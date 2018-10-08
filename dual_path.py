# -*- coding: utf-8 -*-
import shutil
import logging
import re
import multiprocessing as mp
import sys
import platform
from datetime import datetime
from collections import defaultdict
from modules.elman_network import SimpleRecurrentNetwork, deepcopy, np
from modules.plotter import Plotter
from modules.formatter import InputFormatter, compute_mean_and_std, os, pickle, percentage


class DualPath:
    """
    Dual-path is based on the SRN architecture and has the following layers (plus hidden & context):
    input, (predicted) compress, (predicted) concept, (predicted) identifiability & (predicted) role,
    target language, event-semantics and output.

    The event-semantics unit is the only unit that provides information about the target sentence order.
    E.g. for the dative sentence "A man bakes a cake for the cafe" there are 3 event-sem units: CAUSE, CREATE, TRANSFER

    role-concept and pred_role-pred_concept links are used to store the message

    role, concept and pred_concept units are unbiased to make them more input driven
    """

    def __init__(self, hidden_size, learn_rate, final_learn_rate, momentum, epochs, compress_size,
                 role_copy, input_copy, exclude_lang, srn_debug, test_every, set_weights_folder, set_weights_epoch,
                 input_class, check_pronouns, ignore_tense_and_det, allow_cognate_boost=False, simulation_num=None):
        """
        :param hidden_size: Size of the hidden layer
        :param learn_rate: Initial learning rate
        :param final_learn_rate: (Reduced) learning rate after the 1st epoch
        :param momentum: accounts for amount of previous weight changes that are added
        :param epochs: Number of training set iterations during training
        :param compress_size: Size of the compress layers (approximately hidden/3)
        :param role_copy: Whether to keep a copy of the role layer activation
        :param input_copy: Whether to keep a copy of the input layer activation
        :param srn_debug: Whether to show debug messages during training
        :param test_every: Test network every x epochs
        :param set_weights_folder: A folder that contains pre-trained weights as initial weights for simulations
        :param set_weights_epoch: In case of pre-trained weights we can also specify num of epochs (stage of training)
        :param input_class: Instance of InputFormatter Class (contains all the input for the model)
        :param check_pronouns: Whether to evaluate pronoun production
        :param simulation_num: Number of simulation (useful in case we run several simulations in parallel)
        :param allow_cognate_boost: Whether the non-target language will be boosted after the model produces a cognate
        """
        self.inputs = input_class
        self.compress_size = compress_size
        self.hidden_size = hidden_size
        self.simulation_num = simulation_num
        self.training_logger = self.init_logger('training')
        self.test_logger = self.init_logger('test')
        # Learning rate can be reduced linearly until it reaches the end of the first epoch (then stays stable)
        self.final_lrate = final_learn_rate
        # Compute according to how much the lrate decreases and over how many epochs (num_epochs_decreasing_step)
        num_epochs_decreasing_step = 2
        self.lrate_decrease_step = np.true_divide(learn_rate - final_learn_rate,
                                                  self.inputs.num_train * num_epochs_decreasing_step)
        # Epochs indicate the numbers of iteration of the training set during training. 1000 sentences approximate
        # 1 year in Chang & Janciauskas. In Chang, Dell & Bock the total number of sentences experienced is 60000
        self.epochs = epochs
        self.ignore_tense_and_det = ignore_tense_and_det
        self.allow_cognate_boost = allow_cognate_boost
        self.exclude_lang = exclude_lang
        self.check_pronouns = check_pronouns
        if check_pronouns:
            self.pronoun_logger = self.init_logger('pronouns')
        self.test_every = test_every  # test every x epochs
        self.role_copy = role_copy
        self.input_copy = input_copy
        self.set_weights_folder = set_weights_folder
        self.set_weights_epoch = set_weights_epoch
        self.srn = SimpleRecurrentNetwork(learn_rate=learn_rate, momentum=momentum, rdir=results_dir,
                                          debug_messages=srn_debug,
                                          include_role_copy=role_copy,
                                          include_input_copy=input_copy)
        self.initialize_srn()
        self.results = {'correct_meaning': {'test': [], 'training': []},
                        'correct_pos': {'test': [], 'training': []},
                        'pronoun_errors_flex': {'test': [], 'training': []},
                        'pronoun_errors': {'test': [], 'training': []},
                        'correct_code_switches': {'test': [], 'training': []},
                        'all_code_switches': {'test': [], 'training': []},
                        'type_code_switches': {'test': [], 'training': []}}

    def init_logger(self, name):
        logger = logging.getLogger("%s_%s" % (name, self.simulation_num))
        logger.setLevel(logging.DEBUG)
        logger.propagate = False  # no stdout to console
        logger.addHandler(logging.FileHandler("%s/%s.out" % (self.inputs.results_dir, name)))
        return logger

    def initialize_srn(self):
        # Chang: The where, what, and cwhat units were unbiased to make them more input driven
        self.srn.add_layer("input", self.inputs.lexicon_size)  # , convert_input=True)
        self.srn.add_layer("identifiability", self.inputs.identif_size, has_bias=False)
        self.srn.add_layer("concept", self.inputs.concept_size, has_bias=False)
        self.srn.add_layer("role", self.inputs.roles_size)  # , activation_function="softmax")
        self.srn.add_layer("compress", self.compress_size)
        self.srn.add_layer("eventsem", self.inputs.event_sem_size)
        self.srn.add_layer("target_lang", len(self.inputs.languages))
        self.srn.add_layer("hidden", self.hidden_size, is_recurrent=True)
        # If pred_role is not softmax the model performs poorly on determiners.
        self.srn.add_layer("pred_role", self.inputs.roles_size, activation_function="softmax")
        self.srn.add_layer("pred_identifiability", self.inputs.identif_size,
                           has_bias=False)  # , activation_function="softmax")
        self.srn.add_layer("pred_concept", self.inputs.concept_size, has_bias=False)  # , activation_function="softmax")
        self.srn.add_layer("pred_compress", self.compress_size)
        self.srn.add_layer("output", self.inputs.lexicon_size, activation_function="softmax")

        # Connect layers
        self.srn.connect_layers("input", "identifiability")
        self.srn.connect_layers("input", "concept")
        self.srn.connect_layers("input", "compress")
        self.srn.connect_layers("identifiability", "role")
        self.srn.connect_layers("concept", "role")
        # hidden layer
        if self.input_copy:
            self.srn.add_layer("input_copy", self.inputs.lexicon_size)
            self.srn.connect_layers("input", "hidden")
        if self.role_copy:  # it does not seem to improve performance, set default to False to keep model simple
            self.srn.add_layer("role_copy", self.inputs.roles_size)
            self.srn.connect_layers("role_copy", "hidden")
        self.srn.connect_layers("role", "hidden")
        self.srn.connect_layers("compress", "hidden")
        self.srn.connect_layers("eventsem", "hidden")
        self.srn.connect_layers("target_lang", "hidden")
        # hidden to predicted and output layers
        self.srn.connect_layers("hidden", "pred_role")
        self.srn.connect_layers("hidden", "pred_compress")
        self.srn.connect_layers("pred_role", "pred_identifiability")
        self.srn.connect_layers("pred_role", "pred_concept")
        self.srn.connect_layers("pred_identifiability", "output")
        self.srn.connect_layers("pred_concept", "output")
        self.srn.connect_layers("pred_compress", "output")
        self.srn.reset_weights(set_weights_epoch=self.set_weights_epoch, set_weights_folder=self.set_weights_folder,
                               simulation_num=self.simulation_num, results_dir=self.inputs.results_dir)

    def feed_line(self, line, epoch=None, backpropagate=False):
        produced_sent_ids = []
        sentence, message = line.split('## ')
        target_sentence_ids = self.inputs.sentence_indeces(sentence.split())
        weights_role_concept, evsem_act, target_lang_act, message, lang = self.inputs.get_message_info(message)
        self.srn.set_message_reset_context(updated_role_concept=weights_role_concept, event_sem_activations=evsem_act,
                                           target_lang_act=target_lang_act)
        prod_idx = None  # previously produced word (at the beginning of sentence: None)
        ids = deepcopy(target_sentence_ids)
        if not backpropagate:
            ids += [self.inputs.period_idx] * 2  # allow it to complete sentence in test phase.

        for trg_idx in ids:
            self.srn.set_inputs(input_idx=prod_idx, target_idx=trg_idx if backpropagate else None)
            self.srn.feedforward(start_of_sentence=(prod_idx is None))
            if backpropagate:
                prod_idx = trg_idx  # training with target word, NOT produced one
                self.srn.backpropagate(epoch)
            else:  # no "target" word in this case. Also, return the produced sentence
                # reset the target language for the rest of the sentence (during testing only!)
                if self.exclude_lang and prod_idx is None:
                    # TODO: play with activations, e.g. activate the target language slightly more
                    lang_act = np.ones(2)  # [0.5, 0.5] if self.inputs.languages.index(lang) == 0 else [1, 1]
                    self.srn.update_layer_activation("target_lang", activation=lang_act)
                prod_idx = self.srn.get_max_output_activation()
                produced_sent_ids.append(prod_idx)
                if prod_idx == self.inputs.period_idx:  # end sentence if a period was produced
                    break
            # boost after cognate
            if self.exclude_lang and prod_idx in self.inputs.cognate_idx and self.allow_cognate_boost:
                self.srn.boost_non_target_lang(target_lang_idx=self.inputs.languages.index(lang.upper()))

        return produced_sent_ids, target_sentence_ids, message, lang

    def train_network(self, shuffle_set, plot_results=True, evaluate_test_set=True, evaluate_training_set=False):
        """
        :param shuffle_set: Whether to shuffle the training set after each iteration
        :param plot_results: Whether to plot the performance
        :param evaluate_test_set: Whether to evaluate test set every x epochs. The only reason NOT to evaluate
        is for speed, if we want to training network and save weights
        :param evaluate_training_set: Whether to evaluate the training set (default: False)
        Training: for each word of input sentence:
            - compute predicted response
            - determine error, (back)propagate and update weights
            - copy hidden units to context

        In Chang, Dell & Bock (2006) each model subject experienced 60k message-sentence pairs from its training set and
        was tested after 2k epochs. Each training set consisted of 8k pairs and the test set_name of 2k.
        The authors created 20 sets x 8k for 20 subjects
        """
        if evaluate_test_set and evaluate_training_set:  # start multiprocessing when evaluating both
            manager = mp.Manager()
            test_results = manager.dict()
            train_results = manager.dict()
        else:
            test_results = {}

        epoch = 0
        while epoch < self.epochs:  # start training for x epochs
            if epoch % 5 == 0 and epoch > 0:  # check whether to save weights or not (only every 5 epochs)
                self.srn.save_weights(results_dir=self.inputs.results_dir, epochs=epoch)

            if shuffle_set:
                np.random.shuffle(self.inputs.trainlines)  # minpy

            if evaluate_test_set and epoch % self.test_every == 0:
                if not evaluate_training_set:  # no need to run multiprocessing if we only evaluate the test set
                    self.evaluate_network(test_results, epoch, self.inputs.testlines,
                                          self.inputs.num_test, self.check_pronouns if epoch > 0 else False)
                else:
                    subprocesses = []
                    subprocess = mp.Process(target=self.evaluate_network, args=(test_results, epoch,
                                                                                self.inputs.testlines,
                                                                                self.inputs.num_test,
                                                                                self.check_pronouns
                                                                                if epoch > 0 else False))
                    subprocess.start()
                    subprocesses.append(subprocess)
                    if evaluate_training_set:
                        subprocess = mp.Process(target=self.evaluate_network, args=(train_results, epoch,
                                                                                    self.inputs.trainlines,
                                                                                    self.inputs.num_train,
                                                                                    self.check_pronouns
                                                                                    if epoch > 0 else False,
                                                                                    False))
                        subprocess.start()
                        subprocesses.append(subprocess)
                    for sp in subprocesses:
                        sp.join()

            for train_line in self.inputs.trainlines:  # start training
                self.feed_line(train_line, epoch, backpropagate=True)
                if self.srn.learn_rate > self.final_lrate:  # decrease lrate linearly until it reaches 2 epochs
                    self.srn.learn_rate -= self.lrate_decrease_step
            epoch += 1  # increase number of epochs, begin new iteration

        self.srn.save_weights(results_dir=self.inputs.results_dir, epochs=epoch)  # save the last weights

        if evaluate_test_set:
            self.update_results(test_results)
            if evaluate_training_set:
                self.update_results(train_results, type_set='training')

            cs_keys = []
            if self.results['type_code_switches']['test']:
                cs_keys = self.results['type_code_switches']['test'].keys()
            if self.results['type_code_switches']['training']:
                cs_keys += self.results['type_code_switches']['training'].keys()
            self.results['all_cs_types'] = set([re.sub("es-|en-|-cog|-ff", "", k) for k in cs_keys])

            # write (single) simulation results to a pickled file
            with open("%s/results.pickled" % self.inputs.results_dir, 'wb') as pckl:
                pickle.dump(self.results, pckl)

            if plot_results:
                self.results['mse'] = self.srn.mse
                plt = Plotter(results_dir=self.inputs.results_dir, summary_sim=None)
                plt.plot_results(self.results, num_train=self.inputs.num_train, num_test=self.inputs.num_test,
                                 cognate_experiment=args.cognate_experiment, simulation_logger=simulation_logger,
                                 test_sentences_with_pronoun=self.inputs.test_sentences_with_pronoun)

    def update_results(self, temp_results, type_set='test'):
        for sim_id in range(self.epochs):
            for key in self.results.keys():
                self.results[key][type_set].append(temp_results[sim_id][key] if key in temp_results[sim_id] else 0)
        self.aggregate_dict(type_set=type_set)

    def evaluate_network(self, results_dict, epoch, set_lines, num_sentences, check_pron, is_test_set=True):
        """
        :param results_dict: Dictionary that contains evaluation results for all epochs
        :param epoch: Number of epoch
        :param set_lines: the set lines (message+sentence) that are used for the evaluation
        :param num_sentences: the size of set_lines
        :param check_pron: Whether to evaluate pronoun production
        :param is_test_set: Whether it is a test set (otherwise a training set is used)
        """
        counter = defaultdict(int)
        counter['type_code_switches'] = defaultdict(int)
        logger = self.test_logger if is_test_set else self.training_logger
        cs_cog = 0
        cs_enes = 0
        for line in set_lines:
            produced_sentence_idx, target_sentence_idx, message, lang = self.feed_line(line)
            has_correct_pos, has_wrong_det, has_wrong_tense, correct_meaning, cs_type = False, False, False, False, None
            is_grammatical, flexible_order = self.inputs.is_sentence_gramatical_or_flex(produced_sentence_idx,
                                                                                        target_sentence_idx)
            code_switched = self.inputs.is_code_switched(produced_sentence_idx, target_lang=lang)
            if code_switched:
                counter['all_code_switches'] += 1
                if ',COG' in message:
                    cs_cog += 1
                else:
                    cs_enes += 1
            if is_grammatical:
                counter['correct_pos'] += 1
                has_correct_pos = True

                if code_switched:  # only count grammatically correct sentences
                    # determine CS type here
                    cs_type = self.inputs.get_code_switched_type(produced_sentence_idx, target_sentence_idx)
                    if cs_type:  # TODO: it could be interesting to check the failed sentences too
                        correct_meaning = True
                        counter['correct_code_switches'] += 1
                        cs_type_with_lang = "%s-%s" % (lang, cs_type)
                        counter['type_code_switches'][cs_type_with_lang] += 1

                        # check for cognates vs FFs vs regular (no lang)
                        if ',COG' in message:
                            cs_type_with_cognate_status = "%s-cog" % cs_type
                        elif ',FF' in message:
                            cs_type_with_cognate_status = "%s-ff" % cs_type
                        else:  # no cognates or false friends
                            cs_type_with_cognate_status = cs_type
                        counter['type_code_switches'][cs_type_with_cognate_status] += 1
                else:
                    correct_meaning = self.inputs.has_correct_meaning(produced_sentence_idx, target_sentence_idx)

                if correct_meaning:
                    counter['correct_meaning'] += 1
                else:
                    has_wrong_det = self.inputs.test_without_feature(produced_sentence_idx, target_sentence_idx,
                                                                     feature="determiners")
                    has_wrong_tense = self.inputs.test_without_feature(produced_sentence_idx, target_sentence_idx,
                                                                       feature="tense")
                    if self.ignore_tense_and_det and (has_wrong_det or has_wrong_tense):
                        counter['correct_meaning'] += 1  # if the only mistake was the determiner, count it as correct

                if check_pron:  # only check the grammatical sentences
                    correctedness_status = ""
                    if self.inputs.has_pronoun_error(produced_sentence_idx, target_sentence_idx):
                        if self.inputs.test_meaning_without_pronouns(produced_sentence_idx, target_sentence_idx):
                            counter['pronoun_errors'] += 1
                        else:
                            correctedness_status = "(POS only)"
                            # flex: grammatically correct sentences with gender error that convey wrong meaning
                            counter['pronoun_errors_flex'] += 1

                        self.pronoun_logger.info("--------%s (%s)--------%s\nOUT:%s\nTRG:%s\n%s\n" %
                                                 (epoch, "test" if is_test_set else "training", correctedness_status,
                                                  self.inputs.sentence_from_indeces(produced_sentence_idx),
                                                  self.inputs.sentence_from_indeces(target_sentence_idx), message))
            if epoch > 0:
                suffix = ("flex-" if (flexible_order and correct_meaning) or has_wrong_det or has_wrong_tense
                          else "in" if not correct_meaning else "")
                logger.info("--------%s--------\nOUT:%s\nTRG:%s\nGrammatical:%s Tense:%s Definiteness:%s Meaning:"
                            "%scorrect %s\n%s" %
                            (epoch, self.inputs.sentence_from_indeces(produced_sentence_idx),
                             self.inputs.sentence_from_indeces(target_sentence_idx), has_correct_pos,
                             not has_wrong_tense, not has_wrong_det,
                             suffix, "%s" % ("(code-switch%s)" % (": %s" % cs_type if cs_type else "")
                                             if code_switched else ""), message))
        # on the set level
        logger.info("Iteration %s:\nCorrect sentences: %s/%s Correct POS:%s/%s" %
                    (epoch, counter['correct_meaning'], num_sentences, counter['correct_pos'], num_sentences))
        results_dict[epoch] = counter

    def aggregate_dict(self, type_set):
        # convert "type_code_switches" from list of dicts
        # (e.g, [[{'es-noun': 4, 'en-alternational': 1}][{'es-noun': 6, 'en-alternational': 8}]])
        # to a single dict of list (e.g., {'en-alternational': [1, 6, 14], 'es-noun': [4, 8, 22]}
        types_dict = {}
        all_keys = sorted(set().union(*(d.keys() for d in self.results['type_code_switches'][type_set])))
        for key in all_keys:
            val = []
            for epoch in range(self.epochs):
                v = self.results['type_code_switches'][type_set][epoch][key] \
                    if key in self.results['type_code_switches'][type_set][epoch] else 0
                val.append(v)
            types_dict[key] = val
        self.results['type_code_switches'][type_set] = types_dict


def copy_dir(src, dst, symlinks=False, ignore=None):
    if not os.path.exists(dst):
        os.makedirs(dst)
    for item in os.listdir(src):
        s = os.path.join(src, item)
        d = os.path.join(dst, item)
        if os.path.isdir(s):
            shutil.copytree(s, d, symlinks, ignore)
        else:
            shutil.copy2(s, d)


def copy_files_endwith(src, dest, ends_with=".in"):
    for filename in os.listdir(src):
        if filename.endswith(ends_with):
            shutil.copyfile(os.path.join(src, filename), os.path.join(dest, filename))


def copy_test_training_sets(src, dest, valid_filename_list=('test.in', 'training.in')):
    for filename in os.listdir(src):
        if filename in valid_filename_list:
            shutil.copyfile(os.path.join(src, filename), os.path.join(dest, filename))


def create_all_input_files(num_simulations, results_dir, sets, original_input_path, cognate_experiment,
                           generate_num, l2_percentage):
    for sim_num in range(num_simulations):  # first create all input files
        rdir = "%s/%s" % (results_dir, sim_num)
        os.makedirs(rdir)
        if sets:  # generate new test/training sets
            if sim_num == 0:  # copy the .in files under the /input folder
                copy_test_training_sets(os.path.join("%s/input" % results_dir), rdir)
            else:
                sets.sets.results_dir = rdir
                sets.sets.seed = sim_num  # set new seed for language generator
                if cognate_experiment:
                    sets.generate_for_cognate_experiment(num_sentences=generate_num,
                                                         percentage_l2=l2_percentage,
                                                         save_files=False)
                else:
                    sets.sets.generate_general(num_sentences=generate_num, percentage_l2=l2_percentage,
                                               save_files=False)
        elif original_input_path:  # use existing test/training set (copy them first)
            copy_files_endwith(os.path.join(original_input_path, str(sim_num)), rdir)


if __name__ == "__main__":
    import argparse

    def positive_int(value):
        ivalue = int(value)
        if ivalue <= 0:
            raise argparse.ArgumentTypeError("%s is invalid: only use positive int value" % value)
        return ivalue

    parser = argparse.ArgumentParser(formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument('-hidden', help='Number of hidden layer units.', type=positive_int, default=90)
    parser.add_argument('-compress', help='Number of compress layer units', type=positive_int, default=60)
    parser.add_argument('-epochs', '-total_epochs', help='Number of training set iterations during (total) training.',
                        type=positive_int, default=20)
    parser.add_argument('-l2_epochs', '-l2e', help='# of epoch when L2 input gets introduced', type=positive_int)
    parser.add_argument('-l2_percentage', '-l2_perc', help='%% of L2 input', type=float, default=0.5)
    parser.add_argument('-input', help='(Input) folder that contains all input files (lexicon, concepts etc)')
    """ input-related arguments; ithey are probably redundant as all the user needs to specify is the input folder """
    parser.add_argument('-lexicon_csv', help='CSV file that contains the lexicon and concepts', default='lexicon.csv')
    parser.add_argument('-trainingset', '-training', help='File name that contains the message-sentence pair for '
                                                          'training.', default="training.in")
    parser.add_argument('-testset', '-test', help='Test set file name', default="test.in")
    parser.add_argument('-resdir', '-r', help='Prefix of results folder name; will be stored under folder "simulations"'
                                              'and a timestamp will be added')
    parser.add_argument('-lang', help='In case we want to generate a new set, we need to specify the language (en, es '
                                      'or any combination [enes, esen] for bilingual)', default='esen')
    parser.add_argument('-lrate', help='Learning rate', type=float, default=0.15)
    parser.add_argument('-final_lrate', '-flrate', help='Final learning rate after linear decrease in the first 1 epoch'
                                                        "(2k sentences). If not set, rate doesn't decrease",
                        type=float, default=0.02)
    parser.add_argument('-momentum', help='Amount of previous weight changes that are taken into account',
                        type=float, default=0.75)
    parser.add_argument('-set_weights', '-sw',
                        help='Set a folder that contains pre-trained weights as initial weights for simulations')
    parser.add_argument('-set_weights_epoch', '-swe', type=positive_int,
                        help='In case of pre-trained weights we can also specify num of epochs (stage of training)')
    parser.add_argument('-fw', '-fixed_weights', type=float, default=25,
                        help='Fixed weight value for concept-role connections')
    parser.add_argument('-fwi', '-fixed_weights_identif', type=float, default=10,
                        help='Fixed weight value for identif-role connections')
    parser.add_argument('-cognate_percentage', help='Amount of sentences with cognates in test/training sets',
                        type=float, default=0.35)
    parser.add_argument('-generate_num', type=int, default=2500, help='Sum of test/training sentences to be generated '
                                                                      '(only if no input was set)')
    parser.add_argument('-test_every', help='Test network every x epochs', type=positive_int, default=1)
    parser.add_argument('-title', help='Title for the plots')
    parser.add_argument('-sim', type=positive_int, default=2,
                        help="training several simulations at once to take the results' average (Monte Carlo approach)")
    parser.add_argument('-np', help='Defines percentage of Noun Phrases(NPs) vs pronouns on the subject level',
                        type=int, default=100)
    parser.add_argument('-pron', dest='overt_pronouns', type=int, default=0, help='Percentage of overt pronouns in ES')
    parser.add_argument('-threshold', help='Threshold for performance of simulations. Any simulations that performs has'
                                           ' a percentage of correct sentences < threshold are discarded',
                        type=int, default=50)
    """ !----------------------------------- boolean arguments -----------------------------------! """
    parser.add_argument('--prodrop', dest='prodrop', action='store_true', help='Indicates that it is a pro-drop lang')
    parser.set_defaults(prodrop=False)
    parser.add_argument('--crole', dest='crole', action='store_true',
                        help='If (role copy) is set, the produced role layer is copied back to the comprehension layer')
    parser.set_defaults(crole=False)
    parser.add_argument('--cinput', dest='cinput', action='store_true',
                        help='If (copy input) is set, the previous activation of the input layer is stored')
    parser.set_defaults(cinput=False)
    parser.add_argument('--debug', help='Debugging info for SRN layers and deltas', dest='debug', action='store_true')
    parser.set_defaults(debug=False)
    parser.add_argument('--nolang', dest='exclude_lang', action='store_true',
                        help='Exclude language info during TESTing')
    parser.set_defaults(exclude_lang=False)
    parser.add_argument('--nodlr', dest='decrease_lrate', action='store_false', help='Keep lrate stable (final_lrate)')
    parser.set_defaults(decrease_lrate=True)
    parser.add_argument('--nogender', dest='gender', action='store_false', help='Exclude semantic gender for nouns')
    parser.set_defaults(gender=True)
    parser.add_argument('--monolingual', dest='monolingual', action='store_true', help='Do not include L2 lexicon')
    parser.set_defaults(monolingual=False)
    parser.add_argument('--comb-sem', dest='simple_semantics', action='store_false',
                        help='Produce combined concepts instead of simple ones (e.g., PARENT+M instead of FATHER)')
    parser.set_defaults(simple_semantics=True)
    parser.add_argument('--no-shuffle', dest='shuffle', action='store_false',
                        help='Do not shuffle training set after every epoch')
    parser.set_defaults(shuffle=True)
    parser.add_argument('--full-verb-form', '--fv', dest='full_verb', action='store_true',
                        help='Use full lexeme for verbs instead of splitting into lemma/suffix')
    parser.set_defaults(full_verb=False)
    parser.add_argument('--allow-free-structure', '--af', dest='free_pos', action='store_true',
                        help='The model is not given role information in the event semantics and it it therefore '
                             'allowed to use any syntactic structure (which is important for testing, e.g., priming)')
    parser.set_defaults(free_pos=False)
    parser.add_argument('--gender_error_experiment', dest='check_pronouns', action='store_true',
                        help='Evaluate pronoun production')
    parser.set_defaults(check_pronouns=False)
    parser.add_argument('--filler', dest='filler', action='store_true',
                        help='Add filler word ("actually", "pues") at the beginning of the sentence')
    parser.set_defaults(filler=False)
    parser.add_argument('--emb', dest='word_embeddings', action='store_true',
                        help='Represent semantics using word embeddings instead of one-hot vectors.')
    parser.set_defaults(word_embeddings=False)
    parser.add_argument('--cognates', dest='cognate_experiment', action='store_true',
                        help='Run cognate experiment')
    parser.set_defaults(cognate_experiment=False)
    parser.add_argument('--flex_eval', dest='ignore_tense_and_det', action='store_true',
                        help='Ignore mistakes on determiners (definiteness) and tense (past, present)')
    parser.set_defaults(ignore_tense_and_det=False)
    parser.add_argument('--nomultiprocessing', '--no_multiprocessing', dest='use_multiprocessing', action='store_false',
                        help='Use multiprocessing for parallel simulations')
    parser.set_defaults(use_multiprocessing=True)
    args = parser.parse_args()
    # create path to store results
    results_dir = "simulations/%s%s_%s_%ssim_h%s_c%s" % ((args.resdir if args.resdir else ""),
                                                         datetime.now().strftime("%Y-%m-%dt%H.%M.%S"),
                                                         args.lang, args.sim, args.hidden, args.compress)
    lang_code_to_title = {'en': 'English monolingual model', 'es': 'Spanish monolingual model',
                          'el': 'Greek monolingual model', 'enes': 'Bilingual EN-ES model',
                          'esen': 'Bilingual EN-ES model'}
    os.makedirs(results_dir)
    original_input_path = None  # keep track of the original input in case it was copied
    sets = None
    if args.input:  # generate a new set (unless "input" was also set)
        if not os.path.isfile(os.path.join(args.input, "test.in")) and 'input' not in args.input:
            corrected_dir = os.path.join(args.input, "input")  # the user may have forgotten to add the 'input' dir
            if os.path.exists(corrected_dir):
                args.input = corrected_dir
            else:
                import sys

                sys.exit('No input folder found in the path (%s)' % args.input)
        logging.warning("Predefined input folder (%s), will use that instead of generating a new set" % args.input)
        copy_dir(args.input, '%s/input' % results_dir)
        original_input_path = args.input.replace("/input", "")  # remove the "input" part, sets are in the sub folders
        args.input = '%s/input' % results_dir
    else:
        from modules.corpus_for_experiments import ExperimentSets, SetsGenerator

        args.input = "%s/input/" % results_dir
        input_sets = ExperimentSets(
            sets_gen=SetsGenerator(results_dir=args.input, use_full_verb_form=args.full_verb, lang=args.lang,
                                   monolingual_only=args.monolingual, use_simple_semantics=args.simple_semantics,
                                   cognate_percentage=args.cognate_percentage,
                                   allow_free_structure_production=args.free_pos))
        if args.cognate_experiment:
            input_sets.generate_for_cognate_experiment(num_sentences=args.generate_num,
                                                       percentage_l2=args.l2_percentage)
        else:
            input_sets.sets.generate_general(num_sentences=args.generate_num, percentage_l2=args.l2_percentage)

    if args.cognate_experiment and not args.exclude_lang:
        args.exclude_lang = True

    if not args.title:
        args.title = lang_code_to_title[args.lang]

    if not args.decrease_lrate:
        args.lrate = args.final_lrate  # assign the >lowest< learning rate.

    simulation_logger = logging.getLogger('simulation')
    simulation_logger.setLevel(logging.DEBUG)
    fh = logging.FileHandler("%s/simulation.log" % results_dir)
    simulation_logger.propagate = False  # no stdout to console
    simulation_logger.addHandler(fh)

    simulation_logger.info(("Input: %s %s\nTitle:%s\nHidden layers: %s\nInitial learn rate: %s\nDecrease lr: %s%s\n"
                            "Compress: %s\nCopy role: %s\nCopy input: %s\nPercentage NPs:%s\nPro-drop language:%s\nUse "
                            "gender info:%s\novert_pronouns (overt ES pronouns):%s%%\nFixed weights: concept-role: %s, "
                            "identif-role: %s\nSet weights folder: %s (epoch: %s)\nExclude lang during testing:%s\n"
                            "Shuffle set after each epoch: %s\nAllow free structure production:%s\nIgnore tense and "
                            "determiners when evaluating:%s") %
                           (results_dir, "(%s)" % original_input_path if original_input_path else "", args.title,
                            args.hidden, args.lrate, args.decrease_lrate, " (%s)" % args.final_lrate
                            if (args.final_lrate and args.decrease_lrate) else "", args.compress, args.crole,
                            args.cinput, args.np, args.prodrop, args.gender, args.overt_pronouns, args.fw, args.fwi,
                            args.set_weights, args.set_weights_epoch, args.exclude_lang, args.shuffle, args.free_pos,
                            args.ignore_tense_and_det))

    inputs = InputFormatter(results_dir=results_dir, input_dir=args.input, lexicon_csv=args.lexicon_csv,
                            language=args.lang, semantic_gender=args.gender, overt_pronouns=args.overt_pronouns,
                            prodrop=args.prodrop, trainingset=args.trainingset, testset=args.testset,
                            fixed_weights=args.fw, fixed_weights_identif=args.fwi,
                            use_word_embeddings=args.word_embeddings, monolingual_only=args.monolingual)
    num_valid_simulations = None
    simulations_with_pron_err = 0
    failed_sim_id = []
    if not args.sim or args.sim == 1:  # only run one simulation
        dualp = DualPath(hidden_size=args.hidden, learn_rate=args.lrate, final_learn_rate=args.final_lrate,
                         epochs=args.epochs, role_copy=args.crole, input_copy=args.cinput, srn_debug=args.debug,
                         test_every=args.test_every, compress_size=args.compress, exclude_lang=args.exclude_lang,
                         set_weights_folder=args.set_weights, set_weights_epoch=args.set_weights_epoch,
                         ignore_tense_and_det=args.ignore_tense_and_det, input_class=inputs, momentum=args.momentum,
                         check_pronouns=args.check_pronouns)
        dualp.train_network(shuffle_set=args.shuffle)
    else:  # start batch training to take the average of results
        create_all_input_files(num_simulations=args.sim, results_dir=results_dir,
                               original_input_path=original_input_path, cognate_experiment=args.cognate_experiment,
                               sets=input_sets, generate_num=args.generate_num, l2_percentage=args.l2_percentage)
        del input_sets  # we no longer need it
        # now run the simulations
        if sys.version.startswith('3') and platform.system() != 'Linux':
            os.environ["VECLIB_MAXIMUM_THREADS"] = "1"  # multiprocessing + numpy hang on Mac OS

        if args.use_multiprocessing:
            processes = []
        for sim in range(args.sim):
            inputs.input_dir = "%s/%s" % (results_dir, sim)
            inputs.update_sets(new_results_dir=inputs.input_dir)
            simulation_logger.info("Number of cognates and false friends in training set for sim %s: %s/%s" %
                                   (sim, sum(',COG' in l for l in inputs.trainlines) + sum(',FF' in l
                                                                                           for l in inputs.trainlines),
                                    inputs.num_train))
            dualp = DualPath(hidden_size=args.hidden, learn_rate=args.lrate, final_learn_rate=args.final_lrate,
                             epochs=args.epochs, role_copy=args.crole, input_copy=args.cinput, srn_debug=args.debug,
                             test_every=args.test_every, compress_size=args.compress, exclude_lang=args.exclude_lang,
                             set_weights_folder=args.set_weights, momentum=args.momentum, input_class=inputs,
                             ignore_tense_and_det=args.ignore_tense_and_det, set_weights_epoch=args.set_weights_epoch,
                             check_pronouns=args.check_pronouns, simulation_num=sim)
            if args.use_multiprocessing:
                process = mp.Process(target=dualp.train_network, args=(args.shuffle,))
                process.start()
                processes.append(process)
            else:
                dualp.train_network(shuffle_set=args.shuffle)

        if args.use_multiprocessing:
            for p in processes:
                p.join()

        # aggregate results
        all_results = []
        for sim in range(args.sim):  # read results from all simulations
            if os.path.isfile('%s/%s/results.pickled' % (results_dir, sim)):
                with open('%s/%s/results.pickled' % (results_dir, sim), 'rb') as f:
                    all_results.append(pickle.load(f))
            else:  # this would mean "missing data", we could raise a message
                logging.warning('Simulation #%s was problematic' % sim)

        if all_results:
            valid_results = []
            for i, simulation in enumerate(all_results):
                if inputs.training_is_successful(simulation['correct_meaning']['test'], threshold=args.threshold):
                    valid_results.append(simulation)
                    if not inputs.training_is_successful(simulation['correct_meaning']['test'], threshold=80):
                        failed_sim_id.append("[%s]" % i)  # flag it, even if it's included in the final analysis
                else:
                    failed_sim_id.append(str(i))  # keep track of simulations that failed
            num_valid_simulations = len(valid_results)  # some might have been discarded

            if num_valid_simulations:  # take the average of results and plot
                simulations_with_pron_err = len([simulation for simulation in valid_results
                                                 if sum(simulation['pronoun_errors']['test']) > 0 or
                                                 sum(simulation['pronoun_errors_flex']['test']) > 0])
                inputs.results_dir = os.path.split(inputs.results_dir)[0]  # go one folder up and save plot
                results_mean_and_std = compute_mean_and_std(valid_results, epochs=args.epochs)
                with open("%s/summary_results.pickled" % results_dir, 'wb') as pckl:
                    pickle.dump(results_mean_and_std, pckl)
                plot = Plotter(results_dir=results_dir, summary_sim=num_valid_simulations, title=args.title)
                plot.plot_results(results_mean_and_std, cognate_experiment=args.cognate_experiment,
                                  test_sentences_with_pronoun=inputs.test_sentences_with_pronoun,
                                  num_test=inputs.num_test, num_train=inputs.num_train,
                                  simulation_logger=simulation_logger)
                if not isinstance(results_mean_and_std['correct_code_switches']['test'], int):
                    simulation_logger.info("Code-switched percentage (test set): %s" %
                                           [percentage(x, inputs.num_test)
                                            for x in results_mean_and_std['correct_code_switches']['test']])

    layers_with_softmax_act_function = ""
    for layer in dualp.srn.get_layers_for_backpropagation():
        if layer.activation_function == 'softmax':
            layers_with_softmax_act_function += ", %s" % layer.name

    simulation_logger.info("Lexicon size:%s\nLayers with softmax activation function: %s\nSimulations with pronoun "
                           "errors:%s/%s\n%s%s" %
                           (inputs.lexicon_size, layers_with_softmax_act_function, simulations_with_pron_err,
                            args.sim, "Successful simulations:%s/%s" % (num_valid_simulations, args.sim)
                            if num_valid_simulations else "", "\nIndeces of (almost) failed simulations: %s" %
                                                              ", ".join(failed_sim_id) if failed_sim_id else ""))

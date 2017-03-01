# -*- coding: utf-8 -*-
import random
import pickle
from multiprocessing import Process, Manager
from operator import add
import shutil
import collections
import numpy as np
from datetime import datetime
from modules.elman_network import SimpleRecurrentNetwork
from modules.plotter import Plotter
from modules.formatter import InputFormatter, os


class DualPath:
    def __init__(self, hidden_size, learn_rate, compress_size, set_weights_folder, role_copy,
                 elman_debug_mess, test_every, epochs, set_weights_epoch, fixed_weight, input_format,
                 simulation_num=None):
        self.inputs = input_format
        if compress_size:
            self.compress_size = compress_size
        else:  # or hidden/3 ? hidden: 45+13 (lex+compress) 58 compress = args.hidden / 3
            self.compress_size = len(self.inputs.compress_idx)
        self.hidden_size = hidden_size
        # fixed_weight is the activation between roles-concepts and evsem. The value is rather arbitrary unfortunately.
        # Using a really low value (e.g. 1) makes it difficult (but possible) for the model to learn the associations
        self.fixed_weight = fixed_weight

        # Learning rate starts at 0.2 and is reduced linearly until it reaches 0.05 at 1 epoch (2000 sentences),
        # where it is fixed for the rest of training. Values taken from Chang F., 2002
        self.learn_rate = learn_rate
        self.momentum = 0.9  # accounts for amount of previous weight changes that are added

        # Epochs indicate the numbers of iteration of the train set during training. 1000 sentences approximate
        # 1 year in Chang & Janciauskas. In Chang, Dell & Bock the total number of sentences experienced is 60000
        self.epochs = epochs
        # |----------!PARAMS----------|
        self.test_every = test_every  # test every x epochs (default: 2000)
        self.role_copy = role_copy
        self.set_weights_folder = set_weights_folder
        self.set_weights_epoch = set_weights_epoch
        self.simulation_num = simulation_num
        self.srn = SimpleRecurrentNetwork(learn_rate=self.learn_rate, dir=results_dir, debug_messages=elman_debug_mess,
                                          include_role_copy=self.role_copy)
        self.initialize_network()

        self.compare_unordered = lambda x, y: collections.Counter(x) == collections.Counter(y)
        # dict to save results
        self.results = {'correct_sentences': {'test': [], 'train': []},
                        'correct_pos': {'test': [], 'train': []},
                        'pronoun_errors_flex': {'test': [], 'train': []},
                        'pronoun_errors': {'test': [], 'train': []}}

    def initialize_network(self):
        # The where, what, and cwhat units were unbiased to make them more input driven
        self.srn.add_layer("input", self.inputs.lexicon_size)  # , convert_input=True)
        self.srn.add_layer("concept", self.inputs.concept_size, has_bias=False)
        self.srn.add_layer("identif", self.inputs.identif_size, has_bias=False)
        self.srn.add_layer("role", self.inputs.roles_size, has_fixed_weights=True)  # has_bias=False, "softmax"
        self.srn.add_layer("compress", self.compress_size)
        self.srn.add_layer("eventsem", self.inputs.event_sem_size)  # convert_input=True -- it doesn't really matter
        self.srn.add_layer("target_lang", len(self.inputs.languages))
        self.srn.add_layer("hidden", self.hidden_size, is_recurrent=True)
        # If pred_role is not softmax the model performs poorly on determiners.
        self.srn.add_layer("pred_role", self.inputs.roles_size, activation_function="softmax")
        self.srn.add_layer("pred_identifiability", self.inputs.identif_size, has_fixed_weights=True, has_bias=False)
        self.srn.add_layer("pred_concept", self.inputs.concept_size, has_fixed_weights=True, has_bias=False)
        self.srn.add_layer("pred_compress", self.compress_size)
        self.srn.add_layer("output", self.inputs.lexicon_size, activation_function="softmax")

        # Connect layers
        self.srn.connect_layers("input", "identif")
        self.srn.connect_layers("input", "concept")
        self.srn.connect_layers("input", "compress")
        self.srn.connect_layers("identif", "role")
        self.srn.connect_layers("concept", "role")
        # hidden layer
        if self.role_copy:  # it does not seem to improve this model, set default to False for simplicity
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

    def get_message_info(self, message, test_phase=False):
        """
        :param message: string, e.g. "ACTION=CARRY;AGENT=FATHER,DEF;PATIENT=STICK,INDEF
        E=PAST,PROG" which maps roles (AGENT, PATIENT, ACTION) with concepts and also
        gives information about the event-semantics (E)
        :param test_phase: Set to True during evaluation and False during training
        """
        norm_activation = 1  # 0.5 ? 1?
        reduced_activation = 0  # 0.1-4
        increased_activation = 2
        lang = 'en' if '=EN,' in message else 'es'
        event_sem_activations = np.array([-1] * self.inputs.event_sem_size)  # or np.zeros(self.event_sem_size)
        # include the identifiness (first), i.e. def, indef, pronoun, emph
        weights_role_concept = np.zeros((self.inputs.roles_size, self.inputs.identif_size + self.inputs.concept_size))
        target_lang_activations = np.zeros(len(self.inputs.languages))
        for info in message.split(';'):
            role, what = info.split("=")
            if role == "E":  # retrieve activations for the event-sem layer
                activation = norm_activation
                for event in what.split(","):
                    if event == "-1":  # if -1 precedes an event-sem its activation should be lower than 1
                        activation = reduced_activation
                        break
                    if event in ['PRESENT', 'PAST']:
                        activation = increased_activation
                    if event in self.inputs.languages:
                        if test_phase and self.inputs.exclude_lang:
                            if event == 'ES':
                                target_lang_activations[self.inputs.languages.index('ES')] = 0.8  # more active
                                target_lang_activations[self.inputs.languages.index('EN')] = 0.2  # less active
                            else:
                                target_lang_activations[self.inputs.languages.index('ES')] = 0.2
                                target_lang_activations[self.inputs.languages.index('EN')] = 0.8
                        else:
                            target_lang_activations[self.inputs.languages.index(event)] = activation
                    else:  # activate
                        event_sem_activations[self.inputs.event_semantics.index(event)] = activation
                    activation = norm_activation  # reset activation levels to maximum
            else:
                # there's usually multiple concepts/identif per role, e.g. (MAN, DEF, EMPH). We want to
                # activate the bindings with a high value, e.g. 6 as suggested by Chang, 2002
                for concept in what.split(","):
                    if concept in self.inputs.identif:
                        weights_role_concept[self.inputs.roles.index(role)][self.inputs.identif.index(concept)] = \
                            self.fixed_weight
                    else:
                        idx_concept = self.inputs.identif_size + self.inputs.concepts.index(concept)
                        weights_role_concept[self.inputs.roles.index(role)][idx_concept] = self.fixed_weight
        return weights_role_concept, event_sem_activations, target_lang_activations, lang, message

    def feed_line(self, line, epoch=None, backpropagate=False):
        produced_sent_ids = []
        sentence, message = line.split('## ')
        target_sentence_ids = self.inputs.sentence_indeces(sentence.split())
        weights_role_concept, evsem_act, target_lang_act, lang, message = \
            self.get_message_info(message, test_phase=(not backpropagate))
        self.srn.set_message_reset_context(updated_role_concept=weights_role_concept,
                                           event_sem_activations=evsem_act, target_lang_act=target_lang_act)
        prod_idx = None  # previously produced word (at the beginning of sentence: None)
        if not backpropagate:
            ids = target_sentence_ids + [self.inputs.period_idx] * 2  # allow it to complete sentence.
        else:
            ids = target_sentence_ids

        for trg_idx in ids:
            self.srn.set_inputs(input_idx=prod_idx, target_idx=trg_idx if backpropagate else None)
            self.srn.feed_forward(start_of_sentence=(prod_idx is None))
            if backpropagate:
                prod_idx = trg_idx  # Train with target word, NOT produced one
                self.srn.backpropagate(epoch)
            else:  # no "target" word in this case. Also, return the produced sentence
                prod_idx = self.srn.get_max_output_activation()
                produced_sent_ids.append(prod_idx)
                if prod_idx == self.inputs.period_idx:  # end sentence if a period was produced
                    break
        return produced_sent_ids, target_sentence_ids, message

    def train_network(self, decrease_lrate=False, shuffle_set=True, plot_results=True, evaluate=True):
        """
        decrease_lrate: whether to decrease the learning rate or not
        shuffle_set: Whether to shuffle the training set after each iteration
        plot_results: Whether to plot the performance
        evaluate: Whether to evaluate train and test sets every x epochs. The only reason NOT to evaluate is for speed,
                  if we want to train network and save weights

        Training: for each word of input sentence:
            - compute predicted response
            - determine error, (back)propagate and update weights
            - copy hidden units to context

        In Chang, Dell & Bock (2006) each model subject experienced 60k message-sentence pairs from its trainset and was
        tested after 2k epochs. Each training set consisted of 8k pairs and the test set_name of 2k.
        The authors created 20 sets x 8k for 20 subjects
        """
        if evaluate:
            manager = Manager()
            train_results = manager.dict()
            test_results = manager.dict()

        epoch = 0
        while epoch <= self.epochs:  # start training for x epochs
            if epoch % 10 == 0:  # check whether to save weights or not (only every 10 epochs)
                self.srn.save_weights(results_dir=self.inputs.results_dir, epochs=epoch)

            if shuffle_set:
                random.shuffle(self.inputs.trainlines)

            if evaluate and epoch % self.test_every == 0:  # evaluate train AND testset
                subprocesses = []
                # test set
                subprocess = Process(target=self.evaluate_network, args=(test_results, epoch,
                                                                         self.inputs.testlines, self.inputs.num_test))
                subprocess.start()
                subprocesses.append(subprocess)
                # train set
                subprocess = Process(target=self.evaluate_network, args=(train_results, epoch, self.inputs.trainlines,
                                                                         self.inputs.num_train, False))
                subprocess.start()
                subprocesses.append(subprocess)
                for sp in subprocesses:
                    sp.join()

            for train_line in self.inputs.trainlines:  # start training
                self.feed_line(train_line, epoch, backpropagate=True)
                if epoch < 2 and decrease_lrate:
                    self.learn_rate -= 0.000075  # decrease lrate linearly until it reaches 2k lines (1 epoch)

            epoch += 1  # increase number of epochs, begin new iteration

        if evaluate:
            for sim in test_results.values():
                s, p, pr, pr_pos = sim
                self.results['correct_sentences']['test'].append(s)
                self.results['correct_pos']['test'].append(p)
                self.results['pronoun_errors']['test'].append(pr)
                self.results['pronoun_errors_flex']['test'].append(pr_pos)

            for sim in train_results.values():
                s, p, pr, pr_pos = sim
                self.results['correct_sentences']['train'].append(s)
                self.results['correct_pos']['train'].append(p)
                self.results['pronoun_errors']['train'].append(pr)
                self.results['pronoun_errors_flex']['train'].append(pr_pos)

            with open("%s/results.pickled" % self.inputs.results_dir, 'w') as pckl:  # write results to a (pickled) file
                pickle.dump(self.results, pckl)

            if plot_results:
                plt = Plotter(results_dir=self.inputs.results_dir)
                plt.plot_results(self.results, num_train=self.inputs.num_train, num_test=self.inputs.num_test,
                                 title=self.inputs.plot_title,
                                 test_sentences_with_pronoun=self.inputs.test_sentences_with_pronoun)

    def is_code_switched(self, sentence_indeces):
        sentence_no_period = [x for x in sentence_indeces if x != self.inputs.period_idx]
        if (all(i >= self.inputs.code_switched_idx for i in sentence_no_period) or
                all(i < self.inputs.code_switched_idx for i in sentence_no_period)):
                return False
        else:
            return True

    def has_pronoun_error(self, out_sentence_idx, trg_sentence_idx):
        if (out_sentence_idx[0] != trg_sentence_idx[0] and out_sentence_idx[0] in self.inputs.idx_en_pronoun and
                trg_sentence_idx[0] in self.inputs.idx_en_pronoun):
            return True
        return False

    def test_rest_of_meaning(self, out_sentence_idx, trg_sentence_idx):
        # remove the subject pronoun (the first idx produced) and check the rest of the sentence
        return self.test_for_flexible_order(out_sentence_idx[1:], trg_sentence_idx[1:], allow_identical=True)

    def evaluate_network(self, results_dict, epoch, set_lines, num_sentences, is_test_set=True, check_pron=True):
        """
        :param results_dict: Dictionary that contains evaluation results for all epochs
        :param epoch: Number of epoch
        :param set_lines: the set lines (message+sentence) that are used for the evaluation
        :param num_sentences: the size of set_lines
        :param is_test_set: Whether it is a test set (otherwise a train set is used)
        :param check_pron: Whether to evaluate pronoun production
        :return:
        """

        num_correct_meaning = 0
        num_correct_pos = 0
        num_pron_err = 0
        # in addition to num_pron_err, count grammatically correct sentences with gender error that convey wrong meaning
        num_pron_err_flex = 0

        for line in set_lines:
            produced_sentence_idx, target_sentence_idx, message = self.feed_line(line)

            has_correct_pos = False
            code_switched = self.is_code_switched(produced_sentence_idx)
            flexible_order = self.test_for_flexible_order(produced_sentence_idx, target_sentence_idx)
            if produced_sentence_idx == target_sentence_idx or flexible_order:
                num_correct_meaning += 1

            if self.sentence_is_grammatical(produced_sentence_idx):
                num_correct_pos += 1
                has_correct_pos = True
                if check_pron:  # only check the grammatical sentences
                    has_pronoun_error = self.has_pronoun_error(produced_sentence_idx, target_sentence_idx)
                    has_correct_meaning = self.test_rest_of_meaning(produced_sentence_idx, target_sentence_idx)
                    if has_pronoun_error:
                        if has_correct_meaning:
                            num_pron_err += 1
                        else:
                            num_pron_err_flex += 1

                        with open("%s/pronoun_%s.err" % (self.inputs.results_dir, "test" if is_test_set else "train"),
                                  'a') as f:
                            f.write("--------%s--------%s\nOUT:%s\nTRG:%s\n%s\n" %
                                    (epoch, "(POS only)" if not has_correct_meaning else "",
                                     self.inputs.sentence_from_indeces(produced_sentence_idx),
                                     self.inputs.sentence_from_indeces(target_sentence_idx), message))

            if epoch > 0:
                suffix = "flex-" if flexible_order else "in" if produced_sentence_idx != target_sentence_idx else ""
                with open("%s/%s.eval" % (self.inputs.results_dir, "test" if is_test_set else "train"), 'a') as f:
                    f.write("--------%s--------\nOUT:%s\nTRG:%s\nCS:%s POS:%s (%scorrect meaning)\n%s\n" %
                            (epoch, self.inputs.sentence_from_indeces(produced_sentence_idx),
                             self.inputs.sentence_from_indeces(target_sentence_idx), code_switched, has_correct_pos,
                             suffix, message))

        # on the set level
        with open("%s/%s.eval" % (self.inputs.results_dir, "test" if is_test_set else "train"), 'a') as f:
            f.write("Iteration %s:\nCorrect sentences: %s/%s Correct POS:%s/%s\n" %
                    (epoch, num_correct_meaning, num_sentences, num_correct_pos, num_sentences))

        results_dict[epoch] = (num_correct_meaning, num_correct_pos, num_pron_err, num_pron_err_flex)

    def test_for_flexible_order(self, out_sentence_idx, trg_sentence_idx, remove_last_word=True, allow_identical=False):
        """
        :param out_sentence_idx:
        :param trg_sentence_idx:
        :param remove_last_word:
        :param allow_identical: Whether to return False if sentences are identical
        :return: if produced sentence was not identical to the target one, check if the meaning was correct but
        expressed with a different syntactic structure (due to, e.g., priming)
        """
        if out_sentence_idx == trg_sentence_idx and not allow_identical:  # only check non identical sentences
            return False
        flexible_order = False
        if self.compare_unordered([x for x in out_sentence_idx if x not in [self.inputs.to_preposition_idx,
                                                                            self.inputs.period_idx]],
                                  [x for x in trg_sentence_idx if x not in [self.inputs.to_preposition_idx,
                                                                            self.inputs.period_idx]]):
            flexible_order = True
        elif remove_last_word and self.compare_unordered(out_sentence_idx[:-1], trg_sentence_idx[:-1]):
            flexible_order = True
        return flexible_order

    def sentence_is_grammatical(self, sentence_idx):
        if self.inputs.sentence_indeces_pos(sentence_idx) in self.inputs.allowed_structures:
            return True
        return False


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


def take_average_of_valid_results(v_results):
    clean_results = {}
    for d in v_results:
        for k, v in d.iteritems():
            if k not in results:
                results[k] = {}
            for s, j in v.iteritems():
                if s not in results[k]:
                    results[k][s] = np.array(j)
                else:
                    results[k][s] = np.true_divide(map(add, results[k][s], j), 2)
    return clean_results

if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument('-hidden', help='Number of hidden layer units.', type=int, default=30)
    parser.add_argument('-epochs', help='Number of train set iterations during training.', type=int, default=20)
    parser.add_argument('-input', help='(Input) folder that contains all input files (lexicon, concepts etc)')
    parser.add_argument('-resdir', '-r', help='Prefix of results folder name; will be stored under folder "simulations"'
                                              'and a timestamp will be added')
    parser.add_argument('-lang', help='In case we want to generate a new set, we need to specify the language (en, es '
                                      'or any other string for bilingual)', default='en')
    parser.add_argument('-lrate', help='Learning rate', type=float, default=0.1)  # 0.2 or 0.15 or 0.1
    parser.add_argument('-set_weights', '-sw',
                        help='Set a folder that contains pre-trained weights as initial weights for simulations')
    parser.add_argument('-set_weights_epoch', '-swe', type=int,
                        help='In case of pre-trained weights we can also specify num of epochs (stage of training)')
    parser.add_argument('-fw', '-fixed_weights', type=int, default=18,
                        help='Fixed weight value for concept-role connections')
    parser.add_argument('-compress', help='Number of compress layer units', type=int)  # 15?
    parser.add_argument('-generate_num', type=int, default=2500, help='Sum of test/train sentences to be generated '
                                                                      '(if no input was set)')
    parser.add_argument('-test_every', help='Test network every x epochs', type=int, default=1)
    parser.add_argument('-title', help='Title for the plots')
    parser.add_argument('-sim', type=int, default=2, help='Train several simulations (sim) at once to take the '
                                                          'average of the results (Monte Carlo approach)')
    parser.add_argument('-pron', help='Defines percentage of pronouns (vs NPs) on subject level', type=int, default=100)
    # input-related arguments, they are probably redundant as all the user needs to specify is the input/ folder
    parser.add_argument('-lexicon', help='File name that contains the lexicon', default='lexicon.in')
    parser.add_argument('-concepts', help='File name that contains the concepts', default='concepts.in')
    parser.add_argument('-role', help='File name that contains the roles', default='roles.in')
    parser.add_argument('-eventsem', help='File name that contains the event semantics', default='event_sem.in')
    parser.add_argument('-trainset', '-train', help='File name that contains the message-sentence pair for training. '
                                                    'If left empty, the train*.* file under -input will be used.')
    parser.add_argument('-testset', '-test', help='Test set file name')
    # boolean arguments
    parser.add_argument('--prodrop', dest='prodrop', action='store_true', help='Indicates that it is a pro-drop lang')
    parser.set_defaults(prodrop=False)
    parser.add_argument('--rcopy', dest='rcopy', action='store_true',
                        help='If (role copy) is set, the produced role layer is copied back to the comprehension layer')
    parser.set_defaults(rcopy=False)
    parser.add_argument('--debug', help='Debugging info for SRN layers and deltas', dest='debug', action='store_true')
    parser.set_defaults(debug=False)
    parser.add_argument('--nodlr', dest='decrease_lrate', action='store_false', help='Stop automatic decrease of lrate')
    parser.set_defaults(decrease_lrate=True)
    parser.add_argument('--nolang', dest='nolang', action='store_true', help='Exclude language info during TESTing')
    parser.set_defaults(nolang=False)
    parser.add_argument('--nogender', dest='gender', action='store_false', help='Exclude semantic gender for nouns')
    parser.set_defaults(gender=True)
    parser.add_argument('--emph', dest='emphasis', action='store_true', help='Include emphasis concept on subject '
                                                                             'level 20%% of the time')
    parser.set_defaults(emphasis=False)
    args = parser.parse_args()
    # create path to store results
    results_dir = "simulations/%s%s_%s_h%s" % ((args.resdir if args.resdir else ""),
                                               datetime.now().strftime("%Y-%m-%dt%H.%M.%S"), args.lang, args.hidden)
    os.makedirs(results_dir)

    original_input_path = None  # to keep track of the original input in case it was copied
    if args.generate_num:  # generate a new set (unless "input" was also set)
        if args.input:
            if 'input' not in args.input:
                corrected_dir = os.path.join(args.input, "input")  # the user may have forgotten to add the 'input' dir
                if os.path.exists(corrected_dir):
                    args.input = corrected_dir
                elif os.path.exists(os.path.join(args.input, "input_cp")):
                    args.input = os.path.join(args.input, "input_cp")
                else:
                    import sys
                    sys.exit('No input folder found in the path (%s)' % args.input)
            print "Predefined input folder found (%s), will use that instead of generating a new set" % args.input
            copy_dir(args.input, '%s/input_cp' % results_dir)
            original_input_path = args.input
            args.input = '%s/input_cp' % results_dir
        else:
            from modules.corpus_generator import SetsGenerator

            args.input = "%s/input/" % results_dir
            sets = SetsGenerator(results_dir=args.input)
            sets.generate_sets(num_sentences=args.generate_num, lang=args.lang, percentage_pronoun=args.pron,
                               include_bilingual_lex=True)

    if not args.trainset:
        args.trainset = [filename for filename in os.listdir(args.input) if filename.startswith("train")][0]
    if not args.testset:
        args.testset = [filename for filename in os.listdir(args.input) if filename.startswith("test")][0]

    if not args.title:  # if there's no title use the file extension to add one
        if args.testset.endswith('.en'):
            args.title = 'English monolingual model'
        elif args.testset.endswith('.es'):
            args.title = 'Spanish monolingual model'
        elif args.testset.endswith('.el'):
            args.title = 'Greek monolingual model'
        elif args.testset.endswith('.enes'):
            args.title = 'Bilingual EN-ES model'

    inputs = InputFormatter(results_dir=results_dir, input_dir=args.input, lex_fname=args.lexicon,
                            concept_fname=args.concepts, role_fname=args.role, evsem_fname=args.eventsem,
                            language=args.lang, exclude_lang=args.nolang, semantic_gender=args.gender,
                            emphasis=args.emphasis, prodrop=args.prodrop, trainset=args.trainset, testset=args.testset,
                            plot_title=args.title)

    num_valid_simulations = None
    simulations_with_pron_err = 0
    failed_sim_id = []
    if not args.sim or args.sim == 1:  # only run one simulation
        dualp = DualPath(hidden_size=args.hidden, learn_rate=args.lrate, epochs=args.epochs, role_copy=args.rcopy,
                         elman_debug_mess=args.debug, test_every=args.test_every, compress_size=args.compress,
                         set_weights_folder=args.set_weights, set_weights_epoch=args.set_weights_epoch,
                         fixed_weight=args.fw, input_format=inputs)
        dualp.train_network(decrease_lrate=args.decrease_lrate)
    else:  # start batch training to take the average of results
        processes = []
        for sim in range(args.sim):
            rdir = "%s/%s" % (results_dir, sim)
            os.makedirs(rdir)
            inputs.results_dir = rdir
            dualp = DualPath(hidden_size=args.hidden, learn_rate=args.lrate, epochs=args.epochs, role_copy=args.rcopy,
                             elman_debug_mess=args.debug, test_every=args.test_every, compress_size=args.compress,
                             set_weights_folder=args.set_weights, simulation_num=sim,
                             set_weights_epoch=args.set_weights_epoch, fixed_weight=args.fw, input_format=inputs)
            process = Process(target=dualp.train_network, args=(args.decrease_lrate,))
            process.start()
            processes.append(process)
        for p in processes:
            p.join()

        all_results = []
        for sim in range(args.sim):  # read results from all simulations
            if os.path.isfile('%s/%s/results.pickled' % (results_dir, sim)):
                with open('%s/%s/results.pickled' % (results_dir, sim), 'r') as f:
                    all_results.append(pickle.load(f))
            else:  # this would mean "missing data" though, we could raise a message
                print 'Simulation #%s was problematic' % sim

        if all_results:
            valid_results = []
            # a simulation is valid only if the performance on the POS of the test set was over 75%
            for i, simulation in enumerate(all_results):
                if np.true_divide(simulation['correct_pos']['test'][-1] * 100, inputs.num_test) > 75:
                    valid_results.append(simulation)
                else:
                    failed_sim_id.append(str(i))  # keep track of simulations that failed

            num_valid_simulations = len(valid_results)  # some might have been discarded

            if num_valid_simulations:  # take the average of results and plot
                simulations_with_pron_err = len([simulation for simulation in valid_results
                                                 if sum(simulation['pronoun_errors']['test']) > 0])
                inputs.results_dir = os.path.split(inputs.results_dir)[0]  # go one folder up and save plot
                plot = Plotter(results_dir=results_dir)
                plot.plot_results(take_average_of_valid_results(valid_results), title=inputs.plot_title,
                                  num_train=inputs.num_train, num_test=inputs.num_test,
                                  summary_sim=num_valid_simulations,
                                  test_sentences_with_pronoun=inputs.test_sentences_with_pronoun)

    # Save the parameters of the simulation(s)
    with open("%s/simulation.info" % results_dir, 'w') as f:  # Write simulation details to a file
        f.write(("Input: %s %s\nTitle:%s\nHidden layers: %s\nInitial learn rate: %s\nDecrease lr: %s\nCompress: %s\n"
                 "Copy role: %s\nPercentage pronouns:%s\nPro-drop language:%s\nUse gender info:%s\nEmphasis concept:%s"
                 "\nFixed weights (concept-role): %s\nSet weights folder: %s\nSet weights epoch: %s\nExclude target "
                 "lang during testing:%s\nSimulations with pronoun errors:%s/%s\n%s\n%s") %
                (args.input, "(%s)" % original_input_path if original_input_path else "", args.title, args.hidden,
                 args.lrate, args.decrease_lrate, dualp.compress_size,
                 args.rcopy, args.pron, args.prodrop, args.gender, args.emphasis,
                 dualp.fixed_weight, args.set_weights, args.set_weights_epoch, args.nolang,
                 simulations_with_pron_err, args.sim,
                 "Successful simulations:%s/%s" % (num_valid_simulations, args.sim) if num_valid_simulations else "",
                 "Indeces of failed simulations: %s" % ", ".join(failed_sim_id) if failed_sim_id else ""))

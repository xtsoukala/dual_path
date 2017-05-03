# -*- coding: utf-8 -*-
import shutil
import collections
from multiprocessing import Process, Manager
from datetime import datetime
from modules.elman_network import SimpleRecurrentNetwork, np, deepcopy
from modules.plotter import Plotter
from modules.formatter import InputFormatter, take_average_of_valid_results, os, pickle


class DualPath:
    """
    Dual-path is based on the SRN architecture and has the following layers (plus hidden & context):
    input, (predicted) compress, (predicted) concept & (predicted) role, target language, event-semantics and output.

    The event-semantics unit is the only unit that provides information about the target sentence order.
    E.g. for the dative sentence "A man bakes a cake for the cafe" there are 3 event-sem units: CAUSE, CREATE, TRANSFER

    role-concept and pred_role-pred_concept links are used to store the message

    role, concept and pred_concept units are unbiased to make them more input driven
    """
    def __init__(self, hidden_size, learn_rate, final_learn_rate, momentum, epochs, compress_size, role_copy,
                 srn_debug_mess, test_every, set_weights_folder, set_weights_epoch, input_format, simulation_num=None):
        """
        :param hidden_size: Size of the hidden layer
        :param learn_rate: Learning rate
        :param momentum: accounts for amount of previous weight changes that are added
        :param epochs: Number of train set iterations during training
        :param compress_size: Size of the compress layers (approximatelly hidden/3)
        :param role_copy: Whether to keep a copy of the role layer activation
        :param srn_debug_mess: Whether to show debug messages during training
        :param test_every: Test network every x epochs
        :param set_weights_folder: A folder that contains pre-trained weights as initial weights for simulations
        :param set_weights_epoch: In case of pre-trained weights we can also specify num of epochs (stage of training)
        :param input_format: Instance of InputFormatter Class (contains all the input for the model)
        :param simulation_num: Number of simulation (in case we run several simulations in parallel)
        """
        self.inputs = input_format
        self.compress_size = compress_size
        self.hidden_size = hidden_size

        # Learning rate can be reduced linearly until it reaches the end of the first epoch (then stays stable)
        self.final_lrate = final_learn_rate
        self.lrate_decrease_step = np.true_divide(learn_rate - final_learn_rate, self.inputs.num_train)
        # Epochs indicate the numbers of iteration of the train set during training. 1000 sentences approximate
        # 1 year in Chang & Janciauskas. In Chang, Dell & Bock the total number of sentences experienced is 60000
        self.epochs = epochs
        # |----------!PARAMS----------|
        self.test_every = test_every  # test every x epochs
        self.role_copy = role_copy
        self.set_weights_folder = set_weights_folder
        self.set_weights_epoch = set_weights_epoch
        self.simulation_num = simulation_num
        self.srn = SimpleRecurrentNetwork(learn_rate=learn_rate, momentum=momentum, dir=results_dir,
                                          debug_messages=srn_debug_mess, include_role_copy=self.role_copy)
        self.initialize_network()

        self.compare_unordered = lambda x, y: collections.Counter(x) == collections.Counter(y)
        # dict to save results
        self.results = {'correct_sentences': {'test': [], 'train': []},
                        'correct_pos': {'test': [], 'train': []},
                        'pronoun_errors_flex': {'test': [], 'train': []},
                        'pronoun_errors': {'test': [], 'train': []},
                        'code_switched': {'test': [], 'train': []},
                        'mse': {}}

    def initialize_network(self):
        # The where, what, and cwhat units were unbiased to make them more input driven
        self.srn.add_layer("input", self.inputs.lexicon_size)  # , convert_input=True)
        self.srn.add_layer("identifiability", self.inputs.identif_size, has_bias=False)
        self.srn.add_layer("concept", self.inputs.concept_size, has_bias=False)
        self.srn.add_layer("role", self.inputs.roles_size)
        self.srn.add_layer("compress", self.compress_size)
        self.srn.add_layer("eventsem", self.inputs.event_sem_size)
        self.srn.add_layer("target_lang", len(self.inputs.languages))
        self.srn.add_layer("hidden", self.hidden_size, is_recurrent=True)
        # If pred_role is not softmax the model performs poorly on determiners.
        self.srn.add_layer("pred_role", self.inputs.roles_size, activation_function="softmax")
        self.srn.add_layer("pred_identifiability", self.inputs.identif_size, has_bias=False)
        self.srn.add_layer("pred_concept", self.inputs.concept_size, has_bias=False)
        self.srn.add_layer("pred_compress", self.compress_size)
        self.srn.add_layer("output", self.inputs.lexicon_size, activation_function="softmax")

        # Connect layers
        self.srn.connect_layers("input", "identifiability")
        self.srn.connect_layers("input", "concept")
        self.srn.connect_layers("input", "compress")
        self.srn.connect_layers("identifiability", "role")
        self.srn.connect_layers("concept", "role")
        # hidden layer
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
        weights_role_concept, evsem_act, target_lang_act, message = \
            self.inputs.get_message_info(message, test_phase=(not backpropagate))
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
                prod_idx = trg_idx  # Train with target word, NOT produced one
                self.srn.backpropagate(epoch)
            else:  # no "target" word in this case. Also, return the produced sentence
                prod_idx = self.srn.get_max_output_activation()
                produced_sent_ids.append(prod_idx)
                if prod_idx == self.inputs.period_idx:  # end sentence if a period was produced
                    break
        return produced_sent_ids, target_sentence_ids, message

    def train_network(self, shuffle_set, plot_results=True, evaluate=True):
        """
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
        while epoch < self.epochs:  # start training for x epochs
            if epoch % 5 == 0:  # check whether to save weights or not (only every 5 epochs)
                self.srn.save_weights(results_dir=self.inputs.results_dir, epochs=epoch)

            if shuffle_set:
                np.random.shuffle(self.inputs.trainlines)

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
                if self.srn.learn_rate > self.final_lrate:  # decrease lrate linearly until it reaches 1 epoch
                    self.srn.learn_rate -= self.lrate_decrease_step
            epoch += 1  # increase number of epochs, begin new iteration

        self.srn.save_weights(results_dir=self.inputs.results_dir, epochs=epoch)  # save the last weights

        if evaluate:
            for sim in test_results.values():
                s, p, pr, pr_pos, c = sim
                self.results['correct_sentences']['test'].append(s)
                self.results['correct_pos']['test'].append(p)
                self.results['pronoun_errors']['test'].append(pr)
                self.results['pronoun_errors_flex']['test'].append(pr_pos)
                self.results['code_switched']['test'].append(c)

            for sim in train_results.values():
                s, p, pr, pr_pos, c = sim
                self.results['correct_sentences']['train'].append(s)
                self.results['correct_pos']['train'].append(p)
                self.results['pronoun_errors']['train'].append(pr)
                self.results['pronoun_errors_flex']['train'].append(pr_pos)
                self.results['code_switched']['train'].append(c)

            with open("%s/results.pickled" % self.inputs.results_dir, 'w') as pckl:  # write results to a (pickled) file
                pickle.dump(self.results, pckl)

            if plot_results:
                self.results['mse'] = self.srn.mse
                plt = Plotter(results_dir=self.inputs.results_dir)
                plt.plot_results(self.results, num_train=self.inputs.num_train, num_test=self.inputs.num_test,
                                 title=self.inputs.plot_title,
                                 test_sentences_with_pronoun=self.inputs.test_sentences_with_pronoun)

    def is_code_switched(self, sentence_indeces):
        sentence_no_period = [x for x in sentence_indeces if x != self.inputs.period_idx]  # period common in all lang
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
        num_code_switched = 0

        for line in set_lines:
            produced_sentence_idx, target_sentence_idx, message = self.feed_line(line)

            has_correct_pos = False
            has_wrong_det = False
            code_switched = self.is_code_switched(produced_sentence_idx)
            flexible_order = self.test_for_flexible_order(produced_sentence_idx, target_sentence_idx)
            if produced_sentence_idx == target_sentence_idx or flexible_order:
                num_correct_meaning += 1

            if self.sentence_is_grammatical(produced_sentence_idx):
                num_correct_pos += 1
                has_correct_pos = True
                if code_switched:  # only count grammatically correct sentences
                    num_code_switched += 1
                if not (produced_sentence_idx == target_sentence_idx or flexible_order):
                    has_wrong_det = self.test_for_wrong_determiner(produced_sentence_idx, target_sentence_idx)
                    if has_wrong_det:
                        num_correct_meaning += 1

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
                suffix = ("flex-" if flexible_order or has_wrong_det
                          else "in" if produced_sentence_idx != target_sentence_idx else "")
                with open("%s/%s.eval" % (self.inputs.results_dir, "test" if is_test_set else "train"), 'a') as f:
                    f.write("--------%s--------\nOUT:%s\nTRG:%s\nCode-switched:%s Grammatical:%s Definiteness:%s "
                            "Semantics:%scorrect\n%s\n" %
                            (epoch, self.inputs.sentence_from_indeces(produced_sentence_idx),
                             self.inputs.sentence_from_indeces(target_sentence_idx), code_switched, has_correct_pos,
                             not has_wrong_det, suffix, message))

        # on the set level
        with open("%s/%s.eval" % (self.inputs.results_dir, "test" if is_test_set else "train"), 'a') as f:
            f.write("Iteration %s:\nCorrect sentences: %s/%s Correct POS:%s/%s\n" %
                    (epoch, num_correct_meaning, num_sentences, num_correct_pos, num_sentences))

        results_dict[epoch] = (num_correct_meaning, num_correct_pos, num_pron_err, num_pron_err_flex, num_code_switched)

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
        if self.compare_unordered([x for x in out_sentence_idx if x != self.inputs.to_preposition_idx],
                                  [x for x in trg_sentence_idx if x != self.inputs.to_preposition_idx]):
            flexible_order = True
        elif remove_last_word and self.compare_unordered(out_sentence_idx[:-1], trg_sentence_idx[:-1]):
            flexible_order = True
        return flexible_order

    def test_for_wrong_determiner(self, out_sentence_idx, trg_sentence_idx):
        out = [x for x in out_sentence_idx if x not in self.inputs.determiners]
        trg = [x for x in trg_sentence_idx if x not in self.inputs.determiners]
        return self.test_for_flexible_order(out, trg, allow_identical=True)

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


def generate_title_from_file_extension(file_name):
    title = ''
    if file_name.endswith('.en'):
        title = 'English monolingual model'
    elif file_name.endswith('.es'):
        title = 'Spanish monolingual model'
    elif file_name.endswith('.el'):
        title = 'Greek monolingual model'
    elif file_name.endswith('.enes'):
        title = 'Bilingual EN-ES model'
    return title

if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument('-hidden', help='Number of hidden layer units.', type=int, default=40)
    parser.add_argument('-compress', help='Number of compress layer units', type=int, default=20)
    parser.add_argument('-epochs', help='Number of train set iterations during training.', type=int, default=20)
    parser.add_argument('-input', help='(Input) folder that contains all input files (lexicon, concepts etc)')
    parser.add_argument('-resdir', '-r', help='Prefix of results folder name; will be stored under folder "simulations"'
                                              'and a timestamp will be added')
    parser.add_argument('-lang', help='In case we want to generate a new set, we need to specify the language (en, es '
                                      'or any other string for bilingual)', default='es')
    parser.add_argument('-lrate', help='Learning rate', type=float, default=0.15)  # or: 0.2, 0.15
    parser.add_argument('-final_lrate', '-flrate', help='Final learning rate after linear decrease in the first 1 epoch'
                                                        "(2k sentences). If not set, rate doesn't decrease",
                        type=float, default=0.05)
    parser.add_argument('-momentum', help='Amount of previous weight changes that are taken into account',
                        type=float, default=0.9)
    parser.add_argument('-set_weights', '-sw',
                        help='Set a folder that contains pre-trained weights as initial weights for simulations')
    parser.add_argument('-set_weights_epoch', '-swe', type=int,
                        help='In case of pre-trained weights we can also specify num of epochs (stage of training)')
    parser.add_argument('-fw', '-fixed_weights', type=int, default=12,
                        help='Fixed weight value for concept-role connections')
    parser.add_argument('-fwi', '-fixed_weights_identif', type=int, default=12,
                        help='Fixed weight value for identif-role connections')
    parser.add_argument('-generate_num', type=int, default=2500, help='Sum of test/train sentences to be generated '
                                                                      '(if no input was set)')
    parser.add_argument('-test_every', help='Test network every x epochs', type=int, default=1)
    parser.add_argument('-title', help='Title for the plots')
    parser.add_argument('-sim', type=int, default=1, help='Train several simulations (sim) at once to take the '
                                                          'average of the results (Monte Carlo approach)')
    parser.add_argument('-pron', help='Defines percentage of pronouns (vs NPs) on subject level', type=int, default=100)
    parser.add_argument('-emph', dest='emphasis', type=int, default=0, help='Percentage of overt pronouns in ES')
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
    parser.add_argument('--nolang', dest='nolang', action='store_true', help='Exclude language info during TESTing')
    parser.set_defaults(nolang=False)
    parser.add_argument('--nogender', dest='gender', action='store_false', help='Exclude semantic gender for nouns')
    parser.set_defaults(gender=True)
    parser.add_argument('--simple-sem', dest='gendered_semantics', action='store_false',
                        help='Produce simple concepts instead of combined ones (e.g., FATHER instead of PARENT+M)')
    parser.set_defaults(gendered_semantics=True)
    parser.add_argument('--no-shuffle', dest='shuffle', action='store_false',
                        help='Do not shuffle training set after every epoch')
    parser.set_defaults(shuffle=True)
    parser.add_argument('--past', dest='ignore_past', action='store_false',
                        help='Include past tense')
    parser.set_defaults(ignore_past=True)
    parser.add_argument('--full-verb-form', '--fv', dest='full_verb', action='store_true',
                        help='Use full lexeme for verbs instead of splitting into lemma/suffix')
    parser.set_defaults(full_verb=False)
    parser.add_argument('--allow-free-structure', '--af', dest='free_pos', action='store_true',
                        help='The model is not given role information in the event semantics and it it therefore '
                             'allowed to use any syntactic structure (which is important for testing, e.g., priming)')
    parser.set_defaults(free_pos=False)
    args = parser.parse_args()
    # create path to store results
    results_dir = "simulations/%s%s_%s_h%s_c%s" % ((args.resdir if args.resdir else ""),
                                                   datetime.now().strftime("%Y-%m-%dt%H.%M.%S"),
                                                   args.lang, args.hidden, args.compress)
    os.makedirs(results_dir)

    original_input_path = None  # keep track of the original input in case it was copied
    if args.input:  # generate a new set (unless "input" was also set)
        if not os.path.exists(args.input) and 'input' not in args.input:
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
        sets = SetsGenerator(results_dir=args.input, use_full_verb_form=args.full_verb,
                             use_gendered_semantics=args.gendered_semantics,
                             allow_free_structure_production=args.free_pos, ignore_past=args.ignore_past)
        sets.generate_sets(num_sentences=args.generate_num, lang=args.lang, percentage_pronoun=args.pron,
                           include_bilingual_lexicon=True)

    if not args.trainset:
        args.trainset = [filename for filename in os.listdir(args.input) if filename.startswith("train")][0]
    if not args.testset:
        args.testset = [filename for filename in os.listdir(args.input) if filename.startswith("test")][0]

    if not args.title:
        args.title = generate_title_from_file_extension(args.testset)

    # Save the parameters of the simulation(s)
    with open("%s/simulation.info" % results_dir, 'w') as f:
        f.write(("Input: %s %s\nTitle:%s\nHidden layers: %s\nInitial learn rate: %s\nDecrease lr: %s%s\nCompress: %s\n"
                 "Copy role: %s\nPercentage pronouns:%s\nPro-drop language:%s\nUse gender info:%s\nEmphasis (overt ES "
                 "pronouns):%s%%\nFixed weights: concept-role: %s, identif-role: %s\nSet weights folder: %s (epoch: %s)"
                 "\nExclude lang during testing:%s\nShuffle set after each epoch: %s\n"
                 "Allow free structure production:%s\n") %
                (args.input, "(%s)" % original_input_path if original_input_path else "", args.title, args.hidden,
                 args.lrate, (args.final_lrate is not None), " (%s)" % args.final_lrate if args.final_lrate else "",
                 args.compress, args.rcopy, args.pron, args.prodrop, args.gender, args.emphasis, args.fw, args.fwi,
                 args.set_weights, args.set_weights_epoch, args.nolang, args.shuffle, args.free_pos))

    inputs = InputFormatter(results_dir=results_dir, input_dir=args.input, lex_fname=args.lexicon,
                            concept_fname=args.concepts, role_fname=args.role, evsem_fname=args.eventsem,
                            language=args.lang, exclude_lang=args.nolang, semantic_gender=args.gender,
                            emphasis=args.emphasis, prodrop=args.prodrop, trainset=args.trainset, testset=args.testset,
                            plot_title=args.title, fixed_weights=args.fw, fixed_weights_identif=args.fwi)

    if not args.final_lrate:
        args.final_lrate = args.lrate
    num_valid_simulations = None
    simulations_with_pron_err = 0
    failed_sim_id = []
    if not args.sim or args.sim == 1:  # only run one simulation
        dualp = DualPath(hidden_size=args.hidden, learn_rate=args.lrate, final_learn_rate=args.final_lrate,
                         epochs=args.epochs, role_copy=args.rcopy, srn_debug_mess=args.debug,
                         test_every=args.test_every, compress_size=args.compress,
                         set_weights_folder=args.set_weights, set_weights_epoch=args.set_weights_epoch,
                         input_format=inputs, momentum=args.momentum)
        dualp.train_network(shuffle_set=args.shuffle)
    else:  # start batch training to take the average of results
        processes = []
        for sim in range(args.sim):
            rdir = "%s/%s" % (results_dir, sim)
            os.makedirs(rdir)
            inputs.results_dir = rdir
            dualp = DualPath(hidden_size=args.hidden, learn_rate=args.lrate, final_learn_rate=args.final_lrate,
                             epochs=args.epochs, role_copy=args.rcopy, srn_debug_mess=args.debug,
                             test_every=args.test_every, compress_size=args.compress,
                             set_weights_folder=args.set_weights, simulation_num=sim, momentum=args.momentum,
                             set_weights_epoch=args.set_weights_epoch, input_format=inputs)
            process = Process(target=dualp.train_network, args=(args.shuffle, ))
            process.start()
            processes.append(process)
        for p in processes:
            p.join()

        all_results = []
        for sim in range(args.sim):  # read results from all simulations
            if os.path.isfile('%s/%s/results.pickled' % (results_dir, sim)):
                with open('%s/%s/results.pickled' % (results_dir, sim), 'r') as f:
                    all_results.append(pickle.load(f))
            else:  # this would mean "missing data", we could raise a message
                print 'Simulation #%s was problematic' % sim

        if all_results:
            valid_results = []
            for i, simulation in enumerate(all_results):
                if inputs.training_is_successful(simulation['correct_pos']['test']):
                    valid_results.append(simulation)
                else:
                    failed_sim_id.append(str(i))  # keep track of simulations that failed

            num_valid_simulations = len(valid_results)  # some might have been discarded

            if num_valid_simulations:  # take the average of results and plot
                simulations_with_pron_err = len([simulation for simulation in valid_results
                                                 if sum(simulation['pronoun_errors']['test']) > 0 or
                                                 sum(simulation['pronoun_errors_flex']['test']) > 0])
                inputs.results_dir = os.path.split(inputs.results_dir)[0]  # go one folder up and save plot
                plot = Plotter(results_dir=results_dir)
                plot.plot_results(take_average_of_valid_results(valid_results), title=inputs.plot_title,
                                  num_train=inputs.num_train, num_test=inputs.num_test,
                                  summary_sim=num_valid_simulations,
                                  test_sentences_with_pronoun=inputs.test_sentences_with_pronoun)

    with open("%s/simulation.info" % results_dir, 'a') as f:  # Append information regarding the simulations' success
        f.write("Simulations with pronoun errors:%s/%s\n%s%s" % (simulations_with_pron_err, args.sim,
                "Successful simulations:%s/%s" % (num_valid_simulations, args.sim) if num_valid_simulations else "",
                "\nIndeces of failed simulations: %s" % ", ".join(failed_sim_id) if failed_sim_id else ""))

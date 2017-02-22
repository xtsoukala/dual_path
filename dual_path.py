# -*- coding: utf-8 -*-
import random
import pickle
import numpy as np
from datetime import datetime
from elman_network import ElmanNetwork
from plotter import Plotter
from formatter import InputFormatter, os
from multiprocessing import Process, Manager
from operator import add
import shutil


class DualPath:
    def __init__(self, hidden_size, learn_rate, plot_title, compress_size, set_weights_folder, role_copy,
                 elman_debug_mess, test_every, epochs, set_weights_epoch, fixed_weight, input_format,
                 simulation_num=None):
        self.inputs = input_format
        if compress_size:
            self.compress_size = compress_size
        else:  # or hidden/3 ? hidden: 45+13 (lex+compress) 58 compress = args.hidden / 3
            self.compress_size = len(self.inputs.compress_idx)
        self.hidden_size = hidden_size
        # fixed_weight is the activation between roles-concepts and evsem. The value is rather arbitrary unfortunately.
        # Using a really low value (e.g. 1) makes it difficult for the model to learn the associations
        self.fixed_weight = fixed_weight  # 25 6 10 15

        # Learning rate started at 0.2 and was reduced linearly until it reached 0.05 at 2 epochs (2000 sentences),
        # where it was fixed for the rest of training. Values taken from Chang F., 2002
        # So decrease by 0.000075 until it reaches 2 epochs
        self.learn_rate = learn_rate
        self.momentum = 0.9  # accounts for amount of previous weight changes that are added

        # Epochs indicate the numbers of iteration of the train set during training. 1000 sentences approximate
        # 1 year in Chang & Janciauskas. In Chang, Dell & Bock the total number of sentences experienced is 60000
        self.epochs = epochs
        # |----------!PARAMS----------|
        self.test_every = test_every  # test every x epochs (default: 2000)
        self.plot_title = plot_title
        self.role_copy = role_copy
        self.set_weights_folder = set_weights_folder
        self.set_weights_epoch = set_weights_epoch
        self.simulation_num = simulation_num
        self.srn = ElmanNetwork(learn_rate=self.learn_rate, dir=results_dir, debug_messages=elman_debug_mess,
                                include_role_copy=self.role_copy)
        self.initialize_network()

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
        :param message: string, e.g. "ACTION=CARRY AGENT=FATHER,DEF PATIENT=STICK,INDEF
        E=PAST,PROG" which maps roles (AGENT, PATIENT, ACTION) with concepts and also
        gives information about the event-semantics (E)
        :param test_phase: Set to True during evaluation and False during training
        """
        message = message.strip()

        norm_activation = 1  # 0.5 ? 1?
        reduced_activation = 0  # 0.1-4
        increased_activation = 2
        lang = 'en' if '=EN,' in message else 'es'
        event_sem_activations = np.array([-1] * self.inputs.event_sem_size)  # or np.zeros(self.event_sem_size)
        # include the identifiness (first), i.e. def, indef, pronoun, emph
        weights_role_concept = np.zeros((self.inputs.roles_size, self.inputs.identif_size + self.inputs.concept_size))
        target_lang_activations = np.zeros(len(self.inputs.languages))
        # topic_emphasis_activation = np.array([-1])
        self.inputs.all_roles = dict()
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
                # there's usually only one concept per role unless it's a noun with a det, e.g. (MAN, THE). We want to
                # activate the bindings with a high value, e.g. 6 as suggested by Chang, 2002
                for concept in what.split(","):
                    self.inputs.all_roles[concept] = role
                    if concept in self.inputs.identif:
                        weights_role_concept[self.inputs.roles.index(role)][self.inputs.identif.index(concept)] = \
                            self.fixed_weight
                    else:
                        idx_concept = self.inputs.identif_size + self.inputs.concepts.index(concept)
                        weights_role_concept[self.inputs.roles.index(role)][idx_concept] = self.fixed_weight
        return weights_role_concept, event_sem_activations, target_lang_activations, lang, message

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

            reslt = {'correct_sentences': {'test': [], 'train': []},
                     'correct_pos': {'test': [], 'train': []},
                     'pronoun_errors_flex': {'test': [], 'train': []},
                     'pronoun_errors': {'test': [], 'train': []}
                     }

        epoch = 0
        while epoch <= self.epochs:  # start training for x epochs
            if epoch % 10 == 0:  # check whether to save weights or not (only every 10 epochs)
                self.srn.save_weights(results_dir=self.inputs.results_dir, epochs=epoch)

            if shuffle_set:
                random.shuffle(self.inputs.trainlines)

            if evaluate and epoch % self.test_every == 0:  # evaluate train AND testset
                subprocesses = []
                # test set
                subprocess = Process(target=self.evaluate_network, args=(test_results, epoch,))
                subprocess.start()
                subprocesses.append(subprocess)
                # train set
                subprocess = Process(target=self.evaluate_network, args=(train_results, epoch, trainset, False))
                subprocess.start()
                subprocesses.append(subprocess)
                for sp in subprocesses:
                    sp.join()

            for line in self.inputs.trainlines:  # start training
                sentence, message = line.split('##')
                target_sentence = sentence.split()
                weights_role_concept, evsem_act, target_lang_act, lang, message = self.get_message_info(message)
                self.srn.set_message_reset_context(updated_role_concept=weights_role_concept,
                                                   event_sem_activations=evsem_act, target_lang_act=target_lang_act)
                prod_idx = None  # previously produced word (at the beginning of sentence: None)
                for enum_idx, trg_idx in enumerate(self.inputs.sentence_indeces(target_sentence)):
                    self.srn.set_inputs(input_idx=prod_idx, target_idx=trg_idx)
                    self.srn.feed_forward(start_of_sentence=(prod_idx is None))
                    prod_idx = trg_idx  # Train with target word, NOT produced one
                    self.srn.backpropagate(epoch)

            if epoch < 2 and decrease_lrate:
                self.learn_rate -= 0.000075  # decrease lrate linearly until it reaches 2k lines (1 epoch)

            epoch += 1  # increase number of epochs, begin new iteration

        if evaluate:
            for sim in test_results.values():
                s, p, a_p, pr = sim
                reslt['correct_sentences']['test'].append(s)
                reslt['correct_pos']['test'].append(p)
                reslt['pronoun_errors_flex']['test'].append(a_p)
                reslt['pronoun_errors']['test'].append(pr)

            for sim in train_results.values():
                s, p, a_p, pr = sim
                reslt['correct_sentences']['train'].append(s)
                reslt['correct_pos']['train'].append(p)
                reslt['pronoun_errors_flex']['train'].append(a_p)
                reslt['pronoun_errors']['train'].append(pr)

            with open("%s/results.pickled" % self.inputs.results_dir, 'w') as f:  # write results to a (pickled) file
                pickle.dump(reslt, f)

            if plot_results:
                plt = Plotter(results_dir=self.inputs.results_dir)
                plt.plot_results(reslt, num_train=self.inputs.num_train, num_test=self.inputs.num_test,
                                 title=self.plot_title,
                                 test_sentences_with_pronoun=self.inputs.test_sentences_with_pronoun)

    def evaluate_network(self, results_dict, epoch, eval_set=None, is_test_set=True, check_pron=True):
        """
        :param results_dict: Dictionary that contains evaluation results for all epochs
        :param epoch: Number of epoch
        :param eval_set: We can set a brand new set for evaluation (optional, if not set the train/test set is used)
        :param is_test_set: Whether it is a test set (otherwise a train set is used)
        :param check_pron: Whether to evaluate pronoun production
        :return:
        """

        if eval_set:
            lines = self.inputs.read_set(set_name=trainset)
            num_sentences = len(lines)
        elif is_test_set:
            lines = self.inputs.testlines
            num_sentences = self.inputs.num_test
        else:  # train set
            lines = self.inputs.trainlines
            num_sentences = self.inputs.num_train

        sentences_correct = 0
        words_correct = 0
        correct_pos = 0
        trg_sentences = []

        all_pron_err = 0  # all sentences that have he/she errors, even the ungrammatical ones
        pos_pron_err = 0  # grammatical sentence with gender pronoun error (and potentially other semantic errors)
        pron_err = 0  # sentence with gender pronoun error only (and otherwise correct)
        idx_en_pron = [self.inputs.lexicon.index('he'), self.inputs.lexicon.index('she')]

        for line in lines:
            sentence, message = line.split('##')
            target_sentence = sentence.split()
            weights_role_concept, event_sem_activations, target_lang_act, lang, message = \
                self.get_message_info(message, test_phase=True)
            self.srn.set_message_reset_context(updated_role_concept=weights_role_concept,
                                               event_sem_activations=event_sem_activations,
                                               target_lang_act=target_lang_act)
            prod_idx = None  # set previous target as input (initially it's set to None)
            produced_sentence = []
            code_switched = False
            has_pronoun_error = False
            flexible_order = False
            for enum_idx, trg_idx in enumerate(self.inputs.sentence_indeces(target_sentence)):
                self.srn.set_inputs(input_idx=prod_idx)
                self.srn.feed_forward(start_of_sentence=(prod_idx is None))
                prod_idx = self.srn.get_max_output_activation()
                if trg_idx == prod_idx:
                    words_correct += 1
                else:
                    if check_pron and trg_idx in idx_en_pron and prod_idx in idx_en_pron:  # case gender error
                        has_pronoun_error = True
                    if prod_idx != self.inputs.period_idx and \
                            ((lang == 'EN' and prod_idx >= self.inputs.code_switched_idx) or
                                 (lang == 'ES' and prod_idx < self.inputs.code_switched_idx)):
                        code_switched = True
                produced_sentence.append(self.inputs.lexicon[prod_idx])  # add word to the total sentence
                if prod_idx == self.inputs.period_idx:  # end sentence if a period was produced
                    break
                """ will be removed (solved due to softmax)
                if check_determiners:
                    if epoch >= 2000 and trg_idx in idx_all_dets and prod_idx in idx_all_dets \
                            and prod_idx != trg_idx:
                        # CONCEPT
                        conc, rol = self.srn.get_predconcept_activation()
                        allconc, = np.where(conc > 0.9)
                        max_concept = np.argmax(conc)
                        if len(allconc) == 0:
                            cc = self.concepts[max_concept]
                        else:
                            cc = [self.concepts[x] for x in list(allconc)]
                        # ROLE
                        allroles, = np.where(rol > 0.9)
                        if len(allroles) == 0:
                            rr = self.concepts[np.argmax(rol)]
                        else:
                            rr = [self.roles[x] for x in list(allroles)]
                        # COMPRESS
                        compr = self.srn.get_layer_activation("pred_compress")
                        msg, evsem = message.split(";E=")
                        current_concept = self.concepts[max_concept]
                        produced_word = self.lexicon[prod_idx]
                        max_role = self.roles[np.argmax(rol)]
                        next_word_concept = self.lexicon[sentence_indeces[enum_idx + 1]].upper()
                        if next_word_concept in self.all_roles:
                            trg_role = self.all_roles[next_word_concept]
                        else:
                            trg_role = 'N'

                        hidd = self.srn.get_layer_activation("hidden")
                        allhidd, = np.where(hidd > 0.9)
                        with open("%s/det_errors_test_%s.csv" % (dir, dir.split('/')[0]), "a") as f:
                            csv_w = csv.writer(f, delimiter='|')
                            csv_w.writerow((epoch, epoch, " ".join(produced_sentence), produced_word,
                                            sentence, msg, evsem, current_concept,
                                            (current_concept == self.lexicon[trg_idx].upper()),
                                            cc, max_role, (max_role == trg_role), rr,
                                            np.argmax(compr), np.where(compr > 0.9), np.argmax(hidd), allhidd))
                """
            # stats on the sentence level
            out_sentence = ' '.join(produced_sentence)
            trg_sentences.append(sentence)
            if out_sentence == sentence:
                sentences_correct += 1
            else:
                flexible_order = test_for_flexible_order(out_sentence.split(), sentence.split())
                if flexible_order:
                    sentences_correct += 1  # regard sentence as correct (grammatical and conveys same meaning)

            out_pos = self.inputs.sentence_pos_str(out_sentence)
            corr_pos = False
            if out_pos in self.inputs.allowed_structures:
                corr_pos = True
                correct_pos += 1
            # if POS was correct but produced sentence was not identical to the target one, check if
            # the meaning was correct but expressed with a different syntactic structure (due to, e.g., priming)
            if epoch > 0:
                suffix = "flex-" if flexible_order else "in" if out_sentence != sentence else ""
                with open("%s/%s.eval" % (self.inputs.results_dir, "test" if is_test_set else "train"), 'a') as f:
                    f.write("--------%s--------\nOUT:%s\nTRG:%s\nCS:%s POS:%s (%scorrect sentence)\n%s\n" %
                            (epoch, out_sentence, sentence, code_switched, corr_pos, suffix, message))
            if check_pron and has_pronoun_error:
                all_pron_err += 1
                with open("%s/all_pronoun_%s.err" % (self.inputs.results_dir, "test" if is_test_set else "train"),
                          'a') as f:
                    f.write("OUT:%s\nTRG:%s\n%s"
                            "\n---------------- %s\n" % (out_sentence, sentence, message, epoch))
                if corr_pos:
                    pos_pron_err += 1
                    with open("%s/pos_pronoun_%s.err" % (self.inputs.results_dir, "test" if is_test_set else "train"),
                              'a') as f:
                        f.write("OUT:%s\nTRG:%s\n%s\n"
                                "---------------- %s\n" % (out_sentence, sentence, message, epoch))
                # to be even more strict, check if the rest of the sentence is correct
                if sentence.split()[1:] == produced_sentence[1:]:  # everything but the subject pronoun is the same
                    pron_err += 1  # only the REAL pronoun errors (hopefully it's the same as the ones above)
                    with open("%s/pronoun_%s.err" % (self.inputs.results_dir, "test" if is_test_set else "train"),
                              'a') as f:
                        f.write("OUT:%s\nTRG:%s\n%s"
                                "\n---------------- %s\n" % (out_sentence, sentence, message, epoch))

        # Correct words: %s/%s\n  words_correct, words_total[sum([len(sentence.split()) for sentence in trg_sentences])]
        with open("%s/%s.eval" % (self.inputs.results_dir, "test" if is_test_set else "train"), 'a') as f:
            f.write("Iteration %s:\nCorrect sentences: %s/%s Correct POS:%s/%s\n" %
                    (epoch, sentences_correct, num_sentences, correct_pos, num_sentences))

        results_dict[epoch] = (sentences_correct, correct_pos, all_pron_err, pron_err)


def test_for_flexible_order(out_sentence, trg_sentence):
    flexible_order = False
    if set([x for x in out_sentence if x not in ["to", "."]]) == set([x for x in trg_sentence if x not in ["to", "."]]):
        flexible_order = True
    elif set(out_sentence[:-1]) == set(trg_sentence[:-1]):  # remove the last word
        flexible_order = True
    return flexible_order


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
    parser.add_argument('-lexicon', help='File name that contains the lexicon', default='lexicon.in')
    parser.add_argument('-concepts', help='File name that contains the concepts', default='concepts.in')
    parser.add_argument('-role', help='File name that contains the roles', default='roles.in')
    parser.add_argument('-eventsem', help='File name that contains the event semantics', default='event_sem.in')
    parser.add_argument('-trainset', '-train', help='File name that contains the message-sentence pair for training. '
                                                    'If left empty, the train*.* file under -input will be used.')
    parser.add_argument('-testset', '-test', help='Test set file name')
    parser.add_argument('-generate_num', type=int, default=2500, help='Sum of test/train sentences to be generated '
                                                                      '(if no input was set)')
    parser.add_argument('-test_every', help='Test network every x epochs', type=int, default=1)
    parser.add_argument('-title', help='Title for the plots')
    parser.add_argument('-sim', type=int, default=2, help='Train several simulations (sim) at once to take the '
                                                          'average of the results (Monte Carlo approach)')
    parser.add_argument('-pron', help='Defines percentage of pronouns (vs NPs) on subject level', type=int, default=100)
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

    if args.generate_num:  # generate a new set (unless "input" was also set)
        if args.input:
            if 'input' not in args.input:
                import sys
                sys.exit('No input folder found in the path (%s)' % args.input)
            print "Predefined input folder found (%s), will use that instead of generating a new set" % args.input
            copy_dir(args.input, '%s/input_cp' % results_dir)
            args.input = '%s/input_cp' % results_dir
        else:
            from corpus_generator.generator import SetsGenerator

            args.input = "%s/input/" % results_dir
            sets = SetsGenerator(results_dir=args.input)
            sets.generate_sets(num_sentences=args.generate_num, lang=args.lang, percentage_pronoun=args.pron,
                               include_bilingual_lex=True)

    if not args.trainset:
        fname = [filename for filename in os.listdir(args.input) if filename.startswith("train")][0]
        trainset = os.path.join(args.input, fname)
    else:
        trainset = os.path.join(args.input, args.trainset)

    if not args.testset:
        fname = [filename for filename in os.listdir(args.input) if filename.startswith("test")][0]
        testset = os.path.join(args.input, fname)
    else:
        testset = os.path.join(args.input, args.testset)

    if not args.title:  # if there's no title use the file extension
        if testset.endswith('.en'):
            args.title = 'English monolingual model'
        elif testset.endswith('.es'):
            args.title = 'Spanish monolingual model'
        elif testset.endswith('.el'):
            args.title = 'Greek monolingual model'
        elif testset.endswith('.enes'):
            args.title = 'Bilingual EN-ES model'

    inputs = InputFormatter(results_dir=results_dir, input_dir=args.input, lex_fname=args.lexicon,
                            concept_fname=args.concepts, role_fname=args.role, evsem_fname=args.eventsem,
                            language=args.lang, exclude_lang=args.nolang, semantic_gender=args.gender,
                            emphasis=args.emphasis, prodrop=args.prodrop, trainset=trainset, testset=testset)
    num_valid_simulations = None
    simulations_with_pron_err = 0
    failed_sim_id = []
    if not args.sim or args.sim == 1:  # only run one simulation
        dualp = DualPath(hidden_size=args.hidden, learn_rate=args.lrate, epochs=args.epochs, role_copy=args.rcopy,
                         elman_debug_mess=args.debug, test_every=args.test_every, plot_title=args.title,
                         compress_size=args.compress, set_weights_folder=args.set_weights,
                         set_weights_epoch=args.set_weights_epoch, fixed_weight=args.fw, input_format=inputs)
        dualp.train_network(decrease_lrate=args.decrease_lrate)
    else:  # start batch training to take the average of results
        processes = []
        for sim in range(args.sim):
            rdir = "%s/%s" % (results_dir, sim)
            os.makedirs(rdir)
            inputs.results_dir = rdir
            dualp = DualPath(hidden_size=args.hidden, learn_rate=args.lrate, epochs=args.epochs, role_copy=args.rcopy,
                             elman_debug_mess=args.debug, test_every=args.test_every, plot_title=args.title,
                             compress_size=args.compress, set_weights_folder=args.set_weights, simulation_num=sim,
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

            simulations_with_pron_err = len([simulation for simulation in valid_results
                                             if sum(simulation['pronoun_errors']['test']) > 0])
            results = {}
            for d in valid_results:
                for k, v in d.iteritems():
                    if k not in results:
                        results[k] = {}
                    for s, j in v.iteritems():
                        if s not in results[k]:
                            results[k][s] = np.array(j)
                        else:
                            results[k][s] = np.true_divide(map(add, results[k][s], j), 2)

            inputs.results_dir = os.path.split(inputs.results_dir)[0]
            plot = Plotter(results_dir=results_dir)
            plot.plot_results(results, title=dualp.plot_title, num_train=inputs.num_train,
                              num_test=inputs.num_test, test_sentences_with_pronoun=inputs.test_sentences_with_pronoun,
                              summary_sim=num_valid_simulations)

    # Save the parameters of the simulation(s)
    with open("%s/simulation.info" % results_dir, 'w') as f:  # Write simulation details to a file
        f.write(("Input: %s\nTitle:%s\nHidden layers: %s\nInitial learn rate: %s\nDecrease lr: %s\nCompress: %s\n"
                 "Copy role: %s\nPercentage pronouns:%s\nPro-drop language:%s\nUse gender info:%s\nEmphasis concept:%s"
                 "\nFixed weights (concept-role): %s\nSet weights folder: %s\nSet weights epoch: %s\nExclude target "
                 "lang during testing:%s\nSimulations with pronoun errors:%s/%s\n%s\n%s") %
                (args.input, args.title, args.hidden, args.lrate, args.decrease_lrate, dualp.compress_size,
                 args.rcopy, args.pron, args.prodrop, args.gender, args.emphasis,
                 dualp.fixed_weight, args.set_weights, args.set_weights_epoch, args.nolang,
                 simulations_with_pron_err, args.sim,
                 "Successful simulations:%s/%s\n" % (num_valid_simulations, args.sim) if num_valid_simulations else "",
                 ", ".join(failed_sim_id) if failed_sim_id else ""))

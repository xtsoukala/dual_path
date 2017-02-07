# -*- coding: utf-8 -*-
import os
import random
import pickle
import numpy as np
from datetime import datetime
from elman_network import ElmanNetwork, plt
from multiprocessing import Process, Manager
import shutil
import re


# import gc gc.collect()  # garbage collection, for memory efficiency


class DualPath:
    def __init__(self, hidden_size, learn_rate, results_dir, epochs, input_dir, lex_fname, concept_fname, role_fname,
                 evsem_fname, role_copy, elman_debug_mess, test_every, plot_title, compress_size, set_weights_folder,
                 set_weights_epoch, fixed_weight, exclude_lang, language, trainset=None, testset=None,
                 simulation_num=None, semantic_gender=False, emphasis=False, prodrop=False):
        """ This class mostly contains helper functions that set the I/O for the model (SRN).
        Dual Path has the following layers (plus hidden&context)
        word, compress, concept&role and event-semantics.

        The event-semantics unit is the only unit that provides information
        about the target sentence order
        e.g. for the dative sentence "A man bakes a cake for the cafe" there are
        3 event-sem units: CAUSE, CREATE, TRANSFER

        role-concept and prev_role-prev_concept links are used to store the message

        role, concept and prev_concept units are unbiased to make them more
        input driven (all other units except concept have bias)
        """
        self.input_dir = input_dir  # folder that contains training/test files, the lexicon, roles and event-sem
        self.pos, self.lexicon = self._read_lexicon_and_pos(lex_fname)
        self.concepts = self._read_concepts(concept_fname)
        self.identif = self._read_file_to_list('identifiability.in')
        self.roles = self._read_file_to_list(role_fname)
        self.event_semantics = self._read_file_to_list(evsem_fname)
        self.results_dir = results_dir  # directory where the results are saved
        self.prodrop = prodrop
        self.testset = testset
        self.trainset = trainset  # names of train and test set file names
        self.trainlines = self._read_set()
        self.num_train = len(self.trainlines)
        self.testlines = self._read_set(test=True)
        self.num_test = len(self.testlines)
        self.test_sentences_with_pronoun = self._number_of_pronouns()
        self.allowed_structures = self._read_allowed_structures()  # all allowed POS structures

        self.event_sem_size = len(self.event_semantics)
        self.lexicon_size = len(self.lexicon)
        self.concept_size = len(self.concepts)
        self.identif_size = len(self.identif)
        self.compress_idx = list(self.pos.keys())  # basically accounts for POS (syntactic categories)
        self.roles_size = len(self.roles)

        self.lang = language
        self.languages = self._read_file_to_list('target_lang.in')
        self.exclude_lang = exclude_lang
        # self.determiners = [self.lexicon[i] for i in self.pos['DET']]
        # self.det_pattern = re.compile(r'\b(%s)\b' % "|".join(self.determiners))
        # |----------PARAMS----------|
        if compress_size:
            self.compress_size = compress_size
        else:  # or hidden/3 ? hidden: 45+13 (lex+compress) 58 compress = args.hidden / 3
            self.compress_size = len(self.compress_idx)  # Abstracts syntactic categories
        self.hidden_size = hidden_size
        # fixed_weight is the activation between roles-concepts and evsem. The value is rather arbitrary unfortunately.
        # Using a really low value (e.g. 1) makes it difficult for the model to learn the associations
        self.fixed_weight = fixed_weight  # 25 6 10 15

        # Learning rate started at 0.2 and was reduced linearly until it reached 0.05 at 2 epochs (2000 sentences),
        # where it was fixed for the rest of training. Values taken from Chang F., 2002
        # So decrease by 0.000075 until it reaches 2 epochs
        self.learn_rate = learn_rate
        self.momentum = 0.9  # accounts for amount of previous weight changes that are added

        # Epochs are the total number of sentences seen during training. 1000 epochs approximate 1 year in
        # Chang&Janciauskas, but they train per sentence, not word. In Chang,Dell&Bock the total number of
        # sentences experienced is 60000
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
        # temp
        self.period_idx = self.lexicon.index('.')
        self.code_switched_idx = self.lexicon.index('-a')  # the verb suffix is the first entry in the ES lexicon
        self.semantic_gender = semantic_gender
        self.emphasis = emphasis
        self.all_roles = dict()

    def _number_of_pronouns(self):
        with open(self.testset) as f:
            testl = f.readlines()
        return len([line for line in testl if line.startswith('he ') or line.startswith('she ')])

    def _read_set(self, test=False):
        if test:
            set = self.testset
        else:
            set = self.trainset
        with open(set, 'r+') as f:
            trainlines = f.readlines()
        if self.prodrop:  # make prodrop
            trainlines = [re.sub(r'^(él|ella) ', '', sentence) for sentence in trainlines]
        return trainlines

    def _read_allowed_structures(self):
        return set([self.sentence_pos_str(sentence.split("##")[0]) for sentence in self.trainlines])

    def _percentage(self, x, test=False):
        if test:
            return np.true_divide(x * 100, self.num_test)
        return np.true_divide(x * 100, self.num_train)

    def _read_lexicon_and_pos(self, fname):
        """
        :param fname: the name of the file that contains a list of categories (eg. noun, verb) and the lexicon
        :return: lexicon is a list of words, and pos is a dict that contains information regarding the index
        (in the list of lexicon) of the word for each category. E.g. {'noun': [0, 1], 'verb': [2, 3, 4]}
        """
        pos = dict()
        lexicon = ['', 'NULL']  # FIXME: position 0 is >almost< never predicted, so we start lexicon from 1. Check why.
        pos['NULL'] = [1]  # NULL is only there in case we want to use it for the prodrop language. Otherwise ignore.
        prev_pos = ''
        pos_start = pos_end = 2
        with open(os.path.join(self.input_dir, fname)) as f:
            for line in f:  # POS lines are introduced by a colon (:) otherwise it's a lexicon item
                line = line.rstrip('\n')
                if line.endswith(":"):
                    if prev_pos:
                        if prev_pos in pos:
                            pos[prev_pos] += range(pos_start, pos_end)
                        else:
                            pos[prev_pos] = range(pos_start, pos_end)
                        pos_start = pos_end
                    prev_pos = line[:-1]  # remove the colon
                elif line not in lexicon:  # THERE WERE DUPLICATE WORDS!!
                    lexicon.append(line)
                    pos_end += 1
            if prev_pos in pos:
                pos[prev_pos] += range(pos_start, pos_end)
            else:
                pos[prev_pos] = range(pos_start, pos_end)  # to add the last syntactic category
        return pos, lexicon

    def _read_concepts(self, fname):
        """ Comparing Chang, 2002 (Fig.1) and Chang&Fitz, 2014 (Fig. 2) it
        seems that "where" is renamed to "role" and "what" to concept

        If lexicon-concepts are always mapped 1-to-1 we can simply take lexicon
        and uppercase it i.e. concepts = [x.upper() for x in lexicon],
        otherwise read the file and ignore lines that start with a colon """
        with open(os.path.join(self.input_dir, fname)) as f:
            lines = f.readlines()
        # return [''] + [line.rstrip() for line in lines if not line.startswith(":")] Should we add an empty concept?
        return [line.rstrip() for line in lines if not line.startswith(":")]

    def _read_file_to_list(self, fname):
        """
        Simply read the roles or event-semantics files into a list
        """
        return [line.rstrip('\n') for line in open(os.path.join(self.input_dir, fname))]

    def pos_lookup(self, word):
        """
        :param word_idx: The index of a given word (as stored in the lexicon)
        :return: It looks up the pos dictionary and returns the category of
        the word (noun, verb etc)
        """
        word_idx = self.lexicon.index(word)
        for pos, idx in self.pos.iteritems():
            if word_idx in idx:
                return pos
        import sys  # in case the word index is not available
        sys.exit("No POS found for word %s %s" % (word_idx, self.lexicon[word_idx]))

    def sentence_indeces(self, sentence):
        """
        :param sentence: intended sentence from train file (e.g. "the cat was walk -ing . .")
        :return: list of activations in the lexicon for the words above (e.g. [0, 4, 33, 20, 40, 38]
        """
        return [self.lexicon.index(w) for w in sentence.split()]

    def sentence_pos_str(self, sentence):
        """
        :param sentence: sentence string
        :return: returns a list of the POS of every word in the sentence
        """
        return " ".join([self.pos_lookup(word) for word in sentence.split()])

    def get_message_info(self, message, test_phase=False):
        """
        :param message: string, e.g. "A=CARRY X=FATHER,THE Y=STICK,A
        E=PAST,PROG,XX,YY" which maps roles (A,X,Y) with concepts and also
        gives information about the event-semantics (E)

        NOTE: In the given test and train files several event-semantics had -1 as an event:
        PRES,SIMP,XX,YY,-1,ZZ
        So for now I added the string "-1" as a valid event instead of modifying the train sets
        """
        message = message.strip()
        message = re.sub(r',(AGT|-1|PAT|REC),', ',', message)
        if not self.semantic_gender:
            message = re.sub(',(M|F)(,|;|$)', r'\2', message)
        if not self.emphasis:
            message = re.sub(',EMPH', '', message)
        norm_activation = 1  # 0.5 ? 1?
        reduced_activation = 0  # 0.1-4
        increased_activation = 2
        lang = 'en' if '=EN,' in message else 'es'
        event_sem_activations = np.array([-1] * self.event_sem_size)  # or np.zeros(self.event_sem_size)
        # include the identifiness (first), i.e. def, indef, pronoun, emph
        weights_role_concept = np.zeros((self.roles_size, self.identif_size + self.concept_size))  # , dtype=bool)
        target_lang_activations = np.zeros(len(self.languages))
        # topic_emphasis_activation = np.array([-1])
        self.all_roles = dict()
        for info in message.split(';'):
            role, what = info.split("=")
            if role == "E":  # retrieve activations for the event-sem layer
                activation = norm_activation
                # if self.exclude_lang:  # activate both languages
                #    event_sem_activations[self.event_semantics.index('ES')] = 0 #activation - same for EN
                for event in what.split(","):
                    if event == "-1":  # if -1 precedes an event-sem its activation should be lower than 1
                        activation = norm_activation #reduced_activation
                        break
                    # elif event == "2":
                    #    activation = 1
                    #    break
                    # elif event == 'EMPHASIS':
                    #    #topic_emphasis_activation[0] = 1
                    #    break
                    if event in ['PRESENT', 'PAST']:
                        activation = increased_activation
                    if event in self.languages:
                        target_lang_activations[self.languages.index(event)] = activation
                        '''if not self.exclude_lang:
                            target_lang_activations[self.languages.index(event)] = activation  # activate language
                        else:
                            """for i in self.languages:
                                target_lang_activations[self.languages.index(i)] = 0.5  # now BOTH are active"""
                            target_lang_activations[self.languages.index('ES')] = 0.8  # more active
                            target_lang_activations[self.languages.index('EN')] = 0.2  # less active'''
                    else:
                        event_sem_activations[self.event_semantics.index(event)] = activation  # activate
                    activation = norm_activation  # reset activation levels to maximum
            else:
                # there's usually only one concept per role unless it's a noun with a det, e.g. (MAN, THE). We want to
                # activate the bindings with a high value, e.g. 6 as suggested by Chang, 2002
                for concept in what.split(","):
                    self.all_roles[concept] = role
                    ''' or reduce activation of gender info
                        weights_role_concept[self.roles.index(role)][self.concepts.index(concept)] = \
                            self.fixed_weight / 2
                    '''
                    if concept in self.identif:
                        weights_role_concept[self.roles.index(role)][self.identif.index(concept)] = self.fixed_weight
                    else:
                        idx_concept = self.identif_size + self.concepts.index(concept)
                        weights_role_concept[self.roles.index(role)][idx_concept] = self.fixed_weight
        return weights_role_concept, event_sem_activations, target_lang_activations, lang, message

    def train_network(self, decrease_lrate=False, trainset=None, shuffle_set=True, show_progress=False,
                      plot_results=True):
        """
        decrease_lrate: whether to decrease the learning rate or not
        shuffle_set: Whether to shuffle the training set after each iteration
        show_progress: Show a progress bar (default: false)
        plot_results: Whether to plot the performance
        trainset: the name of the training file (inc. the path). Contains target sentence and the message (A=THROW etc).

        For each word of input sentence:
            - compute predicted response
            - determine error, propagate and update weights
            - copy hidden units to context

        In Chang, Dell & Bock (2006) each model subject experienced 60k message-sentence pairs from its trainset and was
        tested after 2k epochs. Each training set consisted of 8k pairs and the test set of 2k.
        The authors created 20 sets x 8k for 20 subjects
        """
        if trainset:  # in case we want to use a different train set that the one set in DualPath()
            with open(trainset, 'r+') as f:
                self.trainlines = f.readlines()
            if self.prodrop:  # make prodrop
                self.trainlines = [re.sub(r'^(él|ella) ', '', sentence) for sentence in self.trainlines]
            self.num_train = len(self.trainlines)

        manager = Manager()
        train_results = manager.dict()
        test_results = manager.dict()

        correct_sentences = {'test': [], 'train': []}
        correct_pos = {'test': [], 'train': []}
        pronoun_errors_flex = {'test': [], 'train': []}
        pronoun_errors = {'test': [], 'train': []}

        epoch = 0
        while epoch <= self.epochs:  # start training for x epochs
            if epoch % 10 == 0:  # check whether to save weights or not (only every 10 epochs)
                self.srn.save_weights(epochs=epoch)

            if shuffle_set:
                random.shuffle(self.trainlines)

            if epoch % self.test_every == 0:  # evaluate train AND testset
                subprocesses = []
                # test set
                subprocess = Process(target=self.evaluate_network, args=(test_results, epoch,))
                subprocess.start()
                subprocesses.append(subprocess)
                # train set
                subprocess = Process(target=self.evaluate_network, args=(train_results, epoch, trainset, False))
                subprocess.start()
                subprocesses.append(subprocess)
                for p in subprocesses:
                    p.join()

            for line in self.trainlines:  # start training
                sentence, message = line.split('##')
                weights_role_concept, evsem_act, target_lang_act, lang, message = self.get_message_info(message)
                self.srn.set_message_reset_context(updated_role_concept=weights_role_concept,
                                                   event_sem_activations=evsem_act, target_lang_act=target_lang_act)
                prod_idx = None  # previously produced word (at the beginning of sentence: None)
                for enum_idx, trg_idx in enumerate(self.sentence_indeces(sentence)):
                    self.srn.set_inputs(input_idx=prod_idx, target_idx=trg_idx)
                    self.srn.feed_forward(start_of_sentence=(prod_idx is None))
                    prod_idx = self.srn.get_max_output_activation()
                    self.srn.backpropagate(epoch)

            if epoch < 3 and decrease_lrate:
                self.learn_rate -= 0.000075  # decrease lrate linearly until it reaches 2k lines (2 epochs)

            epoch += 1  # increase number of epochs, begin new iteration

        for sim in test_results.values():
            s, p, a_p, pr = sim
            correct_sentences['test'].append(s)
            correct_pos['test'].append(p)
            pronoun_errors_flex['test'].append(a_p)
            pronoun_errors['test'].append(pr)

        for sim in train_results.values():
            s, p, a_p, pr = sim
            correct_sentences['train'].append(s)
            correct_pos['train'].append(p)
            pronoun_errors_flex['train'].append(a_p)
            pronoun_errors['train'].append(pr)

        # ONLY include simulations that have learned successfully! POS accuracy at the end should be at least 75%
        if self._percentage(correct_pos['test'][-1], test=True) > 75 or self.simulation_num is None:
            res_name = "results.pickled"
        else:  # rename folder and don't take data into consideration
            res_name = "results.discarded"
            os.rename("%s/%s" % (os.getcwd(), self.results_dir), "%s/%s_discarded" % (os.getcwd(), self.results_dir))
            self.results_dir += "_discarded"
        with open("%s/%s" % (self.results_dir, res_name), 'w') as f:
            pickle.dump((correct_sentences['train'], correct_pos['train'],
                         [self.num_train] * len(correct_sentences['test']),
                         correct_sentences['test'], correct_pos['test'], pronoun_errors_flex['test'],
                         pronoun_errors['test'], [self.num_test] * len(correct_sentences['test'])), f)

        if plot_results:
            epochs = range(len(correct_sentences['train']))
            plt.plot(epochs, [self._percentage(x) for x in correct_sentences['train']], linestyle='--',
                     color='olivedrab', label='train')
            # plt.plot(epochs, _flex_correct, linestyle='--', color='g', label='train flex')
            plt.plot(epochs, [self._percentage(x) for x in correct_pos['train']], linestyle='--',
                     color='yellowgreen', label='train POS')
            # now add test sentences
            plt.plot(epochs, [self._percentage(x, test=True) for x in correct_sentences['test']],
                     color='darkslateblue', label='test')
            # plt.plot(epochs, test_flex_correct, color='royalblue', label='test flex')
            plt.plot(epochs, [self._percentage(x, test=True) for x in correct_pos['test']], color='deepskyblue',
                     label='test POS')
            plt.ylim([0, 100])
            plt.xlabel('Epochs')
            plt.ylabel('Percentage correct (%)')
            plt.title(self.plot_title)
            plt.legend(loc='lower right', ncol=2, fancybox=True, shadow=True)
            plt.savefig('%s/all_epochs.pdf' % self.results_dir)
            plt.close()

            mse_list = [np.mean(self.srn.mse[epoch], axis=0) for epoch in epochs]
            plt.plot(epochs, mse_list, color='darkslateblue', label='MSE')
            plt.xlabel('Epochs')
            plt.ylabel('Mean Square Error')
            plt.ylim([0, 0.007])
            plt.savefig('%s/all_mse_err.pdf' % self.results_dir)
            plt.close()

            if sum(pronoun_errors_flex['test']) > 0:  # only plot if there's something to be plotted
                plt.plot(epochs, pronoun_errors['test'], color='darkslateblue', label='Subject pronoun errors')
                plt.plot(epochs, pronoun_errors_flex['test'], linestyle='--')
                plt.xlabel('Epochs')
                plt.ylabel('Sum of subject pronoun errors')
                plt.savefig('%s/all_pronoun_err.pdf' % self.results_dir)
                plt.close()

                # same using percentages
                if self.test_sentences_with_pronoun:  # for instance, in ES case there are no sentences with he and she
                    percentage_pronoun_errors = [np.true_divide(x * 100, self.test_sentences_with_pronoun)
                                                 for x in pronoun_errors['test']]
                    percentage_pronoun_errors_flex = [np.true_divide(x * 100, self.test_sentences_with_pronoun)
                                                      for x in pronoun_errors_flex['test']]
                else:
                    percentage_pronoun_errors = pronoun_errors['test']
                    percentage_pronoun_errors_flex = pronoun_errors_flex['test']
                plt.plot(epochs, percentage_pronoun_errors)
                plt.plot(epochs, percentage_pronoun_errors_flex, linestyle='--')
                plt.xlabel('Epochs')
                plt.ylabel('Percentage (%) of subject pronoun errors in test set')
                plt.savefig('%s/perc_all_pronoun_err.pdf' % self.results_dir)
                plt.close()

    def evaluate_network(self, results_dict, epoch='final', eval_set=None, is_test_set=True, check_pron=True):
        """
        :param input: the name of the test or train file (inc. the path). The first line is the target sentence and
        the second line contains the message (A=THROW etc).
        We only use the sentence input when the meaning system (event-sem and concept-role bindings)
        have been given for this sentence.

        First we were setting the period as a beginning of the sentence signal: init_trg_idx = self.lexicon.index('.')
        But according to Chang, Dell&Bock (2006) initially there is not input, and only context and evsem give input
        """
        sentences_correct = 0
        all_pron_err = 0
        pos_pron_err = 0  # the latter only counts otherwise correct sentences (so correct POS)
        pron_err = 0  # all sentence (but the pronoun) is correct
        words_correct = 0
        correct_pos = 0
        trg_sentences = []


        if not is_test_set and not eval_set:
            lines = self.trainlines
            num_sentences = self.num_train
        elif not eval_set:
            eval_set = self.testset
            with open(eval_set, 'r+') as f:
                lines = f.readlines()
            num_sentences = len(lines)
            if is_test_set:
                self.num_test = num_sentences
        if self.prodrop:  # make prodrop
            lines = [re.sub(r'^(él|ella) ', '', sentence) for sentence in lines]
        """ This section will soon be removed as the problem is solved due to softmax
        dir = self.results_dir
        if check_determiners:
            if not os.path.isfile("%s/det_errors_test_%s.csv" % (dir, dir.split('/')[0])):
                with open("%s/det_errors_test_%s.csv" % (dir, dir.split('/')[0]), "w") as f:
                    csv_w = csv.writer(f, delimiter='|')
                    csv_w.writerow(("epochs", "it", "prod. sentence", "current word", " target sentence", "msg", "E",
                                    "max concept", "corr. concept", "all concepts", "max role", "corr. role",
                                    "all roles",  "max compress", "all compress", "max hidden", "all hidden"))
            if 'el' in self.lexicon:
                idx_the = [self.lexicon.index('el'), self.lexicon.index('la')]
                idx_a = [self.lexicon.index('un'), self.lexicon.index('una')]
            else:
                if 'the' in self.lexicon:
                    idx_the = [self.lexicon.index('the')]
                    idx_a = [self.lexicon.index('a')]
                else:
                    idx_a = idx_the = []
            idx_all_dets = idx_a + idx_the """
        if check_pron:
            idx_en_pron = [self.lexicon.index('he'), self.lexicon.index('she')]  # self.lexicon.index('it')
            """idx_all_pron = [self.lexicon.index('he'), self.lexicon.index('she'), self.lexicon.index('it'),
                            self.lexicon.index('ella'), self.lexicon.index('él')]
            idx_es_pron = [self.lexicon.index('ella'), self.lexicon.index('él')]
            idx_en_pron = [self.lexicon.index('he'), self.lexicon.index('she'), self.lexicon.index('it')]"""
            #he_idx = idx_en_pron[0]

        for line in lines:
            sentence, message = line.split('##')
            weights_role_concept, event_sem_activations, target_lang_act, lang, message = self.get_message_info(message)
            # , topic_emphasis = \#, test_phase=True)
            self.srn.set_message_reset_context(updated_role_concept=weights_role_concept,
                                               event_sem_activations=event_sem_activations,
                                               target_lang_act=target_lang_act)  # , topic_emphasis)
            prod_idx = None  # set previous target as input (initially it's set to None)
            produced_sentence = []
            code_switched = False
            has_pronoun_error = False
            #he_error = False
            for enum_idx, trg_idx in enumerate(self.sentence_indeces(sentence)):
                self.srn.set_inputs(input_idx=prod_idx)
                self.srn.feed_forward(start_of_sentence=(prod_idx is None))
                prod_idx = self.srn.get_max_output_activation()
                # fig = self.srn.plot_layers(fig)
                if trg_idx == prod_idx:
                    words_correct += 1
                elif check_pron and not produced_sentence and trg_idx in idx_en_pron:  # sentences with pronoun as trg
                    if prod_idx in idx_en_pron:  # case gender error
                        has_pronoun_error = True
                        #if prod_idx == he_idx:
                        #    he_error = True
                    # else:  different error, we could keep track (in case it's pro-drop omission)--so far not useful
                produced_sentence.append(self.lexicon[prod_idx])  # add word to the total sentence
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
                if prod_idx != self.period_idx and ((lang == 'EN' and prod_idx >= self.code_switched_idx) or
                                                        (lang == 'ES' and prod_idx < self.code_switched_idx)):
                    code_switched = True
            # stats sentence level
            out_sentence = ' '.join(produced_sentence)
            trg_sentences.append(sentence)
            if out_sentence == sentence:
                sentences_correct += 1

            out_pos = self.sentence_pos_str(out_sentence)
            trg_pos = self.sentence_pos_str(sentence)
            corr_pos = False
            if out_pos in self.allowed_structures:  # more generic than if out_pos == trg_pos:
                corr_pos = True
                correct_pos += 1
            if epoch > 0:
                # OUT_POS:%s\nTRG_POS:%s\nout_pos, trg_pos
                with open("%s/%s.eval" % (self.results_dir, "test" if is_test_set else "train"), 'a') as f:
                    f.write("--------%s--------\nOUT:%s\nTRG:%s\nCS:%s POS:%s (%scorrect sentence)\n%s\n" %
                            (epoch, out_sentence, sentence, code_switched, corr_pos,
                             "in" if out_sentence != sentence else "", message))
            if check_pron and has_pronoun_error:
                all_pron_err += 1
                with open("%s/all_pronoun_%s.err" % (self.results_dir, "test" if is_test_set else "train"), 'a') as f:
                    f.write("OUT:%s\nTRG:%s\n%s"
                            "\n---------------- %s\n" % (out_sentence, sentence, message, epoch))
                if corr_pos:
                    pos_pron_err += 1
                    with open("%s/pos_pronoun_%s.err" % (self.results_dir, "test" if is_test_set else "train"),
                              'a') as f:
                        f.write("OUT:%s\nTRG:%s\n%s\n"
                                "---------------- %s\n" % (out_sentence, sentence, message, epoch))
                # to be even more strict, check if the rest of the sentence is correct
                if sentence.split()[1:] == produced_sentence[1:]:  # everything but the subject pronoun is the same
                    pron_err += 1  # only the REAL pronoun errors (hopefully it's the same as the ones above)
                    with open("%s/pronoun_%s.err" % (self.results_dir, "test" if is_test_set else "train"), 'a') as f:
                        f.write("OUT:%s\nTRG:%s\n%s"
                                "\n---------------- %s\n" % (out_sentence, sentence, message, epoch))
            """elif check_pron and (kt or out_pos.split()[1:] == trg_pos.split()[:1]):  # just keep track for now
                # case with complete pro-drop in EN
                with open("%s/kt_%s.err" % (self.results_dir, "test" if is_test_set else "train"), 'a') as f:
                    f.write("OUT:%s\nTRG:%s\n%s"
                            "\n----------------kt:%s %s\n" % (out_sentence, sentence, message, kt, epoch))"""

        # Correct words: %s/%s\n  words_correct, words_total[sum([len(sentence.split()) for sentence in trg_sentences])]
        with open("%s/%s.eval" % (self.results_dir, "test" if is_test_set else "train"), 'a') as f:
            f.write("Iteration %s:\nCorrect sentences: %s/%s Correct POS:%s/%s\n" %
                    (epoch, sentences_correct, num_sentences, correct_pos, num_sentences))

        results_dict[epoch] = (sentences_correct, correct_pos, all_pron_err, pron_err)

    def initialize_network(self):
        # The where, what, and cwhat units were unbiased to make them more input driven
        self.srn.add_layer("input", self.lexicon_size)#, convert_input=True)
        self.srn.add_layer("concept", self.concept_size, has_bias=False)
        self.srn.add_layer("identif", self.identif_size, has_bias=False)
        # role units are softmax units; it forces them to choose a winner and to reduce the activation of competitors
        self.srn.add_layer("role", self.roles_size, has_fixed_weights=True)  # has_bias=False,
        self.srn.add_layer("compress", self.compress_size)
        self.srn.add_layer("eventsem", self.event_sem_size)  # convert_input=True -- it doesn't really matter
        self.srn.add_layer("target_lang", len(self.languages))
        # self.srn.add_layer("topic_emphasis", 1)  # binary, whether subject topic is emphasized or not
        self.srn.add_layer("hidden", self.hidden_size, is_recurrent=True)
        # If pred_role is not softmax the model performs poorly on determiners. The structure doesn't seem to be
        # affected (e.g. active to passive) even when pred_role uses tanh as its activation function.
        self.srn.add_layer("pred_role", self.roles_size, activation_function="softmax")
        self.srn.add_layer("pred_identifiability", self.identif_size, has_fixed_weights=True, has_bias=False)
        self.srn.add_layer("pred_concept", self.concept_size, has_fixed_weights=True, has_bias=False)
        self.srn.add_layer("pred_compress", self.compress_size)
        self.srn.add_layer("output", self.lexicon_size, activation_function="softmax")

        # Connect layers
        self.srn.connect_layers("input", "identif")
        self.srn.connect_layers("input", "concept")
        self.srn.connect_layers("input", "compress")
        self.srn.connect_layers("identif", "role")
        self.srn.connect_layers("concept", "role")
        # hidden layer
        if self.role_copy:  # it doesn't seem to be adding much, better ignore to keep model simple
            self.srn.add_layer("role_copy", self.roles_size)
            self.srn.connect_layers("role_copy", "hidden")
        self.srn.connect_layers("role", "hidden")
        self.srn.connect_layers("compress", "hidden")
        self.srn.connect_layers("eventsem", "hidden")
        self.srn.connect_layers("target_lang", "hidden")
        # self.srn.connect_layers("topic_emphasis", "hidden")
        # hidden to predicted and output layers
        self.srn.connect_layers("hidden", "pred_role")
        self.srn.connect_layers("hidden", "pred_compress")
        self.srn.connect_layers("pred_role", "pred_identifiability")
        self.srn.connect_layers("pred_role", "pred_concept")
        self.srn.connect_layers("pred_identifiability", "output")
        self.srn.connect_layers("pred_concept", "output")
        self.srn.connect_layers("pred_compress", "output")
        self.srn.reset_weights(set_weights_epoch=self.set_weights_epoch, set_weights_folder=self.set_weights_folder,
                               simulation_num=self.simulation_num)


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
    parser.add_argument('-hidden', help='number of hidden layer units.', type=int, default=30)
    parser.add_argument('-epochs', help='Number that indicates the number of train set iterations by the model during '
                                        'training.', type=int, default=20)
    parser.add_argument('-input', help='(Input) folder that contains the input files (lexicon, concepts etc)')
    parser.add_argument('-resdir', '-r', help='Prefix of results folder name; will be stored under folder "simulations"'
                                              'and a timestamp will be added')
    parser.add_argument('-lang', help='In case we want to generate a new set, we need to specify the language (en, es '
                                      'or any other string for bilingual)', default='en')
    parser.add_argument('-lrate', help='Learning rate.', type=float, default=0.1)  # 0.2 or 0.15 or 0.1
    parser.add_argument('-pron', help='Defines percentage of pronouns (vs NPs) on subject level. If not set, there '
                                      'will be no pronouns in the test/train set', type=int, default=100)
    parser.add_argument('-set_weights', '-sw',
                        help='We can set a folder that contains pre-trained weights as initial weights for simulations')
    parser.add_argument('-set_weights_epoch', '-swe', type=int,
                        help='In case of pre-trained weights we can also specify num of epochs under the -sw folder')
    parser.add_argument('-fw', '-fixed_weights', type=int, default=18,
                        help='Fixed weight value for concept-role connections')
    parser.add_argument('-compress', help='Number of compress layer units', type=int)  # 15?
    parser.add_argument('-lexicon', help='File name that contains the lexicon', default='lexicon.in')
    parser.add_argument('-concepts', help='File name that contains the concepts', default='concepts.in')
    parser.add_argument('-role', help='File name that contains the roles', default='roles.in')
    parser.add_argument('-eventsem', help='File name that contains the event semantics', default='event_sem.in')
    parser.add_argument('-trainset', '-train', help='File name that contains the message-sentence pair for training. '
                                                    'If left empty, the train*.* file under -input will be used.')
    parser.add_argument('-testset', '-test', help='Test set file name (optional)')
    parser.add_argument('-generate_num', type=int, default=2500, help='Generate new train/test dataset. generate_num '
                                                                      'is the sum of sentences that will be generated')
    parser.add_argument('-test_every', help='Test network every x epochs', type=int, default=1)
    parser.add_argument('-title', help='Title for the plot(s)')
    parser.add_argument('-sim', type=int, default=2, help='Train several simulations (sim) at once to take the '
                                                          'average of the results (Monte Carlo approach)')
    # boolean arguments
    parser.add_argument('-prodrop', dest='prodrop', action='store_true', help='Indicates that it is a pro-drop lang')
    parser.set_defaults(prodrop=False)
    parser.add_argument('-norolecopy', dest='rcopy', action='store_false',
                        help='If set, the produced role layer is not copied back to the comprehension layer')
    parser.set_defaults(rcopy=False)
    parser.add_argument('-debug', help='Debugging info for SRN layers and deltas', dest='debug', action='store_true')
    parser.set_defaults(debug=False)
    parser.add_argument('-nodlr', dest='decrease_lrate', action='store_false', help='Stop automatic decrease of lrate')
    parser.set_defaults(decrease_lrate=True)
    parser.add_argument('-nolang', dest='nolang', action='store_true', help='Exclude language info during TESTing')
    parser.set_defaults(nolang=False)
    parser.add_argument('-nogender', dest='gender', action='store_false', help='Exclude semantic gender for nouns')
    parser.set_defaults(gender=True)
    parser.add_argument('-emph', dest='emphasis', action='store_true', help='Include emphasis concept 30%% of the time')
    parser.set_defaults(emphasis=False)
    args = parser.parse_args()  # parse_known_args()[0] won't show non existing arguments, it's better to get a warning

    results_dir = "simulations/%s%s_%s_h%s" % ((args.resdir if args.resdir else ""),
                                               datetime.now().strftime("%Y-%m-%dt%H.%M.%S"), args.lang, args.hidden)
    os.makedirs(results_dir)

    if args.generate_num:  # generate a new set (unless "dir" was also set. Resolve the conflict)
        if args.input:
            print "Predefined input folder found (%s), will use that instead of generating a new set" % args.input
            copy_dir(args.input, '%s/input_cp' % results_dir)
            args.input = '%s/input_cp' % results_dir
        else:
            from corpora.corpus_generator.generator import GenerateSets

            # args.input = "corpora/generated/%s_%s" % (args.lang, datetime.now().strftime("%Y-%m-%dt%H.%M"))
            args.input = "%s/input" % results_dir
            sets = GenerateSets(results_dir=args.input)
            sets.generate_sets(num_sentences=args.generate_num, lang=args.lang,
                               use_emphasis_concept=True, use_subject_emphasis=False,
                               percentage_pronoun=args.pron, bilingual_lexicon=True, extended_evsem=True)

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
        else:
            args.title = 'Bilingual EN-ES model'

    number_of_all_pronoun_errors = 0
    if not args.sim or args.sim == 1:  # only run one simulation
        dualp = DualPath(hidden_size=args.hidden, learn_rate=args.lrate, results_dir=results_dir, epochs=args.epochs,
                         input_dir=args.input, lex_fname=args.lexicon, concept_fname=args.concepts,
                         role_fname=args.role, evsem_fname=args.eventsem, role_copy=args.rcopy,
                         elman_debug_mess=args.debug, test_every=args.test_every, plot_title=args.title,
                         compress_size=args.compress, set_weights_folder=args.set_weights, language=args.lang,
                         set_weights_epoch=args.set_weights_epoch, fixed_weight=args.fw, exclude_lang=args.nolang,
                         semantic_gender=args.gender, emphasis=args.emphasis, prodrop=args.prodrop, trainset=trainset,
                         testset=testset)
        dualp.train_network(decrease_lrate=args.decrease_lrate)
        # if we want to see whether the single simulation failed, we can add a bool in the train_network function
        num_valid_simulations = 1
    else:  # start batch training to take the average of results
        processes = []
        for sim in range(args.sim):
            rdir = "%s/%s" % (results_dir, sim)
            os.makedirs(rdir)
            dualp = DualPath(hidden_size=args.hidden, learn_rate=args.lrate, results_dir=rdir, epochs=args.epochs,
                             input_dir=args.input, lex_fname=args.lexicon, concept_fname=args.concepts,
                             role_fname=args.role, evsem_fname=args.eventsem, role_copy=args.rcopy,
                             elman_debug_mess=args.debug, compress_size=args.compress, plot_title=args.title,
                             test_every=args.test_every, set_weights_folder=args.set_weights, language=args.lang,
                             set_weights_epoch=args.set_weights_epoch, fixed_weight=args.fw, exclude_lang=args.nolang,
                             semantic_gender=args.gender, emphasis=args.emphasis, simulation_num=sim,
                             prodrop=args.prodrop, trainset=trainset, testset=testset)
            process = Process(target=dualp.train_network, args=(args.decrease_lrate,))
            process.start()
            processes.append(process)
        for p in processes:
            p.join()

        # read the results from all the simulations
        results = []
        for sim in range(args.sim):
            if os.path.isfile('%s/%s/results.pickled' % (results_dir, sim)):
                with open('%s/%s/results.pickled' % (results_dir, sim), 'r') as f:
                    results.append(pickle.load(f))
            else:
                print 'Simulation #%s was problematic' % sim

        num_valid_simulations = len(results)  # some might have been discarded
        if results:
            simulations_with_pron_err = [simulation for simulation in results if sum(simulation[6]) > 0]
            number_of_all_pronoun_errors = len(simulations_with_pron_err)
            # print number_of_all_pronoun_errors
            (num_correct, pos_correct, train_sentences, test_num_correct,
             test_pos_correct, all_pronoun_err, pronoun_err, test_sentences) = np.mean(results, axis=0)
            epoch_list = range(len(test_num_correct))
            # take average of lists and plot
            plt.plot(epoch_list, np.true_divide(num_correct * 100, train_sentences), linestyle='--', color='olivedrab', label='train')
            plt.plot(epoch_list, np.true_divide(pos_correct * 100, train_sentences), linestyle='--', color='yellowgreen',
                     label='train POS')
            # add test sentences
            plt.plot(epoch_list, np.true_divide(test_num_correct * 100, test_sentences), color='darkslateblue', label='test')
            plt.plot(epoch_list, np.true_divide(test_pos_correct * 100, test_sentences), color='deepskyblue', label='test POS')
            plt.ylim([0, 100])
            plt.xlabel('Epochs')
            plt.ylabel('Percentage correct (%)')
            plt.title(args.title)
            plt.legend(loc='lower right', ncol=2, fancybox=True, shadow=True)
            plt.savefig('%s/summary_%s_simulations.pdf' % (results_dir, num_valid_simulations))
            plt.close()

            if sum(all_pronoun_err) > 0:
                plt.title('Subject pronoun errors')
                plt.plot(epoch_list, all_pronoun_err, color='deepskyblue', linestyle='--')
                plt.plot(epoch_list, pronoun_err)
                plt.xlabel('Epochs')
                plt.ylabel('Mean errors')
                plt.savefig('%s/summary_%s_pronoun_err.pdf' % (results_dir, num_valid_simulations))
                plt.close()
                # same using %
                with open(dualp.testset) as f:
                    testl = f.readlines()
                sentences_pronoun = len([line for line in testl if line.startswith('he ') or line.startswith('she ')])
                if sentences_pronoun:
                    all_pronoun_err = np.true_divide(all_pronoun_err * 100, sentences_pronoun)
                    pronoun_err = np.true_divide(pronoun_err * 100, sentences_pronoun)
                plt.title("Percentage of subject pronoun errors (%%) for %s " % dualp.plot_title)
                plt.plot(epoch_list, all_pronoun_err, color='deepskyblue', linestyle='--')
                plt.plot(epoch_list, pronoun_err)
                plt.ylim([0, 40])
                plt.xlabel('Epochs')
                plt.ylabel('Mean errors %')
                plt.savefig('%s/summary_%s_percentage_pronoun_err.pdf' % (results_dir, num_valid_simulations))
                plt.close()
    # Save the parameters of the simulation(s)
    with open("%s/simulation.info" % results_dir, 'w') as f:  # Write simulation details to a file
        f.write(("Input: %s\nTitle:%s\nHidden layers: %s\nInitial learn rate: %s\nDecrease lr: %s\nCompress: %s\n"
                 "Copy role: %s\nPercentage pronouns:%s\nPro-drop language:%s\nUse gender info:%s\nEmphasis concept:%s"
                 "\nFixed weights (concept-role): %s\nSet weights folder: %s\nSet weights epoch: %s\nExclude target "
                 "lang during testing:%s\nSuccessful simulations:%s/%s\nSimulations with pronoun errors:%s/%s") %
                (args.input, args.title, args.hidden, args.lrate, args.decrease_lrate, dualp.compress_size,
                 args.rcopy, args.pron, args.prodrop, args.gender, args.emphasis, dualp.fixed_weight, args.set_weights,
                 args.set_weights_epoch, args.nolang, num_valid_simulations, args.sim,
                 number_of_all_pronoun_errors, args.sim))

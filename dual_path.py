# -*- coding: utf-8 -*-
import shutil
import collections
import itertools
from multiprocessing import Process, Manager
from datetime import datetime
from modules.elman_network import SimpleRecurrentNetwork, np, deepcopy
from modules.plotter import Plotter
from modules.formatter import InputFormatter, compute_mean_and_std, os, pickle


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
                 input_format, check_pronouns, allow_cognate_boost=False, simulation_num=None):
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
        :param input_format: Instance of InputFormatter Class (contains all the input for the model)
        :param check_pronouns: Whether to evaluate pronoun production
        :param simulation_num: Number of simulation (useful in case we run several simulations in parallel)
        :param allow_cognate_boost: Whether the non-target language will be boosted after the model produces a cognate
        """
        self.inputs = input_format
        self.compress_size = compress_size
        self.hidden_size = hidden_size

        # Learning rate can be reduced linearly until it reaches the end of the first epoch (then stays stable)
        self.final_lrate = final_learn_rate
        # Compute according to how much the lrate decreases and over how many epochs (num_epochs_decreasing_step)
        num_epochs_decreasing_step = 2
        self.lrate_decrease_step = np.true_divide(learn_rate - final_learn_rate,
                                                  self.inputs.num_train * num_epochs_decreasing_step)
        # Epochs indicate the numbers of iteration of the training set during training. 1000 sentences approximate
        # 1 year in Chang & Janciauskas. In Chang, Dell & Bock the total number of sentences experienced is 60000
        self.epochs = epochs
        # |----------!PARAMS----------|
        self.allow_cognate_boost = allow_cognate_boost
        self.exclude_lang = exclude_lang
        self.check_pronouns = check_pronouns
        self.test_every = test_every  # test every x epochs
        self.role_copy = role_copy
        self.input_copy = input_copy
        self.set_weights_folder = set_weights_folder
        self.set_weights_epoch = set_weights_epoch
        self.simulation_num = simulation_num
        self.srn = SimpleRecurrentNetwork(learn_rate=learn_rate, momentum=momentum, dir=results_dir,
                                          debug_messages=srn_debug, include_role_copy=role_copy,
                                          include_input_copy=input_copy)
        self.initialize_network()

        self.same_unordered_lists = lambda x, y: collections.Counter(x) == collections.Counter(y)
        # dict to save results
        self.results = {'correct_sentences': {'test': [], 'training': []},
                        'correct_pos': {'test': [], 'training': []},
                        'pronoun_errors_flex': {'test': [], 'training': []},
                        'pronoun_errors': {'test': [], 'training': []},
                        'correct_code_switches': {'test': [], 'training': []},
                        'code_switches': {'test': [], 'training': []},
                        'type_code_switches': {'test': [], 'training': []},
                        'mse': {}}

    def initialize_network(self):
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
                    lang_act = [0.8, 0.8] #if self.inputs.languages.index(lang) == 0 else [1, 1]
                    self.srn.reset_target_lang(target_lang_act=lang_act)  # if left None: 50/50
                prod_idx = self.srn.get_max_output_activation()
                produced_sent_ids.append(prod_idx)
                if prod_idx == self.inputs.period_idx:  # end sentence if a period was produced
                    break
            # boost after cognate
            if self.exclude_lang and prod_idx in self.inputs.cognate_idx and self.allow_cognate_boost:
                self.srn.boost_non_target_lang(target_lang_idx=self.inputs.languages.index(lang))

        return produced_sent_ids, target_sentence_ids, message, lang

    def train_network(self, shuffle_set, plot_results=True, evaluate=True):
        """
        :param shuffle_set: Whether to shuffle the training set after each iteration
        :param plot_results: Whether to plot the performance
        :param evaluate: Whether to evaluate training and test sets every x epochs. The only reason NOT to evaluate
                         is for speed, if we want to training network and save weights

        Training: for each word of input sentence:
            - compute predicted response
            - determine error, (back)propagate and update weights
            - copy hidden units to context

        In Chang, Dell & Bock (2006) each model subject experienced 60k message-sentence pairs from its training set and
        was tested after 2k epochs. Each training set consisted of 8k pairs and the test set_name of 2k.
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

            if evaluate and epoch % self.test_every == 0:  # evaluate training AND testset
                subprocesses = []
                # test set
                subprocess = Process(target=self.evaluate_network, args=(test_results, epoch, self.inputs.testlines,
                                                                         self.inputs.num_test,
                                                                         self.check_pronouns if epoch > 0 else False))
                subprocess.start()
                subprocesses.append(subprocess)
                # training set
                subprocess = Process(target=self.evaluate_network, args=(train_results, epoch, self.inputs.trainlines,
                                                                         self.inputs.num_train,
                                                                         self.check_pronouns if epoch > 0 else False,
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

        if evaluate:
            for sim in test_results.values():
                s, p, pr, pr_pos, cc, c, t = sim
                self.results['correct_sentences']['test'].append(s)
                self.results['correct_pos']['test'].append(p)
                self.results['pronoun_errors']['test'].append(pr)
                self.results['pronoun_errors_flex']['test'].append(pr_pos)
                self.results['correct_code_switches']['test'].append(cc)
                self.results['code_switches']['test'].append(c)
                self.results['type_code_switches']['test'].append(t)

            for sim in train_results.values():
                s, p, pr, pr_pos, cc, c, t = sim
                self.results['correct_sentences']['training'].append(s)
                self.results['correct_pos']['training'].append(p)
                self.results['pronoun_errors']['training'].append(pr)
                self.results['pronoun_errors_flex']['training'].append(pr_pos)
                self.results['correct_code_switches']['training'].append(cc)
                self.results['code_switches']['training'].append(c)
                self.results['type_code_switches']['training'].append(t)
            # convert "type_code_switches" from list of dicts to a single dict
            type_training = sorted(set().union(*(d.keys() for d in self.results['type_code_switches']['training'])))
            type_test = sorted(set().union(*(d.keys() for d in self.results['type_code_switches']['test'])))

            types_dict = {}
            for type in type_training:
                val = []
                for epoch in range(self.epochs):
                    v = self.results['type_code_switches']['training'][epoch][type] \
                        if type in self.results['type_code_switches']['training'][epoch] else 0
                    val.append(v)
                types_dict[type] = val
            self.results['type_code_switches']['training'] = types_dict

            types_dict = {}
            for type in type_test:
                val = []
                for epoch in range(self.epochs):
                    v = self.results['type_code_switches']['test'][epoch][type] \
                        if type in self.results['type_code_switches']['test'][epoch] else 0
                    val.append(v)
                types_dict[type] = val
            self.results['type_code_switches']['test'] = types_dict
            # print self.results['type_code_switches']['test']
            # write (single) simulation results to a pickled file
            with open("%s/results.pickled" % self.inputs.results_dir, 'w') as pckl:
                pickle.dump(self.results, pckl)

            if plot_results:
                self.results['mse'] = self.srn.mse
                plt = Plotter(results_dir=self.inputs.results_dir)
                plt.plot_results(self.results, num_train=self.inputs.num_train, num_test=self.inputs.num_test,
                                 title=self.inputs.plot_title,
                                 test_sentences_with_pronoun=self.inputs.test_sentences_with_pronoun)

    def is_code_switched(self, sentence_indeces, target_lang):
        """ This function only checks whether words from different languages were used.
        It doesn't verify the validity of the expressed message """
        # skip indeces that are common in all lang
        clean_sentence = [x for x in sentence_indeces if x not in self.inputs.shared_idx]
        if not clean_sentence:
            return False  # empty sentence
        min_and_max_idx = get_minimum_and_maximum_idx(clean_sentence)
        if ((all(x >= self.inputs.code_switched_idx for x in min_and_max_idx) or
            all(x < self.inputs.code_switched_idx for x in min_and_max_idx)) and
                self.morpheme_is_from_target_lang(clean_sentence[0], target_lang)):
                return False
        return True

    def morpheme_is_from_target_lang(self, morpheme_idx, target_lang):
        """
        Assumption: this doesn't check for shared indeces (period/congates) because they have already been stripped
        """
        if ((target_lang == self.inputs.L1 and morpheme_idx < self.inputs.code_switched_idx) or
                (target_lang == self.inputs.L2 and morpheme_idx >= self.inputs.code_switched_idx)):
            return True
        return False

    def get_code_switched_type(self, out_sentence_idx, trg_sentence_idx):
        """ Types of code-switches:
                - intra-sentential (in the middle of the sentence)
                - inter-sentential (full switch at sentence boundaries)
                - extra-sentential (insertion of tag)
                - noun borrowing? (if no determiners were switched)
            Note: Returns FALSE if the message conveyed was not correct
        """
        # First "translate" message into the target language and compare with target sentence
        translated_sentence_candidates = self.translate_idx_into_monolingual_candidates(out_sentence_idx,
                                                                                        trg_sentence_idx[0])
        for translated_sentence_idx in translated_sentence_candidates:
            cs_type = self.examine_sentences_for_cs_type(translated_sentence_idx, out_sentence_idx, trg_sentence_idx)
            if cs_type:  # if not False no need to look further
                return cs_type
        return False  # no CS type found

    def translate_idx_into_monolingual_candidates(self, out_sentence_idx, trg_lang_word_idx):
        if trg_lang_word_idx < self.inputs.code_switched_idx:
            lang = self.inputs.L1
        else:
            lang = self.inputs.L2
        trans = [self.inputs.find_equivalent_translation_idx(idx, lang) for idx in out_sentence_idx]
        return [list(x for x in tup) for tup in list(itertools.product(*trans))]

    def _idx_is_cognate_or_ff(self, idx):
        if idx in self.inputs.shared_idx:
            return True
        return False

    def examine_sentences_for_cs_type(self, translated_sentence_idx, out_sentence_idx, trg_sentence_idx):
        if not self.test_for_flexible_order(translated_sentence_idx, trg_sentence_idx, allow_identical=True):
            return False  # output and translated messages are not (flex-)identical, code-switch has wrong meaning
        check_idx = [w for w in out_sentence_idx if (w not in trg_sentence_idx
                                                     and w is not self._idx_is_cognate_or_ff(w))]
        if len(check_idx) == 0:
            return False  # it was either a cognate or a false friend

        # check if sequence is a subset of the sentence (out instead of trg because target is monolingual)
        if len(check_idx) > 1 and " ".join(str(x) for x in check_idx) in " ".join(str(x) for x in out_sentence_idx):
            # if check_idx == trg_sentence_idx[-len(check_idx):] or check_idx == trg_sentence_idx[-len(check_idx):-1]:
            cs_type = "alternational"
        else:
            check_idx_pos = [self.inputs.pos_lookup(w) for w in check_idx]
            if len(set(check_idx_pos)) == 1:
                cs_type = "%s" % check_idx_pos[0].lower()
            else:
                # print self.inputs.sentence_from_indeces(out_sentence_idx)
                # print self.inputs.sentence_from_indeces(translated_sentence_idx)
                # print "POS: %s. INSP:%s %s" % (check_idx_pos, check_idx, self.inputs.sentence_from_indeces(check_idx))
                cs_type = "inter-word switch"
        return cs_type

    def has_pronoun_error(self, out_sentence_idx, trg_sentence_idx):
        out_pronouns = [idx for idx in out_sentence_idx if idx in self.inputs.idx_pronoun]
        trg_pronouns = [idx for idx in trg_sentence_idx if idx in self.inputs.idx_pronoun]
        if out_pronouns != trg_pronouns:
            return True
        return False

    def test_meaning_without_pronouns(self, out_sentence_idx, trg_sentence_idx):
        # remove subject pronouns and check the rest of the sentence
        out = [idx for idx in out_sentence_idx if idx not in self.inputs.idx_pronoun]
        trg = [idx for idx in trg_sentence_idx if idx not in self.inputs.idx_pronoun]
        return self.test_for_flexible_order(out, trg, allow_identical=True)

    def evaluate_network(self, results_dict, epoch, set_lines, num_sentences, check_pron, is_test_set=True):
        """
        :param results_dict: Dictionary that contains evaluation results for all epochs
        :param epoch: Number of epoch
        :param set_lines: the set lines (message+sentence) that are used for the evaluation
        :param num_sentences: the size of set_lines
        :param check_pron: Whether to evaluate pronoun production
        :param is_test_set: Whether it is a test set (otherwise a training set is used)
        """
        num_correct_meaning = 0
        num_correct_pos = 0
        num_pron_err = 0
        # in addition to num_pron_err, count grammatically correct sentences with gender error that convey wrong meaning
        num_pron_err_flex = 0
        num_all_code_switches = 0
        num_correct_code_switches = 0
        type_all_code_switches = {}
        file_prefix = "test" if is_test_set else "train"

        for line in set_lines:
            produced_sentence_idx, target_sentence_idx, message, lang = self.feed_line(line)
            has_correct_pos, has_wrong_det, has_wrong_tense, correct_meaning, cs_type = False, False, False, False, None
            is_grammatical, flexible_order = self.get_sentence_grammaticality_and_flex_order(produced_sentence_idx,
                                                                                             target_sentence_idx)
            code_switched = self.is_code_switched(produced_sentence_idx, target_lang=lang)
            if code_switched:
                num_all_code_switches += 1

            if is_grammatical:
                num_correct_pos += 1
                has_correct_pos = True

                if code_switched:  # only count grammatically correct sentences
                    # determine CS type here
                    cs_type = self.get_code_switched_type(produced_sentence_idx, target_sentence_idx)
                    if cs_type:  # TODO: it could be interesting to check the failed sentences too
                        correct_meaning = True
                        num_correct_code_switches += 1
                        cs_type_with_lang = "%s-%s" % (lang, cs_type)
                        if cs_type_with_lang in type_all_code_switches:
                            type_all_code_switches[cs_type_with_lang] += 1
                        else:
                            type_all_code_switches.update({cs_type_with_lang: 1})

                        # check for cognates vs FFs vs regular (no lang)
                        if ',COG' in message:
                            cs_type_with_cognate_status = "%s-COG" % cs_type
                        elif ',FF' in message:
                            cs_type_with_cognate_status = "%s-FF" % cs_type
                        else:  # no cognates or false friends
                            cs_type_with_cognate_status = cs_type

                        if cs_type_with_cognate_status in type_all_code_switches:
                            type_all_code_switches[cs_type_with_cognate_status] += 1
                        else:
                            type_all_code_switches.update({cs_type_with_cognate_status: 1})

                else:
                    correct_meaning = self.has_correct_meaning(produced_sentence_idx, target_sentence_idx)

                if correct_meaning:
                    num_correct_meaning += 1
                else:
                    has_wrong_det = self.test_without_feature(produced_sentence_idx, target_sentence_idx,
                                                              feature="determiners")
                    has_wrong_tense = self.test_without_feature(produced_sentence_idx, target_sentence_idx,
                                                                feature="tense")
                    if has_wrong_det or has_wrong_tense:
                        num_correct_meaning += 1  # if the only mistake was the determiner, count it as correct

                if check_pron:  # only check the grammatical sentences
                    correctedness_status = ""
                    if self.has_pronoun_error(produced_sentence_idx, target_sentence_idx):
                        if self.test_meaning_without_pronouns(produced_sentence_idx, target_sentence_idx):
                            num_pron_err += 1
                        else:
                            correctedness_status = "(POS only)"
                            num_pron_err_flex += 1

                        with open("%s/pronoun_%s.err" % (self.inputs.results_dir, file_prefix),
                                  'a') as f:
                            f.write("--------%s--------%s\nOUT:%s\nTRG:%s\n%s\n" %
                                    (epoch, correctedness_status,
                                     self.inputs.sentence_from_indeces(produced_sentence_idx),
                                     self.inputs.sentence_from_indeces(target_sentence_idx), message))
            if epoch > 0:
                suffix = ("flex-" if (flexible_order and correct_meaning) or has_wrong_det or has_wrong_tense
                          else "in" if not correct_meaning else "")
                with open("%s/%s.out" % (self.inputs.results_dir, file_prefix), 'a') as f:
                    f.write("--------%s--------\nOUT:%s\nTRG:%s\nGrammatical:%s Tense:%s Definiteness:%s "
                            "Meaning:%scorrect %s\n%s\n" %
                            (epoch, self.inputs.sentence_from_indeces(produced_sentence_idx),
                             self.inputs.sentence_from_indeces(target_sentence_idx), has_correct_pos,
                             not has_wrong_tense, not has_wrong_det,
                             suffix, "%s" % ("(code-switch%s)" % (": %s" % cs_type if cs_type else "")
                                             if code_switched else ""), message))

        # on the set level
        with open("%s/%s.out" % (self.inputs.results_dir, file_prefix), 'a') as f:
            f.write("Iteration %s:\nCorrect sentences: %s/%s Correct POS:%s/%s\n" %
                    (epoch, num_correct_meaning, num_sentences, num_correct_pos, num_sentences))

        results_dict[epoch] = (num_correct_meaning, num_correct_pos, num_pron_err, num_pron_err_flex,
                               num_correct_code_switches, num_all_code_switches, type_all_code_switches)

    def test_for_flexible_order(self, out_sentence_idx, trg_sentence_idx, remove_last_word=True, allow_identical=False,
                                ignore_det=True):
        """
        :param out_sentence_idx:
        :param trg_sentence_idx:
        :param remove_last_word:
        :param allow_identical: Whether to return False if sentences are identical
        :param ignore_det: Whether to count article definiteness (a/the) as a mistake
        :return: if produced sentence was not identical to the target one, check if the meaning was correct but
        expressed with a different syntactic structure (due to, e.g., priming)
        """
        if out_sentence_idx == trg_sentence_idx and not allow_identical:  # only check non identical sentences
            return False
        flexible_order = False
        ignore_idx = self.inputs.to_prepositions_idx
        if ignore_det:
            ignore_idx.extend(self.inputs.determiners)

        if self.same_unordered_lists([x for x in out_sentence_idx if x not in ignore_idx],
                                     [x for x in trg_sentence_idx if x not in ignore_idx]):
            flexible_order = True
        elif remove_last_word and self.same_unordered_lists(out_sentence_idx[:-1], trg_sentence_idx[:-1]):
            flexible_order = True
        return flexible_order

    def test_without_feature(self, out_sentence_idx, trg_sentence_idx, feature):
        if feature == "tense":
            feature_markers = self.inputs.tense_markers
        elif feature == "determiners":
            feature_markers = self.inputs.determiners
        out = [x for x in out_sentence_idx if x not in feature_markers]
        trg = [x for x in trg_sentence_idx if x not in feature_markers]
        return self.test_for_flexible_order(out, trg, allow_identical=True, ignore_det=False)

    def get_sentence_grammaticality_and_flex_order(self, out_sentence_idx, trg_sentence_idx):
        """
        Check a sentence's grammaticality. If the target and output sentences don't have identical POS but differ only
        on the double object expression (e.g., gives the book to him/gives him the book) then return flex_order = True
        NOTE: The grammaticality is judged by the reference (target) sentence, not by the absolute grammaticality of the
        produced sentence. E.g., if the target sentence is "She throw -s the key to the boy ." then
        "She throw -s the key ." will be regarded UNgrammatical, even if it's a correct sentence.
        """
        is_grammatical = True
        has_flex_order = True
        if out_sentence_idx == trg_sentence_idx:  # if sentences are identical no need to check further
            return is_grammatical, not has_flex_order
        out_pos = self.inputs.sentence_indeces_pos(out_sentence_idx)
        trg_pos = self.inputs.sentence_indeces_pos(trg_sentence_idx)
        if out_pos == trg_pos:  # if POS is identical then the sentence is definitely grammatical
            return is_grammatical, not has_flex_order
        if out_pos in self.inputs.allowed_structures:  # if sentence in list of existing POS
            return is_grammatical, has_flex_order
        # Normally we should add "and out_pos in allowed_structures" but the model generated novel (correct) structures
        if len(out_pos) > len(trg_pos):
            trg_pos.append('prep')
        elif len(out_pos) < len(trg_pos):  # if they are equal don't append
            out_pos.append('prep')
        if self.same_unordered_lists(out_pos, trg_pos) and out_pos[-1] != 'prep':  # make sure it doesn't end with 'to'
            return is_grammatical, has_flex_order
        return not is_grammatical, not has_flex_order

    def has_correct_meaning(self, out_sentence_idx, trg_sentence_idx):
        if out_sentence_idx == trg_sentence_idx:
            return True
        # flexible_order in the monolingual case means that the only difference is the preposition "to"
        out_sentence_idx = [x for x in out_sentence_idx if x not in self.inputs.to_prepositions_idx]
        trg_sentence_idx = [x for x in trg_sentence_idx if x not in self.inputs.to_prepositions_idx]
        if self.same_unordered_lists(out_sentence_idx, trg_sentence_idx):
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


def copy_files_endwith(src, dest, ends_with=".in"):
    for filename in os.listdir(src):
        if filename.endswith(ends_with):
            shutil.copyfile(os.path.join(src, filename), os.path.join(dest, filename))


def generate_title_from_lang(lang_code):
    title = ''
    if lang_code == 'en':
        title = 'English monolingual model'
    elif lang_code == 'es':
        title = 'Spanish monolingual model'
    elif lang_code == 'el':
        title = 'Greek monolingual model'
    elif lang_code == 'enes' or lang_code == 'esen':
        title = 'Bilingual EN-ES model'
    return title


def get_minimum_and_maximum_idx(clean_sentence):
    return min(clean_sentence), max(clean_sentence)  # set with 2 indeces, min and max


def create_all_input_files(num_simulations, results_dir, sets, original_input_path, cognate_experiment,
                           generate_num, l2_percentage):
    for sim in range(num_simulations):  # first create all input files
        rdir = "%s/%s" % (results_dir, sim)
        os.makedirs(rdir)
        if sets:  # generate new test/training sets
            if sim == 0:  # copy the .in files under the /input folder
                copy_files_endwith(os.path.join("%s/input" % results_dir), rdir)
            else:
                sets.results_dir = rdir
                sets.seed = sim  # set new seed for language generator
                if cognate_experiment:
                    sets.generate_sets_for_cognate_experiment(num_sentences=generate_num,
                                                              percentage_L2=l2_percentage,
                                                              save_files=False)
                else:
                    sets.generate_sets(num_sentences=generate_num, percentage_L2=l2_percentage,
                                       save_files=False)
        elif original_input_path:
            # use existing test/training set (copy them first)
            copy_files_endwith(os.path.join(original_input_path, str(sim)), rdir)

if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument('-hidden', help='Number of hidden layer units.', type=int, default=80)
    parser.add_argument('-compress', help='Number of compress layer units', type=int, default=40)
    parser.add_argument('-epochs', '-total_epochs', help='Number of training set iterations during (total) training.',
                        type=int, default=20)
    parser.add_argument('-l2_epochs', '-l2e', help='# of epoch when L2 input gets introduced', type=int)
    parser.add_argument('-l2_percentage', '-l2_perc', help='% of L2 input', type=float, default=0.5)
    parser.add_argument('-input', help='(Input) folder that contains all input files (lexicon, concepts etc)')
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
    parser.add_argument('-set_weights_epoch', '-swe', type=int,
                        help='In case of pre-trained weights we can also specify num of epochs (stage of training)')
    parser.add_argument('-fw', '-fixed_weights', type=float, default=20,
                        help='Fixed weight value for concept-role connections')
    parser.add_argument('-fwi', '-fixed_weights_identif', type=float, default=10,
                        help='Fixed weight value for identif-role connections')
    parser.add_argument('-generate_num', type=int, default=2500, help='Sum of test/training sentences to be generated '
                                                                      '(only if no input was set)')
    parser.add_argument('-test_every', help='Test network every x epochs', type=int, default=1)
    parser.add_argument('-title', help='Title for the plots')
    parser.add_argument('-sim', type=int, default=2, help='training several simulations (sim) at once to take the '
                                                          'average of the results (Monte Carlo approach)')
    parser.add_argument('-np', help='Defines percentage of Noun Phrases(NPs) vs pronouns on the subject level',
                        type=int, default=100)
    parser.add_argument('-pron', dest='emphasis', type=int, default=0, help='Percentage of overt pronouns in ES')
    parser.add_argument('-threshold', help='Threshold for performance of simulations. Any simulations that performs has'
                                           ' a percentage of correct sentences < threshold are discarded',
                        type=int, default=20)
    """ input-related arguments, they are probably redundant as all the user needs to specify is the input/ folder """
    parser.add_argument('-lexicon', help='File name that contains the lexicon', default='lexicon.in')
    parser.add_argument('-lexicon_csv', help='CSV file that contains the lexicon and concepts', default='lexicon.csv')
    parser.add_argument('-concepts', help='File name that contains the concepts', default='concepts.in')
    parser.add_argument('-role', help='File name that contains the roles', default='roles.in')
    parser.add_argument('-eventsem', help='File name that contains the event semantics', default='event_sem.in')
    ####################################################################################################################
    parser.add_argument('-trainingset', '-training', help='File name that contains the message-sentence pair for '
                                                          'training.', default="train.in")
    parser.add_argument('-testset', '-test', help='Test set file name', default="test.in")
    """ ######################################## boolean arguments ################################################# """
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
    parser.add_argument('--nolang', dest='nolang', action='store_true', help='Exclude language info during TESTing')
    parser.set_defaults(nolang=False)
    parser.add_argument('--nodlr', dest='decrease_lrate', action='store_false', help='Keep lrate stable (final_lrate)')
    parser.set_defaults(decrease_lrate=True)
    parser.add_argument('--nogender', dest='gender', action='store_false', help='Exclude semantic gender for nouns')
    parser.set_defaults(gender=True)
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
    args = parser.parse_args()
    # create path to store results
    results_dir = "simulations/%s%s_%s_h%s_c%s" % ((args.resdir if args.resdir else ""),
                                                   datetime.now().strftime("%Y-%m-%dt%H.%M.%S"),
                                                   args.lang, args.hidden, args.compress)
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
        print "Predefined input folder found (%s), will use that instead of generating a new set" % args.input
        copy_dir(args.input, '%s/input' % results_dir)
        original_input_path = args.input.replace("/input", "")  # remove the "input" part, sets are in the sub folders
        args.input = '%s/input' % results_dir
    else:
        from modules.corpus_generator import SetsGenerator

        args.input = "%s/input/" % results_dir
        sets = SetsGenerator(results_dir=args.input, use_full_verb_form=args.full_verb,
                             use_simple_semantics=args.simple_semantics,
                             allow_free_structure_production=args.free_pos)
        if args.cognate_experiment:
            sets.generate_sets_for_cognate_experiment(num_sentences=args.generate_num, percentage_L2=args.l2_percentage)
        else:
            sets.generate_sets(num_sentences=args.generate_num, percentage_L2=args.l2_percentage)

    if not args.title:
        args.title = generate_title_from_lang(args.lang)

    if not args.decrease_lrate:
        args.lrate = args.final_lrate  # assign the >lowest< learning rate.

    # Save the parameters of the simulation(s)
    with open("%s/simulation.info" % results_dir, 'w') as f:
        f.write(("Input: %s %s\nTitle:%s\nHidden layers: %s\nInitial learn rate: %s\nDecrease lr: %s%s\nCompress: %s\n"
                 "Copy role: %s\nCopy input: %s\nPercentage NPs:%s\nPro-drop language:%s\nUse gender info:%s\nEmphasis "
                 "(overt ES pronouns):%s%%\nFixed weights: concept-role: %s, identif-role: %s\nSet weights folder: %s "
                 "(epoch: %s)\nExclude lang during testing:%s\nShuffle set after each epoch: %s\n"
                 "Allow free structure production:%s\n") %
                (results_dir, "(%s)" % original_input_path if original_input_path else "", args.title, args.hidden,
                 args.lrate, args.decrease_lrate, " (%s)" % args.final_lrate if (args.final_lrate and
                                                                                 args.decrease_lrate) else "",
                 args.compress, args.crole, args.cinput, args.np, args.prodrop, args.gender, args.emphasis, args.fw,
                 args.fwi, args.set_weights, args.set_weights_epoch, args.nolang, args.shuffle, args.free_pos))

    inputs = InputFormatter(results_dir=results_dir, input_dir=args.input, lexicon_csv=args.lexicon_csv,
                            role_fname=args.role, evsem_fname=args.eventsem,
                            language=args.lang, semantic_gender=args.gender, emphasis=args.emphasis,
                            prodrop=args.prodrop, trainingset=args.trainingset, testset=args.testset,
                            plot_title=args.title, fixed_weights=args.fw, fixed_weights_identif=args.fwi,
                            use_word_embeddings=args.word_embeddings)

    num_valid_simulations = None
    simulations_with_pron_err = 0
    failed_sim_id = []
    if not args.sim or args.sim == 1:  # only run one simulation
        dualp = DualPath(hidden_size=args.hidden, learn_rate=args.lrate, final_learn_rate=args.final_lrate,
                         epochs=args.epochs, role_copy=args.crole, input_copy=args.cinput, srn_debug=args.debug,
                         test_every=args.test_every, compress_size=args.compress, exclude_lang=args.nolang,
                         set_weights_folder=args.set_weights, set_weights_epoch=args.set_weights_epoch,
                         input_format=inputs, momentum=args.momentum, check_pronouns=args.check_pronouns)
        dualp.train_network(shuffle_set=args.shuffle)
    else:  # start batch training to take the average of results
        create_all_input_files(args.sim, results_dir, sets, original_input_path, args.cognate_experiment,
                               args.generate_num, args.l2_percentage)
        del sets  # we no longer need it
        # now run the simulations
        processes = []
        for sim in range(args.sim):
            inputs.input_dir = "%s/%s" % (results_dir, sim)
            inputs.update_sets(new_results_dir=inputs.input_dir)
            with open("%s/simulation.info" % results_dir, 'a') as f:
                f.write("\nNumber of cognates and false friends in training set for sim %s: %s/%s" %
                        (sim, sum(',COG' in l for l in inputs.trainlines)+sum(',FF' in l for l in inputs.trainlines),
                         inputs.num_train))

            dualp = DualPath(hidden_size=args.hidden, learn_rate=args.lrate, final_learn_rate=args.final_lrate,
                             epochs=args.epochs, role_copy=args.crole, input_copy=args.cinput, srn_debug=args.debug,
                             test_every=args.test_every, compress_size=args.compress, exclude_lang=args.nolang,
                             set_weights_folder=args.set_weights, simulation_num=sim, momentum=args.momentum,
                             set_weights_epoch=args.set_weights_epoch, input_format=inputs,
                             check_pronouns=args.check_pronouns)
            process = Process(target=dualp.train_network, args=(args.shuffle,))
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
                if inputs.training_is_successful(simulation['correct_sentences']['test'], threshold=args.threshold):
                    valid_results.append(simulation)
                    if not inputs.training_is_successful(simulation['correct_sentences']['test'], threshold=75):
                        failed_sim_id.append("[%s]" % i)  # flag it, even if it's included in the final analysis
                else:
                    failed_sim_id.append(str(i))  # keep track of simulations that failed

            num_valid_simulations = len(valid_results)  # some might have been discarded

            if num_valid_simulations:  # take the average of results and plot
                simulations_with_pron_err = len([simulation for simulation in valid_results
                                                 if sum(simulation['pronoun_errors']['test']) > 0 or
                                                 sum(simulation['pronoun_errors_flex']['test']) > 0])
                inputs.results_dir = os.path.split(inputs.results_dir)[0]  # go one folder up and save plot
                plot = Plotter(results_dir=results_dir)
                plot.plot_results(compute_mean_and_std(valid_results, epochs=args.epochs), title=inputs.plot_title,
                                  num_train=inputs.num_train, num_test=inputs.num_test,
                                  summary_sim=num_valid_simulations,
                                  test_sentences_with_pronoun=inputs.test_sentences_with_pronoun)

    layers_with_softmax_act_function = []
    for layer in dualp.srn.get_layers_for_backpropagation():
        if layer.activation_function == 'softmax':
            layers_with_softmax_act_function.append(layer.name)

    with open("%s/simulation.info" % results_dir, 'a') as f:  # Append information regarding the simulations' success
        f.write("\nLayers with softmax activation function: %s\nSimulations with pronoun errors:%s/%s\n%s%s" %
                (', '.join(layers_with_softmax_act_function), simulations_with_pron_err, args.sim,
                 "Successful simulations:%s/%s" % (num_valid_simulations, args.sim) if num_valid_simulations else "",
                 "\nIndeces of failed simulations (or simulations that would fail): %s" % ", ".join(failed_sim_id)
                 if failed_sim_id else ""))

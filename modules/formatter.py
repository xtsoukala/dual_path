# -*- coding: utf-8 -*-
import re
import os
import itertools
import pickle
import pandas as pd
import collections
from modules.elman_network import np


class InputFormatter:
    def __init__(self, results_dir, input_dir, fixed_weights, fixed_weights_identif, language, trainingset, testset,
                 semantic_gender, overt_pronouns, prodrop, use_word_embeddings, monolingual_only):
        """ This class mostly contains helper functions that set the I/O for the Dual-path model (SRN)."""
        self.monolingual_only = monolingual_only
        self.L1, self.L2 = self.get_l1_and_l2(language)
        self.input_dir = input_dir  # folder that contains training/test files, the lexicon, roles and event-sem
        self.lexicon_df = pd.read_csv(os.path.join(self.input_dir, 'lexicon.csv'), sep=',', header=0)  # 1st line:header
        self.lexicon, self.pos, self.idx_to_concept, self.code_switched_idx = self.get_lex_info_and_code_switched_idx()
        if use_word_embeddings:
            import word2vec
        self.use_word_embeddings = use_word_embeddings
        self.concepts = list(self.lexicon_df.concept.dropna().unique()) if not use_word_embeddings \
            else word2vec.load('word2vec/text8.bin')
        self.semantic_gender = semantic_gender
        self.identifiability = self._read_file_to_list('identifiability.in')
        self.languages = self._read_file_to_list('target_lang.in')
        self.roles = self._read_file_to_list('roles.in')
        self.event_semantics = self._read_file_to_list('event_semantics.in')
        self.results_dir = results_dir  # directory where the results are saved
        self.prodrop = prodrop
        self.emphasis_percentage = overt_pronouns
        self.testset = testset
        self.trainingset = trainingset  # names of training and test set file names
        self.trainlines = self.read_set()
        self.num_train = len(self.trainlines)
        self.testlines = self.read_set(test=True)
        self.num_test = len(self.testlines)
        self.test_sentences_with_pronoun = self._number_of_test_pronouns()
        self.same_unordered_lists = lambda x, y: collections.Counter(x) == collections.Counter(y)
        """self.translation_dict = {'-a': '-s', '-ó': '-ed', 'a_': 'to', '.': '.', 'está': 'is', 'estaba': 'was',
                                 'un': 'a', 'una': 'a', 'el': 'the', 'la': 'the',
                                 '-ando': '-ing', 'ella': 'she', 'él': 'he'}
        self.reverse_translation_dict = {v: k for k, v in self.translation_dict.iteritems()}"""
        # |----------PARAMS----------|
        # fixed_weight is the activation between roles-concepts and evsem. The value is rather arbitrary unfortunately.
        # Using a really low value (e.g. 1) makes it difficult (but possible) for the model to learn the associations
        self.fixed_weights = fixed_weights
        self.fixed_identif = fixed_weights_identif
        self.period_idx = self.get_lexicon_index('.')
        self.to_prepositions_idx = self.df_query_to_idx("pos == 'prep'")
        self.idx_pronoun = self.df_query_to_idx("pos == 'pron'")
        self.determiners = self.df_query_to_idx("pos == 'det'")
        self.tense_markers = self.df_query_to_idx("pos == 'aux' or pos == 'verb_suffix'")
        self.cognate_idx = self.df_query_to_idx("is_cognate == 'Y'", lang='en')
        self.false_friend_idx = self.df_query_to_idx("is_false_friend == '1'", lang='en')
        self.shared_idx = [self.period_idx] + self.cognate_idx + self.false_friend_idx
        self.allowed_structures = self._read_allowed_structures()  # all allowed POS structures (in the training file)
        self.event_sem_size = len(self.event_semantics)
        self.lexicon_size = len(self.lexicon)
        self.concept_size = len(self.concepts) if not self.use_word_embeddings else self.concepts['dog'].size
        self.identif_size = len(self.identifiability)
        self.roles_size = len(self.roles)

        del self.lexicon_df  # remove it after the processing

    def get_l1_and_l2(self, lang_code):
        if len(lang_code) == 4:
            L1 = lang_code[:2]
            L2 = lang_code[2:]
        else:
            L1 = lang_code
            if self.monolingual_only:
                L2 = None
            else:
                L2 = [x for x in ['EN', 'ES'] if x != L1][0]
                print("Will include L2 (%s) lexicon" % L2)
        return L1, L2

    def update_sets(self, new_results_dir):
        self.results_dir = new_results_dir
        self.trainlines = self.read_set()  # re-read files
        self.num_train = len(self.trainlines)
        self.testlines = self.read_set(test=True)
        self.num_test = len(self.testlines)
        self.test_sentences_with_pronoun = self._number_of_test_pronouns()

    def has_correct_meaning(self, out_sentence_idx, trg_sentence_idx):
        if out_sentence_idx == trg_sentence_idx:
            return True
        # flexible_order in the monolingual case means that the only difference is the preposition "to"
        out_sentence_idx = [x for x in out_sentence_idx if x not in self.to_prepositions_idx]
        trg_sentence_idx = [x for x in trg_sentence_idx if x not in self.to_prepositions_idx]
        if self.same_unordered_lists(out_sentence_idx, trg_sentence_idx):
            return True
        return False

    def is_sentence_gramatical_or_flex(self, out_sentence_idx, trg_sentence_idx):
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
        out_pos = self.sentence_indeces_pos(out_sentence_idx)
        trg_pos = self.sentence_indeces_pos(trg_sentence_idx)
        if out_pos == trg_pos:  # if POS is identical then the sentence is definitely grammatical
            return is_grammatical, not has_flex_order
        if out_pos in self.allowed_structures:  # if sentence in list of existing POS
            return is_grammatical, has_flex_order
        # Normally we should add "and out_pos in allowed_structures" but the model generated novel (correct) structures
        if not out_pos[-1] == 'prep':  # it shouldn't end with 'to'
            if 'prep' in out_pos and 'prep' not in trg_pos:
                trg_pos.append('prep')
            elif 'prep' in trg_pos and 'prep' not in out_pos:
                out_pos.append('prep')
            # TODO: If the verb is Spanish we shouldn't allow double datives
            if self.same_unordered_lists(out_pos, trg_pos):
                return is_grammatical, has_flex_order
        return not is_grammatical, not has_flex_order

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
        ignore_idx = self.to_prepositions_idx
        if ignore_det:
            ignore_idx.extend(self.determiners)

        if self.same_unordered_lists([x for x in out_sentence_idx if x not in ignore_idx],
                                     [x for x in trg_sentence_idx if x not in ignore_idx]):
            flexible_order = True
        elif remove_last_word and self.same_unordered_lists(out_sentence_idx[:-1], trg_sentence_idx[:-1]):
            flexible_order = True
        return flexible_order

    def test_meaning_without_pronouns(self, out_sentence_idx, trg_sentence_idx):
        # remove subject pronouns and check the rest of the sentence
        out = [idx for idx in out_sentence_idx if idx not in self.idx_pronoun]
        trg = [idx for idx in trg_sentence_idx if idx not in self.idx_pronoun]
        return self.test_for_flexible_order(out, trg, allow_identical=True)

    def test_without_feature(self, out_sentence_idx, trg_sentence_idx, feature):
        if feature == "tense":
            feature_markers = self.tense_markers
        elif feature == "determiners":
            feature_markers = self.determiners
        out = [x for x in out_sentence_idx if x not in feature_markers]
        trg = [x for x in trg_sentence_idx if x not in feature_markers]
        return self.test_for_flexible_order(out, trg, allow_identical=True, ignore_det=False)

    def has_pronoun_error(self, out_sentence_idx, trg_sentence_idx):
        out_pronouns = [idx for idx in out_sentence_idx if idx in self.idx_pronoun]
        trg_pronouns = [idx for idx in trg_sentence_idx if idx in self.idx_pronoun]
        if out_pronouns != trg_pronouns:
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
            # print translated_sentence_idx, self.sentence_from_indeces(translated_sentence_idx)
            cs_type = self.examine_sentences_for_cs_type(translated_sentence_idx, out_sentence_idx, trg_sentence_idx)
            if cs_type:  # if not False no need to look further
                return cs_type
        return False  # no CS type found

    def translate_idx_into_monolingual_candidates(self, out_sentence_idx, trg_lang_word_idx):
        if trg_lang_word_idx < self.code_switched_idx:
            lang = self.L1
        else:
            lang = self.L2
        trans = [self.find_equivalent_translation_idx(idx, lang) for idx in out_sentence_idx]
        return [list(x for x in tup) for tup in list(itertools.product(*trans))]

    def _idx_is_cognate_or_ff(self, idx):
        if idx in self.shared_idx:
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
            check_idx_pos = [self.pos_lookup(w) for w in check_idx]
            if len(set(check_idx_pos)) == 1:
                cs_type = "%s" % check_idx_pos[0].lower()
            else:
                cs_type = "congruent lex."
        return cs_type

    def is_code_switched(self, sentence_indeces, target_lang):
        """ This function only checks whether words from different languages were used.
        It doesn't verify the validity of the expressed message """
        # skip indeces that are common in all lang
        clean_sentence = [x for x in sentence_indeces if x not in self.shared_idx]
        if not clean_sentence:
            return False  # empty sentence
        min_and_max_idx = get_minimum_and_maximum_idx(clean_sentence)
        if ((all(x >= self.code_switched_idx for x in min_and_max_idx) or
             all(x < self.code_switched_idx for x in min_and_max_idx)) and
                self.morpheme_is_from_target_lang(clean_sentence[0], target_lang)):
            return False
        return True

    def morpheme_is_from_target_lang(self, morpheme_idx, target_lang):
        """
        Assumption: this doesn't check for shared indeces (period/congates) because they have already been stripped
        """
        if ((target_lang == self.L1 and morpheme_idx < self.code_switched_idx) or
                (target_lang == self.L2 and morpheme_idx >= self.code_switched_idx)):
            return True
        return False

    def get_lex_info_and_code_switched_idx(self):
        """
        :return: lexicon in list format and code-switched id (the first entry of the second language)
        """
        idx_to_concept = []  # TODO: maybe change to dict
        l1_column = self.lexicon_df[['morpheme_%s' % self.L1.lower(), 'pos',
                                     'concept', 'type']].dropna(subset=['morpheme_%s' % self.L1.lower()])
        lex = list(l1_column['morpheme_%s' % self.L1.lower()])
        pos = list(l1_column['pos'])
        l1_type = list(l1_column['type'])
        for i, concept in enumerate(list(l1_column['concept'])):
            if is_not_nan(concept):
                idx_to_concept.append(concept)
            else:
                idx_to_concept.append("%s::%s" % (pos[i], l1_type[i]) if is_not_nan(l1_type[i]) else pos[i])
        code_switched_idx = len(lex)
        if self.L2:
            l2_column = self.lexicon_df[['morpheme_%s' % self.L2.lower(), 'pos',
                                         'concept', 'type']].dropna(subset=['morpheme_%s' % self.L2.lower()])
            l2_pos_list = list(l2_column['pos'])
            l2_concept_list = list(l2_column['concept'])
            l2_type_list = list(l2_column['type'])
            for i, item in enumerate(list(l2_column['morpheme_%s' % self.L2.lower()])):
                if item not in lex:  # only get unique items. set() would change the order, do this instead
                    lex.append(item)
                    pos.append(l2_pos_list[i])
                    # add concept info
                    if is_not_nan(l2_concept_list[i]):
                        idx_to_concept.append(l2_concept_list[i])
                    else:
                        idx_to_concept.append("%s::%s" % (pos[-1], l2_type_list[i]) if is_not_nan(l2_type_list[i])
                                              else pos[-1])
        with open(os.path.join(self.input_dir, "lexicon.in"), 'w') as f:
            f.writelines("%s\n" % w for w in lex)
        return lex, pos, idx_to_concept, code_switched_idx  # idx_to_concept: nparray if we want to use "where"

    def get_lexicon_index(self, word):
        """
        :param word: unique word in string format
        :return: returns index of the word in the list. In case of non unique words, it only returns the first idx
        """
        return self.lexicon.index(word)

    def concept_to_morphemes_OLD(self, concept, target_lang):
        morpheme_idx = np.where(self.idx_to_concept == concept)[0]
        if target_lang == self.L1:
            morph = list(morpheme_idx[morpheme_idx < self.code_switched_idx])
        else:  # L2
            morph = list(morpheme_idx[morpheme_idx >= self.code_switched_idx])
        return morph

    def concept_to_morphemes(self, concept_idx, target_lang):
        lower_range = 0 if target_lang == self.L1 else self.code_switched_idx
        upper_range = self.code_switched_idx if target_lang == self.L1 else len(self.idx_to_concept)
        morph = []
        for idx in range(lower_range, upper_range):
            if self.idx_to_concept[concept_idx] == self.idx_to_concept[idx]:
                morph.append(idx)
        return morph

    def _number_of_test_pronouns(self):
        regexp = re.compile(r'(^| )(s)?he ')  # looks for "he /she / he / she "
        return len([line for line in self.testlines if regexp.search(line)])

    def read_set(self, test=False):
        """
        :param test: if file name is not provided, we need to specify whether it's a testset (test=True) or trainingset
        :return:
        """
        if test:
            set_name = self.testset
        else:
            set_name = self.trainingset
        lines = self._read_file_to_list(set_name)

        if self.prodrop:  # make pro-drop
            if self.emphasis_percentage > 0:  # keep pronoun if emphasized
                es_line_idx = [idx for idx, x in enumerate(lines) if 'ES,' in x]
                num_emphasized = len(es_line_idx) * self.emphasis_percentage / 100
                for es_idx in np.random.choice(es_line_idx, num_emphasized, replace=False):
                    lines[es_idx] = lines[es_idx].replace('AGENT=', 'AGENT=EMPH,')
                lines = [re.sub(r'(^| )(él|ella) ', ' ', line) if 'EMPH,' not in line else line for line in lines]
            else:
                lines = [re.sub(r'(^| )(él|ella) ', ' ', line) for line in lines]
        # elif not self.emphasis: lines = [re.sub(r',EMPH', '', sentence) for sentence in lines]

        if not self.semantic_gender:
            lines = [re.sub(',(M|F)(,|;|$)', r'\2', line) for line in lines]

        return lines

    def _read_allowed_structures(self):
        all_pos = [self.sentence_indeces_pos(sentence.split("##")[0].split(), convert_to_idx=True)
                   for sentence in self.trainlines]
        all_pos.sort()
        return list(all_pos for all_pos, _ in itertools.groupby(all_pos))

    def _read_file_to_list(self, fname):
        """
        :param fname: file name
        :return: Simply reads a file into a list while stripping newlines
        """
        if self.file_exists(fname):
            with open(os.path.join(self.input_dir, fname)) as f:
                lines = [line.rstrip('\n') for line in f]
            return lines

    def _read_pickled_file(self, fname):
        if self.file_exists(fname, warning=False):
            with open(os.path.join(self.input_dir, fname), 'rb') as f:
                return pickle.load(f)
        return {}

    def file_exists(self, fname, warning=True):
        if not os.path.isfile(os.path.join(self.input_dir, fname)):  # make sure the file exists
            if warning:
                import warnings
                warnings.warn("File '%s' doesn't exist, did you want that?" % os.path.join(self.input_dir, fname))
            return False
        return True

    def pos_lookup(self, word_idx):
        """
        :param word_idx: the index of the word in the lexicon
        :return: the category of the word (noun, verb etc)
        """
        return self.pos[word_idx]

    def sentence_from_indeces(self, sentence_idx):
        """
        :param sentence_idx: list with sentence indeces
        :return: converts a list of idx into a sentence (string of words)
        """
        return " ".join([self.lexicon[idx] for idx in sentence_idx])

    def sentence_indeces(self, sentence_lst):
        """
        :param sentence_lst: intended sentence in a list (split string) format, e.g., ['the', 'cat', 'walk', '-s']
        :return: list of activations in the lexicon for the words above (e.g. [0, 4, 33, 20]
        """
        return [self.get_lexicon_index(w) for w in sentence_lst]

    # TODO: remove_period: True
    def sentence_indeces_pos(self, sentence_idx_lst, remove_period=False, convert_to_idx=False):
        """
        :param sentence_idx_lst: sentence in list format. Either contains activations in the lexicon for the sentence
        or the words (in that case, convert_to_idx should be set to True)
        :param remove_period: whether to remove the period (last element) from the sentence (useful when checking POS)
        :param convert_to_idx: if sentence_idx contains list of words, they first need to be converted to the
        respective indeces
        :return:
        """
        if convert_to_idx:
            sentence_idx_lst = self.sentence_indeces(sentence_idx_lst)
        if remove_period and sentence_idx_lst[-1] == self.period_idx:
            sentence_idx_lst = sentence_idx_lst[:-1]
        return [self.pos_lookup(word_idx) for word_idx in sentence_idx_lst]

    def get_message_info(self, message):
        """ :param message: string, e.g. "ACTION=CARRY;AGENT=FATHER,DEF;PATIENT=STICK,INDEF
                            E=PAST,PROG" which maps roles (AGENT, PATIENT, ACTION) with concepts and also
                            gives information about the event-semantics (E)
        """
        norm_activation = 1  # 0.5 ? 1?
        reduced_activation = 0.2  # 0.1-4
        event_sem_activations = np.array([-1] * self.event_sem_size)
        # include the identifiness, i.e. def, indef, pronoun, emph(asis)
        weights_role_concept = np.zeros((self.roles_size, self.identif_size + self.concept_size))
        target_lang_activations = np.zeros(len(self.languages))
        target_language = None
        for info in message.split(';'):
            role, what = info.split("=")
            if role == "E":  # retrieve activations for the event-sem layer
                activation = norm_activation
                for event in what.split(","):
                    if event == "-1":  # if -1 precedes an event-sem its activation should be lower than 1
                        activation = reduced_activation
                    elif event in self.languages:
                        target_language = event
                        target_lang_activations[self.languages.index(event)] = activation
                    elif event == 'ENES':
                        target_language = event
                        target_lang_activations = [0.5, 0.5]
                    else:
                        event_sem_activations[self.event_semantics.index(event)] = activation
                    activation = norm_activation  # reset activation levels to maximum
            else:
                # there's usually multiple concepts/identif per role, e.g. (MAN, DEF, EMPH). We want to
                # activate the bindings with a high value, e.g. 6 as suggested by Chang, 2002
                for concept in what.split(","):
                    if concept in self.identifiability:
                        weights_role_concept[self.roles.index(role)][
                            self.identifiability.index(concept)] = self.fixed_identif
                    elif concept not in ['COG', 'FF']:
                        if self.use_word_embeddings:
                            activation_vector = self.concepts['unknown']
                            # FIXME
                            lex = next(key for key, value in self.lexicon_to_concept.items() if value == concept)
                            if lex in self.concepts:
                                activation_vector = self.concepts[lex]
                            else:
                                print("UNK: %s(%s)" % (lex, concept))

                            for i, w2v_activation in enumerate(activation_vector):
                                weights_role_concept[self.roles.index(role)][self.identif_size + i] = w2v_activation
                        else:
                            if concept in self.concepts:
                                idx_concept = self.identif_size + self.concepts.index(concept)
                                weights_role_concept[self.roles.index(role)][idx_concept] = self.fixed_weights
                            else:
                                print(message, '#####', concept)
                                import sys
                                sys.exit()
        return weights_role_concept, event_sem_activations, target_lang_activations, message, target_language

    def cosine_similarity(self, first_word, second_word):
        """ Cosine similarity between words when using word2vec """
        return np.dot(self.concepts[first_word], self.concepts[second_word] /
                      np.linalg.norm(self.concepts[first_word] * np.linalg.norm(self.concepts[second_word])))

    def training_is_successful(self, x, threshold):
        if x:
            return np.true_divide(x[-1] * 100, self.num_test) >= threshold
        print("Training did not pass the threshold: %s / %s" % (x, threshold))
        return False

    def df_query_to_idx(self, query, lang=None):
        if lang:
            languages = ['morpheme_%s' % lang]
        else:
            languages = ['morpheme_en', 'morpheme_es']
        q = self.lexicon_df.query(query)[languages].values.ravel()
        q = [x for x in list(q) if is_not_nan(x)]
        return self.sentence_indeces(q)

    def find_equivalent_translation_idx(self, idx, lang):
        # ignore shared indeces (cognates/period)
        if (idx not in self.shared_idx and ((idx > self.code_switched_idx and lang == self.L1) or
                                            (lang == self.L2 and idx <= self.code_switched_idx))):
            return self.concept_to_morphemes(concept_idx=idx, target_lang=lang)
        return [idx]


def get_minimum_and_maximum_idx(clean_sentence):
    return min(clean_sentence), max(clean_sentence)  # set with 2 indeces, min and max


def is_not_nan(x):
    if x == x:
        return True
    return False


def take_average_of_valid_results(valid_results):
    """
    :param valid_results: list of dicts (simulations)
    :return:
    """
    results_average = {}
    for key in valid_results[0].keys():
        results_average[key] = {'training': [], 'test': []}
        for simulation in valid_results:
            for t in ['training', 'test']:
                if t in results_average[key] and is_not_empty(results_average[key][t]):
                    if type(simulation[key][t]) is dict:  # case: type_code_switches
                        for cs_type, val in simulation[key][t].items():
                            if cs_type in results_average[key][t]:
                                results_average[key][t][cs_type] = np.add(results_average[key][t][cs_type], val)
                            else:
                                results_average[key][t][cs_type] = val
                    else:
                        results_average[key][t] = np.add(results_average[key][t], simulation[key][t])
                elif t in simulation[key]:
                    results_average[key][t] = simulation[key][t]
    # now average over all simulations
    for key, val in results_average.items():
        for t in ['training', 'test']:
            if t in results_average[key]:
                if type(results_average[key][t]) is dict:  # case: type_code_switches
                    results_average[key][t] = {k: np.true_divide(v, len(valid_results))
                                               for k, v in results_average[key][t].iteritems()}
                else:
                    results_average[key][t] = np.true_divide(val[t], len(valid_results))
    return results_average


def is_not_empty(x):
    if x != [] and sum_list_greater_than_zero(x):  # do not simplify
        return True
    return False


def sum_list_greater_than_zero(x):
    if sum([sum(i) for i in x]) > 0:
        return True
    return False


def get_np_mean_and_std_err(x, summary_sim=None):
    if isinstance(x, list):
        x = np.array(x)
    if x.sum() > 0:
        if summary_sim:
            return x.mean(axis=0), standard_error(x.std(axis=0), summary_sim)
        return x.mean(), x.std()  # we only want one number in this case (axis=1)
    return 0, 0


def get_np_mean(x, summary_sim=None):
    if isinstance(x, list):
        x = np.array(x)
    if x.sum() > 0:
        if summary_sim:
            return x.mean(axis=0)
        return x.mean()  # we only want one number in this case (axis=1)
    return 0


def is_nd_array(x):
    if isinstance(x, np.ndarray):
        return True
    return False


def standard_error(std, num_simulations):
    return np.true_divide(std, np.sqrt(num_simulations))


def percentage(x, total):
    if total == 0:
        return float('NaN')
    return np.true_divide(x * 100, total)


def numpy_arange_len(x):
    return np.arange(len(x))


def compute_mean_and_std(valid_results, epochs):
    """
    :param valid_results: list of dicts (simulations).
    :return:
    """
    results_sum = {}
    all_keys = valid_results[0].keys()
    cs_keywords = []
    for sim in valid_results:
        for t in ['test', 'training']:
            if sim['type_code_switches'][t]:
                cs_keywords.extend(sim['type_code_switches'][t].keys())
    cs_keywords = set(cs_keywords)
    for key in all_keys:  # e.g., 'correct_code_switches', 'correct_sentences', 'type_code_switches', 'correct_pos'
        if key == 'type_code_switches':
            results_sum[key] = {'training': {}, 'test': {}}
        else:
            results_sum[key] = {'training': [], 'test': []}
        for simulation in valid_results:  # go through all simulations
            for t in ['training', 'test']:
                if t in simulation[key] and simulation[key][t]:
                    if type(simulation[key][t]) is dict:  # case: type_code_switches
                        for cs_type in cs_keywords:
                            if cs_type not in results_sum[key][t]:
                                results_sum[key][t][cs_type] = []
                            if cs_type in simulation[key][t]:
                                results_sum[key][t][cs_type].append(simulation[key][t][cs_type])
                            else:  # fill with 0
                                results_sum[key][t][cs_type].append([0] * epochs)
                    else:
                        results_sum[key][t].append(simulation[key][t])
    # now compute MEAN and STANDARD ERROR of all simulations
    for key in all_keys:
        for t in ['training', 'test']:
            if t in results_sum[key] and results_sum[key][t]:
                if type(results_sum[key][t]) is dict:
                    for cs_type in cs_keywords:
                        np_array = np.array(results_sum[key][t][cs_type])
                        np_mean, np_std_err = get_np_mean_and_std_err(np_array, summary_sim=len(valid_results))
                        results_sum[key][t]["%s-std_error" % cs_type] = np_std_err
                        results_sum[key][t][cs_type] = np_mean
                else:
                    np_array = np.array(results_sum[key][t])
                    np_mean, np_std_err = get_np_mean_and_std_err(np_array, summary_sim=len(valid_results))
                    results_sum[key]["%s-std_error" % t] = np_std_err
                    results_sum[key][t] = np_mean
    results_sum['all_cs_types'] = set([re.sub("EN-|ES-|-cog|-ff", "", x) for x in cs_keywords])
    return results_sum

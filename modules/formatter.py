# -*- coding: utf-8 -*-
import re
import os
import itertools
import pickle
import pandas as pd
from elman_network import np

np.random.seed(18)


class InputFormatter:
    def __init__(self, results_dir, input_dir, lexicon_csv, role_fname, evsem_fname, fixed_weights,
                 fixed_weights_identif, language, trainingset, testset, semantic_gender, emphasis,
                 prodrop, plot_title, use_word_embeddings):
        """ This class mostly contains helper functions that set the I/O for the Dual-path model (SRN)."""
        self.input_dir = input_dir  # folder that contains training/test files, the lexicon, roles and event-sem
        self.lexicon_df = pd.read_csv(os.path.join(self.input_dir, lexicon_csv), sep=',', header=0)  # 1st line: header
        self.lexicon, self.code_switched_idx = self.get_lexicon_and_code_switched_idx()
        if use_word_embeddings:
            import word2vec
        self.use_word_embeddings = use_word_embeddings
        self.concepts = list(self.lexicon_df.concept.dropna().unique()) if not use_word_embeddings \
            else word2vec.load('word2vec/text8.bin')
        self.semantic_gender = semantic_gender
        self.identif = self._read_file_to_list('identifiability.in')
        self.languages = self._read_file_to_list('target_lang.in')
        self.roles = self._read_file_to_list(role_fname)
        self.event_semantics = self._read_file_to_list(evsem_fname)
        self.results_dir = results_dir  # directory where the results are saved
        self.prodrop = prodrop
        self.emphasis_percentage = emphasis
        self.testset = testset
        self.trainingset = trainingset  # names of training and test set file names
        self.trainlines = self.read_set()
        self.num_train = len(self.trainlines)
        self.testlines = self.read_set(test=True)
        self.num_test = len(self.testlines)
        self.test_sentences_with_pronoun = self._number_of_test_pronouns()
        """self.lexicon_to_concept = self._read_pickled_file('lexicon_to_concept.pickled')
        self.translation_dict = {'-a': '-s', '-ó': '-ed', 'a_': 'to', '.': '.', 'está': 'is', 'estaba': 'was',
                                 'un': 'a', 'una': 'a', 'el': 'the', 'la': 'the',
                                 '-ando': '-ing', 'ella': 'she', 'él': 'he'}
        self.reverse_translation_dict = {v: k for k, v in self.translation_dict.iteritems()}
        self.concept_to_words = self._reverse_lexicon_to_concept()"""
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
        self.allowed_structures = self._read_allowed_structures()  # all allowed POS structures (in the training file)
        self.event_sem_size = len(self.event_semantics)
        self.lexicon_size = len(self.lexicon)
        self.concept_size = len(self.concepts) if not self.use_word_embeddings else self.concepts['dog'].size
        self.identif_size = len(self.identif)
        self.roles_size = len(self.roles)

        self.plot_title = plot_title
        self.lang = language

    def update_sets(self, new_input_dir):
        self.input_dir = new_input_dir
        self.trainlines = self.read_set()  # re-read files
        self.num_train = len(self.trainlines)
        self.testlines = self.read_set(test=True)
        self.num_test = len(self.testlines)
        self.test_sentences_with_pronoun = self._number_of_test_pronouns()

    def get_lexicon_and_code_switched_idx(self):
        x = ['']
        x.extend(list(self.lexicon_df['morpheme_en']))
        code_switched_idx = len(x) - 1
        x.extend(list(self.lexicon_df['morpheme_es']))
        return x, code_switched_idx

    def get_lexicon_index(self, word):
        """
        :param word: unique word in string format
        :return: returns index of the word in the list. In case of non unique words, it only returns the first idx
        """
        return self.lexicon.index(word)

    def morpheme_to_concept(self, morpheme, lang):
        c = self.lexicon_df.loc[(self.lexicon_df['morpheme_es'] == morpheme) | (self.lexicon_df['morpheme_en'] == morpheme)]
        return c['concept']

    def _reverse_lexicon_to_concept(self):
        concept_to_words = {}  # use
        for revkey, revvalue in self.lexicon_to_concept.iteritems():
            if revvalue in concept_to_words:
                concept_to_words[revvalue].append(revkey)
            else:
                concept_to_words[revvalue] = [revkey]
        return concept_to_words

    def _number_of_test_pronouns(self):
        regexp = re.compile(r'(^| )(s)?he ')  # looks for "he /she / he / she "
        return len([line for line in self.testlines if regexp.search(line)])

    def read_set(self, set_name=None, test=False):
        """
        :param set_name: file name (optional)
        :param test: if file name is not provided, we need to specify whether it's a testset (test=True) or trainingset
        :return:
        """
        if not set_name:
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

    def _read_lexicon_and_pos(self, fname, save_raw_lexicon=True):
        """
        :param fname: the name of the file that contains a list of categories (eg. noun, verb) and the lexicon
        :return: lexicon is a list of words, and pos is a dict that contains information regarding the index
                 (in the list of lexicon) of the word for each category. E.g. {'noun': [0, 1], 'verb': [2, 3, 4]}
        """
        lexicon = ['', '.']  # position 0 is >almost< never predicted! Check why
        pos = {'': [0], '.': [1]}  # made-up POS for position 0 (empty string) and extra position for period
        prev_pos = ''
        pos_start = pos_end = 2
        for line in self._read_file_to_list(fname):
            if line.endswith(":"):  # POS lines are introduced by a colon (:) otherwise it's a lexicon item
                if prev_pos:
                    if prev_pos in pos:
                        pos[prev_pos] += range(pos_start, pos_end)
                    else:
                        pos[prev_pos] = range(pos_start, pos_end)
                    pos_start = pos_end
                prev_pos = line[:-1]  # remove the colon, use it as a dict key for pos (dictionary)
            elif line not in lexicon:  # make sure there are no duplicate words
                lexicon.append(line)
                pos_end += 1
        if prev_pos in pos:
            pos[prev_pos] += range(pos_start, pos_end)
        else:
            pos[prev_pos] = range(pos_start, pos_end)  # this adds the last syntactic category
        if save_raw_lexicon:
            with open(os.path.join(self.input_dir, "raw_%s" % fname), 'a') as f:
                for w in lexicon:
                    f.write("%s\n" % w)
        return pos, lexicon

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
            with open(os.path.join(self.input_dir, fname)) as f:
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
        word_idx -= 1  # need to reduce by 1 because of the added space in position 0
        if word_idx >= self.code_switched_idx:  # adjust for Spanish words
            word_idx -= self.code_switched_idx
        try:
            return self.lexicon_df['pos'].values[word_idx]
        except:
            print word_idx
            sys.exit()

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

    def sentence_indeces_pos(self, sentence_idx, remove_period=True, convert_to_idx=False):
        """
        :param sentence_idx: sentence in list format. Either contains activations in the lexicon for the sentence
        or the words (in that case, convert_to_idx should be set to True)
        :param remove_period: whether to remove the period (last element) from the sentence (useful when checking POS)
        :param convert_to_idx: if sentence_idx contains list of words, they first need to be converted to the
        respective indeces
        :return:
        """
        if convert_to_idx:
            sentence_idx = self.sentence_indeces(sentence_idx)
        if remove_period and sentence_idx[-1] == self.period_idx:
            sentence_idx = sentence_idx[:-1]
        return [self.pos_lookup(word_idx) for word_idx in sentence_idx]

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
                        break
                    if event in self.languages:
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
                    if concept in self.identif:
                        weights_role_concept[self.roles.index(role)][self.identif.index(concept)] = self.fixed_identif
                    elif concept not in ['COG', 'FF']:
                        if self.use_word_embeddings:
                            activation_vector = self.concepts['unknown']
                            # FIXME
                            lex = next(key for key, value in self.lexicon_to_concept.items() if value == concept)
                            if lex in self.concepts:
                                activation_vector = self.concepts[lex]
                            else:
                                print "UNK: %s(%s)" % (lex, concept)

                            for i, w2v_activation in enumerate(activation_vector):
                                weights_role_concept[self.roles.index(role)][self.identif_size + i] = w2v_activation
                        else:
                            if concept in self.concepts:
                                idx_concept = self.identif_size + self.concepts.index(concept)
                                weights_role_concept[self.roles.index(role)][idx_concept] = self.fixed_weights
                            else:
                                print message, '#####', concept
                                import sys;sys.exit()
        return weights_role_concept, event_sem_activations, target_lang_activations, message, target_language

    def cosine_similarity(self, first_word, second_word):
        """ Cosine similarity between words when using word2vec"""
        return np.dot(self.concepts[first_word], self.concepts[second_word] /
                      np.linalg.norm(self.concepts[first_word] * np.linalg.norm(self.concepts[second_word])))

    def training_is_successful(self, x, threshold=75):
        if x:
            return np.true_divide(x[-1] * 100, self.num_test) >= threshold
        print x
        return False

    def df_query_to_idx(self, query, lang=None):
        if lang:
            languages = ['morpheme_%s' % lang]
        else:
            languages = ['morpheme_en', 'morpheme_es']
        q = list(self.lexicon_df.query(query)[languages].values.ravel())
        return self.sentence_indeces(q)

    def find_equivalent_translation_idx(self, idx, lang, ignore_cognates=True):
        # FIXME: Lookup concept and find all morphemes in other lang
        if idx in self.cognate_idx and ignore_cognates:
            return [idx]
        if idx > self.code_switched_idx and lang == 'en':
            idx -= self.code_switched_idx
        elif lang == 'es' and idx <= self.code_switched_idx:
            idx += self.code_switched_idx
        return [idx]
        """word = self.inputs.lexicon[idx]
        if word in self.inputs.translation_dict:
            translation = self.inputs.translation_dict[word]
        elif word in self.inputs.reverse_translation_dict:
            translation = self.inputs.reverse_translation_dict[word]
        else:
            concept = self.inputs.lexicon_to_concept[self.inputs.lexicon[idx]]
            all_translations = [w for w in self.inputs.concept_to_words[concept] if w != word]
            if not all_translations:
                # print word, idx, concept
                return [idx]  # this is the case where a word exists in one language but not the other
            elif len(all_translations) > 1:
                if remove_candidates_less_than_cs_point:
                    return [self.inputs.lexicon.index(translation) for translation in all_translations
                            if self.inputs.lexicon.index(translation) < self.inputs.code_switched_idx]
                else:
                    return [self.inputs.lexicon.index(translation) for translation in all_translations
                            if self.inputs.lexicon.index(translation) >= self.inputs.code_switched_idx]
            else:
                translation = all_translations[0]
        return [self.inputs.lexicon.index(translation)]"""


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
                if results_average[key][t] != []:  # do not simplify ( != [] is necessary)
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
            if type(results_average[key][t]) is dict:  # case: type_code_switches
                results_average[key][t] = {k: np.true_divide(v, len(valid_results))
                                           for k, v in results_average[key][t].iteritems()}
            else:
                results_average[key][t] = np.true_divide(val[t], len(valid_results))
    return results_average


def take_average_of_valid_results2(valid_results):
    """
    :param valid_results: list of dicts (simulations)
    :return:
    """
    print valid_results
    results_average = {}
    for key in valid_results[0].keys():
        results_average[key] = {'training': [], 'test': []}
        for simulation in valid_results:
            for t in ['training', 'test']:
                if results_average[key][t] != []:  # do not simplify ( != [] is necessary)
                    if type(simulation[key][t]) is dict:  # case: type_code_switches
                        for cs_type, val in simulation[key][t].items():
                            if cs_type in results_average[key][t]:
                                results_average[key][t][cs_type].append(val)
                            else:
                                results_average[key][t][cs_type] = [val]
                    else:
                        results_average[key][t].append(simulation[key][t])
                elif t in simulation[key]:
                    results_average[key][t] = [simulation[key][t]]
    # now average over all simulations
    print results_average
    print '@@@@'
    for key, val in results_average.items():
        for t in ['training', 'test']:
            if type(results_average[key][t]) is dict:  # case: type_code_switches
                results_average[key][t] = {k: np.true_divide(v, len(valid_results))
                                           for k, v in results_average[key][t].iteritems()}
            else:
                results_average[key][t] = np.true_divide(val[t], len(valid_results))
    return results_average

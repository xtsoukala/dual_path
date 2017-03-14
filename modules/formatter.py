# -*- coding: utf-8 -*-
import re
import os
import itertools
import pickle


class InputFormatter:
    def __init__(self, results_dir, input_dir, lex_fname, concept_fname, role_fname, evsem_fname, exclude_lang,
                 language, trainset, testset, semantic_gender, emphasis, prodrop, plot_title):
        """ This class mostly contains helper functions that set the I/O for the Dual-path model (SRN)."""
        self.input_dir = input_dir  # folder that contains training/test files, the lexicon, roles and event-sem
        self.pos, self.lexicon = self._read_lexicon_and_pos(lex_fname)
        self.concepts = self._read_file_to_list(concept_fname)
        self.identif = self._read_file_to_list('identifiability.in')
        self.languages = self._read_file_to_list('target_lang.in')
        self.roles = self._read_file_to_list(role_fname)
        self.event_semantics = self._read_file_to_list(evsem_fname)
        self.results_dir = results_dir  # directory where the results are saved
        self.prodrop = prodrop
        self.emphasis = emphasis
        self.semantic_gender = semantic_gender
        self.testset = testset
        self.trainset = trainset  # names of train and test set file names
        self.trainlines = self.read_set()
        self.num_train = len(self.trainlines)
        self.testlines = self.read_set(test=True)
        self.num_test = len(self.testlines)
        self.test_sentences_with_pronoun = self._number_of_test_pronouns()
        self.lexicon_to_concept = self._read_pickled_file('lexicon_to_concept.pickled')
        # |----------PARAMS----------|
        self.period_idx = self.lexicon.index('.')
        self.to_preposition_idx = self.lexicon.index('to')
        # the verb suffix -ó is the first entry in the ES lexicon
        self.code_switched_idx = self.lexicon.index('-ó') if '-ó' in self.lexicon else None
        self.idx_en_pronoun = [self.lexicon.index('he'), self.lexicon.index('she')]
        self.allowed_structures = self._read_allowed_structures()  # all allowed POS structures (in the train file)
        self.event_sem_size = len(self.event_semantics)
        self.lexicon_size = len(self.lexicon)
        self.concept_size = len(self.concepts)
        self.identif_size = len(self.identif)
        self.compress_idx = list(self.pos.keys())  # basically accounts for POS (syntactic categories)
        self.roles_size = len(self.roles)

        self.plot_title = plot_title
        self.lang = language
        self.exclude_lang = exclude_lang

    def _number_of_test_pronouns(self):
        return len([line for line in self.testlines if line.startswith('he ') or line.startswith('she ')])

    def read_set(self, test=False, set_name=None):
        if not set_name:
            if test:
                set_name = self.testset
            else:
                set_name = self.trainset
        lines = self._read_file_to_list(set_name)

        if self.prodrop:  # make pro-drop
            if self.emphasis:  # keep pronoun if emphasized
                lines = [re.sub(r'^(él|ella) ', '', line) if ',EMPH' not in line else line for line in lines]
            else:
                lines = [re.sub(r'(él|ella|,EMPH) ', '', line) for line in lines]
        elif not self.emphasis:
            lines = [re.sub(r',EMPH', '', sentence) for sentence in lines]

        if not self.semantic_gender:
            lines = re.sub(',(M|F)(,|;|$)', r'\2', lines)

        return lines

    def _read_allowed_structures(self):
        all_pos = [self.sentence_indeces_pos(sentence.split("##")[0].split(), convert_to_idx=True)
                   for sentence in self.trainlines]
        all_pos.sort()
        return list(all_pos for all_pos,_ in itertools.groupby(all_pos))

    def _read_lexicon_and_pos(self, fname):
        """
        :param fname: the name of the file that contains a list of categories (eg. noun, verb) and the lexicon
        :return: lexicon is a list of words, and pos is a dict that contains information regarding the index
                 (in the list of lexicon) of the word for each category. E.g. {'noun': [0, 1], 'verb': [2, 3, 4]}
        """
        pos = dict()
        lexicon = ['']  # position 0 is almost never predicted! Check why
        pos['NULL'] = [0]  # made-up POS for position 0 (empty string)
        prev_pos = ''
        pos_start = pos_end = 1
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
        return pos, lexicon

    def _read_file_to_list(self, fname):
        """
        :param fname: file name
        :return: Simply reads a file into a list while stripping newlines
        """
        if not os.path.isfile(os.path.join(self.input_dir, fname)):  # make sure the file exists
            import warnings
            warnings.warn("File '%s' doesn't exist, did you want that?" % os.path.join(self.input_dir, fname))
            return []

        with open(os.path.join(self.input_dir, fname)) as f:
            lines = [line.rstrip('\n') for line in f]
        return lines

    def _read_pickled_file(self, fname):
        with open(os.path.join(self.input_dir, fname)) as f:
            return pickle.load(f)

    def pos_lookup(self, word_idx):
        """
        :param word_idx: the index of the word in the lexicon
        :return: It looks up the pos dictionary and returns the category of
        the word (noun, verb etc)
        """
        for pos, idx in self.pos.iteritems():
            if word_idx in idx:
                return pos
        import sys  # in case the word index is not available
        sys.exit("No POS found for word %s (%s)" % (word_idx, self.lexicon[word_idx]))

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
        return [self.lexicon.index(w) for w in sentence_lst]

    def sentence_indeces_pos(self, sentence_idx, remove_period=False, convert_to_idx=False):
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

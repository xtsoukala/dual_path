# -*- coding: utf-8 -*-
import re
import os


class InputFormatter:
    def __init__(self, results_dir, input_dir, lex_fname, concept_fname, role_fname,
                 evsem_fname, exclude_lang, language, trainset=None, testset=None,
                 semantic_gender=False, emphasis=False, prodrop=False):
        """ This class mostly contains helper functions that set the I/O for the model (SRN).
        Dual Path has the following layers (plus hidden & context)
        word, compress, concept & role, target language and event-semantics.

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
        self.allowed_structures = self._read_allowed_structures()  # all allowed POS structures

        self.event_sem_size = len(self.event_semantics)
        self.lexicon_size = len(self.lexicon)
        self.concept_size = len(self.concepts)
        self.identif_size = len(self.identif)
        self.compress_idx = list(self.pos.keys())  # basically accounts for POS (syntactic categories)
        self.roles_size = len(self.roles)

        self.lang = language
        self.exclude_lang = exclude_lang
        # self.determiners = [self.lexicon[i] for i in self.pos['DET']]
        # self.det_pattern = re.compile(r'\b(%s)\b' % "|".join(self.determiners))
        # |----------PARAMS----------|
        self.period_idx = self.lexicon.index('.')
        self.code_switched_idx = self.lexicon.index('-a')  # the verb suffix is the first entry in the ES lexicon
        self.all_roles = dict()

    def _number_of_test_pronouns(self):
        return len([line for line in self.testlines if line.startswith('he ') or line.startswith('she ')])

    def read_set(self, test=False, set_name=None, skip_period=False):
        if not set_name:
            if test:
                set_name = self.testset
            else:
                set_name = self.trainset

        with open(set_name, 'r+') as f:
            lines = f.readlines()

        if self.prodrop:  # make prodrop
            if self.emphasis:  # keep pronoun if emphasized
                lines = [re.sub(r'^(él|ella) ', '', line) if ',EMPH' not in line else line for line in lines]
            else:
                lines = [re.sub(r'(él|ella|,EMPH) ', '', line) for line in lines]
        elif not self.emphasis:
            lines = [re.sub(r',EMPH', '', sentence) for sentence in lines]

        if skip_period:
            lines = [re.sub(r' \.', '', line) for line in lines]

        if not self.semantic_gender:
            lines = re.sub(',(M|F)(,|;|$)', r'\2', lines)

        return lines

    def _read_allowed_structures(self):
        return set([self.sentence_pos_str(sentence.split("##")[0]) for sentence in self.trainlines])

    def _read_lexicon_and_pos(self, fname):
        """
        :param fname: the name of the file that contains a list of categories (eg. noun, verb) and the lexicon
        :return: lexicon is a list of words, and pos is a dict that contains information regarding the index
        (in the list of lexicon) of the word for each category. E.g. {'noun': [0, 1], 'verb': [2, 3, 4]}
        """
        pos = dict()
        lexicon = ['']  # FIXME: position 0 is >almost< never predicted, so we start lexicon from 1. Check why.
        prev_pos = ''
        pos_start = pos_end = 1
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
                elif line not in lexicon:  # make sure there are no duplicate words
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
        :param sentence: intended sentence in a list (split string) format, e.g., ['the', 'cat', 'was', 'walk', '-ing']
        :return: list of activations in the lexicon for the words above (e.g. [0, 4, 33, 20, 40]
        """
        return [self.lexicon.index(w) for w in sentence]

    def sentence_pos_str(self, sentence, remove_period=True):
        """
        :param sentence: sentence string
        :param remove_period: whether to remove the period from the end of the sentence (useful when checking POS only)
        :return: returns a list of the POS of every word in the sentence
        """
        if remove_period:
            sentence = re.sub(r' \.', '', sentence)
        return " ".join([self.pos_lookup(word) for word in sentence.split()])

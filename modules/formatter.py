# -*- coding: utf-8 -*-
import re
import os
import itertools
import pickle
import pandas as pd
import numpy as np
import torch
import torch.multiprocessing as mp
from collections import defaultdict, Counter

try:
    from itertools import zip_longest as zp
except:  # python 2
    from itertools import izip as zp


class InputFormatter:
    def __init__(self, directory, fixed_weights, fixed_weights_identif, language, trainingset, testset, overt_pronouns,
                 use_semantic_gender, prodrop, use_word_embeddings, monolingual_only, replace_haber_tener):
        """ This class mostly contains helper functions that set the I/O for the Dual-path model (SRN)."""
        self.monolingual_only = monolingual_only
        self.L1, self.L2 = self.get_l1_and_l2(language)
        self.directory = directory  # folder that contains input files and where the results are saved
        self.identifiability = self._read_file_to_list('identifiability.in')
        self.use_semantic_gender = use_semantic_gender
        if self.use_semantic_gender and 'M' not in self.identifiability:
            self.identifiability += ['M', 'F']
        self.lexicon_df = pd.read_csv(os.path.join(self.directory, 'lexicon.csv'), sep=',', header=0)  # 1st line:header
        self.lexicon, self.pos, self.code_switched_idx = self.get_lex_info_and_code_switched_idx()
        self.replace_haber_tener = replace_haber_tener
        if replace_haber_tener:  # call sed to replace training and test files with "tener"
            os.system("sed -i -e 's/ ha / tiene /g' %s/t*.in" % directory)
            self.lexicon_df.loc[(self.lexicon_df.pos == 'aux') & (self.lexicon_df.aspect == 'perfect') &
                                (self.lexicon_df.tense == 'present'), 'morpheme_es'] = 'tiene'
        if use_word_embeddings:
            import word2vec
        self.use_word_embeddings = use_word_embeddings
        self.concepts = list(self.lexicon_df.concept.dropna().unique()) if not use_word_embeddings \
            else word2vec.load('word2vec/text8.bin')
        self.languages = self._read_file_to_list('target_lang.in')
        self.roles = self._read_file_to_list('roles.in')
        self.event_semantics = self._read_file_to_list('event_semantics.in')
        self.prodrop = prodrop
        self.emphasis_percentage = overt_pronouns
        # |----------PARAMS----------|
        # fixed_weight is the activation between roles-concepts and evsem. The value is rather arbitrary unfortunately.
        # Using a really low value (e.g. 1) makes it difficult (but possible) for the model to learn the associations
        self.fixed_weights = fixed_weights
        self.fixed_identif = fixed_weights_identif
        self.period_idx = self.get_lexicon_index('.')
        self.auxiliary_idx = self.df_query_to_idx("pos == 'aux'")
        self.to_prepositions_idx = self.df_query_to_idx("pos == 'prep'")
        self.idx_pronoun = self.df_query_to_idx("pos == 'pron'")
        self.determiners = self.df_query_to_idx("pos == 'det'")
        self.tense_markers = self.df_query_to_idx("pos == 'aux' or pos == 'verb_suffix'")
        self.cognate_idx = self.df_query_to_idx("is_cognate == 'Y'", lang='en')
        self.false_friend_idx = self.df_query_to_idx("is_false_friend == 'Y'", lang='en')
        self.shared_idx = [self.period_idx] + self.cognate_idx + self.false_friend_idx
        self.event_sem_size = len(self.event_semantics)
        self.lexicon_size = len(self.lexicon)
        self.concept_size = len(self.concepts) if not self.use_word_embeddings else self.concepts['dog'].size
        self.identif_size = len(self.identifiability)
        self.identif_and_concept_size = self.concept_size + self.identif_size
        self.roles_size = len(self.roles)
        self.languages_size = len(self.languages)
        self.weights_role_concept = {'training': [], 'test': []}
        self.training_set = trainingset
        self.trainlines_df, self.weights_role_concept['training'] = self.read_set_to_df()
        self.num_train = len(self.trainlines_df)
        self.allowed_structures = self.read_allowed_pos()
        self.testset = testset
        self.testlines_df, self.weights_role_concept['test'] = self.read_set_to_df(test=True)
        self.num_test = len(self.testlines_df)
        self.test_sentences_with_pronoun = self._number_of_test_pronouns()
        self.same_unordered_lists = lambda x, y: Counter(x) == Counter(y)

    def get_l1_and_l2(self, lang_code):
        if len(lang_code) == 4:
            L1 = lang_code[:2]
            L2 = lang_code[2:]
        else:
            L1 = lang_code
            if self.monolingual_only:
                L2 = None
            else:
                L2 = [x for x in ['en', 'es'] if x != L1][0]
                print("Will include L2 (%s) lexicon" % L2)
        return L1, L2

    def update_sets(self, new_directory):
        self.directory = new_directory
        if self.replace_haber_tener:  # call sed to replace training and test files with "tener"
            os.system("sed -i -e 's/ ha / tiene /g' %s/t*.in" % new_directory)
        self.trainlines_df, self.weights_role_concept['training'] = self.read_set_to_df()  # re-read files
        self.num_train = len(self.trainlines_df)
        self.testlines_df, self.weights_role_concept['test'] = self.read_set_to_df(test=True)
        self.num_test = len(self.testlines_df)
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

    def is_sentence_gramatical_or_flex(self, out_sentence_pos, trg_sentence_pos, out_sentence_idx):
        """
        Check a sentence's grammaticality. If the target and output sentences don't have identical POS but differ only
        on the double object expression (e.g., gives the book to him/gives him the book) then return flex_order = True
        NOTE: The grammaticality is judged by the reference (target) sentence, not by the absolute grammaticality of the
        produced sentence. E.g., if the target sentence is "She throw -s the key to the boy ." then
        "She throw -s the key ." will be regarded UNgrammatical, even if it's a correct sentence.
        """
        is_grammatical = True
        has_flex_order = True
        if out_sentence_pos == trg_sentence_pos:  # if POS is identical then the sentence is definitely grammatical
            return is_grammatical, not has_flex_order
        if out_sentence_pos in self.allowed_structures:  # if sentence in list of existing POS
            return is_grammatical, has_flex_order
        # Normally we should add "and out_pos in allowed_structures" but the model generated novel (correct) structures
        if not out_sentence_pos[-1] == 'prep':  # it shouldn't end with 'to'
            if 'prep' in out_sentence_pos and 'prep' not in trg_sentence_pos:
                if self.same_unordered_lists(out_sentence_pos, trg_sentence_pos + ['prep']):
                    return is_grammatical, has_flex_order
            elif 'prep' in trg_sentence_pos and 'prep' not in out_sentence_pos:
                # If the verb is Spanish we shouldn't allow double datives
                p_idx = None
                if 'verb' in out_sentence_pos:
                    p_idx = out_sentence_pos.index('verb')
                elif 'participle' in out_sentence_pos:
                    p_idx = out_sentence_pos.index('participle')

                if p_idx and out_sentence_idx[p_idx] < self.code_switched_idx:  # assumption: L1 English in lex
                    if self.same_unordered_lists(out_sentence_pos + ['prep'], trg_sentence_pos):
                        return is_grammatical, has_flex_order
        return not is_grammatical, not has_flex_order

    def test_for_flexible_order(self, out_sentence_idx, trg_sentence_idx, ignore_det=True):
        """
        :param out_sentence_idx:
        :param trg_sentence_idx:
        :param ignore_det: Whether to count article definiteness (a/the) as a mistake
        :return: if produced sentence was not identical to the target one, check if the meaning was correct but
        expressed with a different syntactic structure (due to, e.g., priming)
        """
        flexible_order = False
        ignore_idx = self.to_prepositions_idx
        if ignore_det:
            ignore_idx.extend(self.determiners)

        if self.same_unordered_lists([x for x in out_sentence_idx if x not in ignore_idx],
                                     [x for x in trg_sentence_idx if x not in ignore_idx]):
            flexible_order = True
        elif self.same_unordered_lists(out_sentence_idx[:-1], trg_sentence_idx[:-1]):
            print(out_sentence_idx, trg_sentence_idx, "LAST WORD")
            flexible_order = True
        return flexible_order

    def test_meaning_without_pronouns(self, out_sentence_idx, trg_sentence_idx):
        # remove subject pronouns and check the rest of the sentence
        out = [idx for idx in out_sentence_idx if idx not in self.idx_pronoun]
        trg = [idx for idx in trg_sentence_idx if idx not in self.idx_pronoun]
        return self.test_for_flexible_order(out, trg)

    def test_without_feature(self, out_sentence_idx, trg_sentence_idx, feature):
        if feature == "tense":
            feature_markers = self.tense_markers
        elif feature == "determiners":
            feature_markers = self.determiners
        out = [x for x in out_sentence_idx if x not in feature_markers]
        trg = [x for x in trg_sentence_idx if x not in feature_markers]
        return self.test_for_flexible_order(out, trg, ignore_det=False)

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
        # "translate" message into the target language
        trg_lang = self.get_target_language_from_sentence_idx(trg_sentence_idx)
        translated_sentence_candidates = self.translate_idx_into_monolingual_candidates(out_sentence_idx, trg_lang)
        # check for insertions (cases where only 1 idx is from the other language)
        insertion_type = self.check_for_insertions(out_sentence_idx, trg_lang)
        if insertion_type:
            for translated_sentence_idx in translated_sentence_candidates:  # check translation validity
                if self.test_for_flexible_order(translated_sentence_idx, trg_sentence_idx):
                    return insertion_type
        # Now check for alternational switching - compare with target sentence
        for translated_sentence_idx in translated_sentence_candidates:
            cs_type = self.examine_sentences_for_cs_type(translated_sentence_idx, out_sentence_idx, trg_sentence_idx)
            if cs_type:  # if not False no need to look further
                return cs_type
        # no CS type found. Either the meaning was incorrect or the produced lang was different than the "target" one
        return False

    def get_target_language_from_sentence_idx(self, sentence_idx):
        lang = self.L1
        if sentence_idx[0] >= self.code_switched_idx:
            lang = self.L2
        return lang

    def check_for_insertions(self, out_sentence_idx, target_lang):
        non_shared_idx = [w for w in out_sentence_idx if w not in self.shared_idx]
        l2_words = sum(1 for i in non_shared_idx if i >= self.code_switched_idx)
        l1_words = sum(1 for i in non_shared_idx if i < self.code_switched_idx)
        if ((target_lang == self.L2 and l1_words >= l2_words and out_sentence_idx[0] < self.code_switched_idx) or
                (target_lang == self.L1 and l1_words <= l2_words and out_sentence_idx[0] >= self.code_switched_idx)):
            print(out_sentence_idx, self.sentence_from_indeces(out_sentence_idx), target_lang, 'RESOLVE',
                  l1_words, l2_words)

        if target_lang == self.L2:  # test for L1 insertions
            check_idx = [i for i in non_shared_idx if i < self.code_switched_idx]
        else:  # check for L2 insertions
            check_idx = [i for i in non_shared_idx if i >= self.code_switched_idx]

        check_idx_pos = [self.pos_lookup(w) for w in check_idx]
        if len(set(check_idx_pos)) == 1:
            return check_idx_pos[0]
        return False

    def translate_idx_into_monolingual_candidates(self, out_sentence_idx, trg_lang):
        trans = [self.find_equivalent_translation_idx(idx, trg_lang) for i, idx in enumerate(out_sentence_idx)]
        return [list(x for x in tup) for tup in list(itertools.product(*trans))]

    def examine_sentences_for_cs_type(self, translated_sentence_idx, out_sentence_idx, trg_sentence_idx):
        if not self.test_for_flexible_order(translated_sentence_idx, trg_sentence_idx):
            return False  # output and translated messages are not (flex-)identical, code-switch has wrong meaning

        check_idx = [w for w in out_sentence_idx if (w not in trg_sentence_idx and w not in self.shared_idx)]
        if len(check_idx) == 0:
            return False  # it was either a cognate or a false friend

        if len(check_idx) == len([w for w in out_sentence_idx if w not in self.shared_idx]):
            return "inter-sentential"  # whole sentence in the non-target language

        # check if sequence is a subset of the sentence (out instead of trg because target is monolingual)
        check_idx_pos = [self.pos_lookup(w) for w in check_idx]
        len_pos = len(set(check_idx_pos))
        if len_pos > 1 and set(check_idx).issubset(out_sentence_idx):
            cs_type = "alt. (%s)" % check_idx_pos[0]
        else:
            print("No CS detected for: %s %s" % (out_sentence_idx, self.sentence_from_indeces(out_sentence_idx)))
            sys.exit()
        return cs_type

    def is_code_switched(self, sentence_indeces, target_lang_idx):
        """ This function only checks whether words from different languages were used.
        It doesn't verify the validity of the expressed message """
        # skip indeces that are common in all lang
        clean_sentence = [x for x in sentence_indeces if x not in self.shared_idx]
        if not clean_sentence:
            return False  # empty sentence
        min_and_max_idx = get_minimum_and_maximum_idx(clean_sentence)
        if ((all(x >= self.code_switched_idx for x in min_and_max_idx) or
             all(x < self.code_switched_idx for x in min_and_max_idx))
                and self.morpheme_is_from_target_lang(clean_sentence[0], target_lang_idx)):
            return False
        return True

    def check_switch_points(self, sentence_indeces, sentence_pos, pos_of_interest='aux'):
        # assumption: lexicon contains first EN and then ES words
        (at, right_after, after, at_esen, right_after_esen, after_esen,
         after_anywhere, after_anywhere_esen) = (False, False, False, False, False, False, False, False)
        if pos_of_interest in sentence_pos:
            pos_idx = sentence_pos.index(pos_of_interest)
        else:
            pos_idx = sentence_pos.index('verb')
        if pos_idx:
            # check switch before pos_of_interest
            at = self.is_code_switched(sentence_indeces[:pos_idx + 1], target_lang_idx=sentence_indeces[0])
            # check Spanish-to-English direction
            at_esen = True if at and sentence_indeces[pos_idx] >= self.code_switched_idx else False
            # check switch right after (e.g. between aux and participle)
            right_after = self.is_code_switched(sentence_indeces[pos_idx:pos_idx + 2],
                                                target_lang_idx=sentence_indeces[pos_idx])
            right_after_esen = (True if right_after and sentence_indeces[pos_idx] < self.code_switched_idx
                                else False)
            # check switch at the end (e.g. after aux and participle)
            after = self.is_code_switched(sentence_indeces[pos_idx + 1:pos_idx + 3],
                                          target_lang_idx=sentence_indeces[pos_idx + 1])
            after_esen = True if after and sentence_indeces[pos_idx + 1] < self.code_switched_idx else False

            after_anywhere = self.is_code_switched(sentence_indeces[pos_idx + 1:],
                                                   target_lang_idx=sentence_indeces[pos_idx + 1])
            after_anywhere_esen = (True if after_anywhere and sentence_indeces[pos_idx + 1] < self.code_switched_idx
                                   else False)
        return at, right_after, after, after_anywhere, at_esen, right_after_esen, after_esen, after_anywhere_esen

    def morpheme_is_from_target_lang(self, morpheme_idx, target_idx):
        """
        Assumption: this doesn't check for shared indeces (period/congates) because they have already been stripped
        """
        if (all(x >= self.code_switched_idx for x in [morpheme_idx, target_idx]) or
                all(x < self.code_switched_idx for x in [morpheme_idx, target_idx])):
            return True
        return False

    def get_lex_info_and_code_switched_idx(self):
        """
        :return: lexicon in list format and code-switched id (the first entry of the second language)
        """
        info = defaultdict(list)
        lex_append = info['lex'].append
        pos_append = info['pos'].append
        for lang in [self.L1, self.L2]:
            if lang:
                column = self.lexicon_df[['morpheme_%s' % lang, 'pos',
                                          'concept', 'type']].dropna(subset=['morpheme_%s' % lang])
                pos_list = list(column['pos'])
                for i, item in enumerate(list(column['morpheme_%s' % lang])):
                    if item not in info['lex']:  # only get unique items. set() would change the order, do this instead
                        lex_append(item)
                        pos_append(pos_list[i])
            info['code_switched_idx'].append(len(info['lex']))
        with open(os.path.join(self.directory, "lexicon.in"), 'w') as f:
            f.writelines("%s\n" % w for w in info['lex'])
        return info['lex'], info['pos'], info['code_switched_idx'][0]

    def get_lexicon_index(self, word):
        """
        :param word: unique word in string format
        :return: returns index of the word in the list. In case of non unique words, it only returns the first idx
        """
        return self.lexicon.index(word)

    def concept_to_morphemes(self, lex_idx, target_lang):
        current_lang = self.L1 if target_lang == self.L2 else self.L2
        return self.df_query_to_idx("morpheme_%s == '%s'" % (current_lang, self.lexicon[lex_idx]), lang=target_lang)

    def _number_of_test_pronouns(self):
        return sum(self.testlines_df.target_sentence.str.count('(^| )(s)?he '))

    def read_set_to_df(self, test=False):
        set_name = self.testset if test else self.training_set
        df = pd.read_csv(os.path.join(self.directory, set_name), names=['target_sentence', 'message'],
                         sep='## ', engine='python')
        if self.prodrop:  # TODO: make pro-drop
            if self.emphasis_percentage > 0:  # keep pronoun if emphasized
                # find num of lines that are in ES. decide on num that will be emphasized:
                number_emphasized = len([]) * self.emphasis_percentage / 100  # replace('AGENT=', 'AGENT=EMPH,')
            else:
                df.line = df.line.str.replace('(^| )(él|ella) ', ' ', regex=True)
        # elif not self.emphasis: lines = [re.sub(r',EMPH', '', sentence) for sentence in lines]

        if not self.use_semantic_gender:
            df.message = df.message.str.replace(',(M|F);', ';', regex=True)

        df['target_sentence_idx'] = df.target_sentence.map(lambda a: self.sentence_indeces(a))
        df['target_pos'] = df.target_sentence_idx.map(lambda a: self.sentence_pos(a))
        (df['event_sem_activations'], df['target_lang_act'], df['lang'], weights_role_concept,
         df['event_sem_message']) = zp(*df.message.map(lambda a: self.get_message_info(a)))
        #print(df['event_sem_activations'], type(df['event_sem_activations']))
        #print(df['event_sem_activations'].values.astype(float))
        #df['event_sem_activations'] = torch.tensor(df['event_sem_activations'].values.astype(float))
        #print(df['event_sem_activations'], type(df['event_sem_activations']))
        #sys.exit
        return df, weights_role_concept

    def read_allowed_pos(self):
        """ returns all allowed POS structures in the training file """
        return [list([i.replace('aux', 'verb') for i in x]) for x in set(tuple(x)
                                                                         for x in self.trainlines_df.target_pos)]

    def _read_file_to_list(self, fname):
        """
        :param fname: file name
        :return: Simply reads a file into a list while stripping newlines
        """
        if self.file_exists(fname):
            with open(os.path.join(self.directory, fname)) as f:
                lines = [line.rstrip('\n') for line in f]
            return lines

    def _read_pickled_file(self, fname):
        if self.file_exists(fname, warning=False):
            with open(os.path.join(self.directory, fname), 'rb') as f:
                return pickle.load(f)
        return {}

    def file_exists(self, fname, warning=True):
        if not os.path.isfile(os.path.join(self.directory, fname)):  # make sure the file exists
            if warning:
                import warnings
                warnings.warn("File '%s' doesn't exist, did you want that?" % os.path.join(self.directory, fname))
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

    def sentence_indeces(self, sentence):
        """
        :param sentence: intended sentence , e.g., 'the cat walk -s' (will be split into: ['the', 'cat', 'walks'])
        :return: list of activations in the lexicon for the words above (e.g. [0, 4, 33]
        """
        return [self.get_lexicon_index(w) for w in sentence.split()]

    # TODO: remove_period?
    def sentence_pos(self, sentence_idx_lst, remove_period=False):
        """
        :param sentence_idx_lst: sentence in list format. Either contains activations in the lexicon for the sentence
        or the words (in that case, convert_to_idx should be set to True)
        :param remove_period: whether to remove the period (last element) from the sentence (useful when checking POS)
        :return:
        """
        if remove_period and sentence_idx_lst[-1] == self.period_idx:
            sentence_idx_lst = sentence_idx_lst[:-1]
        pos = [self.pos_lookup(word_idx) for word_idx in sentence_idx_lst]
        if 'aux' in pos:
            idx = pos.index('aux')
            pos[idx] = 'verb'
        """if pos.count('verb') > 1:
            idx = pos.index('verb')
            pos[idx] = 'aux'
            pos[idx + 1] = 'participle'
        elif 'verb' in pos and 'participle' in pos:
            pos = [w.replace('verb', 'aux') for w in pos]"""
        return pos

    @staticmethod
    def replace_verb_with_auxiliary(sentence_pos):
        if 'participle' in sentence_pos:
            idx = sentence_pos.index('participle')
            sentence_pos[idx-1] = 'aux'
        elif sentence_pos.count('verb') == 2:
            idx = sentence_pos.index('verb')
            sentence_pos[idx] = 'aux'
            sentence_pos[idx+1] = 'participle'
        elif 'aux' in sentence_pos and 'verb' in sentence_pos:
            idx = sentence_pos.index('verb')
            sentence_pos[idx] = 'participle'
        return sentence_pos

    def get_message_info(self, message):
        """ :param message: string, e.g. "ACTION=CARRY;AGENT=FATHER,DEF;PATIENT=STICK,INDEF
                            E=PAST,PROG" which maps roles (AGENT, PATIENT, ACTION) with concepts and also
                            gives information about the event-semantics (E)
        """
        norm_activation = 1.  # 0.5 ?
        reduced_activation = 0.7  # 0.1-4
        event_sem_activations = np.zeros(self.event_sem_size) #[0] * self.event_sem_size #torch.zeros(self.event_sem_size) #np.zeros(self.event_sem_size)  # or: [-1] * self.event_sem_size
        event_sem_message = ''
        # include the identifiness, i.e. def, indef, pronoun, emph(asis)
        weights_role_concept = torch.zeros((self.roles_size, self.identif_and_concept_size))
        target_lang_activations = [0.] * self.languages_size #torch.zeros(self.languages_size) #np.zeros(self.languages_size)
        target_language = None
        for info in message.split(';'):
            role, what = info.split("=")
            if role == "E":  # retrieve activations for the event-sem layer
                event_sem_message = what
                activation = norm_activation
                for event in what.split(","):
                    if event == "-1":  # if -1 precedes an event-sem its activation should be lower than 1
                        activation = reduced_activation
                        continue  # otherwise activation will revert to default
                    elif event in self.languages:
                        target_language = event
                        target_lang_activations[self.languages.index(event)] = activation
                    elif event == 'enes':
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
                                import sys
                                sys.exit("No concept found: %s (%s)" % (concept, message))
        return event_sem_activations, target_lang_activations, target_language, weights_role_concept, event_sem_message

    def get_weights_role_concept(self, message):
        """ :param message: string, e.g. "ACTION=CARRY;AGENT=FATHER,DEF;PATIENT=STICK,INDEF
                            E=PAST,PROG" which maps roles (AGENT, PATIENT, ACTION) with concepts and also
                            gives information about the event-semantics (E)
        """
        # include the identifiness, i.e. def, indef, pronoun, emph(asis)
        weights_role_concept = torch.zeros((self.roles_size, self.identif_and_concept_size))
        for info in message.split(';'):
            role, what = info.split("=")
            if role != "E":  # retrieve activations for the event-sem layer
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
                                import sys
                                sys.exit("No concept found: %s (%s)" % (concept, message))
        return weights_role_concept

    def cosine_similarity(self, first_word, second_word):
        """ Cosine similarity between words when using word2vec """
        pass

    def training_is_successful(self, x, threshold):
        return np.true_divide(x[-1] * 100, self.num_test) >= threshold

    def df_query_to_idx(self, query, lang=None):
        if lang:
            languages = ['morpheme_%s' % lang]
        else:
            languages = ['morpheme_en', 'morpheme_es']
        q = self.lexicon_df.query(query)[languages].values.ravel()
        return [self.get_lexicon_index(x) for x in list(q) if is_not_nan(x)]

    def find_equivalent_translation_idx(self, idx, lang):
        # ignore shared indeces (cognates/period)
        if (idx not in self.shared_idx and ((idx >= self.code_switched_idx and lang == self.L1) or
                                            (lang == self.L2 and idx < self.code_switched_idx))):
            return self.concept_to_morphemes(lex_idx=idx, target_lang=lang)
        return [idx]


def get_minimum_and_maximum_idx(clean_sentence):
    return min(clean_sentence), max(clean_sentence)  # set with 2 indeces, min and max


def is_not_nan(x):
    if x == x:
        return True
    return False


def is_not_empty(x):
    if x != [] and sum(x) > 0:  # do not simplify
        return True
    return False


def get_np_mean_and_std_err(x, summary_sim):
    if not isinstance(x, np.ndarray):
        x = np.array(x)
    return x.mean(axis=0), standard_error(x.std(axis=0), summary_sim)  # mean of lists (per column)


def standard_error(std, num_simulations):
    return true_divide(std, torch.sqrt(num_simulations))


def true_divide(x, total):
    return torch.div(x, total)


def extract_cs_keys(sim_with_type_code_switches, set_names, strip_language_info=True):
    cs_keys = []
    for sim in sim_with_type_code_switches:
        for set_type in set_names:
            cs_keys += sim['type_code_switches'][set_type].keys()
    res = cs_keys
    if strip_language_info:
        res = strip_language_info_and_std_err(res)
    return res


def compute_mean_and_std(valid_results, epochs, evaluated_sets):
    """
    :param valid_results: list of dicts (simulations).  e.g., for 2 simulations and 4 epochs:
                [{'correct_meaning': {'test': [0, 324, 725, 822]}, 'correct_pos': {'test': [0, 864, 944, 962, 952]}},
                {'correct_meaning': {'test': [0, 424, 825, 922]}, 'correct_pos': {'test': [0, 964, 984, 982, 989]}}]
    :param epochs: number of epochs per simulation that will be analyzed. We might want to restrict to a
                   lower number than the one in the simulations
    :param evaluated_sets: the sets that have been evaluated (test, training)
    :return:
    """
    # convert lists of dicts to a single dictionary of lists
    results_sum = {}
    all_simulation_keys = list(valid_results[0].keys())  # e.g., 'correct_code_switches', 'correct_sentences'
    all_simulation_keys.remove('type_code_switches')
    all_cs_types = extract_cs_keys(valid_results, set_names=evaluated_sets, strip_language_info=False)

    for key in all_simulation_keys + all_cs_types:
        results_sum[key] = {set_name: [] for set_name in evaluated_sets}
        for simulation in valid_results:  # go through all simulations
            for set_name in evaluated_sets:
                if key in all_cs_types:
                    if key in simulation['type_code_switches'][set_name]:
                        results_sum[key][set_name].append(simulation['type_code_switches'][set_name][key][:epochs])
                    else:  # fill with 0
                        results_sum[key][set_name].append([0] * epochs)
                else:
                    results_sum[key][set_name].append(simulation[key][set_name][:epochs])
    # now compute MEAN and STANDARD ERROR of all simulations
    for key in results_sum.keys():
        for set_name in evaluated_sets:
            np_mean, np_std_err = get_np_mean_and_std_err(results_sum[key][set_name], summary_sim=len(valid_results))
            if np_mean is not False:
                results_sum[key]["%s-std_error" % set_name] = np_std_err
                results_sum[key][set_name] = np_mean
    results_sum['all_cs_types'] = strip_language_info_and_std_err(all_cs_types)
    return results_sum


def strip_language_info_and_std_err(keyword_list):
    return set([re.sub("en-|es-|-cog|-ff|-std_error", "", x) for x in keyword_list])

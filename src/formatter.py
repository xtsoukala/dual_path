# -*- coding: utf-8 -*-
import re
import itertools
import math
import operator
import subprocess
from itertools import zip_longest as zp
from src import defaultdict, Counter, np, pd, os, torch


class InputFormatter:
    def __init__(self, directory, fixed_weights, fixed_weights_identif, language, training_set_name, test_set_name,
                 overt_pronouns, use_semantic_gender, prodrop, use_word_embeddings, monolingual_only,
                 replace_haber_tener, test_haber_frequency, convert_input, num_training):
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
        self.convert_input = convert_input
        self.replace_haber_tener = replace_haber_tener
        self.test_haber_frequency = test_haber_frequency
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
        self.translation_cache = {}
        self.code_switched_type_cache = {}
        self.switch_points_cache = {}
        self.concept_to_morpheme_cache = {}
        # |----------PARAMS----------|
        # fixed_weight is the activation between roles-concepts and evsem. The value is rather arbitrary unfortunately.
        # Using a really low value (e.g. 1) makes it difficult (but possible) for the model to learn the associations
        self.fixed_weights = fixed_weights
        self.fixed_identif = fixed_weights_identif
        self.period_idx = self.get_lexicon_index('.')
        self.auxiliary_idx = self.df_query_to_idx("pos == 'aux'")
        self.to_prepositions_idx = self.df_query_to_idx("pos == 'prep'")
        self.haber_tener_idx = self.df_query_to_idx("morpheme_es == 'tiene' or morpheme_es == 'ha'", lang='es')
        self.idx_pronoun = self.df_query_to_idx("pos == 'pron'")
        self.determiners = self.df_query_to_idx("pos == 'det'")
        self.tense_markers = self.df_query_to_idx("pos == 'aux' or pos == 'verb_suffix'")
        self.cognate_idx = self.df_query_to_idx("is_cognate == 'Y'", lang='en')
        self.false_friend_idx = self.df_query_to_idx("is_false_friend == 'Y'", lang='en')
        self.shared_idx = [self.period_idx] + self.cognate_idx + self.false_friend_idx
        self.lexicon_size = len(self.lexicon)
        self.identif_size = len(self.identifiability)
        self.concept_size = len(self.concepts) if not self.use_word_embeddings else self.concepts['dog'].size
        self.event_sem_size = len(self.event_semantics)
        self.roles_size = len(self.roles)
        self.num_languages = len(self.languages)
        self.initialized_weights_role_concept = torch.zeros(self.roles_size, (self.concept_size + self.identif_size))
        self.weights_role_concept = {'training': [], 'test': []}
        self.weights_concept_role = {'training': [], 'test': []}
        self.event_sem_activations = {'training': [], 'test': []}
        self.target_lang_act = {'training': [], 'test': []}
        self.training_set = training_set_name
        self.testset = test_set_name
        self.num_training = num_training
        self.trainlines_df, self.allowed_structures, self.num_test = None, None, None
        self.testlines_df, self.test_sentences_with_pronoun = None, None
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

        if self.convert_input:
            if self.replace_haber_tener:  # call sed to replace training and test files with "tener"
                os.system("sed -i -e 's/ ha / tiene /g' %s/t*.in" % new_directory)
                self.lexicon_df.loc[(self.lexicon_df.pos == 'aux') & (self.lexicon_df.aspect == 'perfect') &
                                    (self.lexicon_df.tense == 'present'), 'morpheme_es'] = 'tiene'
            elif self.test_haber_frequency:
                self.make_haber_and_tener_synonyms(new_directory)
                
        (self.trainlines_df, self.weights_role_concept['training'], self.event_sem_activations['training'],
         self.target_lang_act['training']) = self.read_set_to_df()
        self.weights_concept_role['training'] = [torch.t(x) for x in self.weights_role_concept['training']]
        self.num_training = len(self.trainlines_df)
        (self.testlines_df, self.weights_role_concept['test'], self.event_sem_activations['test'],
         self.target_lang_act['test']) = self.read_set_to_df(test=True)
        self.weights_concept_role['test'] = [torch.t(x) for x in self.weights_role_concept['test']]
        self.num_test = len(self.testlines_df)
        self.test_sentences_with_pronoun = self._number_of_test_pronouns()
        if not self.allowed_structures:
            self.allowed_structures = self.read_allowed_pos()

    @staticmethod
    def make_haber_and_tener_synonyms(directory):
        fname = "%s/training.in" % directory
        os.system("sed -i -e 's/ ha / tiene /g' %s" % fname)
        num = int(subprocess.check_output("cat %s | grep -w tiene | wc -l" % fname, shell=True))
        num = num / 2  # only convert half of the instances
        os.system("awk '{for(i=1;i<=NF;i++){if(x<%s&&$i==\"tiene\"){x++;sub(\"tiene\",\"ha\",$i)}}}1' %s > "
                  "tmp && mv tmp %s" % (num, fname, fname))

    def has_correct_meaning(self, out_sentence_idx, trg_sentence_idx):
        if out_sentence_idx == trg_sentence_idx:
            return True
        if (self.test_haber_frequency and filter(lambda i: i not in self.haber_tener_idx, out_sentence_idx) ==
                filter(lambda i: i not in self.haber_tener_idx, trg_sentence_idx)):  # remove haber/tener and check
                return True
        # flexible_order in the monolingual case means that the only difference is the preposition "to"
        out_sentence_idx = filter(lambda i: i not in self.to_prepositions_idx, out_sentence_idx)
        trg_sentence_idx = filter(lambda i: i not in self.to_prepositions_idx, trg_sentence_idx)
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

        if self.same_unordered_lists(filter(lambda i: i not in ignore_idx, out_sentence_idx),
                                     filter(lambda i: i not in ignore_idx, trg_sentence_idx)):
            flexible_order = True
        return flexible_order

    def test_meaning_without_pronouns(self, out_sentence_idx, trg_sentence_idx):
        # remove subject pronouns and check the rest of the sentence
        return self.test_for_flexible_order(filter(lambda i: i not in self.idx_pronoun, out_sentence_idx),
                                            filter(lambda i: i not in self.idx_pronoun, trg_sentence_idx))

    def test_without_feature(self, out_sentence_idx, trg_sentence_idx, feature):
        if feature == "tense":
            feature_markers = self.tense_markers
        elif feature == "determiners":
            feature_markers = self.determiners
        return self.test_for_flexible_order(filter(lambda i: i not in feature_markers, out_sentence_idx),
                                            filter(lambda i: i not in feature_markers, trg_sentence_idx),
                                            ignore_det=False)

    def has_pronoun_error(self, out_sentence_idx, trg_sentence_idx):
        out_pronouns = [idx for idx in out_sentence_idx if idx in self.idx_pronoun]
        trg_pronouns = [idx for idx in trg_sentence_idx if idx in self.idx_pronoun]
        if out_pronouns != trg_pronouns:
            return True
        return False

    def get_code_switched_type(self, out_sentence_idx, trg_sentence_idx, target_lang, top_down_language_activation):
        """ Types of code-switches:
                - intra-sentential (in the middle of the sentence)
                - inter-sentential (full switch at sentence boundaries)
                - extra-sentential (insertion of tag)
                - noun borrowing? (if no determiners were switched)
            Note: Returns FALSE if the message conveyed was not correct
        """
        out_idx = repr(out_sentence_idx)
        cache = self.query_cache(out_idx, self.code_switched_type_cache)
        if not cache:
            # "translate" message into the target language
            translated_sentence_candidates = self.translate_idx_into_monolingual_candidates(out_sentence_idx,
                                                                                            target_lang)
            # check for insertions (cases where only 1 idx is from the other language)
            insertion_type = self.check_for_insertions(out_sentence_idx,
                                                       None if top_down_language_activation else target_lang)
            if insertion_type:
                for translated_sentence_idx in translated_sentence_candidates:  # check translation validity
                    if self.test_for_flexible_order(translated_sentence_idx, trg_sentence_idx):
                        self.code_switched_type_cache[out_idx] = insertion_type
                        return insertion_type
            # Now check for alternational switching - compare with target sentence
            for translated_sentence_idx in translated_sentence_candidates:
                cs_type = self.examine_sentences_for_cs_type(translated_sentence_idx, out_sentence_idx,
                                                             trg_sentence_idx)
                if cs_type:  # if not False no need to look further
                    self.code_switched_type_cache[out_idx] = cs_type
                    return cs_type
            # no CS type found. Either the meaning was incorrect or the produced lang was different than the target one
            cache = False
            self.code_switched_type_cache[out_idx] = cache
        return cache

    def check_for_insertions(self, out_sentence_idx, target_lang):
        non_shared_idx = filter(lambda i: i not in self.shared_idx, out_sentence_idx)
        l2_words = sum(1 for _ in filter(lambda i: i >= self.code_switched_idx, non_shared_idx))
        l1_words = sum(1 for _ in filter(lambda i: i < self.code_switched_idx, non_shared_idx))

        filter_idx = operator.lt if target_lang == self.L2 or l2_words > l1_words else operator.ge
        check_idx = [i for i in non_shared_idx if filter_idx(i, self.code_switched_idx)]

        if target_lang and not check_idx:
            # all words were in the "non-target" language. Doesn't really count as inter-sentential as
            # no language was set at the beginning of the sentence
            return "inter-sentential"

        check_idx_pos = map(self.pos_lookup, check_idx)
        if len(set(check_idx_pos)) == 1:
            return list(check_idx_pos)[0]
        return False

    @staticmethod
    def query_cache(out_idx, cache):
        if out_idx in cache:
            return cache[out_idx]
        return []

    def translate_idx_into_monolingual_candidates(self, out_sentence_idx, trg_lang):
        out_idx = repr(out_sentence_idx)
        cache = self.query_cache(out_idx, self.translation_cache)
        if not cache:
            trans = [self.find_equivalent_translation_idx(idx, trg_lang) for i, idx in enumerate(out_sentence_idx)]
            cache = [list(x for x in tup) for tup in list(itertools.product(*trans))]
            self.translation_cache[out_idx] = cache
        return cache

    def examine_sentences_for_cs_type(self, translated_sentence_idx, out_sentence_idx, trg_sentence_idx):
        if not self.test_for_flexible_order(translated_sentence_idx, trg_sentence_idx):
            return False  # output and translated messages are not (flex-)identical, code-switch has wrong meaning

        check_idx = [w for w in out_sentence_idx if (w not in trg_sentence_idx and w not in self.shared_idx)]
        if len(check_idx) == 0:
            return False  # it was either a cognate or a false friend

        if len(check_idx) == len([w for w in out_sentence_idx if w not in self.shared_idx]):
            return "inter-sentential"  # whole sentence in the non-target language

        # check if sequence is a subset of the sentence (out instead of trg because target is monolingual)
        check_idx_pos = map(self.pos_lookup, check_idx)
        if len(set(check_idx_pos)) > 1 and set(check_idx).issubset(out_sentence_idx):
            cs_type = "alt. (%s)" % list(check_idx_pos)[0]
        else:
            print("No CS detected for: %s %s" % (out_sentence_idx, self.sentence_from_indeces(out_sentence_idx)))
            import sys;sys.exit()
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
        out_idx = repr(sentence_indeces)
        cache = self.query_cache(out_idx, self.switch_points_cache)
        if not cache:
            # FIXME: current assumption: lexicon contains first EN and then ES words
            (at, right_after, after, at_esen, right_after_esen, after_esen, after_anywhere,
             after_anywhere_esen) = (False, False, False, False, False, False, False, False)
            pos_idx = None
            if pos_of_interest in sentence_pos:
                pos_idx = sentence_pos.index(pos_of_interest)
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
            cache = (at, right_after, after, after_anywhere, at_esen, right_after_esen,
                     after_esen, after_anywhere_esen)
            self.switch_points_cache[out_idx] = cache
        return cache

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
        idx = repr((lex_idx, target_lang))
        cache = self.query_cache(idx, self.concept_to_morpheme_cache)
        if not cache:
            current_lang = self.L1 if target_lang == self.L2 else self.L2
            cache = self.df_query_to_idx("morpheme_%s == '%s'" % (current_lang, self.lexicon[lex_idx]),
                                         lang=target_lang)
            self.concept_to_morpheme_cache[idx] = cache
        return cache

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

        df['target_sentence_idx'] = df.target_sentence.apply(self.sentence_indeces)
        df['target_pos'] = df.target_sentence_idx.apply(self.sentence_pos)
        (event_sem_activations, target_lang_act, df['lang'], weights_role_concept,
         df['event_sem_message']) = zp(*df.message.apply(self.get_message_info))
        return df, weights_role_concept, event_sem_activations, target_lang_act

    def read_allowed_pos(self):
        """ returns all (distinct) allowed POS structures in the training file (list of lists) """
        return list(map(list, set(map(tuple, self.trainlines_df.target_pos))))

    @staticmethod
    def correct_auxiliary_phrase(pos):
        if 'verb' in pos and 'participle' in pos:
            pos = list([i.replace('verb', 'aux') for i in pos])
        elif 'aux' in pos and 'verb' in pos:
            pos = list([i.replace('verb', 'participle') for i in pos])
        elif pos.count('verb') == 2:
            p_idx = pos.index('verb')
            pos[p_idx] = 'aux'
            pos[p_idx + 1] = 'participle'
        return pos

    def _read_file_to_list(self, fname):
        """
        :param fname: file name
        :return: Simply reads a file into a list while stripping newlines
        """
        with open(os.path.join(self.directory, fname)) as f:
            lines = [line.rstrip('\n') for line in f]
        return lines

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

    def sentence_pos(self, sentence_idx_lst):
        """
        :param sentence_idx_lst: sentence in list format. Either contains activations in the lexicon for the sentence
        or the words (in that case, convert_to_idx should be set to True)
        :return: returns a list with the POS tags of a sentence
        """
        return self.correct_auxiliary_phrase(list(map(self.pos_lookup, sentence_idx_lst)))

    def get_message_info(self, message):
        """ :param message: string, e.g. "ACTION=CARRY;AGENT=FATHER,DEF;PATIENT=STICK,INDEF
                            E=PAST,PROG" which maps roles (AGENT, PATIENT, ACTION) with concepts and also
                            gives information about the event-semantics (E)
        """
        norm_activation = 1.  # 0.5 ?
        reduced_activation = 0.7  # 0.1-4
        event_sem_activations = torch.zeros(self.event_sem_size)
        event_sem_message = None
        weights_role_concept = self.initialized_weights_role_concept.clone()
        target_lang_activations = torch.zeros(self.num_languages)
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

    def cosine_similarity(self, first_word, second_word):
        """ Cosine similarity between words when using word2vec """
        pass

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


def get_np_mean_and_std_err(x, squared_num_simulations):
    if not isinstance(x, torch.Tensor):
        if len(x) > 1:
            x = np.array(x)
            return x.mean(axis=0), np.true_divide(x.std(axis=0), squared_num_simulations)
        x = torch.tensor(x).float()
    return x.mean(0), torch.div(x.std(0), squared_num_simulations)  # mean of lists (per column), standard error


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
            np_mean, np_std_err = get_np_mean_and_std_err(results_sum[key][set_name],
                                                          squared_num_simulations=math.sqrt(len(valid_results)))
            if np_mean is not False:
                results_sum[key]["%s-std_error" % set_name] = np_std_err
                results_sum[key][set_name] = np_mean
    results_sum['all_cs_types'] = strip_language_info_and_std_err(all_cs_types)
    return results_sum


def strip_language_info_and_std_err(keyword_list):
    return set([re.sub("en-|es-|-cog|-ff|-std_error", "", x) for x in keyword_list])

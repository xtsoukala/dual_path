# -*- coding: utf-8 -*-
import math
from operator import lt, ge, itemgetter
import shutil
from itertools import product, zip_longest
from . import defaultdict, Counter, np, pd, os, torch, zeros, re, subprocess, sys


class InputFormatter:
    def __init__(self, directory, fixed_weights, fixed_weights_identif, language, training_set_name, test_set_name,
                 overt_pronouns, use_semantic_gender, prodrop, use_word_embeddings, monolingual_only,
                 replace_haber_tener, test_haber_frequency, num_training):
        """ This class mostly contains helper functions that set the I/O for the Dual-path model (SRN)."""
        self.monolingual_only = monolingual_only
        self.L1, self.L2 = self.get_l1_and_l2(language)
        self.directory = directory  # folder that contains input files and where the results are saved
        self.root_directory = directory.replace('/input', '/')
        self.identifiability = self._read_file_to_list('identifiability.in')
        self.use_semantic_gender = use_semantic_gender
        if self.use_semantic_gender and 'M' not in self.identifiability:
            self.identifiability += ['M', 'F']
        self.identif_size = len(self.identifiability)
        self.identifiability_idx = dict(zip(self.identifiability, range(self.identif_size)))
        self.lexicon_df = pd.read_csv(os.path.join(self.directory, 'lexicon.csv'), sep=',', header=0)  # 1st line:header
        self.lexicon, self.pos, self.code_switched_idx = self.get_lex_info_and_code_switched_idx()
        self.lexicon_size = len(self.lexicon)
        self.lexicon_index = dict(zip(self.lexicon, range(self.lexicon_size)))
        self.replace_haber_tener = replace_haber_tener
        self.test_haber_frequency = test_haber_frequency
        if use_word_embeddings:
            import word2vec
        self.use_word_embeddings = use_word_embeddings
        self.concepts = list(self.lexicon_df.concept.dropna().unique()) if not use_word_embeddings \
            else word2vec.load('word2vec/text8.bin')
        self.concept_size = len(self.concepts) if not self.use_word_embeddings else self.concepts['dog'].size
        self.concept_idx = dict(zip(self.concepts, range(self.concept_size)))
        self.languages = self._read_file_to_list('target_lang.in')
        self.num_languages = len(self.languages)
        self.language_index = dict(zip(self.languages, range(self.num_languages)))
        self.roles = self._read_file_to_list('roles.in')
        self.roles_size = len(self.roles)
        self.roles_idx = dict(zip(self.roles, range(self.roles_size)))
        self.event_semantics = self._read_file_to_list('event_semantics.in')
        self.event_sem_size = len(self.event_semantics)
        self.event_sem_index = dict(zip(self.event_semantics, range(self.event_sem_size)))
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
        self.period_idx = self.lexicon_index['.']
        self.auxiliary_idx = self.df_query_to_idx("pos == 'aux'")
        self.to_prepositions_idx = self.df_query_to_idx("pos == 'prep'")
        self.haber_idx = self.df_query_to_idx("morpheme_es == 'ha'", lang='es')[0]
        self.tener_idx = self.df_query_to_idx("morpheme_es == 'tiene'", lang='es')[0]
        self.idx_pronoun = self.df_query_to_idx("pos == 'pron'")
        self.determiners = self.df_query_to_idx("pos == 'det'")
        self.tense_markers = self.df_query_to_idx("pos == 'aux' or pos == 'verb_suffix'")
        self.cognate_idx = self.df_query_to_idx("is_cognate == 'Y'", lang='en')
        self.false_friend_idx = self.df_query_to_idx("is_false_friend == 'Y'", lang='en')
        self.shared_idx = set(list([self.period_idx]) + list(self.cognate_idx) + list(self.false_friend_idx))
        self.initialized_weights_role_concept = zeros(self.roles_size, self.concept_size)
        self.initialized_weights_role_identif = zeros(self.roles_size, self.identif_size)
        self.weights_role_concept = {'training': [], 'test': []}
        self.weights_role_identif = {'training': [], 'test': []}
        self.weights_concept_role = {'training': [], 'test': []}
        self.weights_identif_role = {'training': [], 'test': []}
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
                print(f"Will include L2 ({L2}) lexicon")
        return L1, L2

    def update_sets(self, new_directory):
        self.directory = new_directory

        if self.replace_haber_tener:  # call sed to replace training and test files with "tener"
            os.system(f"sed -i -e 's/ ha / tiene /g' {new_directory}/t*.in")
            self.lexicon_df.loc[(self.lexicon_df.pos == 'aux') & (self.lexicon_df.aspect == 'perfect') &
                                (self.lexicon_df.tense == 'present'), 'morpheme_es'] = 'tiene'
        elif self.test_haber_frequency:
            self.make_haber_and_tener_synonyms(new_directory)

        (self.trainlines_df, self.weights_role_concept['training'], self.weights_role_identif['training'],
         self.event_sem_activations['training'], self.target_lang_act['training']) = self.read_set_to_df()
        self.weights_concept_role['training'] = [x.t() for x in self.weights_role_concept['training']]
        self.weights_identif_role['training'] = [x.t() for x in self.weights_role_identif['training']]
        self.num_training = len(self.trainlines_df)
        (self.testlines_df, self.weights_role_concept['test'], self.weights_role_identif['test'],
         self.event_sem_activations['test'], self.target_lang_act['test']) = self.read_set_to_df(test=True)
        self.weights_concept_role['test'] = [x.t() for x in self.weights_role_concept['test']]
        self.weights_identif_role['test'] = [x.t() for x in self.weights_role_identif['test']]
        self.num_test = len(self.testlines_df)
        self.test_sentences_with_pronoun = self._number_of_test_pronouns()
        if not self.allowed_structures:
            self.allowed_structures = self.read_allowed_pos()

    @staticmethod
    def make_haber_and_tener_synonyms(directory):
        fname = f"{directory}/training.in"
        sim = directory.split('/')[-1]
        num = int(subprocess.check_output(f"cat {fname} | grep -w ha | wc -l", shell=True))
        os.system(f"sed -i -e 's/ ha / tiene /g' {fname}")  # convert all "haber" to "tener"
        os.system("awk '{for(i=1;i<=NF;i++){if(x<%s&&$i==\"tiene\"){x++;sub(\"tiene\",\"ha\",$i)}}}1' %s > "
                  "tmp%s && mv tmp%s %s" % (num, fname, sim, sim, fname))

    def has_correct_meaning(self, out_sentence_idx, trg_sentence_idx):
        if out_sentence_idx == trg_sentence_idx:
            return True
        # flexible_order in the monolingual case means that the only difference is the preposition "to"
        if (self.to_prepositions_idx in out_sentence_idx or self.to_prepositions_idx in trg_sentence_idx and
                self.same_unordered_lists(list(filter(lambda i: i not in self.to_prepositions_idx, out_sentence_idx)),
                                          list(filter(lambda i: i not in self.to_prepositions_idx, trg_sentence_idx)))):
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
        if filter(lambda i: i in self.idx_pronoun, out_sentence_idx) != \
                filter(lambda i: i in self.idx_pronoun, trg_sentence_idx):
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
        non_shared_idx = list(filter(lambda i: i not in self.shared_idx, out_sentence_idx))
        l2_words = sum([1 for i in non_shared_idx if i >= self.code_switched_idx])
        l1_words = sum([1 for i in non_shared_idx if i < self.code_switched_idx])
        filter_idx = lt if target_lang == self.L2 or l2_words > l1_words else ge
        check_idx = [i for i in non_shared_idx if filter_idx(i, self.code_switched_idx)]
        if target_lang and not check_idx:
            # all words were in the "non-target" language. Doesn't really count as inter-sentential as
            # no language was set at the beginning of the sentence
            return "inter-sentential"

        check_idx_pos = list(map(self.pos_lookup, check_idx))
        if len(set(check_idx_pos)) == 1:
            return check_idx_pos[0]
        return False

    @staticmethod
    def query_cache(out_idx, cache):
        if out_idx in cache:
            return cache[out_idx]
        return None

    def translate_idx_into_monolingual_candidates(self, out_sentence_idx, trg_lang):
        out_idx = repr(out_sentence_idx)
        cache = self.query_cache(out_idx, self.translation_cache)
        if not cache:
            trans = [self.find_equivalent_translation_idx(idx, trg_lang) for i, idx in enumerate(out_sentence_idx)]
            cache = [list(x for x in tup) for tup in list(product(*trans))]
            self.translation_cache[out_idx] = cache
        return cache

    def examine_sentences_for_cs_type(self, translated_sentence_idx, out_sentence_idx, trg_sentence_idx):
        if not self.test_for_flexible_order(translated_sentence_idx, trg_sentence_idx):
            return False  # output and translated messages are not (flex-)identical, code-switch has wrong meaning
        check_idx = list(filter(lambda i: (i not in trg_sentence_idx and i not in self.shared_idx), out_sentence_idx))
        if len(check_idx) == 0:
            return False  # it was either a cognate or a false friend

        if len(check_idx) == sum(1 for _ in filter(lambda i: i not in self.shared_idx, out_sentence_idx)):
            return "inter-sentential"  # whole sentence in the non-target language

        # check if sequence is a subset of the sentence (out instead of trg because target is monolingual)
        check_idx_pos = list(map(self.pos_lookup, check_idx))
        if len(set(check_idx_pos)) > 1 and set(check_idx).issubset(out_sentence_idx):
            cs_type = f"alt. ({check_idx_pos[0]})"
        else:
            print(f"No CS detected for: {out_sentence_idx} {self.sentence_from_indeces(out_sentence_idx)}")
            sys.exit()
        return cs_type

    def is_code_switched(self, sentence_indeces, target_lang_idx):
        """ This function only checks whether words from different languages were used.
        It doesn't verify the validity of the expressed message """
        # skip indeces that are common in all lang
        clean_sentence = list(filter(lambda i: i not in self.shared_idx, sentence_indeces))
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
        for lang in [self.L1, self.L2]:
            if lang:
                column = self.lexicon_df[[f'morpheme_{lang}', 'pos',
                                          'concept', 'type']].dropna(subset=[f'morpheme_{lang}'])
                pos_list = list(column['pos'])
                for i, item in enumerate(list(column[f'morpheme_{lang}'])):
                    if item not in info['lex']:  # only get unique items. set() would change the order, do this instead
                        info['lex'].append(item)
                        info['pos'].append(pos_list[i])
            info['code_switched_idx'].append(len(info['lex']))
        with open(os.path.join(self.directory, "lexicon.in"), 'w') as f:
            f.writelines('\n'.join(info['lex']))
        return info['lex'], info['pos'], info['code_switched_idx'][0]

    def concept_to_morphemes(self, lex_idx, target_lang):
        idx = repr((lex_idx, target_lang))
        cache = self.query_cache(idx, self.concept_to_morpheme_cache)
        if not cache:
            current_lang = self.L1 if target_lang == self.L2 else self.L2
            cache = self.df_query_to_idx(f"morpheme_{current_lang} == '{self.lexicon[lex_idx]}'", lang=target_lang)
            self.concept_to_morpheme_cache[idx] = cache
        return cache

    def _number_of_test_pronouns(self):
        return sum(self.testlines_df.target_sentence.str.count('(^| )(s)?he '))

    def read_set_to_df(self, test=False):
        set_name = self.testset if test else self.training_set
        df = pd.read_csv(os.path.join(self.directory, set_name), names=['target_sentence', 'message'],
                         sep='##', engine='python')
        df.message = df.message.str.strip()  # strip whitespace
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
        (event_sem_activations, target_lang_act, df['lang'], weights_role_concept, weights_role_identif,
         df['event_sem_message']) = zip_longest(*df.message.apply(self.get_message_info))
        return df, weights_role_concept, weights_role_identif, event_sem_activations, target_lang_act

    def read_allowed_pos(self):
        """ returns all (distinct) allowed POS structures in the training file (list of lists) """
        allowed = list(map(list, set(map(tuple, self.trainlines_df.target_pos))))
        allowed.extend([x[:-1] for x in allowed])
        return allowed

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
        return " ".join(list(itemgetter(*sentence_idx)(self.lexicon)))

    def sentence_indeces(self, sentence):
        """
        :param sentence: intended sentence , e.g., 'the cat walk -s' (will be split into: ['the', 'cat', 'walks'])
        :return: list of activations in the lexicon for the words above (e.g. [0, 4, 33]
        """
        return list(map(self.lexicon_index.__getitem__, sentence.split()))

    def sentence_pos(self, sentence_idx_lst):
        """
        :param sentence_idx_lst: sentence in list format. Either contains activations in the lexicon for the sentence
        or the words (in that case, convert_to_idx should be set to True)
        :return: returns a list with the POS tags of a sentence
        """
        return self.correct_auxiliary_phrase(list(map(self.pos_lookup, sentence_idx_lst)))

    def get_message_info(self, message):
        """ :param message: string, e.g. "ACTION=CARRY;AGENT=FATHER,DEF;PATIENT=STICK,INDEF
                            EVENT-SEM=PAST,PROG" which maps roles (AGENT, PATIENT, ACTION) with concepts and also
                            gives information about the event-semantics (E)
        """
        event_sem_activations = zeros(self.event_sem_size)
        event_sem_message = None
        weights_role_concept = self.initialized_weights_role_concept.clone()
        weights_role_identif = self.initialized_weights_role_identif.clone()
        target_lang_activations = zeros(self.num_languages)
        target_language = None
        if is_not_nan(message):
            activation = 1.
            for info in message.split(';'):
                role, what = info.split("=")
                if role == "EVENT-SEM":  # retrieve activations for the event-sem layer
                    event_sem_message = what
                    for event in what.split(","):
                        if ':' in event:
                            current_event, current_activation = event.split(':')
                            event_sem_activations[self.event_sem_index[current_event]] = float(current_activation)
                        else:
                            event_sem_activations[self.event_sem_index[event]] = activation
                elif role == "TARGET-LANG":
                    if what in self.languages:
                        target_language = what
                        target_lang_activations[self.language_index[what]] = activation
                    elif what == 'enes':
                        target_language = what
                        target_lang_activations = [0.5, 0.5]
                else:
                    # there are usually multiple concepts/identif per role, e.g. (MAN, DEF, EMPH). We want to
                    # activate the bindings with a high value
                    for concept in what.split(","):
                        if concept in self.identifiability:
                            weights_role_identif[self.roles_idx[role]][self.identifiability_idx[concept]] = \
                                self.fixed_identif
                        elif concept in self.concepts:
                            weights_role_concept[self.roles_idx[role]][self.concept_idx[concept]] = self.fixed_weights
                        elif concept not in ['COG', 'FF']:
                            sys.exit(f"No concept found: {concept} ({message})")
        return (event_sem_activations, target_lang_activations, target_language, weights_role_concept,
                weights_role_identif, event_sem_message)

    def cosine_similarity(self, first_word, second_word):
        """ Cosine similarity between words when using word2vec """
        pass

    def df_query_to_idx(self, query, lang=None):
        if lang:
            languages = [f'morpheme_{lang}']
        else:
            languages = ['morpheme_en', 'morpheme_es']
        q = self.lexicon_df.query(query)[languages].values.ravel()
        return list(self.lexicon_index[x] for x in list(q) if is_not_nan(x))

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


def copy_files(src, dest, ends_with=None):
    os.makedirs(dest)
    for filename in os.listdir(src):
        if not ends_with or (ends_with and filename.endswith(ends_with)):
            shutil.copyfile(os.path.join(src, filename), os.path.join(dest, filename))


def get_np_mean_and_std_err(x, squared_num_simulations):
    """if not isinstance(x, torch.Tensor):
        if len(x) > 1:
            x = np.array(x)
            return x.mean(axis=0), np.true_divide(x.std(axis=0), squared_num_simulations)
        x = torch.tensor(x).float()
    return x.mean(0), torch.div(x.std(0), squared_num_simulations)  # mean of lists (per column), standard error"""
    if not isinstance(x, np.ndarray):
        x = np.array(x)
        squared_num_simulations = np.array(squared_num_simulations)
    return x.mean(axis=0), x.std(axis=0) / squared_num_simulations


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
                    if key in simulation:
                        results_sum[key][set_name].append(simulation[key][set_name][:epochs])
                    else:
                        results_sum[key][set_name].append([0] * epochs)
    # now compute MEAN and STANDARD ERROR of all simulations
    for key in results_sum.keys():
        for set_name in evaluated_sets:
            np_mean, np_std_err = get_np_mean_and_std_err(results_sum[key][set_name],
                                                          squared_num_simulations=math.sqrt(len(valid_results)))
            if np_mean is not False:
                results_sum[key][f"{set_name}-std_error"] = np_std_err
                results_sum[key][set_name] = np_mean
    results_sum['all_cs_types'] = strip_language_info_and_std_err(all_cs_types)
    return results_sum


def training_is_successful(x, threshold, num_test):
    return torch.div(x[-1] * 100, num_test) >= threshold


def strip_language_info_and_std_err(keyword_list):
    return set([re.sub("en-|es-|-cog|-ff|-std_error", "", x) for x in keyword_list])

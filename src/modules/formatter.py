# -*- coding: utf-8 -*-
from operator import lt, ge, itemgetter
import shutil
from itertools import product, zip_longest
from . import defaultdict, Counter, pd, os, torch, zeros, subprocess, sys


class InputFormatter:
    def __init__(self, directory, fixed_weights, fixed_weights_identif, language, training_set_name, test_set_name,
                 overt_pronouns, use_semantic_gender, prodrop, use_word_embeddings, replace_haber_tener,
                 test_haber_frequency, num_training, messageless_decimal_fraction, auxiliary_experiment,
                 cognate_experiment):
        """ This class mostly contains helper functions that set the I/O for the Dual-path model (SRN)."""
        self.L = self.get_languages_with_idx(language)
        self.directory = directory  # folder that contains input files and where the results are saved
        self.root_directory = directory.replace('/input', '/')
        self.target_lang = self._read_file_to_list('target_lang.in')
        self.identifiability = self._read_file_to_list('identifiability.in')
        self.use_semantic_gender = use_semantic_gender
        if self.use_semantic_gender and 'M' not in self.identifiability:
            self.identifiability += ['M', 'F']
        self.identif_size = len(self.identifiability)
        self.identifiability_idx = dict(zip(self.identifiability, range(self.identif_size)))
        self.num_languages = len(self.target_lang)
        self.language_index = dict(zip(self.target_lang, range(self.num_languages)))
        self.lexicon_df = pd.read_csv(os.path.join(self.directory, 'lexicon.csv'), sep=',', header=0)  # 1st line:header
        self.lexicon, self.pos, self.code_switched_idx = self.get_lex_info_and_code_switched_idx()
        self.lexicon_size = len(self.lexicon)
        self.lexicon_index = dict(zip(self.lexicon, range(self.lexicon_size)))
        self.replace_haber_tener = replace_haber_tener
        self.test_haber_frequency = test_haber_frequency
        self.messageless_decimal_fraction = messageless_decimal_fraction
        if use_word_embeddings:
            import word2vec
        self.use_word_embeddings = use_word_embeddings
        self.concepts = list(self.lexicon_df.concept.dropna().unique()) if not use_word_embeddings \
            else word2vec.load('word2vec/text8.bin')
        self.concept_size = len(self.concepts) if not self.use_word_embeddings else self.concepts['dog'].size
        self.concept_idx = dict(zip(self.concepts, range(self.concept_size)))
        self.roles = self._read_file_to_list('roles.in')
        self.roles_size = len(self.roles)
        self.roles_idx = dict(zip(self.roles, range(self.roles_size)))
        self.event_semantics = self._read_file_to_list('event_semantics.in')
        self.event_sem_size = len(self.event_semantics)
        self.event_sem_index = dict(zip(self.event_semantics, range(self.event_sem_size)))
        self.prodrop = prodrop
        self.emphasis_decimal_fraction = overt_pronouns
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
        self.haber_idx = self.df_query_to_idx("morpheme_es == 'ha'", lang='es')[0] if auxiliary_experiment else []
        self.tener_idx = self.df_query_to_idx("morpheme_es == 'tiene'", lang='es')[0] if auxiliary_experiment else []
        self.idx_pronoun = self.df_query_to_idx("pos == 'pron'")
        self.determiners = self.df_query_to_idx("pos == 'det'")
        self.tense_markers = self.df_query_to_idx("pos == 'aux' or pos == 'verb_suffix'")
        self.cognate_idx = self.df_query_to_idx("is_cognate == 'Y'", lang=self.L[1]) if cognate_experiment else []
        self.false_friend_idx = (self.df_query_to_idx("is_false_friend == 'Y'", lang=self.L[1])
                                 if cognate_experiment else [])
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

    def get_languages_with_idx(self, languages):
        return {k + 1: v for k, v in enumerate(languages)}

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
        
        if self.messageless_decimal_fraction:
            # Create a backup of training data with all messages
            os.system(f"mv {new_directory}/training.in {new_directory}/training_full.in")
            # Remove messages from randomly sampled fraction of sentences in training set
            messageless_indices = self.trainlines_df.sample(frac=self.messageless_decimal_fraction).index.values    
            self.trainlines_df.loc[messageless_indices,'message'] = ''
            # Can't use df.to_csv, because separater must be a 1-character string
            with open(f'{new_directory}/training.in', 'w') as f:
                for row in list(zip(self.trainlines_df['target_sentence'], self.trainlines_df['message'])):
                    f.write(f'{row[0]}## {row[1]}\n')
        
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

                if p_idx and out_sentence_idx[p_idx] < self.code_switched_idx:  # FIXME assumption: L1 English in lex
                    if self.same_unordered_lists(out_sentence_pos + ['prep'], trg_sentence_pos):
                        return is_grammatical, has_flex_order
        return not is_grammatical, not has_flex_order

    def test_for_flexible_order(self, out_sentence_idx, trg_sentence_idx, ignore_det=False):
        """
        :param out_sentence_idx:
        :param trg_sentence_idx:
        :param ignore_det: Whether to count article definiteness (a/the) and gender (e.g., la, el) as a mistake
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

    def get_code_switched_type(self, out_sentence_idx, out_pos, trg_sentence_idx, target_lang,
                               top_down_language_activation):
        """ Types of code-switches:
                - alternational (in the middle of the sentence)
                - insertional (insertion of single words)
                - inter-sentential (full switch at sentence boundaries)
            Note: Returns FALSE if the message conveyed was not correct
        """
        out_idx = repr(out_sentence_idx)
        cache = self.query_cache(out_idx, self.code_switched_type_cache)
        if not cache:
            # "translate" message into the target language
            translated_sentence_candidates = self.translate_idx_into_monolingual_candidates(out_sentence_idx,
                                                                                            target_lang)
            # check for insertions (cases where only 1 idx is from the other language)
            switch_type, switch_pos = self.check_for_insertions(out_sentence_idx, out_pos,
                                                                None if top_down_language_activation else target_lang)
            if switch_type:
                for translated_sentence_idx in translated_sentence_candidates:  # check translation validity
                    if self.test_for_flexible_order(translated_sentence_idx, trg_sentence_idx):
                        cache = switch_type, switch_pos
                        self.code_switched_type_cache[out_idx] = cache
                        return cache
            # Now check for alternational switching - compare with target sentence
            for translated_sentence_idx in translated_sentence_candidates:
                switch_pos = self.examine_sentences_for_cs_type(translated_sentence_idx, out_sentence_idx, out_pos,
                                                                trg_sentence_idx)
                if switch_pos:  # if not False no need to look further
                    cache = "alternational", switch_pos
                    self.code_switched_type_cache[out_idx] = cache
                    return cache
            # no CS type found. Either the meaning was incorrect or the produced lang was different than the target one
            cache = False, False
            self.code_switched_type_cache[out_idx] = cache
        return cache

    def check_for_insertions(self, out_sentence_idx, out_pos, target_lang):
        is_from_lang_filter = {'en': lt, 'es': ge}
        non_shared_idx = list(filter(lambda i: i not in self.shared_idx, out_sentence_idx))
        l2_words = sum([1 for i in non_shared_idx if i >= self.code_switched_idx])
        l1_words = sum([1 for i in non_shared_idx if i < self.code_switched_idx])
        if (((target_lang == self.L[1] and l1_words == 1 and l2_words > 1) or
             (target_lang == self.L[2] and l2_words == 1 and l1_words > 1)) and
                is_from_lang_filter[target_lang](out_sentence_idx[0], self.code_switched_idx)):
            return "alternational", out_pos[1]

        check_idx = [i for i in non_shared_idx if not is_from_lang_filter[target_lang](i, self.code_switched_idx)]
        if target_lang and (not check_idx or check_idx == non_shared_idx):
            # all words were in the "non-target" language. It doesn't really count as inter-sentential as
            # no language was set at the beginning of the sentence
            return "inter-sentential", False

        check_idx_pos = self.map_to_sentence_pos(check_idx, out_sentence_idx, out_pos)
        if len(set(check_idx_pos)) == 1:
            pos = check_idx_pos[0]
            if check_idx[0] == out_sentence_idx[-2]:
                return "ambiguous", pos    # if last word: it could be either an alternation or an insertion
            else:
                return "insertional", pos
        return False, False

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

    def examine_sentences_for_cs_type(self, translated_sentence_idx, out_sentence_idx, out_pos, trg_sentence_idx):
        if not self.test_for_flexible_order(translated_sentence_idx, trg_sentence_idx):
            return False  # output and translated messages are not (flex-)identical, code-switch has wrong meaning
        check_idx = list(filter(lambda i: (i not in trg_sentence_idx and i not in self.shared_idx), out_sentence_idx))
        if len(check_idx) == 0:
            return False  # it was either a cognate or a false friend

        # check if sequence is a subset of the sentence (out instead of trg because target is monolingual)
        starting_switch_point = self.map_to_sentence_pos(check_idx, out_sentence_idx, out_pos)
        if len(set(starting_switch_point)) > 0 and set(check_idx).issubset(out_sentence_idx):
            return starting_switch_point[0]
        sys.exit(f"No CS detected for: {out_sentence_idx} {self.sentence_from_indices(out_sentence_idx)}")

    def is_code_switched(self, sentence_indices, target_lang_idx):
        """ This function only checks whether words from different languages were used.
        It doesn't verify the validity of the expressed message """
        # skip indices that are common in all lang
        clean_sentence = list(filter(lambda i: i not in self.shared_idx, sentence_indices))
        if not clean_sentence:
            return False  # empty sentence
        min_and_max_idx = get_minimum_and_maximum_idx(clean_sentence)
        if ((all(x >= self.code_switched_idx for x in min_and_max_idx) or
             all(x < self.code_switched_idx for x in min_and_max_idx))
                and self.morpheme_is_from_target_lang(clean_sentence[0], target_lang_idx)):
            return False
        return True

    def check_cs_around_pos_of_interest(self, sentence_indices, sentence_pos, pos_of_interest='aux'):
        out_idx = repr(sentence_indices)
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
                at = self.is_code_switched(sentence_indices[:pos_idx + 1], target_lang_idx=sentence_indices[0])
                # check Spanish-to-English direction
                at_esen = True if at and sentence_indices[pos_idx] >= self.code_switched_idx else False
                # check switch right after (e.g. between aux and participle)
                right_after = self.is_code_switched(sentence_indices[pos_idx:pos_idx + 2],
                                                    target_lang_idx=sentence_indices[pos_idx])
                right_after_esen = (True if right_after and sentence_indices[pos_idx] < self.code_switched_idx
                                    else False)
                # check switch at the end (e.g. after aux and participle)
                after = self.is_code_switched(sentence_indices[pos_idx + 1:pos_idx + 3],
                                              target_lang_idx=sentence_indices[pos_idx + 1])
                after_esen = True if after and sentence_indices[pos_idx + 1] < self.code_switched_idx else False

                after_anywhere = self.is_code_switched(sentence_indices[pos_idx + 1:],
                                                       target_lang_idx=sentence_indices[pos_idx + 1])
                after_anywhere_esen = (True if after_anywhere and sentence_indices[pos_idx + 1] < self.code_switched_idx
                                       else False)
            cache = (at, right_after, after, after_anywhere, at_esen, right_after_esen,
                     after_esen, after_anywhere_esen)
            self.switch_points_cache[out_idx] = cache
        return cache

    def morpheme_is_from_target_lang(self, morpheme_idx, target_idx):
        """
        Assumption: this doesn't check for shared indices (period/congates) because they have already been stripped
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
        for lang in self.target_lang:
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
            current_lang = self.L[1] if target_lang == self.L[2] else self.L[2]
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
            if self.emphasis_decimal_fraction > 0:  # keep pronoun if emphasized
                # find num of lines that are in ES. decide on num that will be emphasized:
                number_emphasized = len([]) * self.emphasis_decimal_fraction  # replace('AGENT=', 'AGENT=EMPH,')
            else:
                df.line = df.line.str.replace('(^| )(él|ella) ', ' ', regex=True)
        # elif not self.emphasis: lines = [re.sub(r',EMPH', '', sentence) for sentence in lines]

        if not self.use_semantic_gender:
            df.message = df.message.str.replace(',(M|F);', ';', regex=True)

        df['target_sentence_idx'] = df.target_sentence.apply(self.sentence_indices)
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
    def correct_participle_and_adverb(pos):
        if 'participle' in pos and 'verb' in pos:
            pos = list([i.replace('verb', 'aux') for i in pos])
        elif 'aux' in pos and 'verb' in pos:
            pos = list([i.replace('verb', 'participle') for i in pos])
        elif sublist_in_list(['verb', 'verb'], pos):
            p_idx = pos.index('verb')
            pos[p_idx] = 'aux'
            pos[p_idx + 1] = 'participle'
        elif sublist_in_list(['verb', 'adj'], pos):
            p_idx = pos.index('verb')
            pos[p_idx + 1] = 'adverb'
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

    @staticmethod
    def map_to_sentence_pos(word_idx_list, sentence_idx, sentence_pos):
        idx = [sentence_idx.index(v) for v in word_idx_list]
        return list(map(lambda x: sentence_pos[x], idx))

    def sentence_from_indices(self, sentence_idx):
        """
        :param sentence_idx: list with sentence indices
        :return: converts a list of idx into a sentence (string of words)
        """
        return " ".join(list(itemgetter(*sentence_idx)(self.lexicon)))

    def sentence_indices(self, sentence):
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
        return self.correct_participle_and_adverb(list(map(self.pos_lookup, sentence_idx_lst)))

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
                    if what in self.target_lang:
                        target_language = what
                        target_lang_activations[self.language_index[what]] = activation
                    elif len(what) > 2:
                        target_language = what
                        print('Target lang:', target_language)
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

    def df_query_to_idx(self, query, lang=None):
        if lang:
            languages = [f'morpheme_{lang}']
        else:
            languages = [f'morpheme_{lang}' for lang in self.target_lang]
        q = self.lexicon_df.query(query)[languages].values.ravel()
        return list(self.lexicon_index[x] for x in list(q) if is_not_nan(x))

    def find_equivalent_translation_idx(self, idx, lang):
        # ignore shared indices (cognates/period)
        if (idx not in self.shared_idx and ((idx >= self.code_switched_idx and lang == self.L[1]) or
                                            (lang == self.L[2] and idx < self.code_switched_idx))):
            return self.concept_to_morphemes(lex_idx=idx, target_lang=lang)
        return [idx]


def get_minimum_and_maximum_idx(clean_sentence):
    return min(clean_sentence), max(clean_sentence)  # set with 2 indices, min and max


def sublist_in_list(sublist, main):
    return sublist in [main[i:len(sublist) + i] for i in range(len(main))]


def is_not_nan(x):
    if x == x:
        return True
    return False


def copy_files(src, dest, ends_with=None):
    os.makedirs(dest)
    for filename in os.listdir(src):
        if not ends_with or (ends_with and filename.endswith(ends_with)):
            shutil.copyfile(os.path.join(src, filename), os.path.join(dest, filename))


def training_is_successful(x, threshold, num_test):
    return torch.div(x[-1] * 100, num_test) >= threshold

# -*- coding: utf-8 -*-
from operator import lt, ge, itemgetter
import shutil
from itertools import product, zip_longest
from . import defaultdict, Counter, pd, np, os, zeros, subprocess, sys, logging


class InputFormatter:
    def __init__(self, directory, fixed_weights, fixed_weights_identif, language, training_set_name, test_set_name,
                 overt_pronouns, use_semantic_gender, prodrop, use_word_embeddings, replace_haber_tener,
                 test_haber_frequency, num_training, messageless_decimal_fraction, auxiliary_experiment,
                 cognate_list, false_friends_lexicon, concepts_to_evaluate, determinerpronoun, priming_experiment,
                 priming_set):
        """ This class mostly contains helper functions that set the I/O for the Dual-path model (SRN)."""
        self.L = self.get_languages_with_idx(language)
        self.directory = directory  # folder that contains input files and where the results are saved
        self.root_directory = directory.replace('/input', '/')
        self.target_lang = self._read_file_to_list('target_lang.in')
        self.identifiability = self._read_file_to_list('identifiability.in') if not determinerpronoun else ['defpro']
        self.determinerpronoun = determinerpronoun
        self.use_semantic_gender = use_semantic_gender
        if self.use_semantic_gender and 'M' not in self.identifiability:
            self.identifiability += ['M', 'F']
        self.identif_size = len(self.identifiability)
        self.identifiability_idx = dict(zip(self.identifiability, range(self.identif_size)))
        self.num_languages = len(self.target_lang)
        self.language_index = dict(zip(self.target_lang, range(self.num_languages)))
        self.lexicon_df = pd.read_csv(os.path.join(self.directory, 'lexicon.csv'), sep=',', header=0)  # 1st line:header
        self.cognate_list = cognate_list
        if cognate_list:
            self.lexicon_df.loc[:, 'is_cognate'] = False  # reset any preexisting cognates
            self.lexicon_df.loc[self.lexicon_df.concept.isin(cognate_list), 'is_cognate'] = True
            with open(f'{self.directory}/cognates.in', 'w', encoding='utf-8') as f:
                f.write("%s" % "\n".join(cognate_list))

        self.lexicon, self.pos, self.lang_indices = self.get_lexicon_and_lang_info()
        self.lexicon_size = len(self.lexicon)
        self.lexicon_index = dict(zip(self.lexicon, range(self.lexicon_size)))

        self.false_friends_replacement_dict = None
        if false_friends_lexicon:
            if f'{self.directory}/false_friends_lexicon.csv' != false_friends_lexicon:  # only copy if it's new
                shutil.copyfile(false_friends_lexicon, os.path.join(self.directory, "false_friends_lexicon.csv"))
            original_form = []
            false_friends_form = []
            ff_lexicon = pd.read_csv(false_friends_lexicon)
            ff_word = ff_lexicon.loc[ff_lexicon.is_false_friend == True, 'morpheme_en'].unique()
            for concept in ff_lexicon.loc[ff_lexicon.morpheme_es.isin(ff_word), 'concept']:
                original_form.append(self.lexicon_df.loc[self.lexicon_df.concept == concept, 'morpheme_es'].iloc[0])
                false_friends_form.append(ff_lexicon.loc[ff_lexicon.concept == concept,
                                                         'morpheme_es'].iloc[0])
            d = dict(zip(original_form, false_friends_form))
            self.false_friends_replacement_dict = {r'\b{}\b'.format(k): v for k, v in d.items()}  # add word boundaries
            self.lexicon_df = pd.read_csv(false_friends_lexicon)
        self.concepts_to_evaluate = None
        if concepts_to_evaluate:
            self.concepts_to_evaluate = self.df_query_to_idx(f"concept.isin({concepts_to_evaluate})")
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
        self.idx_points_cache = {}
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
        self.cognate_idx = self.df_query_to_idx("is_cognate == True", lang=self.L[1])
        self.false_friend_idx = self.df_query_to_idx("is_false_friend == True", lang=self.L[1])
        if 2 in self.L:
            for i in list(self.cognate_idx) + list(self.false_friend_idx):  # update lang_id: append Spanish as well
                self.lang_indices[i].append(self.L[2])

        logging.debug(self.false_friend_idx)
        self.shared_idx = set(list([self.period_idx]) + list(self.cognate_idx) + list(self.false_friend_idx))
        self.shared_idx_no_false_friends = set(list([self.period_idx]) + list(self.cognate_idx))
        self.initialized_weights_role_concept = zeros(self.roles_size, self.concept_size)
        self.initialized_weights_role_identif = zeros(self.roles_size, self.identif_size)
        self.weights_role_concept = {'training': [], 'test': []}
        self.weights_role_identif = {'training': [], 'test': []}
        self.weights_concept_role = {'training': [], 'test': []}
        self.weights_identif_role = {'training': [], 'test': []}
        self.event_sem_activations = {'training': [], 'test': []}
        self.target_lang_act = {'training': [], 'test': []}
        self.training_set = training_set_name  # default: training.in
        self.testset = test_set_name  # default: test.in
        self.num_training = num_training
        self.trainlines_df, self.allowed_structures, self.num_test = None, None, None
        self.testlines_df, self.test_sentences_with_pronoun = None, None
        self.same_unordered_lists = lambda x, y: Counter(x) == Counter(y)
        self.priming_experiment = priming_experiment
        self.priming_set = priming_set

    def get_languages_with_idx(self, languages):
        return {k + 1: v for k, v in enumerate(languages)}

    def update_sets(self, new_directory):
        self.directory = new_directory

        if self.determinerpronoun:
            os.system(f"sed -i -e 's/=indef,/=defpro:0.33,/g' {new_directory}/t*.in")
            os.system(f"sed -i -e 's/=def,/=defpro:0.66,/g' {new_directory}/t*.in")
            os.system(f"sed -i -e 's/=pron,/=defpro,/g' {new_directory}/t*.in")

        if self.replace_haber_tener:  # call sed to replace training and test files with "tener"
            os.system(f"sed -i -e 's/ ha / tiene /g' {new_directory}/t*.in")
            self.lexicon_df.loc[(self.lexicon_df.pos == 'aux') & (self.lexicon_df.aspect == 'perfect') &
                                (self.lexicon_df.tense == 'present'), 'morpheme_es'] = 'tiene'
        elif self.test_haber_frequency:
            self.make_haber_and_tener_synonyms(new_directory)

        if os.path.exists(os.path.join(self.directory, self.training_set)):
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
            os.system(f"mv {new_directory}/{self.training_set} {new_directory}/training_full.in")
            # Remove messages from randomly sampled fraction of sentences in training set
            messageless_indices = self.trainlines_df.sample(frac=self.messageless_decimal_fraction).index.values
            self.trainlines_df.loc[messageless_indices, 'message'] = ''
            # Can't use df.to_csv, because separater must be a 1-character string
            with open(f'{new_directory}/{self.training_set}', 'w', encoding='utf-8') as f:
                for row in list(zip(self.trainlines_df['target_sentence'], self.trainlines_df['message'])):
                    f.write(f'{row[0]}## {row[1]}\n')

        self.num_test = len(self.testlines_df)
        self.test_sentences_with_pronoun = self._number_of_test_pronouns()
        if not self.allowed_structures:
            self.allowed_structures = self.read_allowed_pos()

    @staticmethod
    def make_haber_and_tener_synonyms(directory):
        fname = f"{directory}/{self.training_set}"
        sim = directory.split('/')[-1]
        num = int(subprocess.check_output(f"cat {fname} | grep -w ha | wc -l", shell=True))
        os.system(f"sed -i -e 's/ ha / tiene /g' {fname}")  # convert all "haber" to "tener"
        os.system("awk '{for(i=1;i<=NF;i++){if(x<%s&&$i==\"tiene\"){x++;sub(\"tiene\",\"ha\",$i)}}}1' %s > "
                  "tmp%s && mv tmp%s %s" % (num, fname, sim, sim, fname))

    def has_correct_meaning(self, out_sentence_idx, trg_sentence_idx):
        if out_sentence_idx == trg_sentence_idx:
            return True

        if self.same_unordered_lists(out_sentence_idx, trg_sentence_idx):
            return True  # flexible order

        # otherwise check whether the only difference is the preposition "to"
        if ((set(out_sentence_idx).intersection(self.to_prepositions_idx) or
             set(trg_sentence_idx).intersection(self.to_prepositions_idx)) and
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

                if p_idx and self.lang_indices[out_sentence_idx[p_idx]] == 'en':
                    if self.same_unordered_lists(out_sentence_pos + ['prep'], trg_sentence_pos):
                        return is_grammatical, has_flex_order
        return not is_grammatical, not has_flex_order

    def test_for_flexible_order(self, out_sentence_idx, trg_sentence_idx, ignore_det=False,
                                num_subject_positions_to_test_separately=0):
        """
        :param out_sentence_idx:
        :param trg_sentence_idx:
        :param ignore_det: Whether to count article definiteness (a/the) and gender (e.g., la, el) as a mistake
        :param num_subject_positions_to_test_separately: When scrumbling the sentence position, the model may produce
        the subject position at the end, which changes the meaning (e.g., "the son throws the key to a woman" instead of
        "the woman throws the key to the son"). We need to restrict this by checking the subject position separately.
        :return: if produced sentence was not identical to the target one, check if the meaning was correct but
        expressed with a different syntactic structure (due to, e.g., priming)
        """
        flexible_order = False
        ignore_idx = self.to_prepositions_idx
        if ignore_det:
            ignore_idx.extend(self.determiners)
        if (num_subject_positions_to_test_separately and
                len(trg_sentence_idx) > num_subject_positions_to_test_separately):
            subject_trg = trg_sentence_idx[:num_subject_positions_to_test_separately]
            subject_out = out_sentence_idx[:num_subject_positions_to_test_separately]
            correct_subject_position = self.same_unordered_lists(filter(lambda i: i not in ignore_idx, subject_out),
                                                                 filter(lambda i: i not in ignore_idx, subject_trg))
            trg_sentence_idx = trg_sentence_idx[num_subject_positions_to_test_separately:]
            out_sentence_idx = out_sentence_idx[num_subject_positions_to_test_separately:]
        else:
            correct_subject_position = True
        if (correct_subject_position and
                self.same_unordered_lists(filter(lambda i: i not in ignore_idx, out_sentence_idx),
                                          filter(lambda i: i not in ignore_idx, trg_sentence_idx))):
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
                                                                                            trg_sentence_idx,
                                                                                            target_lang)
            # check for insertions (cases where only 1 idx is from the other language)
            switch_type, switch_pos = self.check_for_switch_types(out_sentence_idx, out_pos, trg_sentence_idx,
                                                                  None if top_down_language_activation else target_lang)
            if switch_type:
                for translated_sentence_idx in translated_sentence_candidates:  # check translation validity
                    if self.test_for_flexible_order(translated_sentence_idx, trg_sentence_idx,
                                                    num_subject_positions_to_test_separately=(1 if 'pron' in out_pos
                                                    else 3 if 'adj' in out_pos else 2)):
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

    def check_for_switch_types(self, out_sentence_idx, out_pos, trg_sentence_idx, target_lang):
        shared_idx = list(filter(lambda i: i in trg_sentence_idx, out_sentence_idx))
        # Check if switch is after the first word:
        if shared_idx == out_sentence_idx[0]:
            return "alternational", out_pos[1]
        non_shared_idx = list(filter(lambda i: i not in trg_sentence_idx, out_sentence_idx))
        check_idx = [i for i in non_shared_idx if (i in self.false_friend_idx or
                                                   target_lang not in self.lang_indices[i])]
        if target_lang and (not check_idx or check_idx == [i for i in out_sentence_idx if i not in self.shared_idx]):
            # all words were in the "non-target" language. It doesn't really count as inter-sentential as
            # no language was set at the beginning of the sentence
            return "inter-sentential", False

        check_idx_pos = self.map_to_sentence_pos(check_idx, out_sentence_idx, out_pos)
        if len(set(check_idx_pos)) == 1:
            pos = check_idx_pos[0]
            if check_idx[0] == out_sentence_idx[-2]:
                return "ambiguous", pos  # if last word: it could be either an alternation or an insertion
            else:
                return "insertional", pos
        return False, False

    @staticmethod
    def query_cache(out_idx, cache):
        if out_idx in cache:
            return cache[out_idx]
        return None

    def translate_idx_into_monolingual_candidates(self, out_sentence_idx, trg_sentence_idx, trg_lang):
        # FIXME: This translates a sentence word-by-word. It only works if the syntactic structures can be aligned.
        # For instance, "a busy uncle" will be translated as "un ocupado tío", not "un tío ocupado". Create rules?
        out_idx = repr(out_sentence_idx)
        cache = self.query_cache(out_idx, self.translation_cache)
        if not cache:
            trans = [self.find_equivalent_translation_idx(idx, trg_sentence_idx, trg_lang)
                     for idx in out_sentence_idx]
            cache = [list(x for x in tup) for tup in list(product(*trans))]
            self.translation_cache[out_idx] = cache
        return cache

    def examine_sentences_for_cs_type(self, translated_sentence_idx, out_sentence_idx, out_pos, trg_sentence_idx):
        if not self.test_for_flexible_order(translated_sentence_idx, trg_sentence_idx,
                                            num_subject_positions_to_test_separately=(1 if 'pron' in out_pos else
                                            3 if 'adj' in out_pos else 2)):
            return False  # output and translated messages are not (flex-)identical, code-switch has wrong meaning
        check_idx = list(filter(lambda i: (i not in trg_sentence_idx and i not in self.shared_idx_no_false_friends),
                                out_sentence_idx))
        if len(check_idx) == 0:
            return False  # it was a cognate

        # check if sequence is a subset of the sentence (out instead of trg because target is monolingual)
        starting_switch_point = self.map_to_sentence_pos(check_idx, out_sentence_idx, out_pos)
        if len(set(starting_switch_point)) > 0 and set(check_idx).issubset(out_sentence_idx):
            return starting_switch_point[0]
        sys.exit(f"No CS detected for: {out_sentence_idx} {self.sentence_from_indices(out_sentence_idx)}")

    def is_code_switched(self, sentence_idx, target_lang, target_sentence_idx=(),
                         return_position=False, srn_only=False):
        """ This function only checks whether words from different languages were used.
            It doesn't verify the validity of the expressed message """
        first_cs_position = None
        if sentence_idx == target_sentence_idx:
            return False, first_cs_position
        # false_friend = set([x for x in sentence_idx if x not in target_sentence_idx]
        #                   ).intersection(self.false_friend_idx) if self.false_friend_idx else None
        sentence_lang = self.sentence_lang_from_indices(sentence_idx)
        num_in_target_lang = sum(x.count(target_lang) for x in sentence_lang)
        if num_in_target_lang < len(sentence_idx):  # this indicates that there are words in the other language
            if return_position:
                for x in sentence_lang:
                    if target_lang not in x:
                        first_cs_position = sentence_lang.index(x)
                        break
            return True if not srn_only else False, first_cs_position
        return False, first_cs_position

    def check_cs_around_pos_of_interest(self, sentence_indices, sentence_pos, pos_of_interest='aux'):
        out_idx = repr(sentence_indices)
        cache = self.query_cache(out_idx, self.switch_points_cache)
        if not cache:
            (at, right_after, after, at_esen, right_after_esen, after_esen, after_anywhere,
             after_anywhere_esen) = (False, False, False, False, False, False, False, False)
            pos_idx = None
            if pos_of_interest in sentence_pos:
                pos_idx = sentence_pos.index(pos_of_interest)
            if pos_idx:
                # check switch before pos_of_interest   # FIXME: check if target_lang is the intended one
                at, point = self.is_code_switched(sentence_indices[:pos_idx + 1],
                                                  target_lang=self.lang_indices[sentence_indices[0]])
                # check Spanish-to-English direction
                at_esen = True if at and self.lang_indices[sentence_indices[pos_idx + 1]] == 'en' else False
                # check switch right after (e.g. between aux and participle)
                right_after, point = self.is_code_switched(sentence_indices[pos_idx:pos_idx + 2],
                                                           target_lang=self.lang_indices[sentence_indices[pos_idx]])
                right_after_esen = (True if right_after and self.lang_indices[sentence_indices[pos_idx]] == 'en'
                                    else False)
                # check switch at the end (e.g. after aux and participle)
                after, point = self.is_code_switched(sentence_indices[pos_idx + 1:pos_idx + 3],
                                                     target_lang=self.lang_indices[sentence_indices[pos_idx + 1]])
                after_esen = True if after and self.lang_indices[sentence_indices[pos_idx + 1]] == 'en' else False

                after_anywhere, point = self.is_code_switched(sentence_indices[pos_idx + 1:],
                                                              target_lang=self.lang_indices[
                                                                  sentence_indices[pos_idx + 1]])
                after_anywhere_esen = (True if (after_anywhere and
                                                self.lang_indices[sentence_indices[pos_idx + 1]] == 'en') else False)
            cache = (at, right_after, after, after_anywhere, at_esen, right_after_esen,
                     after_esen, after_anywhere_esen)
            self.switch_points_cache[out_idx] = cache
        return cache

    def check_cs_around_idx_of_interest(self, sentence_indices, idx_of_interest, target_lang, target_sentence_idx):
        out_idx = repr(sentence_indices)
        cache = self.query_cache(out_idx, self.idx_points_cache)
        if not cache:
            # FIXME: current assumption: lexicon contains first EN and then ES words
            (switched_before, switched_at, switched_right_after, switched_one_after, switched_after_anywhere,
             switched_before_es_en, switched_at_es_en, switched_right_after_es_en, switched_one_after_es_en,
             switched_after_anywhere_es_en,
             point_of_interest_produced_last) = (False, False, False, False, False,
                                                 False, False, False, False, False, False)
            target_idx = sentence_indices.index(idx_of_interest)
            switched_before, point = self.is_code_switched(sentence_indices[:target_idx], target_lang=target_lang,
                                                           target_sentence_idx=target_sentence_idx)
            logging.debug(f'switched before: {self.sentence_from_indices(sentence_indices[:target_idx])} '
                          f'{switched_before}')
            switched_before_es_en = True if switched_before and target_lang == 'es' else False
            switched_at = idx_of_interest not in target_sentence_idx
            logging.debug(f'switched at: {idx_of_interest}, {switched_at}')
            switched_at_es_en = switched_at and target_lang == 'es'

            switched_right_after, point = self.is_code_switched(sentence_indices[target_idx:target_idx + 2],
                                                                target_lang=target_lang,
                                                                target_sentence_idx=target_sentence_idx)
            logging.debug(f'switched_right_after: '
                          f'{self.sentence_from_indices(sentence_indices[target_idx:target_idx + 2])}, '
                          f'{switched_right_after}')
            switched_right_after_es_en = True if switched_right_after and target_lang == 'es' else False

            switched_one_after, point = self.is_code_switched(sentence_indices[target_idx + 1:target_idx + 3],
                                                              target_lang=target_lang,
                                                              target_sentence_idx=target_sentence_idx)
            logging.debug('switched_one_after: '
                          f'{self.sentence_from_indices(sentence_indices[target_idx + 1:target_idx + 3])}'
                          f'{switched_one_after}')
            switched_one_after_es_en = True if switched_one_after and target_lang == 'es' else False

            # anywhere after point of interest
            switched_after_anywhere, point = self.is_code_switched(sentence_indices[target_idx + 1:],
                                                                   target_lang=target_lang,
                                                                   target_sentence_idx=target_sentence_idx)
            logging.debug(f'switched_after_anywhere: {self.sentence_from_indices(sentence_indices[target_idx + 1:])}'
                          f'{switched_after_anywhere}')
            switched_after_anywhere_es_en = (True if switched_after_anywhere and target_lang == 'es' else False)

            point_of_interest_produced_last = idx_of_interest == sentence_indices[-2]  # ignore period

            cache = (switched_before, switched_at, switched_right_after, switched_one_after, switched_after_anywhere,
                     switched_before_es_en, switched_at_es_en, switched_right_after_es_en, switched_one_after_es_en,
                     switched_after_anywhere_es_en, point_of_interest_produced_last)
            self.idx_points_cache[out_idx] = cache
        return cache

    def get_lexicon_and_lang_info(self):
        """
        :return: lexicon in list format and code-switched id (the first entry of the second language)
        """
        info = defaultdict(list)
        langid = {}
        for lang in self.target_lang:
            if lang:
                lexicon_of_lang = self.lexicon_df[[f'morpheme_{lang}', 'pos', 'concept',
                                                   'is_false_friend']].dropna(subset=[f'morpheme_{lang}'])
                for i, row in lexicon_of_lang.iterrows():
                    if row[f'morpheme_{lang}'] not in info['lex']:
                        info['lex'].append(row[f'morpheme_{lang}'])
                        info['pos'].append(row['pos'])
                        langid[len(info['lex']) - 1] = [lang]
                    elif lang not in langid[info['lex'].index(row[f'morpheme_{lang}'])]:
                        langid[info['lex'].index(row[f'morpheme_{lang}'])].append(lang)

        with open(os.path.join(self.directory, "lexicon.in"), 'w', encoding='utf-8') as f:
            f.writelines('\n'.join(info['lex']))
        return info['lex'], info['pos'], langid

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

        df = pd.read_csv(os.path.join(self.directory, set_name) if not self.priming_set else self.priming_set,
                         names=['target_sentence', 'message'], sep='##', engine='python')
        df.message = df.message.str.strip()  # strip whitespace
        if self.cognate_list:
            cognate_translation = self.lexicon_df.loc[self.lexicon_df.is_cognate == True, 'morpheme_es'].unique()
            cognate_word = self.lexicon_df.loc[self.lexicon_df.is_cognate == True, 'morpheme_en'].unique()
            d = dict(zip(cognate_translation, cognate_word))
            d = {r'\b{}\b'.format(k): v for k, v in d.items()}  # add word boundaries
            df['target_sentence'] = df['target_sentence'].replace(to_replace=d, regex=True)
        if self.false_friends_replacement_dict:
            df['target_sentence'] = df['target_sentence'].replace(to_replace=self.false_friends_replacement_dict,
                                                                  regex=True)

        if self.prodrop:  # TODO: make pro-drop
            if self.emphasis_decimal_fraction > 0:  # keep pronoun if emphasized
                # find num of lines that are in ES. decide on num that will be emphasized:
                number_emphasized = len([]) * self.emphasis_decimal_fraction  # replace('AGENT=', 'AGENT=EMPH,')
            else:
                df.line = df.line.str.replace('(^| )(él|ella) ', ' ', regex=True)
        # elif not self.emphasis: lines = [re.sub(r',EMPH', '', sentence) for sentence in lines]

        if not self.use_semantic_gender:
            df.message = df.message.str.replace(',(M|F|M-F);', ';', regex=True)

        df['target_sentence_idx'] = df.target_sentence.apply(self.sentence_indices)
        df['target_pos'] = df.target_sentence_idx.apply(self.sentence_pos)
        (event_sem_activations, target_lang_act, df['lang'], weights_role_concept, weights_role_identif,
         df['event_sem_message']) = zip_longest(*df.message.apply(self.get_message_info))

        if self.priming_experiment and test:
            df['trans_verb_idx'] = None

            df['alt_sentence_idx'] = df.apply(lambda x: self.active_to_passive(x.target_sentence_idx, x.message),
                                              axis=1)
            df['alt_sentence'] = df.alt_sentence_idx.apply(self.sentence_from_indices)

            # After generating alt_sentences, delete messages for prime sentences
            df.iloc[::2, df.columns.get_loc('message')] = np.nan

            df_half_idx = int(len(df) / 2)

            # For the second half of prime sentences, change from active to passive
            df.iloc[df_half_idx::2, df.columns.get_loc('target_sentence')] = df.iloc[df_half_idx::2,
                                                                             df.columns.get_loc('alt_sentence')]
            df.iloc[df_half_idx::2, df.columns.get_loc('target_sentence_idx')] = df.iloc[df_half_idx::2,
                                                                                 df.columns.get_loc('alt_sentence_idx')]

            df['sentence_structure'] = df.target_sentence_idx.apply(self.get_sentence_structure)

        return df, weights_role_concept, weights_role_identif, event_sem_activations, target_lang_act

    def read_allowed_pos(self):
        """ returns all (distinct) allowed POS structures in the training file (list of lists) """
        allowed = list(map(list, set(map(tuple,
                                         self.trainlines_df.target_pos if not self.trainlines_df.empty else self.testlines_df))))
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
        with open(os.path.join(self.directory, fname), encoding='utf-8') as f:
            lines = [line.rstrip('\n') for line in f]
        return lines

    def pos_lookup(self, word_idx):
        """
        :param word_idx: the index of the word in the lexicon
        :return: the category of the word (noun, verb etc)
        """
        return self.pos[word_idx]

    def active_to_passive(self, active_sentence_idx, message=''):
        """
        :param active_sentence_idx: list with sentence indices
        :param message: string
        :return: list with indices of passive sentence
        """

        # Get language from message info
        (event_sem_activations, target_lang_activations, lang, weights_role_concept,
         weights_role_identif, event_sem_message) = self.get_message_info(message)

        passive_sentence_idx = active_sentence_idx

        self.transitive_idx = self.df_query_to_idx("type == 'transitive'")
        self.past_idx = self.df_query_to_idx("pos == 'past'", lang)
        self.par_idx = self.df_query_to_idx("pos == 'prf'", lang)
        self.by_idx = self.df_query_to_idx("pos == 'by'", lang)
        self.is_idx = self.df_query_to_idx("pos == 'aux' and tense == 'present' and aspect == 'perfect_pass'", lang)
        self.was_idx = self.df_query_to_idx("pos == 'aux' and tense == 'past' and aspect == 'perfect_pass'", lang)
        self.she_idx = self.df_query_to_idx(
            f"pos == 'pron' and syntactic_gender_{self.L[2]} == 'F' and type == 'subject'", lang)
        self.he_idx = self.df_query_to_idx(
            f"pos == 'pron' and syntactic_gender_{self.L[2]} == 'M' and type == 'subject'", lang)
        self.her_idx = self.df_query_to_idx(
            f"pos == 'pron' and syntactic_gender_{self.L[2]} == 'F' and type == 'prep-object'", lang)
        self.him_idx = self.df_query_to_idx(
            f"pos == 'pron' and syntactic_gender_{self.L[2]} == 'M' and type == 'prep-object'", lang)

        trans_verb_idx = None

        for i in range(len(active_sentence_idx)):
            if active_sentence_idx[i] in self.transitive_idx:
                trans_verb_idx = i

        # Passive sentence starts with object of active sentence
        passive_sentence_idx = active_sentence_idx[trans_verb_idx + 1:-1]

        # Append auxiliary verb
        if active_sentence_idx[trans_verb_idx + 1] == self.past_idx[0]:
            del passive_sentence_idx[0]
            passive_sentence_idx += self.was_idx
        else:
            passive_sentence_idx += self.is_idx

        if lang != 'nl':
            # Append transitive verb, '-par' and   
            passive_sentence_idx += [active_sentence_idx[trans_verb_idx]] + self.par_idx

        # Add 'by' and subject (and optional adjective) of active sentence up to period
        passive_sentence_idx += self.by_idx + active_sentence_idx[:trans_verb_idx]

        # Change pronoun from subject to object
        if passive_sentence_idx[-1] == self.she_idx[0]:
            passive_sentence_idx[-1] = self.her_idx[0]
        elif passive_sentence_idx[-1] == self.he_idx[0]:
            passive_sentence_idx[-1] = self.him_idx[0]

        if lang == 'nl':
            # Append transitive verb, '-par' and 'by'  
            passive_sentence_idx += [active_sentence_idx[trans_verb_idx]] + self.par_idx

        passive_sentence_idx.append(self.period_idx)

        '''    
        # Append transitive verb, '-par' and 'by'  
        passive_sentence_idx += [active_sentence_idx[trans_verb_idx]] + self.par_idx + self.by_idx
        
        # Passive sentence ends with subject (and optional adjective) of active sentence and period
        passive_sentence_idx += active_sentence_idx[:trans_verb_idx] + [active_sentence_idx[-1]]
                 
        # Change pronoun from subject to object
        if passive_sentence_idx[-2] == self.she_idx[0]:
            passive_sentence_idx[-2] = self.her_idx[0]
        elif passive_sentence_idx[-2] == self.he_idx[0]:
            passive_sentence_idx[-2] = self.him_idx[0]
        '''
        return passive_sentence_idx

    def get_sentence_structure(self, sentence_idx):
        """
        :param sentence_idx: list with sentence indices
        :return: sentence structure, either active or passive
        """
        self.by_idx = self.df_query_to_idx("pos == 'by'")

        if any(idx in self.by_idx for idx in sentence_idx):
            return 'passive'

        return 'active'

    @staticmethod
    def map_to_sentence_pos(word_idx_list, sentence_idx, sentence_pos):
        idx = [sentence_idx.index(v) for v in word_idx_list]
        return [sentence_pos[x] for x in idx]

    def sentence_from_indices(self, sentence_idx):
        """
        :param sentence_idx: list with sentence indices
        :return: converts a list of idx into a sentence (string of words)
        """
        return " ".join(list(itemgetter(*sentence_idx)(self.lexicon)))

    def sentence_lang_from_indices(self, sentence_idx):
        return list(itemgetter(*sentence_idx)(self.lang_indices))

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
                        logging.WARNING('Target lang:', target_language)
                        target_lang_activations = [0.5, 0.5]
                else:
                    # there are usually multiple concepts/identif per role, e.g. (MAN, DEF, EMPH). We want to
                    # activate the bindings with a high value
                    input_activation = None
                    for concept in what.split(","):
                        if ':' in concept:
                            concept, input_activation = concept.split(':')
                        if concept in self.identifiability:
                            weights_role_identif[self.roles_idx[role]][self.identifiability_idx[concept]] = (
                                self.fixed_identif * float(input_activation)
                                if input_activation else self.fixed_identif)
                        elif concept in self.concepts:
                            weights_role_concept[self.roles_idx[role]][self.concept_idx[concept]] = (
                                self.fixed_weights * float(input_activation)
                                if input_activation else self.fixed_weights)
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

    def find_equivalent_translation_idx(self, idx, trg_sentence_idx, lang):
        if idx in trg_sentence_idx:
            return [idx]

        if idx in self.false_friend_idx or lang not in self.lang_indices[idx]:
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


def pairwise_list_view(row_idx, bidirectional=False):
    if bidirectional:
        return ((row_idx[i], row_idx[i + 1] if i + 1 < len(row_idx) else row_idx[0]) for i in range(len(row_idx)))
    # else use a step
    step = int(len(row_idx) / 2)
    return ((row_idx[i], row_idx[i + step]) for i in range(step))

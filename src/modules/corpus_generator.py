# -*- coding: utf-8 -*-
from . import pd, os, sys, is_not_nan, time, re, datetime, np


class SetsGenerator:
    def __init__(self, use_simple_semantics, allow_free_structure_production, cognate_percentage, monolingual_only,
                 lang, lexicon_csv, structures_csv, aux_experiment, input_dir=None, sim_results_dir=None,
                 default_L2='en', include_ff=False):
        """
        :param use_simple_semantics:
        :param allow_free_structure_production:
        :param aux_experiment: whether we're running the auxiliary experiment (haber/estar asymmetry in CS)
        """
        self.allow_free_structure_production = allow_free_structure_production
        self.lang = lang
        self.ALL = []
        self.L1 = lang if len(lang) == 2 else lang[:2]  # take first 2 letters as L1
        self.L2 = None if len(lang) == 2 else lang[2:]
        self.random = np.random
        self.cognate_percentage = cognate_percentage
        self.aux_experiment = aux_experiment
        self.lexicon_df = self.get_clean_lexicon(lexicon_csv, false_friends=include_ff,
                                                 cognates=True if cognate_percentage > 0 else False,
                                                 use_simple_semantics=use_simple_semantics)
        self.results_dir = sim_results_dir
        self.input_dir = input_dir
        if input_dir and not os.path.exists(input_dir):
            os.mkdir(input_dir)
        self.input_dir_empty = True
        self.genders = [x for x in self.lexicon_df.semantic_gender.dropna().unique() if '-' not in x]
        self.determiners = self.get_determiners_from_lexicon()
        self.concepts = self.lexicon_df.concept.dropna().unique()
        # source: https://www.realfastspanish.com/vocabulary/spanish-cognates
        # http://mentalfloss.com/article/57195/50-spanish-english-false-friend-words
        self.structures_df = self.get_structures(structures_csv)
        self.num_structures_L1, self.num_structures_L2 = self.get_num_structures_per_language()
        self.roles = self.structures_df['message'].str.extractall('(;|^)?([A-Z-]*)(=;)')[1].unique()  # AGENT etc
        self.df_cache = {}
        L2 = self.L2 if self.L2 is not None else default_L2
        self.target_lang = [self.L1, L2] if not monolingual_only else [self.L1]
        # TODO: automate
        self.identifiability = ['pron', 'def', 'indef']

    def set_new_results_dir(self, results_dir):
        if os.path.isdir(results_dir):  # if this folder name exists already add a timestamp at the end
            results_dir += datetime.now().strftime(".%S")
        os.makedirs(results_dir)
        self.results_dir = results_dir

    def generate_general(self, num_training, num_test, percentage_l2, cognates_experiment=False):
        """
        :param num_training: number of training sentences to be generated
        :param percentage_l2: percentage of L2 (e.g., English) vs L1
        :param cognates_experiment: (if True) include cognates and ff only in training sets
        """
        if len(self.lang) == 2 and percentage_l2 != 0:  # correct L2 percentage in monolingual setting
            percentage_l2 = 0

        sentence_structures_train = self.generate_sentence_structures(num_training, percentage_l2=percentage_l2)
        sentence_structures_test = self.generate_sentence_structures(num_test, percentage_l2=percentage_l2)
        # save only training set if we're selecting sentences for the cognate experiment
        # test_fname = "test.in" if not aux_experiment else "test_all.in" if not cognates_experiment else None
        test_fname = "test.in" if not cognates_experiment else None
        test_set = self.generate_sentences(sentence_structures_test, fname=test_fname,
                                           exclude_cognates=cognates_experiment,
                                           max_cognate=0 if cognates_experiment else num_test * self.cognate_percentage)
        training_set = self.generate_sentences(sentence_structures_train, fname="training.in",
                                               exclude_test_sentences=test_set,
                                               max_cognate=num_training * self.cognate_percentage)
        assert num_test == len(test_set) and num_training == len(training_set)
        if self.input_dir_empty:
            self.input_dir_empty = False  # the files are generated in parallel, signal here already & check in function
            self.save_lexicon_and_structures_to_csv()
        # if cognates_experiment or self.aux_experiment:  # return sets of message/sentence pairs
        return test_set, training_set

    def generate_auxiliary_experiment_sentences(self, training_set, percentage_l2, num_test_sentences=800):  # 1000
        perfect_structures = self.generate_aux_perfect_sentence_structures(num_test_sentences // 2,
                                                                           percentage_l2=percentage_l2)
        self.generate_sentences(perfect_structures, fname="test_aux.in", exclude_test_sentences=training_set,
                                max_cognate=(num_test_sentences // 2) * self.cognate_percentage)

    def replace_perfect_with_progressive(self, sentence, message):
        """
        :param sentence:
        :param message:
        :return: replaces has -> is, ha -> está, perfect participle -> prog participle
        """
        msg = message.replace('PERFECT', 'PROG')
        concept = re.search(';AAL=([A-Z]*);', msg).group(1)
        lang = msg.split(',')[-1]
        # look up prog and perfect participles and replace
        res = self.lexicon_df.query(f"pos == 'participle' and concept == '{concept}'")
        prog = res[f'morpheme_{lang}'].loc[res['aspect'] == 'prog'].max()
        perfect = res[f'morpheme_{lang}'].loc[res['aspect'] == 'perfect'].max()
        sent = sentence.replace(' has ', ' is ').replace(' ha ', ' está ').replace(perfect, prog)
        return sent, msg

    def get_random_row_idx(self, data_len):
        return self.random.randint(0, data_len) if data_len > 1 else 0

    def generate_sentence_structures(self, num_sentences, percentage_l2, filtered_structures=None):
        """
        :param num_sentences: number of message/sentence pairs that need to be generated
        :param percentage_l2: percentage of L2 structures
        :param filtered_structures: use given structures (that have been filtered before)
        :return:
        """
        num_l2 = int(percentage_l2 * num_sentences)
        num_l1 = num_sentences - num_l2

        if filtered_structures is not None:
            pd.options.mode.chained_assignment = None   # it's otherwise impossible to get rid of SettingWithCopyWarning
            df = self.distribute_percentages_equally_if_not_set(filtered_structures)
            percentage_l2 *= 100
            percentage_l1 = 100 - percentage_l2
            key = f'percentage_{self.L1}'
            existing_percentages = df[key].sum()
            if existing_percentages != percentage_l1:
                # df.loc[:, key] = df[key] * percentage_l1 / existing_percentages
                df.loc[:, key] *= percentage_l1 / existing_percentages
            if percentage_l2:
                key = f'percentage_{self.L2}'
                existing_percentages = df[key].sum()
                if existing_percentages != percentage_l2:
                    # df.loc[:, key] = df[key] * percentage_l2 / existing_percentages
                    df.loc[:, key] *= percentage_l2 / existing_percentages
        else:
            df = self.distribute_percentages_equally_if_not_set(self.structures_df)

        occurances = [int(x) for x in df[f'percentage_{self.L1}'] * num_l1 / 100]
        sentence_structures = df[['message', self.L1]].values.repeat(occurances, axis=0)
        structures_missing = num_l1 - len(sentence_structures)
        if structures_missing > 0:
            sentence_structures = np.append(sentence_structures,
                                            df[['message', self.L1]].sample(n=structures_missing, replace=True), axis=0)
        elif structures_missing < 0:
            sentence_structures = np.delete(sentence_structures,
                                            self.random.randint(len(sentence_structures),
                                                                size=abs(structures_missing)), axis=0)
        sentence_structures[:, 0] += f',{self.L1}'  # append language code at the end

        if num_l2:  # repeat the procedure for L2
            occurances = [int(x) for x in df[f'percentage_{self.L2}'] * num_l2 / 100]
            sentence_structures_l2 = df[['message', self.L2]].values.repeat(occurances, axis=0)
            structures_missing = num_l2 - len(sentence_structures_l2)
            if structures_missing > 0:
                sentence_structures_l2 = np.append(sentence_structures_l2,
                                                   df[['message', self.L2]].sample(n=structures_missing,
                                                                                   replace=True), axis=0)
            elif structures_missing < 0:
                sentence_structures_l2 = np.delete(sentence_structures_l2,
                                                   self.random.randint(len(sentence_structures_l2),
                                                                       size=abs(structures_missing)), axis=0)
            sentence_structures_l2[:, 0] += f',{self.L2}'  # append language code at the end
            sentence_structures = np.append(sentence_structures, sentence_structures_l2, axis=0)

        assert num_sentences == len(sentence_structures)
        self.random.shuffle(sentence_structures)
        return sentence_structures

    def distribute_percentages_equally_if_not_set(self, df):
        for key in [f'percentage_{self.L1}', f'percentage_{self.L2}']:
            if df[key].sum() == 0:
                df.loc[:, key] = 100 / df.size
        return df

    def generate_aux_perfect_sentence_structures(self, num_sentences, percentage_l2):
        """
        :param num_sentences: number of message/sentence pairs that need to be generated
        :param percentage_l2: percentage of L2 structures
        :return:
        """
        aux_structures = self.structures_df[self.structures_df.message.str.contains("PERFECT")]
        return self.generate_sentence_structures(num_sentences, percentage_l2, filtered_structures=aux_structures)

    def generate_sentences(self, sentence_structures, fname, max_cognate, exclude_test_sentences=[],
                           exclude_cognates=False):
        """
        :param sentence_structures: list of allowed structures for the generated sentences
        :param fname: filename to store results (they won't be stored if set to None)
        :param exclude_test_sentences: list of sentences to exclude (test set needs to contain novel messages only)
        :param exclude_cognates: whether to exclude cognates from the lexicon
        :param max_cognate: maximum number of cognates in set
        :return: list of generated pairs (sentence, message)
        """
        replace_aux_sentences = True if fname and "aux" in fname else False
        # keep track of training sentences (messages) that are identical to test ones and exclude them
        generated_pairs = []
        remaining_structures = sentence_structures
        time_start = time.time()
        while len(remaining_structures):  # while loop needed because of the unique sentence restriction
            if time.time() - time_start > 60:
                sys.exit("The process timed out (limit: 60s). Remaining structures: "
                         f"{len(remaining_structures)} more structures: {set(remaining_structures)} "
                         f"(total: {len(sentence_structures)}).")
            remaining_structures, generated_pairs, max_cognate = self.structures_to_sentences(remaining_structures,
                                                                                              generated_pairs,
                                                                                              exclude_test_sentences,
                                                                                              exclude_cognates,
                                                                                              replace_aux_sentences,
                                                                                              max_cognate=max_cognate)
        self.random.shuffle(generated_pairs)
        if fname:  # fname is None in the cognate experiment case
            self.save_language_sets(fname, generated_pairs)
        return generated_pairs

    def save_language_sets(self, fname, generated_pairs):
        with open('%s/%s' % (self.results_dir, fname), 'w') as f:
            for sentence, message in generated_pairs:
                f.write(u'%s## %s\n' % (sentence, message))

    def structures_to_sentences(self, sentence_structures, generated_pairs, exclude_test_sentences, exclude_cognates,
                                replace_aux_sentences, max_cognate):
        sentences_with_cognates = 0
        sentence_idx = len(generated_pairs)  # keep track of how many sentences we have generated already
        remaining_structures = []
        for msg, pos_full in sentence_structures:
            if not exclude_cognates and sentences_with_cognates >= max_cognate:
                exclude_cognates = True
            message = msg.split(';')
            lang = message[-1].split(',')[-1]
            sentence = []
            msg_idx = 0
            gender = None
            boost_next = False
            pos_list = pos_full.split()
            for i, pos in enumerate(pos_list):
                morpheme_df = self.select_random_morpheme_for_lang(pos=pos, lang=lang, gender=gender,
                                                                   exclude_cognates=exclude_cognates)
                gender = self.get_df_gender(morpheme_df, prev_gender=gender)
                sentence.append(morpheme_df.values[0])
                if pos == 'pron':  # also need to choose a random concept -- only constraint: gender
                    morpheme_df = self.select_random_morpheme_for_lang(pos='noun:animate', lang=lang, gender=gender,
                                                                       exclude_cognates=exclude_cognates)
                concept = self.get_df_concept(morpheme_df)
                if concept:
                    semantic_gender = self.get_df_semantic_gender(morpheme_df, syntactic_gender=gender)
                    message[msg_idx] = self.add_concept_and_gender_info(message[msg_idx], concept, semantic_gender)
                    next_pos = pos_list[i + 1] if i + 1 < len(pos_list) else None
                    msg_idx, boost_next = self.alter_msg_idx(msg_idx, pos, lang, next_pos, boost_next)
            sentence = u'%s .' % ' '.join(sentence)
            message = ";".join(message)  # .upper()
            sentence_is_unique = self.sentence_is_unique(message, exclude_test_sentences, generated_pairs)
            if replace_aux_sentences and sentence_is_unique:
                prog_sentence, prog_msg = self.replace_perfect_with_progressive(sentence=sentence, message=message)
                if self.sentence_is_unique(prog_msg, exclude_test_sentences, generated_pairs):
                    generated_pairs.append((prog_sentence, prog_msg))
                    sentence_idx += 1
                    if not exclude_cognates and ',COG' in message:
                        sentences_with_cognates += 1
                else:  # do not add the perfect structure either
                    sentence_is_unique = False

            if sentence_is_unique:
                generated_pairs.append((sentence, message))
                sentence_idx += 1
                if not exclude_cognates and ',COG' in message:
                    sentences_with_cognates += 1
            else:  # find unique sentence, don't add it to the training set
                remaining_structures.append((msg, pos_full))
        return remaining_structures, generated_pairs, max_cognate - sentences_with_cognates

    def get_query_cache(self, params):
        if params in self.df_cache:
            return self.df_cache[params]
        return False

    def select_random_morpheme_for_lang(self, pos, lang, gender, exclude_cognates, only_get_cognate=False,
                                        only_get_false_friend=False):
        params = repr(locals().values())
        cache = self.get_query_cache(params)
        if cache is False:
            if gender and not any([x in pos for x in ['noun', 'adj']]):
                gender = None
            pos_type = None
            all_pos = pos.split(':')
            for n in range(0, 5 - len(all_pos)):  # this is simply to be able to unpack even N/A values like number
                all_pos.append(None)
            pos, pos_type, tense, aspect, number = all_pos

            query = [f"pos == '{pos}' and morpheme_{lang} == morpheme_{lang}"]  # x == x to avoid NaN values
            if pos_type == 'animate':
                query.append("and semantic_gender == semantic_gender")
            elif pos_type == 'inanimate':  # checks for NaN
                query.append("and semantic_gender != semantic_gender")
            elif pos_type:
                query.append(f"and type == '{pos_type}'")

            if tense:
                query.append(f"and tense == '{tense}'")
            if aspect:
                query.append(f"and aspect == '{aspect}'")
            if gender:
                query.append(f"and (syntactic_gender_es == '{gender}' or syntactic_gender_es == 'M-F')")

            if exclude_cognates:
                query.append("and is_cognate != 'Y'")
            elif only_get_cognate:
                query.append("and is_cognate == 'Y'")
            elif only_get_false_friend:
                query.append("and is_false_friend == '1'")
            cache = self.lexicon_df.query(' '.join(query))
            # if 'noun' in pos and lang == 'en':
            #    print(query, cache, len(cache.index))
            self.df_cache[params] = cache
        cache_size = len(cache.index)
        if not cache_size:
            sys.exit(f"Empty cache: {params} {cache} {query if query else ''}")  # throw an error if cache is empty
        idx = self.get_random_row_idx(cache_size)
        if 'noun:animate' in pos:
            self.ALL.append(idx)
        selected = cache[[f'morpheme_{lang}', 'pos', 'type', 'syntactic_gender_es', 'semantic_gender', 'concept',
                          'is_cognate', 'is_false_friend']].iloc[idx]
        return selected

    def save_lexicon_and_structures_to_csv(self):
        # Matches strings between ;E= or ,           E.g., 'PROG', 'SIMPLE', 'PRESENT', 'PAST', 'AGENT', 'PATIENT'
        # "?" is necessary for multiple matches
        if not os.listdir(self.input_dir):
            event_semantics = self.structures_df['message'].str.extractall(';E=|,?([A-Z-]*)(,|$)')[0].dropna().unique()
            self.list_to_file("event_semantics", event_semantics)
            self.list_to_file("identifiability", self.identifiability)
            self.list_to_file("target_lang", set(self.target_lang))
            self.list_to_file("roles", self.roles)
            self.list_to_file("concepts", self.concepts)
            self.lexicon_df.to_csv('%s/lexicon.csv' % self.input_dir, encoding='utf-8', index=False)
            self.structures_df.to_csv('%s/structures.csv' % self.input_dir, encoding='utf-8', index=False)

    def list_to_file(self, fname, content):
        with open('%s/%s.in' % (self.input_dir, fname), 'w') as f:
            f.write("%s" % "\n".join(content))

    def get_determiners_from_lexicon(self):
        return pd.unique(self.lexicon_df.query("pos == 'det'")[['morpheme_en', 'morpheme_es']].values.ravel())

    def get_structures(self, structures_csv, sep=","):
        if not os.path.isfile(structures_csv):
            structures_csv = "src/%s" % structures_csv
        df = pd.read_csv(structures_csv, sep=sep, header=0)  # first line is the header
        structures = df.query(f"percentage_{self.L1} != 0 and percentage_{self.L2} != 0")
        keys = ['message']
        for l in [self.L1, self.L2]:
            if l:
                keys.append(l)
                keys.append(f'percentage_{l}')
        df = structures[keys]
        if True:  # replace all "verb_prefix verb_suffix" with "verb"  FIXME
            df = df.replace({'verb(_prefix)?:intrans verb_suffix::present': 'verb:intrans:present'}, regex=True)
            df = df.replace({'verb(_prefix)?:trans verb_suffix::present': 'verb:trans:present'}, regex=True)
            df = df.replace({'verb(_prefix)?:double verb_suffix::present': 'verb:double:present'}, regex=True)

            df = df.replace({'verb(_prefix)?:intrans verb_suffix::past': 'verb:intrans:past'}, regex=True)
            df = df.replace({'verb(_prefix)?:trans verb_suffix::past': 'verb:trans:past'}, regex=True)
            df = df.replace({'verb(_prefix)?:double verb_suffix::past': 'verb:double:past'}, regex=True)

            df = df.replace({'verb_prefix:copular': 'verb:copular'}, regex=True)
            df = df.replace({'verb_prefix:possession': 'verb:possession'}, regex=True)

            df = df.replace({'verb(_prefix)?:trans participle_suffix:::prog': 'participle:trans::prog'}, regex=True)
            df = df.replace({'verb(_prefix)?:intrans participle_suffix:::prog': 'participle:intrans::prog'}, regex=True)
            df = df.replace({'verb(_prefix)?:double participle_suffix:::prog': 'participle:double::prog'}, regex=True)

            df = df.replace({'verb(_prefix)?:trans participle_suffix:::perfect': 'participle:trans::perfect'},
                            regex=True)
            df = df.replace({'verb(_prefix)?:intrans participle_suffix:::perfect': 'participle:intrans::perfect'},
                            regex=True)
            df = df.replace({'verb(_prefix)?:double participle_suffix:::perfect': 'participle:double::perfect'},
                            regex=True)
        if not self.allow_free_structure_production:
            df.message = df.message.map(lambda a: self.extract_and_append_event_semantics(a))
        return df

    def get_num_structures_per_language(self):
        l1 = self.structures_df[self.L1].count()
        l2 = None
        if self.L2:
            l2 = self.structures_df[self.L2].count()
        return l1, l2

    @staticmethod
    def get_clean_lexicon(lexicon_csv, false_friends, cognates, use_simple_semantics):
        if not os.path.isfile(lexicon_csv):
            lexicon_csv = "src/%s" % lexicon_csv
        df = pd.read_csv(lexicon_csv, sep=',', header=0)  # first line is the header
        query = ["inactive != 'Y'"]  # remove inactive words
        if not false_friends:
            query.append("and is_false_friend != 'Y'")
        if not cognates:
            query.append("and is_cognate != 'Y'")
        lex = df.query(' '.join(query))
        if use_simple_semantics:
            lex.drop(['compositional_concept', 'inactive'], axis=1)
        else:
            lex.drop(['concept', 'inactive'], axis=1)
            lex = lex.rename(columns={'compositional_concept': 'concept'})
        return lex

    # --------------------------- corpus_for_experiments ---------------------------
    def generate_for_cognate_experiment(self, num_training_sentences, percentage_l2, include_ff=False, save_files=True):
        # select cognate-free sentences
        original_test_set, original_training_set = self.generate_general(num_training=num_training_sentences,
                                                                         percentage_l2=percentage_l2,
                                                                         cognates_experiment=True)
        # modify test set: replace one sentence per word with a cognate
        cognate_sets, replacement_idx = self.generate_replacement_test_sets(original_test_set)
        all_test_sets = original_test_set + cognate_sets
        if include_ff:
            # replace one sentence per word with a false friend
            false_friend_sets, replacement_idx = self.generate_replacement_test_sets(original_test_set,
                                                                                     replacement_idx=replacement_idx,
                                                                                     replace_with_cognates=False)
            all_test_sets += false_friend_sets
        if save_files:
            self.save_lexicon_and_structures_to_csv()
        self.random.shuffle(all_test_sets)
        with open(f'{self.results_dir}/test.in', 'w') as f:
            for sentence, message in all_test_sets:
                f.write(u'%s## %s\n' % (sentence, message))

    def generate_replacement_test_sets(self, original_sets, replacement_idx=None, replace_with_cognates=True):
        """
        :param original_sets: the sentence/message pairs that need to be modified to include cognates or false friends
        :param replacement_idx: index (position) of thematic role that needs to be replaced
        :param replace_with_cognates: if False, insert false friends instead (default: True)
        :return:
        """
        replacement_sets = []
        new_replacement_idx = []
        for idx, (sentence, message) in enumerate(original_sets):
            lang = message[-2:]
            all_roles = message.split(';')
            if replacement_idx:
                role_idx_to_replace = all_roles[replacement_idx[idx]]
            else:
                role_idx_to_replace = self.random.choice(range(len(all_roles) - 2))  # avoid switches at last point
                new_replacement_idx.append(role_idx_to_replace)
            concept_to_replace = self.extract_concept_from_role(all_roles[role_idx_to_replace])
            word_to_replace, pos_w, syntactic_gender_w, semantic_gender_w, verb_type = \
                self.get_word_from_concept(concept_to_replace, lang)
            if pos_w == 'verb':
                pos_to_replace = "%s:%s" % (pos_w, verb_type)
            else:
                pos_to_replace = "%s:%sanimate" % (pos_w, "" if is_not_nan(semantic_gender_w) else "in")
            replace_with_word = self.select_random_morpheme_for_lang(pos=pos_to_replace, lang=lang,
                                                                     gender=syntactic_gender_w,
                                                                     exclude_cognates=False,
                                                                     only_get_false_friend=not replace_with_cognates,
                                                                     only_get_cognate=replace_with_cognates)
            all_roles[role_idx_to_replace] = all_roles[role_idx_to_replace].replace(concept_to_replace,
                                                                                    replace_with_word['concept'])
            if replace_with_cognates:
                all_roles[role_idx_to_replace] += ',COG'
            else:
                all_roles[role_idx_to_replace] += ',FF'
            sentence = sentence.replace(" %s " % word_to_replace, " %s " % replace_with_word['morpheme_%s' % lang])
            message = ';'.join(all_roles)
            replacement_sets.append((sentence, message))
        if not replacement_idx:
            replacement_idx = new_replacement_idx
        return replacement_sets, replacement_idx

    def extract_concept_from_role(self, role):
        return [x for x in role.split('=')[1].split(',') if x not in self.genders + self.identifiability][0]

    def get_word_from_concept(self, concept, lang):
        w = self.lexicon_df.query(f"concept == '{concept}'")
        return w[[f'morpheme_{lang}', 'pos', 'syntactic_gender_es', 'semantic_gender', 'type']].values[0]

    @staticmethod
    def extract_and_append_event_semantics(msg_str):
        event_sem_roles = ','.join([re.sub("=(pron)?", "", m) for m in msg_str.split(';') if not m.startswith("E=")])
        new_msg = f"{msg_str},{event_sem_roles}"
        return new_msg.replace("RECIPIENT,PATIENT", "RECIPIENT,-1,PATIENT")

    @staticmethod
    def alter_msg_idx(msg_idx, pos, lang, next_pos, boost_next=False):
        """
        :param msg_idx: index of the message list (e.g., ['AGENT', 'AGENT-MOD', 'ACTION', 'PATIENT']
        :param pos: current part of speech (e.g., 'det' for determiner, 'noun:animate' for an animate noun)
        :param lang: language code (en, es)
        :param next_pos: the pos that follows
        :param boost_next: whether to move two indexes ahead. This hack is because in English we want to use the
        adjective as 'AGENT-MOD', then go back to 'AGENT' for the noun, and finally move to 'ACTION' for the verb
        :return:
        """
        if boost_next:
            msg_idx += 2
            boost_next = False
        elif pos == 'det' and lang == 'en' and 'adj' in next_pos:
            msg_idx += 1
        elif lang == 'en' and 'adj' in pos:
            msg_idx -= 1
            boost_next = True
        elif pos != 'det':
            msg_idx += 1
        return msg_idx, boost_next

    @staticmethod
    def sentence_is_unique(message, exclude_test_sentences, generated_pairs):
        if message in ([x[1] for x in exclude_test_sentences + generated_pairs]):
            return False
        return True

    @staticmethod
    def add_concept_and_gender_info(message, concept, semantic_gender):
        msg = "%s%s%s" % (message, "," if message[-1] != '=' else "", concept)
        if semantic_gender:
            msg += ",%s" % semantic_gender
        return msg

    @staticmethod
    def get_df_concept(morpheme_df):
        concept = False
        if not pd.isnull(morpheme_df['concept']):
            concept = morpheme_df['concept']
            if morpheme_df['is_cognate'] == 'Y':
                concept += ",COG"
            elif str(morpheme_df['is_false_friend']) == u'1':
                concept += ",FF"
        elif morpheme_df['pos'] == 'det':
            concept = morpheme_df['type']
        return concept

    @staticmethod
    def get_df_gender(morpheme_df, prev_gender=None):
        if not pd.isnull(morpheme_df['syntactic_gender_es']) and morpheme_df['syntactic_gender_es'] != 'M-F':
            return morpheme_df['syntactic_gender_es']
        return prev_gender

    @staticmethod
    def get_df_semantic_gender(morpheme_df, syntactic_gender):
        if not pd.isnull(morpheme_df['semantic_gender']):
            if morpheme_df['semantic_gender'] == 'M-F' and syntactic_gender:
                return syntactic_gender
            return morpheme_df['semantic_gender']
        return None

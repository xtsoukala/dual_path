# -*- coding: utf-8 -*-
from . import pd, os, sys, is_not_nan, time, datetime, np
from joblib import Parallel, delayed
from numpy import around
import re


class SetsGenerator:
    def __init__(self, allow_free_structure_production, lang, lexicon_csv, structures_csv, num_training,
                 randomize, l2_decimal, l2_decimal_dev, root_simulations_path, auxiliary_experiment=False,
                 cognate_experiment=False, input_dir=None, sim_results_dir=None, generator_timeout=60):
        """
        :param allow_free_structure_production:
        """
        self.root_simulations_path = root_simulations_path
        self.auxiliary_experiment = auxiliary_experiment
        self.cognate_experiment = cognate_experiment
        self.unique_cognate_per_sentence = False
        self.randomize = randomize
        self.l2_decimal = l2_decimal
        self.l2_decimal_dev = l2_decimal_dev
        self.allow_free_structure_production = allow_free_structure_production
        self.L = self.get_languages_with_idx(lang)
        self.random = np.random
        self.lexicon_df = self.get_clean_lexicon(lexicon_csv)
        self.languages_with_syntactic_gender = [lang for lang in self.L.values()
                                                if f'syntactic_gender_{lang}' in list(self.lexicon_df)]
        self.results_dir = sim_results_dir
        self.input_dir = input_dir
        if input_dir and not os.path.exists(input_dir):
            os.mkdir(input_dir)
        self.input_dir_empty = True
        self.num_training = num_training
        self.num_test = self.calculate_testset_size(num_training)
        self.genders = [x for x in self.lexicon_df.semantic_gender.dropna().unique() if '-' not in x]
        self.determiners = self.get_determiners_from_lexicon()
        self.concepts = self.lexicon_df.concept.dropna().unique()
        # source: https://www.realfastspanish.com/vocabulary/spanish-cognates
        # http://mentalfloss.com/article/57195/50-spanish-english-false-friend-words
        self.structures_df = self.get_structures(structures_csv)
        self.num_structures_L1, self.num_structures_L2 = self.get_num_structures_per_language()
        self.roles = self.structures_df['message'].str.extractall('(;|^)?([A-Z-]*)(=;)')[1].unique()  # AGENT etc
        self.df_cache = {}
        # TODO: automate
        self.identifiability = ['pron', 'def', 'indef']
        self.generator_timeout = generator_timeout

    @staticmethod
    def get_languages_with_idx(languages):
        return {k + 1: v for k, v in enumerate(languages)}

    def set_new_results_dir(self, results_dir, mk_new_dir=True):
        if mk_new_dir:
            if os.path.isdir(results_dir):  # if this folder name exists already add a timestamp at the end
                results_dir += datetime.now().strftime(".%S")
            os.makedirs(results_dir)
        self.results_dir = results_dir

    def create_input_for_simulation(self, simulation_number):
        self.set_new_results_dir(f"{self.root_simulations_path}/{simulation_number}")
        self.random.seed(simulation_number)  # set new seed each time we run a new simulation
        if self.randomize and self.l2_decimal:
            self.l2_decimal = around(self.random.normal(self.l2_decimal, self.l2_decimal_dev), decimals=2)
            print(f"Simulation {simulation_number}: L1 decimal fraction: {1. - self.l2_decimal:.2}, "
                  f"L2 decimal fraction: {self.l2_decimal}")
        test_set, training_set = self.generate_general()
        if self.auxiliary_experiment:
            self.generate_auxiliary_experiment_sentences(excluded_sentences=training_set)

    @staticmethod
    def calculate_testset_size(num_training, test_set_decimal=0.2):
        """
        :param num_training: Number of training sentences
        :param test_set_decimal: default: 0.2 (20%) of sentences are set aside for testing. (80%: training)
        :return: Number of sentences for training and test sets
        """
        return int((num_training * 100 / 80) * test_set_decimal)

    def generate_general(self, num_training=None, num_test=None):
        """
        :param num_training: number of training sentences to be generated
        :param num_test: number of test sentences
        """
        if not num_training:
            num_training = self.num_training
        if not num_test:
            num_test = self.num_test

        sentence_structures_train = self.generate_sentence_structures(num_training)
        sentence_structures_test = self.generate_sentence_structures(num_test)
        # save only training set if we're selecting sentences for the cognate experiment
        test_set = self.generate_sentences(sentence_structures_test, fname="test.in")
        training_set = self.generate_sentences(sentence_structures_train, fname="training.in",
                                               exclude_test_sentences=test_set)
        assert num_test == len(test_set) and num_training == len(training_set)
        if self.input_dir_empty:
            self.input_dir_empty = False  # the files are generated in parallel, signal here already & check in function
            self.save_lexicon_and_structures_to_csv()
        return test_set, training_set

    def generate_auxiliary_experiment_sentences(self, excluded_sentences, test_spanish_only=True,
                                                num_test_sentences=750):
        if test_spanish_only:
            self.l2_decimal = 1.0 if self.L[2] == 'es' else 0.0
        perfect_structures = self.generate_aux_perfect_sentence_structures(num_test_sentences // 2)
        self.generate_sentences(perfect_structures, fname="test_aux.in", exclude_test_sentences=excluded_sentences)

    def replace_perfect_with_progressive(self, sentence, message):
        """
        :param sentence:
        :param message:
        :return: replaces has -> is, ha -> está, perfect participle -> progressive participle
        """
        msg = message.replace('PERFECT', 'PROGRESSIVE')
        concept = re.search(';ACTION-LINKING=([A-Z]*);', msg).group(1)
        lang = msg[-2:]
        # look up progressive and perfect participles and replace
        res = self.lexicon_df.query(f"pos == 'participle' and concept == '{concept}'")
        progressive = res[f'morpheme_{lang}'].loc[res['aspect'] == 'progressive'].max()
        perfect = res[f'morpheme_{lang}'].loc[res['aspect'] == 'perfect'].max()
        sent = sentence.replace(' has ', ' is ').replace(' ha ', ' está ').replace(perfect, progressive)
        return sent, msg

    def get_random_row_idx(self, data_len):
        return self.random.randint(0, data_len) if data_len > 1 else 0

    def generate_sentence_structures(self, num_sentences, filtered_structures=None):
        """
        :param num_sentences: number of message/sentence pairs that need to be generated
        :param filtered_structures: use given structures (that have been filtered before)
        :return:
        """
        num_l2 = int(self.l2_decimal * num_sentences)
        num_l1 = num_sentences - num_l2

        if filtered_structures is not None:
            pd.options.mode.chained_assignment = None  # it's otherwise impossible to get rid of SettingWithCopyWarning
            df = self.distribute_percentages_equally_if_not_set(filtered_structures)
            percentage_l2 = self.l2_decimal * 100
            percentage_l1 = 100 - percentage_l2
            key = f'percentage_{self.L[1]}'
            existing_percentages = df[key].sum()
            if existing_percentages != percentage_l1:
                # df.loc[:, key] = df[key] * percentage_l1 / existing_percentages
                df.loc[:, key] *= percentage_l1 / existing_percentages
            if percentage_l2:
                key = f'percentage_{self.L[2]}'
                existing_percentages = df[key].sum()
                if existing_percentages != percentage_l2:
                    # df.loc[:, key] = df[key] * percentage_l2 / existing_percentages
                    df.loc[:, key] *= percentage_l2 / existing_percentages
        else:
            df = self.distribute_percentages_equally_if_not_set(self.structures_df)

        sentence_structures = self.structures_per_lang_and_occurrance(df, num_l1, self.L[1])
        if num_l2:  # repeat the procedure for L2
            sentence_structures_l2 = self.structures_per_lang_and_occurrance(df, num_l2, self.L[2])
            sentence_structures = np.append(sentence_structures, sentence_structures_l2, axis=0)

        assert num_sentences == len(sentence_structures)
        self.random.shuffle(sentence_structures)
        return sentence_structures

    def structures_per_lang_and_occurrance(self, df, num_total, lang):
        occurrences = [int(x) for x in df[f'percentage_{lang}'] * num_total / 100]
        sentence_structures = df[['message', lang]].values.repeat(occurrences, axis=0)
        structures_missing = num_total - len(sentence_structures)
        if structures_missing > 0:
            sentence_structures = np.append(sentence_structures,
                                            df[['message', lang]].sample(n=structures_missing, replace=True), axis=0)
        elif structures_missing < 0:
            sentence_structures = np.delete(sentence_structures,
                                            self.random.randint(len(sentence_structures), size=abs(structures_missing)),
                                            axis=0)
        sentence_structures[:, 0] += f';TARGET-LANG={lang}'  # append language code at the end
        return sentence_structures

    def distribute_percentages_equally_if_not_set(self, df):
        keys = [f'percentage_{self.L[1]}']
        if 2 in self.L:  # if there is an L2
            keys.append(f'percentage_{self.L[2]}')
        for key in keys:
            if df[key].sum() == 0:
                df.loc[:, key] = 100 / df.size
        return df

    def generate_aux_perfect_sentence_structures(self, num_sentences):
        """
        :param num_sentences: number of message/sentence pairs that need to be generated
        :return:
        """
        aux_structures = self.structures_df[self.structures_df.message.str.contains("PERFECT")]
        return self.generate_sentence_structures(num_sentences, filtered_structures=aux_structures)

    def generate_sentences(self, sentence_structures, fname, exclude_test_sentences=None):
        """
        :param sentence_structures: list of allowed structures for the generated sentences
        :param fname: filename to store results (they won't be stored if set to None)
        :param exclude_test_sentences: list of sentences to exclude (test set needs to contain novel messages only)
        :return: list of generated pairs (sentence, message)
        """
        replace_aux_sentences = True if fname and "aux" in fname else False
        # keep track of training sentences (messages) that are identical to test ones and exclude them
        generated_pairs = []
        remaining_structures = sentence_structures
        time_start = time.time()
        while len(remaining_structures):  # while loop needed because of the unique sentence restriction
            if time.time() - time_start > self.generator_timeout:
                sys.exit(f"The process timed out (limit: {self.generator_timeout}s). Remaining structures: "
                         f"{len(remaining_structures)} more structures: {set(remaining_structures)} "
                         f"(total: {len(sentence_structures)}).")
            remaining_structures, generated_pairs = self.structures_to_sentences(remaining_structures,
                                                                                 generated_pairs,
                                                                                 exclude_test_sentences,
                                                                                 replace_aux_sentences)
        self.random.shuffle(generated_pairs)
        self.save_language_sets(fname, generated_pairs)
        return generated_pairs

    def save_language_sets(self, fname, generated_pairs):
        with open('%s/%s' % (self.results_dir, fname), 'w') as f:
            for sentence, message in generated_pairs:
                f.write(u'%s## %s\n' % (sentence, message))

    def structures_to_sentences(self, sentence_structures, generated_pairs, exclude_test_sentences,
                                replace_aux_sentences):
        sentence_idx = len(generated_pairs)  # keep track of how many sentences we have generated already
        remaining_structures = []
        for msg, pos_full in sentence_structures:
            message = msg.split(';')
            lang = message[-1].split('=')[1]
            sentence = []
            msg_idx = 0
            gender = None
            boost_next = False
            pos_list = pos_full.split()
            sentence_length = len(pos_list) - 1
            for i, pos in enumerate(pos_list):
                exclude_cognates = False
                # only one cognate per sentence and not at the end of the sentence
                if self.unique_cognate_per_sentence and (any([',COG' in ms for ms in message]) or i == sentence_length):
                    exclude_cognates = True
                morpheme_df = self.select_random_morpheme_for_lang(pos=pos, lang=lang, gender=gender,
                                                                   exclude_cognates=exclude_cognates)
                morpheme_df = morpheme_df
                gender = self.get_syntactic_gender(morpheme_df, lang, prev_gender=gender)
                lang_code = ("en" if ((morpheme_df.is_cognate == True) and
                                      (not self.unique_cognate_per_sentence)) else lang)
                sentence.append(morpheme_df[f'morpheme_{lang_code}'])
                if pos.startswith('pron'):  # also need to choose a random concept -- only constraint: gender
                    morpheme_df = self.select_random_morpheme_for_lang(pos='noun:animate', lang=lang, gender=gender)
                concept = self.get_df_concept(morpheme_df)
                if concept:
                    semantic_gender = self.get_df_semantic_gender(morpheme_df, syntactic_gender=gender)
                    message[msg_idx] = self.add_concept_and_gender_info(message[msg_idx], concept, semantic_gender)
                    next_pos = pos_list[i + 1] if i + 1 < len(pos_list) else None
                    msg_idx, boost_next = self.alter_msg_idx(msg_idx, pos, lang, next_pos, boost_next)
            sentence = u'%s .' % ' '.join(sentence)
            message = ";".join(message)
            if self.unique_cognate_per_sentence and 'COG' not in message:
                sentence_is_unique = False
            else:
                sentence_is_unique = self.sentence_is_unique(message, exclude_test_sentences, generated_pairs)
            if replace_aux_sentences and sentence_is_unique:
                prog_sentence, prog_msg = self.replace_perfect_with_progressive(sentence=sentence, message=message)
                if self.sentence_is_unique(prog_msg, exclude_test_sentences, generated_pairs):
                    generated_pairs.append((prog_sentence, prog_msg))
                    sentence_idx += 1
                else:  # do not add the perfect structure either
                    sentence_is_unique = False

            if sentence_is_unique:
                generated_pairs.append((sentence, message))
                sentence_idx += 1
            else:  # find unique sentence, don't add it to the training set
                remaining_structures.append((msg, pos_full))
        return remaining_structures, generated_pairs

    def get_query_cache(self, params):
        if params in self.df_cache:
            return self.df_cache[params]
        return False

    def select_random_morpheme_for_lang(self, pos, lang, gender, only_get_cognate=False, only_get_false_friend=False,
                                        exclude_cognates=False, exclude_false_friends=False):
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
            if gender and lang in f'syntactic_gender_{lang}' in list(self.lexicon_df):
                query.append(f"and (syntactic_gender_{lang} == '{gender}' or syntactic_gender_{lang} == 'M-F')")

            if exclude_cognates:
                query.append("and is_cognate != True")
            elif exclude_false_friends:
                query.append("and is_false_friend != True")
            elif only_get_cognate:
                query.append("and is_cognate == True")
            elif only_get_false_friend:
                query.append("and is_false_friend == True")
            cache = self.lexicon_df.query(' '.join(query))
            self.df_cache[params] = cache
        cache_size = len(cache.index)
        if not cache_size:
            sys.exit(f"Error: Empty cache. {params} {cache} {query if query else ''}")
        return cache.iloc[self.get_random_row_idx(cache_size)]

    def save_lexicon_and_structures_to_csv(self):
        """
        Matches strings between ;EVENT-SEM= or , E.g.: AGENT=;AGENT-MOD=;ACTION-LINKING=;EVENT-SEM=PRESENT,PROGRESSIVE
        "?" is necessary for multiple matches
        :return: e.g., 'PROGRESSIVE', 'SIMPLE', 'PRESENT', 'PAST', 'AGENT', 'PATIENT'
        """
        # if not os.listdir(self.input_dir): mght have to bring back
        # I have a hard time capturing words with a hyphen: ';EVENT-SEM=|,?([A-Z]*(-([A-Z]*))?)(,|$)'
        event_semantics = []
        for i, event_semantic_str in self.structures_df.message.iteritems():  # slow loop
            for evsem in event_semantic_str.split("EVENT-SEM=")[1].split(','):
                if ':' in evsem:
                    evsem = evsem.split(':')[0]  # remove activation
                if evsem and evsem not in event_semantics:
                    event_semantics.append(evsem)
        self.list_to_file("event_semantics", event_semantics)
        self.list_to_file("identifiability", self.identifiability)
        self.list_to_file("roles", self.roles)
        self.list_to_file("concepts", self.concepts)
        self.lexicon_df.to_csv(f'{self.input_dir}/lexicon.csv', encoding='utf-8', index=False)
        self.structures_df.to_csv(f'{self.input_dir}/structures.csv', encoding='utf-8', index=False)

    def list_to_file(self, fname, content):
        with open('%s/%s.in' % (self.input_dir, fname), 'w') as f:
            f.write("%s" % "\n".join(content))

    def get_determiners_from_lexicon(self):
        return pd.unique(self.lexicon_df.query("pos == 'det'")[[f'morpheme_{l}'
                                                                for l in self.L.values()]].values.ravel())

    def get_structures(self, structures_csv, sep=","):
        if not os.path.isfile(structures_csv):
            structures_csv = "src/%s" % structures_csv
        df = pd.read_csv(structures_csv, sep=sep, header=0)  # first line is the header
        query = f"percentage_{self.L[1]} != 0"
        if 2 in self.L:  # if there is an L2
            query = f"{query} and percentage_{self.L[2]} != 0"
        structures = df.query(query)
        keys = ['message']
        for l in self.L.values():
            keys.append(l)
            keys.append(f'percentage_{l}')
        df = structures[keys]
        if self.allow_free_structure_production:
            df.message = df.message.map(lambda a: self.remove_roles_from_event_semantics(a))
        return df

    def get_num_structures_per_language(self):
        l1 = self.structures_df[self.L[1]].count()
        l2 = None
        if 2 in self.L:  # if there is an L2
            l2 = self.structures_df[self.L[2]].count()
        return l1, l2

    @staticmethod
    def get_clean_lexicon(lexicon_csv):
        if not os.path.isfile(lexicon_csv):
            lexicon_csv = "src/%s" % lexicon_csv
        df = pd.read_csv(lexicon_csv, sep=',', header=0)  # first line is the header
        query = ["inactive != 'Y'"]  # remove inactive words
        lex = df.query(' '.join(query))
        return lex

    def convert_nouns_to_cognates(self, cognate_decimal_fraction, excluded_concepts=[], seed=18,
                                  only_report_values=False):
        if seed:
            self.random.seed(seed)  # Option to set a seed for consistency
        all_nouns = self.lexicon_df[self.lexicon_df.pos == 'noun']
        all_nouns_count = len(all_nouns.index)
        num_cognates = round(all_nouns_count * cognate_decimal_fraction)
        a = self.lexicon_df.loc[(self.lexicon_df.pos == 'noun') & (self.lexicon_df.semantic_gender.notnull()) &
                                (~self.lexicon_df.concept.isin(excluded_concepts)),]
        random_idx = self.random.choice(a.index, num_cognates, replace=False)
        if not only_report_values:
            self.lexicon_df.loc[random_idx, 'is_cognate'] = True
            cognate_concepts = self.lexicon_df.loc[random_idx, 'concept'].unique()
            self.list_to_file("cognates", cognate_concepts)
        else:
            return self.lexicon_df.loc[random_idx, 'concept'].unique()

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
            lang = message[-1].split('=')[1]  # final two letters
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
                                                                     only_get_false_friend=not replace_with_cognates,
                                                                     only_get_cognate=replace_with_cognates)
            all_roles[role_idx_to_replace] = all_roles[role_idx_to_replace].replace(concept_to_replace,
                                                                                    replace_with_word['concept'])
            if replace_with_cognates:
                all_roles[role_idx_to_replace] += ',COG'
            else:
                all_roles[role_idx_to_replace] += ',FF'
            sentence = sentence.replace(f" {word_to_replace} ", " %s " % replace_with_word[f'morpheme_{lang}'])
            message = ';'.join(all_roles)
            replacement_sets.append((sentence, message))
        if not replacement_idx:
            replacement_idx = new_replacement_idx
        return replacement_sets, replacement_idx

    def extract_concept_from_role(self, role):
        return [x for x in role.split('=')[1].split(',') if x not in self.genders + self.identifiability][0]

    def get_word_from_concept(self, concept, lang):
        w = self.lexicon_df.query(f"concept == '{concept}'")
        return w[[f'morpheme_{lang}', 'pos', f'syntactic_gender_{lang}', 'semantic_gender', 'type']].values[0]

    @staticmethod
    def remove_roles_from_event_semantics(msg_str):
        for event in msg_str.split("EVENT-SEM=")[1].split(','):
            if ':' in event:  # the user has the option to set the activation, e.g.: 'PATIENT:0.7,AGENT:0.9'
                core_event = event.split(':')[0]
            else:
                core_event = event

            if f'{core_event}=' in msg_str:
                if f'={event},' in msg_str:
                    msg_str = re.sub(f'={event},', '=', msg_str)
                elif f',{event},' in msg_str:
                    msg_str = re.sub(f',{event},', ',', msg_str)
                elif f',{event}' in msg_str:
                    msg_str = re.sub(f',{event}', '', msg_str)
        return msg_str

    @staticmethod
    def alter_msg_idx(msg_idx, pos, lang, next_pos, boost_next=False):
        """
        :param msg_idx: index of the message list (e.g., ['AGENT', 'AGENT-MOD', 'ACTION', 'PATIENT']
        :param pos: current part of speech (e.g., 'det' for determiner, 'noun:animate' for an animate noun)
        :param lang: language code (e.g., en, es)
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
        message_sentence_pairs = generated_pairs + exclude_test_sentences if exclude_test_sentences else generated_pairs
        if message in ([x[1] for x in message_sentence_pairs]):
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
            if morpheme_df['is_cognate'] is True:
                concept += ",COG"
            elif str(morpheme_df['is_false_friend']) == u'1':
                concept += ",FF"
        elif morpheme_df['pos'] == 'det':
            concept = morpheme_df['type']
        return concept

    def get_syntactic_gender(self, morpheme_df, lang, prev_gender=None):
        """
        If the syntactic gender is not set but the semantic one is (and it's not ambiguous, e.g., "M-F"), return the
        semantic gender. Otherwise, return the syntactic gender if it's not empty or ambiguous.
        """
        if (lang in self.languages_with_syntactic_gender and not pd.isnull(morpheme_df[f'syntactic_gender_{lang}'])
                and morpheme_df[f'syntactic_gender_{lang}'] != 'M-F'):
            return morpheme_df[f'syntactic_gender_{lang}']
        elif (not pd.isnull(morpheme_df['semantic_gender']) and (lang not in self.languages_with_syntactic_gender or
                                                                 pd.isnull(morpheme_df[f'syntactic_gender_{lang}']))
              ):
            if len(morpheme_df['semantic_gender']) == 1:
                return morpheme_df['semantic_gender']
            else:
                # ASSUMPTION: multiple genders are connected with a hyphen. Select a gender randomly.
                return self.random.choice(morpheme_df['semantic_gender'].split('-'))
        return prev_gender

    @staticmethod
    def get_df_semantic_gender(morpheme_df, syntactic_gender):
        if not pd.isnull(morpheme_df['semantic_gender']):
            if morpheme_df['semantic_gender'] == 'M-F' and syntactic_gender:
                return syntactic_gender
            return morpheme_df['semantic_gender']
        return None

    def generate_cognate_experiment_test_sets(self, simulation_range, num_models, cognate_decimal_fraction):
        cognate_list = []
        for m in range(num_models):
            cognate_list.extend(self.convert_nouns_to_cognates(cognate_decimal_fraction=cognate_decimal_fraction,
                                                               excluded_concepts=cognate_list,
                                                               only_report_values=True))
        self.lexicon_df.loc[self.lexicon_df.concept.isin(cognate_list), 'is_cognate'] = True
        self.list_to_file("all_cognates", cognate_list)
        self.unique_cognate_per_sentence = True
        self.structures_df = self.structures_df[~self.structures_df.message.str.contains('=pron')]
        Parallel(n_jobs=-1)(delayed(self.generate_cognate_test_set)(sim,) for sim in simulation_range)

    def generate_cognate_test_set(self, simulation_number, num_test_sentences=600):
        self.set_new_results_dir(f"{self.root_simulations_path}/{simulation_number}", mk_new_dir=False)
        self.random.seed(simulation_number)  # set new seed each time we run a new simulation
        if self.randomize and self.l2_decimal:
            self.l2_decimal = around(self.random.normal(self.l2_decimal, self.l2_decimal_dev), decimals=2)
            print(f"Simulation {simulation_number}: L1 decimal fraction: {1. - self.l2_decimal:.2}, "
                  f"L2 decimal fraction: {self.l2_decimal}")
        sentence_structures_test = self.generate_sentence_structures(num_test_sentences)
        existing_training_set_sentences = self.file_set_to_list(f"{self.root_simulations_path}/"
                                                                f"{simulation_number}/training.in")
        test_set = self.generate_sentences(sentence_structures_test, fname="test_cog.in",
                                           exclude_test_sentences=existing_training_set_sentences)
        assert num_test_sentences == len(test_set)

    @staticmethod
    def file_set_to_list(fname):
        """ split fname lines by sentence## message """
        with open(fname) as file:
            lines = [line.strip().split('## ') for line in file]
        return lines

# -*- coding: utf-8 -*-
import random
import os
import codecs
from datetime import datetime
import pandas as pd
import sys
import re
import time

print_on_screen = False  # used only to debug, no need to add it as a called parameter


class SetsGenerator:
    def __init__(self, results_dir, use_simple_semantics, allow_free_structure_production, use_full_verb_form,
                 cognate_percentage, monolingual_only, lang, lexicon_csv, structures_csv, aux_experiment=False,
                 seed=0, default_L2='en', include_ff=False):
        """
        :param results_dir:
        :param use_simple_semantics:
        :param allow_free_structure_production:
        :param use_full_verb_form:
        :param aux_experiment: whether we're running the auxiliary experiment (haber/estar asymmetry in CS)
        """
        self.allow_free_structure_production = allow_free_structure_production
        self.lang = lang
        self.L1 = lang if len(lang) == 2 else lang[:2]  # take first 2 letters as L1
        self.L2 = None if len(lang) == 2 else lang[2:]
        self.seed = seed
        self.use_full_verb = use_full_verb_form
        self.cognate_percentage = cognate_percentage
        self.aux_experiment = aux_experiment
        self.lexicon_df = self.get_clean_lexicon(lexicon_csv, false_friends=include_ff,
                                                 cognates=True if cognate_percentage > 0 else False,
                                                 use_simple_semantics=use_simple_semantics)
        """self.lexicon_size = len(pd.unique(self.lexicon_df[["morpheme_%s" % self.L1,
                                                           "morpheme_%s" % self.L2]
                                          if self.L2 or not monolingual_only
                                          else ["morpheme_%s" % self.L1]].values.ravel('K')))"""
        self.results_dir = results_dir
        if os.path.isdir(self.results_dir):  # if this folder name exists already add a timestamp at the end
            self.results_dir += datetime.now().strftime(".%S")
        os.makedirs(self.results_dir)
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

    def generate_general(self, num_sentences, percentage_l2, cognates_experiment=False, save_files=True):
        """
        :param num_sentences: number of training AND test sentences to be generated
        :param percentage_l2: percentage of L2 (e.g., English) vs L1
        :param cognates_experiment: (if True) include cognates and ff only in training sets
        :param save_files: whether to save lexicon/concepts etc or just training/test sets
        """
        if not cognates_experiment:
            # (re)set the seed if it's not part of the cognate experiment (where this function is called twice)
            random.seed(self.seed)

        if len(self.lang) == 2 and percentage_l2 != 0:
            percentage_l2 = 0

        num_train, num_test = self.calculate_number_of_sentences_per_set(num_sentences)

        sentence_structures_train = self.generate_sentence_structures(num_train, percentage_l2=percentage_l2)
        sentence_structures_test = self.generate_sentence_structures(num_test, percentage_l2=percentage_l2)
        # save only training set if we're selecting sentences for the cognate experiment
        # test_fname = "test.in" if not aux_experiment else "test_all.in" if not cognates_experiment else None
        test_fname = "test.in" if not cognates_experiment else None
        test_set = self.generate_sentences(sentence_structures_test, fname=test_fname,
                                           exclude_cognates=cognates_experiment,
                                           max_cognate=0 if cognates_experiment else num_test * self.cognate_percentage)
        training_set = self.generate_sentences(sentence_structures_train, fname="training.in",
                                               exclude_test_sentences=test_set,
                                               max_cognate=num_train * self.cognate_percentage)
        assert num_test == len(test_set) and num_train == len(training_set)
        if save_files:
            self.save_lexicon_and_structures_to_csv()
        # if cognates_experiment or self.aux_experiment:  # return sets of message/sentence pairs
        return test_set, training_set

    def generate_auxiliary_experiment_sentences(self, training_sentences, percentage_l2, num_test_sentences=1000):
        perfect_structures = self.generate_aux_perfect_sentence_structures(num_test_sentences // 2,
                                                                           percentage_l2=percentage_l2)
        self.generate_sentences(perfect_structures, fname="test_aux.in", exclude_test_sentences=training_sentences,
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
        res = self.lexicon_df.query("pos == 'participle' and concept == '%s'" % concept)
        prog = res['morpheme_%s' % lang].loc[res['aspect'] == 'prog'].max()
        perfect = res['morpheme_%s' % lang].loc[res['aspect'] == 'perfect'].max()
        sent = sentence.replace(' has ', ' is ').replace(' ha ', ' está ').replace(perfect, prog)
        return sent, msg

    def generate_sentence_structures(self, num_sentences, percentage_l2):
        """
        :param num_sentences: number of message/sentence pairs that need to be generated
        :param percentage_l2: percentage of L2 structures
        :return:
        """
        num_l2 = percentage_l2 * num_sentences
        num_l1 = num_sentences - num_l2
        # if percentages are not set, distribute equally
        # calculate structures for L1
        l1_times_repeat = int(num_l1 // self.num_structures_L1)
        l1_mod_repeat = int(num_l1 % self.num_structures_L1)
        # TODO: take percentages into consideration if not set to NaN
        sentence_structures = pd.concat([self.structures_df[['message', self.L1]]] * l1_times_repeat,
                                        ignore_index=True, sort=False)
        sentence_structures = list(sentence_structures.itertuples(index=False, name=None))
        for i in range(l1_mod_repeat):
            row = random.randint(0, self.num_structures_L1 - 1)  # select random row
            sentence_structures.append((self.structures_df['message'].iloc[row], self.structures_df[self.L1].iloc[row]))

        sentence_structures = [("%s,%s" % (i[0], self.L1), i[1]) for i in sentence_structures]
        if self.L2 and percentage_l2 > 0:
            l2_times_repeat = int(num_l2 // self.num_structures_L2)
            l2_mod_repeat = int(num_l2 % self.num_structures_L2)
            if l2_times_repeat:
                l2_df = pd.concat([self.structures_df[['message', self.L2]]] * l2_times_repeat,
                                  ignore_index=True, sort=False)
                l2_structures = [("%s,%s" % (i[0], self.L2), i[1])
                                 for i in list(l2_df.itertuples(index=False, name=None))]
                sentence_structures.extend(l2_structures)
            for i in range(l2_mod_repeat):
                row = random.randint(0, self.num_structures_L2 - 1)
                sentence_structures.append((self.structures_df['message'].iloc[row] + "," + self.L2,
                                            self.structures_df[self.L2].iloc[row]))
        generated_structures = len(sentence_structures)
        if num_sentences > generated_structures:
            sentences_to_append = num_sentences - generated_structures
            print("Appending %s more L1 row(s)" % sentences_to_append)
            for i in range(sentences_to_append):
                row = random.randint(0, self.num_structures_L1 - 1)  # select random row
                sentence_structures.append((self.structures_df['message'].iloc[row] + "," + self.L1,
                                            self.structures_df[self.L1].iloc[row]))
        assert num_sentences == len(sentence_structures)
        random.shuffle(sentence_structures)
        return sentence_structures

    def generate_aux_perfect_sentence_structures(self, num_sentences, percentage_l2):
        """
        :param num_sentences: number of message/sentence pairs that need to be generated
        :param percentage_l2: percentage of L2 structures
        :return:
        """
        aux_structures = self.structures_df[self.structures_df['message'].str.contains("PERFECT")]
        num_structures_L1 = aux_structures[self.L1].count()
        if self.L2:
            num_structures_L2 = aux_structures[self.L2].count()
        num_l2 = percentage_l2 * num_sentences
        num_l1 = num_sentences - num_l2
        # if percentages are not set, distribute equally
        # calculate structures for L1
        l1_times_repeat = int(num_l1 // num_structures_L1)
        l1_mod_repeat = int(num_l1 % num_structures_L1)
        # TODO: take percentages into consideration if not set to NaN
        sentence_structures = pd.concat([aux_structures[['message', self.L1]]] * l1_times_repeat,
                                        ignore_index=True, sort=False)
        sentence_structures = list(sentence_structures.itertuples(index=False, name=None))
        for i in range(l1_mod_repeat):
            row = random.randint(0, num_structures_L1 - 1)  # select random row
            sentence_structures.append((aux_structures['message'].iloc[row], aux_structures[self.L1].iloc[row]))

        sentence_structures = [("%s,%s" % (i[0], self.L1), i[1]) for i in sentence_structures]
        if self.L2 and percentage_l2 > 0:
            l2_times_repeat = int(num_l2 // num_structures_L2)
            l2_mod_repeat = int(num_l2 % num_structures_L2)
            if l2_times_repeat:
                l2_df = pd.concat([aux_structures[['message', self.L2]]] * l2_times_repeat,
                                  ignore_index=True, sort=False)
                l2_structures = [("%s,%s" % (i[0], self.L2), i[1])
                                 for i in list(l2_df.itertuples(index=False, name=None))]
                sentence_structures.extend(l2_structures)
            for i in range(l2_mod_repeat):
                row = random.randint(0, num_structures_L2 - 1)
                sentence_structures.append((aux_structures['message'].iloc[row] + "," + self.L2,
                                            aux_structures[self.L2].iloc[row]))
        random.shuffle(sentence_structures)
        return sentence_structures

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
        while remaining_structures:  # while loop needed because of the unique sentence restriction
            if time.time() - time_start > 60:
                if self.aux_experiment and len(self.lang) == 2:
                    print("You might want to increase the size of the lexicon or decrease the number of allowed "
                          "structures; the generator doesn't have enough material to generate %s more structures: %s "
                          "(total: %s). fname: %s. Simulation: %s" % (len(remaining_structures), remaining_structures,
                                                                      len(sentence_structures), fname, self.seed))
                    exclude_test_sentences = []
                else:
                    sys.exit("You might want to increase the size of the lexicon or the number of allowed structures; "
                             "the generator doesn't have enough material to generate %s more structures: %s" %
                             (len(remaining_structures), remaining_structures))
            remaining_structures, generated_pairs, max_cognate = self.structures_to_sentences(remaining_structures,
                                                                                              generated_pairs,
                                                                                              exclude_test_sentences,
                                                                                              exclude_cognates,
                                                                                              replace_aux_sentences,
                                                                                              max_cognate=max_cognate)
        random.shuffle(generated_pairs)
        if fname:  # fname is None in the cognate experiment case
            with codecs.open('%s/%s' % (self.results_dir, fname), 'w', "utf-8") as f:
                for sentence, message in generated_pairs:
                    f.write(u'%s## %s\n' % (sentence, message))
        return generated_pairs

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
                    next_pos = pos_list[i + 1] if i < len(pos_list) - 1 else 'NaN'
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
                    if print_on_screen:
                        print(u'%s## %s' % (sentence, message))
                else:  # do not add the perfect structure either
                    sentence_is_unique = False

            if sentence_is_unique:
                generated_pairs.append((sentence, message))
                sentence_idx += 1
                if not exclude_cognates and ',COG' in message:
                    sentences_with_cognates += 1
                if print_on_screen:
                    print(u'%s## %s' % (sentence, message))
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

            query = "pos == '%s' and morpheme_%s == morpheme_%s" % (pos, lang, lang)  # avoid NaN values
            if pos_type == 'animate':
                query += " and semantic_gender == semantic_gender"
            elif pos_type == 'inanimate':  # checks for NaN
                query += " and semantic_gender != semantic_gender"
            elif pos_type:
                query += " and type == '%s'" % pos_type

            if tense:
                query += " and tense == '%s'" % tense
            if aspect:
                query += " and aspect == '%s'" % aspect
            if gender:
                query += " and (syntactic_gender_es == '%s' or syntactic_gender_es == 'M-F')" % gender

            if exclude_cognates:
                query += " and is_cognate != 'Y'"
            elif only_get_cognate:
                query += " and is_cognate == 'Y'"
            elif only_get_false_friend:
                query += " and is_false_friend == '1'"
            cache = self.lexicon_df.query(query)
            self.df_cache[params] = cache
        if not cache.shape[0]:
            if query:
                print(query)
            sys.exit("Empty cache: %s %s" % (params, cache))  # throw an error if cache is empty
        selected = cache[['morpheme_%s' % lang, 'pos', 'type', 'syntactic_gender_es', 'semantic_gender', 'concept',
                          'is_cognate', 'is_false_friend']].iloc[random.randint(0, cache.shape[0] - 1)]
        return selected

    def save_lexicon_and_structures_to_csv(self):
        # Matches strings between ;E= or ,           E.g., 'PROG', 'SIMPLE', 'PRESENT', 'PAST', 'AGENT', 'PATIENT'
        # "?" is necessary for multiple matches
        event_semantics = self.structures_df['message'].str.extractall(';E=|,?([A-Z-]*)(,|$)')[0].dropna().unique()
        self.list_to_file("event_semantics", event_semantics)
        self.list_to_file("identifiability", self.identifiability)
        self.list_to_file("target_lang", set(self.target_lang))
        self.list_to_file("roles", self.roles)
        self.list_to_file("concepts", self.concepts)
        self.lexicon_df.to_csv('%s/lexicon.csv' % self.results_dir, encoding='utf-8', index=False)
        self.structures_df.to_csv('%s/structures.csv' % self.results_dir, encoding='utf-8', index=False)

    def list_to_file(self, fname, content):
        with open('%s/%s.in' % (self.results_dir, fname), 'w') as f:
            f.write("%s" % "\n".join(content))

    def get_determiners_from_lexicon(self):
        return pd.unique(self.lexicon_df.query("pos == 'det'")[['morpheme_en', 'morpheme_es']].values.ravel())

    def get_structures(self, structures_csv, sep=","):
        if not os.path.isfile(structures_csv):
            structures_csv = "modules/%s" % structures_csv
        df = pd.read_csv(structures_csv, sep=sep, header=0)  # first line is the header
        query = "inactive != 'Y'"
        structures = df.query(query)
        keys = ['message', 'percentage']
        for l in [self.L1, self.L2]:
            if l:
                keys.append(l)
        df = structures[keys]
        if self.use_full_verb:  # replace all "verb_prefix verb_suffix" with "verb"
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

    def get_clean_lexicon(self, lexicon_csv, false_friends, cognates, use_simple_semantics):
        if not os.path.isfile(lexicon_csv):
            lexicon_csv = "modules/%s" % lexicon_csv
        df = pd.read_csv(lexicon_csv, sep=',', header=0)  # first line is the header
        query = "inactive != 'Y'"  # remove inactive words
        if not false_friends:
            query += " and is_false_friend != 'Y'"
        if not cognates:
            query += " and is_cognate != 'Y'"
        if self.use_full_verb:
            query += " and pos not in ['verb_prefix', 'verb_suffix', 'participle_suffix'] "
        else:
            query += " and pos not in ['verb', 'participle']"
        lex = df.query(query)
        if use_simple_semantics:
            lex.drop(['compositional_concept', 'inactive'], axis=1)
        else:
            lex.drop(['concept', 'inactive'], axis=1)
            lex = lex.rename(columns={'compositional_concept': 'concept'})
        return lex

    @staticmethod
    def extract_and_append_event_semantics(msg_str):
        event_sem_roles = [re.sub("=(pron)?", "", m) for m in msg_str.split(';') if not m.startswith("E=")]
        new_msg = "%s,%s" % (msg_str, ",".join(event_sem_roles))
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
    def calculate_number_of_sentences_per_set(num_sentences, percentage_test_set=0.2):
        """
        :param num_sentences: Number of sentences that need to be generated
        :param percentage_test_set: default: 20% of sentences are set aside for testing. (80%: training)
        :return: Number of sentences for training and test sets
        """
        num_test = int(percentage_test_set * num_sentences)
        num_train = num_sentences - num_test
        return num_train, num_test

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


if __name__ == "__main__":
    # store under "generated/" if folder was not specified
    sets = SetsGenerator(results_dir="../generated/%s" % datetime.now().strftime("%Y-%m-%dt%H.%M"),
                         cognate_percentage=0, use_full_verb_form=True, monolingual_only=False,
                         use_simple_semantics=True, allow_free_structure_production=False, lang='en',
                         lexicon_csv='../corpus/lexicon_aux_limited.csv', structures_csv='../corpus/structures.csv')
    # sets.generate_general(num_sentences=2500, percentage_l2=0.5)
    test, train = sets.generate_general(num_sentences=3500, percentage_l2=0.5)
    if len(sets.lang) > 2:
        sets.generate_auxiliary_experiment_sentences(num_test_sentences=1000, training_sentences=train, percentage_l2=0)

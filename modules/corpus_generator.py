# -*- coding: utf-8 -*-
import random
import os
import codecs
from datetime import datetime
import pandas as pd
from copy import deepcopy
import sys
import numpy as np
reload(sys)
sys.setdefaultencoding("utf-8")  # otherwise Spanish (non-ascii) characters throw an error
print_on_screen = False  # used only to debug, no need to add it as a called parameter


class SetsGenerator:
    def __init__(self, results_dir, use_simple_semantics, allow_free_structure_production, use_full_verb_form,
                 cognate_percentage, monolingual_only, lang, seed=0, lexicon_csv='../corpus/lexicon.csv',
                 structures_csv='../corpus/structures.csv', include_ff=False):
        """
        :param results_dir:
        :param use_simple_semantics:
        :param allow_free_structure_production:
        :param use_full_verb_form:
        """
        self.lang = lang.lower()
        self.L1 = self.lang if len(lang) == 2 else self.lang[:2]  # take first 2 letters as L1
        self.L2 = None if len(lang) == 2 else self.lang[2:]
        self.seed = seed
        self.cognate_percentage = cognate_percentage
        self.lexicon_df = self.get_clean_lexicon(lexicon_csv, false_friends=include_ff,
                                                 cognates=True if cognate_percentage > 0 else False,
                                                 use_simple_semantics=use_simple_semantics)
        self.results_dir = results_dir
        if os.path.isdir(self.results_dir):  # if this folder name exists already add a timestamp at the end
            self.results_dir += datetime.now().strftime(".%S")
        os.makedirs(self.results_dir)
        self.genders = [x for x in self.lexicon_df.semantic_gender.dropna().unique() if '-' not in x]
        self.determiners = self.get_determiners_from_lexicon()
        self.concepts = self.lexicon_df.concept.dropna().unique()
        # source: https://www.realfastspanish.com/vocabulary/spanish-cognates
        # http://mentalfloss.com/article/57195/50-spanish-english-false-friend-words
        self.structures_df = self.get_structures(structures_csv, use_full_verb=use_full_verb_form)
        self.num_structures_L1, self.num_structures_L2 = self.get_num_structures_per_language()
        # TODO: automate
        self.event_sem = ['PROG', 'SIMPLE', 'PRESENT', 'PAST', 'AGT', 'PAT', 'REC']
        self.roles = ['AGENT', 'PATIENT', 'ACTION', 'RECIPIENT', 'AGENT-MOD', 'PATIENT-MOD']
        self.identifiability = ['EMPH', 'PRON', 'DEF', 'INDEF'] + self.genders
        self.target_lang = ['EN', 'ES'] if not monolingual_only else [self.lang.upper()]
        if allow_free_structure_production:
            self.event_sem = [evsem for evsem in self.event_sem if evsem not in ['AGT', 'PAT', 'REC']]
            self.strip_structure_roles()
        self.df_cache = {}

    def generate_sets(self, num_sentences, percentage_L2, cognates_experiment=False, save_files=True):
        """
        :param num_sentences: number of training AND test sentences to be generated
        :param percentage_L2: percentage of L2 (e.g., English) vs L1
        :param cognates_experiment: (if True) include cognates and ff only in training sets
        :param save_files: whether to save lexicon/concepts etc or just training/test sets
        """
        if not cognates_experiment:
            # (re)set the seed if it's not part of the cognate experiment (where this function is called twice)
            random.seed(self.seed)

        if len(self.lang) == 2 and percentage_L2 != 0:
            percentage_L2 = 0

        num_train, num_test = self.calculate_number_of_sentences_per_set(num_sentences)
        sentence_structures_train = self.generate_sentence_structures(num_train, percentage_L2=percentage_L2)
        sentence_structures_test = self.generate_sentence_structures(num_test, percentage_L2=percentage_L2)
        # save only training set if we're selecting sentences for the cognate experiment
        test_set = self.generate_sentences(sentence_structures_test,
                                           fname="test.in" if not cognates_experiment else None,
                                           exclude_cognates=cognates_experiment,
                                           max_cognate=0 if cognates_experiment else num_test * self.cognate_percentage)
        training_set = self.generate_sentences(sentence_structures_train,
                                               fname="training.in",
                                               exclude_test_sentences=test_set,
                                               max_cognate=num_train * self.cognate_percentage)
        assert num_test == len(test_set) and num_train == len(training_set)
        if cognates_experiment:  # return sets of message/sentence pairs (no need to save them yet)
            return test_set, training_set
        if save_files:
            self.save_lexicon_and_structures_to_csv()

    def generate_sets_for_cognate_experiment(self, num_sentences, percentage_L2, include_ff=False, seed=0,
                                             save_files=True):
        random.seed(seed)  # change the seed each time we run a new simulation
        # first select cognate-free sentences
        original_test_set, original_training_set = self.generate_sets(num_sentences,
                                                                      percentage_L2,
                                                                      cognates_experiment=True,
                                                                      save_files=False)
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
        random.shuffle(all_test_sets)
        with codecs.open('%s/%s' % (self.results_dir, "test.in"), 'w', "utf-8") as f:
            for sentence, message in all_test_sets:
                f.write(u"%s## %s\n" % (sentence, message))

    def generate_replacement_test_sets(self, original_sets, replacement_idx=[], replace_with_cognates=True):
        """
        :param original_sets: the sentence/message pairs that need to be modified to include cognates or false friends
        :param replacement_idx: index (position) of thematic role that needs to be replaced
        :param replace_with_cognates: if False, insert false friends instead (default: True)
        :return:
        """
        replacement_sets = []
        new_idx = []
        for idx, (sentence, message) in enumerate(original_sets):
            lang = message[-2:].lower()
            all_roles = message.split(';')
            if replacement_idx:
                role_idx_to_replace = all_roles[replacement_idx[idx]]
            else:
                role_idx_to_replace = random.choice(range(len(all_roles) - 2))  # avoid switches at last point
                new_idx.append(role_idx_to_replace)
            concept_to_replace = self.extract_concept_from_role(all_roles[role_idx_to_replace])
            word_to_replace, pos_w, syntactic_gender_w, semantic_gender_w, verb_type = \
                self.get_word_from_concept(concept_to_replace, lang)
            if pos_w == 'verb':
                pos_to_replace = "%s:%s" % (pos_w, verb_type)
            else:
                pos_to_replace = "%s:%sanimate" % (pos_w, "" if self.is_not_nan(semantic_gender_w) else "in")
            replace_with_word = self.select_random_morpheme_for_lang(pos=pos_to_replace, lang=lang,
                                                                     gender=syntactic_gender_w,
                                                                     only_select_false_friend=not replace_with_cognates,
                                                                     only_select_cognate=replace_with_cognates)
            all_roles[role_idx_to_replace] = all_roles[role_idx_to_replace].replace(concept_to_replace,
                                                                                    replace_with_word['concept'])
            if replace_with_cognates:
                all_roles[role_idx_to_replace] += ',COG'
            else:
                all_roles[role_idx_to_replace] += ',FF'
            sentence = sentence.replace(" %s " % word_to_replace,
                                        " %s " % replace_with_word['morpheme_%s' % lang])
            message = ';'.join(all_roles)
            replacement_sets.append((sentence, message))
        if not replacement_idx:
            replacement_idx = new_idx
        return replacement_sets, replacement_idx

    def generate_sentence_structures(self, num_sentences, percentage_L2):
        """
        :param num_sentences: number of message/sentence pairs that need to be generated
        :param percentage_L2: percentage of L2 structures
        :return:
        """
        num_l2 = percentage_L2 * num_sentences
        num_l1 = num_sentences - num_l2
        # if percentages are not set, distribute equally
        # calculate structures for L1
        l1_times_repeat = int(np.floor(num_l1 / self.num_structures_L1))
        l1_mod_repeat = int(np.floor(num_l1 % self.num_structures_L1))
        # TODO: take percentages into consideration if not set to NaN
        sentence_structures = pd.concat([self.structures_df[['message', self.L1]]] * l1_times_repeat,
                                        ignore_index=True, sort=False)
        sentence_structures = list(sentence_structures.itertuples(index=False, name=None))
        for i in range(l1_mod_repeat):
            row = random.randint(0, self.num_structures_L1 - 1)  # select random row
            sentence_structures.append((self.structures_df['message'].iloc[row], self.structures_df[self.L1].iloc[row]))

        sentence_structures = [("%s,%s" % (i[0], self.L1.upper()), i[1]) for i in sentence_structures]
        if self.L2 and percentage_L2 > 0:
            l2_times_repeat = int(np.floor(num_l2 / self.num_structures_L2))
            l2_mod_repeat = int(np.floor(num_l2 % self.num_structures_L2))
            if l2_times_repeat:
                l2_df = pd.concat([self.structures_df[['message', self.L2]]] * l2_times_repeat,
                                  ignore_index=True, sort=False)
                l2_structures = [("%s,%s" % (i[0], self.L2.upper()), i[1])
                                 for i in list(l2_df.itertuples(index=False, name=None))]
                sentence_structures.extend(l2_structures)
            for i in range(l2_mod_repeat):
                row = random.randint(0, self.num_structures_L2 - 1)
                sentence_structures.append((self.structures_df['message'].iloc[row]+","+self.L2.upper(),
                                            self.structures_df[self.L2].iloc[row]))
        assert num_sentences == len(sentence_structures)
        random.shuffle(sentence_structures)
        return sentence_structures

    def generate_sentences(self, sentence_structures, fname,  max_cognate, exclude_test_sentences=[],
                           exclude_cognates=False):
        """
        :param sentence_structures: list of allowed structures for the generated sentences
        :param fname: filename to store results (they won't be stored if set to None)
        :param exclude_test_sentences: list of sentences to exclude (test set needs to contain novel messages only)
        :param exclude_cognates: whether to exclude cognates from the lexicon
        :return: list of generated pairs (sentence, message)
        """
        # keep track of training sentences (messages) that are identical to test ones and exclude them
        generated_pairs = []
        remaining_structures = sentence_structures
        # the while loop is needed because of the unique sentence restriction.
        while remaining_structures:
            remaining_structures, generated_pairs, max_cognate = self.structures_to_sentences(remaining_structures,
                                                                                              generated_pairs,
                                                                                              exclude_test_sentences,
                                                                                              exclude_cognates,
                                                                                              max_cognate=max_cognate)
        random.shuffle(generated_pairs)
        if fname:  # fname is None in the cognate experiment case
            with codecs.open('%s/%s' % (self.results_dir, fname), 'w', "utf-8") as f:
                for sentence, message in generated_pairs:
                    f.write(u"%s## %s\n" % (sentence, message))
        return generated_pairs

    def structures_to_sentences(self, sentence_structures, generated_pairs, exclude_test_sentences, exclude_cognates,
                                max_cognate):
        sentences_with_cognates = 0
        sentence_idx = len(generated_pairs)  # keep track of how many sentences we have generated already
        remaining_structures = []
        for msg, pos_full in sentence_structures:
            if not exclude_cognates and sentences_with_cognates >= max_cognate:
                exclude_cognates = True
            message = msg.split(';')
            lang = message[-1].split(',')[-1].lower()
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
                if pos == 'pron':  # also choose a random concept -- only constraint: gender
                    morpheme_df = self.select_random_morpheme_for_lang(pos='noun:animate', lang=lang, gender=gender,
                                                                       exclude_cognates=exclude_cognates)
                concept = self.get_df_concept(morpheme_df)
                if concept:
                    semantic_gender = self.get_df_semantic_gender(morpheme_df, syntactic_gender=gender)
                    message[msg_idx] = self.add_concept_and_gender_info(message[msg_idx], concept, semantic_gender)
                    next_pos = pos_list[i+1] if i < len(pos_list) - 1 else 'NaN'
                    msg_idx, boost_next = self.alter_msg_idx(msg_idx, pos, lang, next_pos, boost_next)
            sentence = u"%s ." % " ".join(sentence)
            message = ";".join(message).upper()

            if self.sentence_is_unique(message, exclude_test_sentences, generated_pairs):
                generated_pairs.append((sentence, message))
                sentence_idx += 1
                if not exclude_cognates and ',COG' in message:
                    sentences_with_cognates += 1
                if print_on_screen:
                    print u"%s## %s" % (sentence, message)
            else:  # find unique sentence, don't add it to the training set
                remaining_structures.append((msg, pos_full))
        return remaining_structures, generated_pairs, max_cognate - sentences_with_cognates

    def get_query_cache(self, params):
        if params in self.df_cache:
            return self.df_cache[params]
        return False

    def select_random_morpheme_for_lang(self, pos, lang, tense = None, gender=None, exclude_cognates=False,
                                        only_select_cognate=False, only_select_false_friend=False):
        params = ''.join([str(x) for x in locals().values()])
        cache = self.get_query_cache(params)
        if cache is False:
            if gender and not any([x in pos for x in ['noun', 'adj']]):
                gender = None
            pos_type = None
            num_types = pos.count(':')
            if num_types == 2:
                pos, pos_type, tense = pos.split(':')
            elif num_types == 1:
                pos, pos_type = pos.split(':')
            query = "pos == '%s' and morpheme_%s == morpheme_%s" % (pos, lang, lang)  # avoid NaN values
            if pos_type == 'animate':
                query += " and semantic_gender == semantic_gender"
            elif pos_type == 'inanimate':  # checks for NaN
                query += " and semantic_gender != semantic_gender"
            elif pos_type:
                query += " and type == '%s'" % pos_type

            if tense:
                query += " and tense == '%s'" % tense
            if gender:
                query += " and (syntactic_gender_es == '%s' or syntactic_gender_es == 'M-F')" % gender

            if exclude_cognates:
                query += " and is_cognate != 'Y'"
            elif only_select_cognate:
                query += " and is_cognate == 'Y'"
            elif only_select_false_friend:
                query += " and is_false_friend == '1'"

            cache = self.lexicon_df.query(query)
            self.df_cache[params] = cache
        selected = cache[['morpheme_%s' % lang, 'pos', 'type', 'syntactic_gender_es', 'semantic_gender', 'concept',
                          'is_cognate', 'is_false_friend', 'adj_es_female']].iloc[random.randint(0, cache.shape[0] - 1)]
        if pos == 'adj' and gender == 'F' and lang == 'es' and not pd.isnull(selected['adj_es_female']):
            selected = selected.columns.rename({'morpheme_%s' % lang: 'null',
                                                'adj_es_female': 'morpheme_%s' % lang})
        return selected

    def save_lexicon_and_structures_to_csv(self):
        self.lexicon_df.to_csv('%s/lexicon.csv' % self.results_dir, encoding='utf-8', index=False)
        self.structures_df.to_csv('%s/structures.csv' % self.results_dir, encoding='utf-8', index=False)
        with codecs.open('%s/identifiability.in' % self.results_dir, 'w',  "utf-8") as f:
            f.write("%s" % "\n".join(self.identifiability))
        with open('%s/event_semantics.in' % self.results_dir, 'w') as f:
            f.write("%s" % "\n".join(self.event_sem))
        with open('%s/target_lang.in' % self.results_dir, 'w') as f:
            f.write("%s" % "\n".join(set(self.target_lang)))
        with open('%s/roles.in' % self.results_dir, 'w') as f:
            f.write("%s" % "\n".join(self.roles))

    def get_determiners_from_lexicon(self):
        return pd.unique(self.lexicon_df.query("pos == 'det'")[['morpheme_en', 'morpheme_es']].values.ravel())

    def strip_structure_roles(self):
        self.structures_df.message = self.structures_df.message.str.replace(',-1|,AGT|,PAT|,REC', '')

    def get_structures(self, structures_csv, sep=",", use_full_verb=False):
        if not os.path.isfile(structures_csv):
            structures_csv = "modules/%s" % structures_csv
        df = pd.read_csv(structures_csv, sep=sep, header=0)  # first line is the header
        query = "inactive != 'Y'"
        structures = df.query(query)
        keys = ['message', 'percentage']
        labels = deepcopy(keys)
        if use_full_verb:
            if 'es' in self.lang:
                keys.append('full_verb_es')
                labels.append('es')
            if 'en' in self.lang:
                keys.append('full_verb_en')
                labels.append('en')
        else:  # return structures that split morpheme-suffix
            if 'es' in self.lang:
                keys.append('pos_es')
                labels.append('es')
            if 'en' in self.lang:
                keys.append('pos_en')
                labels.append('en')
        df = structures[keys]
        df.columns = labels  # rename to language code instead of e.g., pos_es and full_verb_es
        return df

    def get_num_structures_per_language(self):
        l1 = self.structures_df[self.L1].count()
        l2 = None
        if self.L2:
            l2 = self.structures_df[self.L2].count()
        return l1, l2

    def extract_concept_from_role(self, role):
        return [x for x in role.split('=')[1].split(',') if x not in self.genders+self.identifiability][0]

    def get_word_from_concept(self, concept, lang):
        w = self.lexicon_df.query("concept == '%s'" % concept)
        return w[['morpheme_%s' % lang, 'pos', 'syntactic_gender_es', 'semantic_gender', 'type']].values[0]

    @staticmethod
    def alter_msg_idx(msg_idx, pos, lang, next_pos, boost_next=False):
        """
        :param msg_idx: index of the message list (e.g., ['AGENT', 'AGENT-MOD', 'ACTION', 'PATIENT']
        :param pos: current part of speech (e.g., 'det' for determiner, 'noun:animate' for an animate noun)
        :param lang: language code (en, es)
        :param next_pos: the pos that follows
        :param boost_next: whether to move two indexes ahead. This hack is because in EN we want to use the adjective
        as 'AGENT-MOD', then go back to 'AGENT' for the noun, and finally move to 'ACTION' for the verb
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
    def get_clean_lexicon(lexicon_csv, false_friends, cognates, use_simple_semantics):
        if not os.path.isfile(lexicon_csv):
            lexicon_csv = "modules/%s" % lexicon_csv
        df = pd.read_csv(lexicon_csv, sep=',', header=0)  # first line is the header
        query = "inactive != 'Y'"  # remove inactive words
        if not false_friends:
            query += " and is_false_friend != '1'"
        if not cognates:
            query += " and is_cognate != 'Y'"
        lex = df.query(query)
        if use_simple_semantics:
            lex.drop(['compositional_concept', 'inactive'], axis=1)
        else:
            lex.drop(['concept', 'inactive'], axis=1)
            lex = lex.rename(columns={'compositional_concept': 'concept'})
        lex.drop(['full_verb_3rd_en', 'full_verb_3rd_es', 'participle_en', 'participle_es',
                  'past_tense_en', 'past_tense_es'], axis=1)
        return lex

    @staticmethod
    def sentence_is_unique(message, exclude_test_sentences, generated_pairs):
        if message in ([x[1] for x in exclude_test_sentences+generated_pairs]):
            return False
        return True

    @staticmethod
    def add_concept_and_gender_info(message, concept, semantic_gender):
        if message[-1] != '=':
            msg = "%s,%s" % (message, concept) if not semantic_gender else "%s,%s,%s" % (message, concept, semantic_gender)
        else:
            msg = "%s%s" % (message, concept) if not semantic_gender else "%s%s,%s" % (message, concept, semantic_gender)
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
            elif morpheme_df['is_false_friend'] == '1':
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

    @staticmethod
    def is_not_nan(x):
        if x == x:
            return True
        return False

if __name__ == "__main__":
    # store under "generated/" if folder was not specified
    res_dir = "../generated/%s" % datetime.now().strftime("%Y-%m-%dt%H.%M")
    sets = SetsGenerator(results_dir=res_dir, cognate_percentage=0.2, use_full_verb_form=False, monolingual_only=False,
                         use_simple_semantics=True, allow_free_structure_production=False, lang='esen')
    sets.generate_sets(num_sentences=2500, percentage_L2=0.3)
    #sets.generate_sets_for_cognate_experiment(num_sentences=2500, percentage_L2=0.5)

# -*- coding: utf-8 -*-
import random
import re
import os
import codecs
from datetime import datetime
import sys
import pandas
from copy import deepcopy

# TODO: exclude_cognates=True set to False

reload(sys)
sys.setdefaultencoding("utf-8")  # otherwise Spanish (non-ascii) characters throw an error

print_on_screen = False  # used only to debug, no need to add it as a called parameter


class SetsGenerator:
    def __init__(self, results_dir, use_simple_semantics, allow_free_structure_production, use_full_verb_form,
                 seed=0, lang='enes', lexicon_csv='corpus/lexicon.csv', structures_csv='corpus/structures.csv',
                 include_ff=False, include_cognates=True):
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
        self.lexicon_df = get_clean_lexicon(lexicon_csv, include_false_friends=include_ff,
                                            include_cognates=include_cognates)
        self.results_dir = results_dir
        if os.path.isdir(self.results_dir):  # if this folder name exists already add a timestamp at the end
            self.results_dir += datetime.now().strftime(".%S")
        os.makedirs(self.results_dir)
        self.genders = [x for x in self.lexicon_df['semantic_gender'].dropna().unique() if '-' not in x]
        self.determiners = self.get_determiners_from_lexicon()
        self.concepts = self.get_concepts_from_lexicon(use_simple_semantics=use_simple_semantics)
        # source: https://www.realfastspanish.com/vocabulary/spanish-cognates
        self.cognate_values = self.lexicon_df.query("is_cognate == 'Y'").morpheme_en.unique()
        # http://mentalfloss.com/article/57195/50-spanish-english-false-friend-words
        self.false_friends_values = self.lexicon_df.query("is_false_friend == '1'").morpheme_en.unique()
        self.structures_df = self.get_structures(structures_csv, use_full_verb=use_full_verb_form)
        self.num_structures_L1, self.num_structures_L2 = self.get_num_structures_per_language()
        self.target_lang = []
        # TODO: automate
        self.event_sem = ['PROG', 'SIMPLE', 'PRESENT', 'PAST', 'AGT', 'PAT', 'REC']
        self.roles = ['AGENT', 'PATIENT', 'ACTION', 'RECIPIENT', 'AGENT-MOD', 'PATIENT-MOD']
        if allow_free_structure_production:
            self.event_sem = [evsem for evsem in self.event_sem if evsem not in ['AGT', 'PAT', 'REC']]
            self.structures_df = self.strip_structure_roles()

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

        if not self.L2 and percentage_L2 != 0:
            percentage_L2 = 0

        num_train, num_test = calculate_number_of_sentences_per_set(num_sentences)
        sentence_structures_train = self.generate_sentence_structures(num_train, percentage_L2=percentage_L2)
        sentence_structures_test = self.generate_sentence_structures(num_test, percentage_L2=percentage_L2)

        test_set = self.generate_sentences(sentence_structures_test,
                                           fname="test.in" if not cognates_experiment else None,
                                           exclude_cognates=cognates_experiment)
        training_set = self.generate_sentences(sentence_structures_train,
                                               fname="train.in" if not cognates_experiment else None,
                                               exclude_test_sentences=test_set)
        assert num_test == len(test_set) and num_train == len(training_set)
        if cognates_experiment:  # return sets of message/sentence pairs (no need to save them yet)
            return test_set, training_set
        if save_files:
            self.save_lexicon_and_structures_to_csv()

    def generate_sets_for_cognate_experiment(self, num_sentences, percentage_L2, seed=0):
        random.seed(seed)  # change the seed each time we run a new simulation
        # first select cognate-free sentences
        original_test_set, original_training_set = self.generate_sets(num_sentences,
                                                                      percentage_L2,
                                                                      cognates_experiment=True,
                                                                      save_files=False)
        random.shuffle(original_training_set)
        for sentence, message in original_training_set:  # save training set into file
            with codecs.open('%s/%s' % (self.results_dir, "train.in"), 'a', "utf-8") as f:
                f.write(u"%s## %s\n" % (sentence, message))
        # modify test set
        # replace one sentence per word with a cognate
        cognate_sets = self.generate_replacement_test_sets(original_test_set)
        all_test_sets = original_test_set + cognate_sets
        if self.include_ff:
            # replace one sentence per word with a false friend
            false_friend_sets = self.generate_replacement_test_sets(original_test_set, cognates=False)
            all_test_sets += false_friend_sets
        random.shuffle(all_test_sets)
        for sentence, message in all_test_sets:
            with codecs.open('%s/%s' % (self.results_dir, "test.in"), 'a', "utf-8") as f:
                f.write(u"%s## %s\n" % (sentence, message))

    def generate_replacement_test_sets(self, orig_sets, cognates=True):
        """
        :param orig_sets: the sentence/message pairs that need to be modified to include cognates or false friends
        :param cognates: if False, insert false friends instead (default: True)
        :return:
        """
        original_sets = deepcopy(orig_sets)
        if cognates:
            replacement_dict = self.cognates
        else:
            replacement_dict = self.false_friends
        replacement_sets = []
        for sentence, message in original_sets:
            # choose between noun and adjective
            lang = re.search(r";E=(\S.),", message).group(1).lower()
            rep_pos = self.random_choice(['noun', 'adj'])  # , 'verb'])
            if rep_pos == 'adj':
                new_adj = self.random_choice(replacement_dict['adj'])
                candidate_roles = [r for r in message.split(';') if '-MOD' in r]
                role_to_replace = self.random_choice(candidate_roles)
                new_role = role_to_replace.split('=')
                new_role[1] = new_adj.upper()  # replace concept, not thematic role
                # in case of false friends
                if not cognates and lang != 'en':
                    new_role[1] += "_ES"
                message = message.replace(role_to_replace, '='.join(new_role))
                old_role = role_to_replace.split('=')[1]  # take arguments, not role
                old_role = old_role.replace(",FF", "").replace(",COG", "").replace("_ES", "")
                if lang == 'en':
                    sentence = sentence.replace(" %s " % old_role.lower(), " %s " % new_adj)
                    if print_on_screen:
                        print "replace %s with %s" % (old_role, new_adj)
                        print sentence, "\n", message
                else:  # need to look up concept -> word before replacing
                    if old_role in self.concept_to_es_words:
                        word_to_replace = self.concept_to_es_words[old_role]
                    else:
                        word_to_replace = [old_role.lower()]

                    for word in word_to_replace:
                        sentence = sentence.replace(" %s " % word, " %s " % new_adj)
                        if print_on_screen:
                            print "replace %s with %s" % (word, new_adj)
                            print sentence, "\n", message
            elif rep_pos == 'noun':
                ignore = ['-MOD=', 'E=', 'ACTION=']
                candidate_roles = [r for r in message.split(';') if not any(x in r for x in ignore)]
                role_to_replace = self.random_choice(candidate_roles).split('=')[1].split(',')
                concept_idx = int([i for i, j in enumerate(role_to_replace)
                                   if j not in ['F', 'M', 'DEF', 'INDEF']][0])
                word_to_replace = ''
                if lang == 'en':
                    word_to_replace = role_to_replace[concept_idx].lower()
                else:
                    if role_to_replace[concept_idx] in self.concept_to_es_words:
                        list_word_to_replace = self.concept_to_es_words[role_to_replace[concept_idx]]
                    else:
                        list_word_to_replace = [role_to_replace[concept_idx].lower()]
                    # remove "_ES" FIXME
                    list_word_to_replace = [i.replace("_ES", "") for i in list_word_to_replace]
                    for w in list_word_to_replace:
                        if " %s " % w in sentence:
                            word_to_replace = w
                            break
                    if not word_to_replace:
                        print list_word_to_replace, '@@@', sentence, '@@@', role_to_replace, concept_idx
                        sys.exit()

                if 'M' in role_to_replace or 'F' in role_to_replace:  # it means that it's animate
                    gender = [i.lower() for i in role_to_replace if i == 'F' or i == 'M'][0]
                    new_word = self.random_choice(replacement_dict['noun']['animate'][gender])
                else:
                    # find gender of word
                    if lang == 'es':
                        gender = 'm'
                        if word_to_replace in self.lexicon[lang]['noun']['inanimate']['f']:
                            gender = 'f'
                    else:
                        gender = self.random_choice(['m', 'f'])
                    new_word = self.random_choice(replacement_dict['noun']['inanimate'][gender])
                new_role = deepcopy(role_to_replace)
                new_role[concept_idx] = new_word.upper()
                if not cognates and lang != 'en':  # Spanish FF
                    new_role[concept_idx] += "_ES"
                message = message.replace(','.join(role_to_replace) + ',', ','.join(new_role) + ',')
                message = message.replace(','.join(role_to_replace) + ';', ','.join(new_role) + ';')
                if sentence.split().count(word_to_replace) > 1:  # if more than once change all roles
                    message = message.replace(role_to_replace[concept_idx] + ',', new_word.upper() + ',')
                sentence = sentence.replace(" %s " % word_to_replace, " %s " % new_word)
            else:  # verbs
                print 'TODO'

            if cognates:
                message += ',COG'
            else:
                message += ',FF'
            replacement_sets.append((sentence, message))
        return replacement_sets

    def generate_sentence_structures(self, num_sentences, percentage_L2):
        """
        :param num_sentences: number of message/sentence pairs that need to be generated
        :param percentage_L2: percentage of L2 structures
        :return:
        """
        # if percentages are not set, distribute equally
        # calculate structures for L1
        l1_times_repeat = int(round((1 - percentage_L2) * (num_sentences / self.num_structures_L1)))
        l1_mod_repeat = int(round((1 - percentage_L2) * (num_sentences % self.num_structures_L1)))
        # TODO: take percentages into consideration if not set to NaN
        sentence_structures = pandas.concat([self.structures_df[['message', self.L1]]] * l1_times_repeat,
                                            ignore_index=True, sort=False)
        sentence_structures = list(sentence_structures.itertuples(index=False, name=None))
        for i in range(l1_mod_repeat):
            row = random.randint(0, self.num_structures_L1 - 1)  # select random row
            sentence_structures.append((self.structures_df['message'][row], self.structures_df[self.L1][row]))

        sentence_structures = [("%s,%s" % (i[0], self.L1.upper()), i[1]) for i in sentence_structures]
        if self.L2 and percentage_L2 > 0:
            l2_times_repeat = int(round(percentage_L2 * num_sentences / self.num_structures_L2))
            l2_mod_repeat = int(round(percentage_L2 * (num_sentences % self.num_structures_L2)))
            l2_df = pandas.concat([self.structures_df[['message', self.L2]]] * l2_times_repeat,
                                  ignore_index=True, sort=False)
            l2_structures = [("%s,%s" % (i[0], self.L2.upper()), i[1])
                             for i in list(l2_df.itertuples(index=False, name=None))]
            sentence_structures.extend(l2_structures)
            for i in range(l2_mod_repeat):
                row = random.randint(0, self.num_structures_L2 - 1)
                sentence_structures.append((self.structures_df['message'][row]+","+self.L2.upper(),
                                            self.structures_df[self.L2][row]))
        assert num_sentences == len(sentence_structures)
        random.shuffle(sentence_structures)
        return sentence_structures

    def generate_sentences(self, sentence_structures, fname, exclude_test_sentences=[],
                           exclude_cognates=True):
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
            remaining_structures, generated_pairs = self.convert_structures_to_sentences(remaining_structures,
                                                                                         generated_pairs,
                                                                                         exclude_test_sentences,
                                                                                         exclude_cognates,
                                                                                         fname)
        return generated_pairs

    def convert_structures_to_sentences(self, sentence_structures, generated_pairs, exclude_test_sentences,
                                        exclude_cognates, fname):
        sentence_idx = len(generated_pairs)  # keep track of how many sentences we have generated already
        remaining_structures = []
        for msg, pos_full in sentence_structures:
            message = msg.split(';')
            lang = message[-1].split(',')[-1].lower()
            sentence = []
            msg_idx = 0
            for pos in pos_full.split():
                print pos
                morpheme_df = self.select_random_morpheme_for_lang(pos=pos, lang=lang)
                concept = get_df_concept(morpheme_df)
                message[msg_idx] = "%s,%s" % (message[msg_idx], concept) \
                                   if message[msg_idx][-1] != '=' else "%s%s" % (message[msg_idx], concept)
                print morpheme_df.iloc[0][0]
                sentence.append(morpheme_df.iloc[0][0])
                print '!@@@'
                print message
                print sentence
                print '@@@'
            print '---'

            sentence = u"%s ." % " ".join(sentence)
            #unique_roles = [w for w in sentence.split() if w not in self.determiners]
            message = ";".join(message).upper()
            print sentence
            print message
            if sentence_is_unique(message, exclude_test_sentences, generated_pairs):
                generated_pairs.append((sentence, message))
                sentence_idx += 1
                if print_on_screen:
                    print u"%s## %s" % (sentence, message)
                if fname:  # fname is None in the cognate experiment case
                    with codecs.open('%s/%s' % (self.results_dir, fname), 'a', "utf-8") as f:
                        f.write(u"%s## %s\n" % (sentence, message))
            else:  # find unique sentence, don't add it to the training set
                remaining_structures.append((pos_full, msg))
        return remaining_structures, generated_pairs

    def select_random_morpheme_for_lang(self, pos, lang, pos_type=None, gender=None):
        if '::' in pos:
            if pos_type:
                print pos_type
                sys.exit()
            pos, pos_type = pos.split('::')
        query = "pos == '%s'" % pos
        if pos_type == 'animate':
            query = "%s and semantic_gender == semantic_gender" % query
        elif pos_type == 'inanimate':  # checks for NaN
            query = "%s and semantic_gender != semantic_gender" % query
        elif pos_type:
            query = "%s and type == '%s'" % (query, pos_type)
        if gender:
            query = "%s and syntactic_gender_es == '%s'" % (query, gender)
        print '-----', query, '-----'
        w = self.lexicon_df.query(query)
        print w
        # print w[['morpheme_%s' % lang, 'pos_type', 'syntactic_gender_es', 'concept']]
        print w[['morpheme_%s' % lang, 'type', 'syntactic_gender_es', 'concept']]
        return w[['morpheme_%s' % lang, 'type', 'syntactic_gender_es', 'concept']].sample()

    def random_choice(self, options, exclude_cognates=False):
        choice = random.choice(options)
        if exclude_cognates and choice in self.cognate_values+self.false_friends_values:
            return self.random_choice(options, exclude_cognates)
        return choice

    def save_lexicon_and_structures_to_csv(self):
        self.lexicon_df.to_csv('%s/lexicon.csv' % self.results_dir, encoding='utf-8', index=False)
        self.structures_df.to_csv('%s/structures.csv' % self.results_dir, encoding='utf-8', index=False)

    def get_determiners_from_lexicon(self):
        return pandas.unique(self.lexicon_df.query("pos == 'det'")[['morpheme_en', 'morpheme_es']].values.ravel('K'))

    def get_concepts_from_lexicon(self, use_simple_semantics):
        if use_simple_semantics:
            return self.lexicon_df['concept'].dropna().unique()
        return self.lexicon_df['compositional_semantics'].dropna().unique()

    def strip_structure_roles(self):
        # TODO: des an ginetai na allaksei mono to structures_df['message']
        # FIXME: keep it a df
        return [(re.sub(r'|'.join(map(re.escape, [',AGT', ',PAT', ',-1', ',REC'])), '', row[0]),
                row[1], row[2], row[3]) for idx, row in self.structures_df.iterrows()]

    def get_structures(self, structures_csv, sep=",", use_full_verb=False):
        if not os.path.isfile(structures_csv):
            structures_csv = "modules/%s" % structures_csv
        df = pandas.read_csv(structures_csv, sep=sep, header=0)  # first line is the header
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


def get_clean_lexicon(lexicon_csv, include_false_friends, include_cognates):
    if not os.path.isfile(lexicon_csv):
        lexicon_csv = "modules/%s" % lexicon_csv
    df = pandas.read_csv(lexicon_csv, sep=',', header=0)  # first line is the header
    # remove inactive words:
    query = "inactive != 'Y'"
    if not include_false_friends:
        query = "%s and is_false_friend != '1'" % query
    if not include_cognates:
        query = "%s and is_cognate != 'Y'" % query
    return df.query(query)


def sentence_is_unique(message, exclude_test_sentences, generated_pairs):
    if message in ([x[1] for x in exclude_test_sentences+generated_pairs]):
        return False
    return True


def calculate_number_of_sentences_per_set(num_sentences, percentage_test_set=0.2):
    """
    :param num_sentences: Number of sentences that need to be generated
    :param percentage_test_set: default: 20% of sentences are set aside for testing. (80%: training)
    :return: Number of sentences for training and test sets
    """
    num_test = int(percentage_test_set * num_sentences)
    num_train = num_sentences - num_test
    return num_train, num_test


def get_df_concept(morpheme):
    if not morpheme['concept'].isnull().values.any():
        return morpheme['concept'].values[0]
    return morpheme['type'].values[0]

if __name__ == "__main__":
    # store under "generated/" if folder was not specified
    res_dir = "../generated/%s" % datetime.now().strftime("%Y-%m-%dt%H.%M")
    sets = SetsGenerator(results_dir=res_dir, use_full_verb_form=False, use_simple_semantics=True,
                         allow_free_structure_production=False, lang='esen')
    sets.generate_sets(num_sentences=2500, percentage_L2=0.4)
    # sets.generate_sets_for_cognate_experiment(num_sentences=2500, lang='en', save_input_files=True)

# -*- coding: utf-8 -*-
import random
import re
import os
import codecs
from datetime import datetime
import sys
import pickle
import pandas
from copy import deepcopy
from itertools import chain, izip_longest

# TODO: exclude_cognates=True set to False
include_ff = False

reload(sys)
sys.setdefaultencoding("utf-8")  # otherwise Spanish (non-ascii) characters throw an error

print_on_screen = False  # used only to debug, no need to add it as a called parameter


class SetsGenerator:
    def __init__(self, results_dir, use_simple_semantics, allow_free_structure_production, use_full_verb_form,
                 seed=0, lang='enes', lexicon_csv='corpus/lexicon.csv', structures_csv='corpus/structures.csv'):
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
        self.lexicon_df = get_clean_lexicon(lexicon_csv, include_false_friends=include_ff)
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
        self.target_lang = []
        self.num_structures = None
        # TODO: automate
        self.event_sem = ['PROG', 'SIMPLE', 'PRESENT', 'PAST', 'AGT', 'PAT', 'REC']
        self.roles = ['AGENT', 'PATIENT', 'ACTION', 'RECIPIENT', 'AGENT-MOD', 'PATIENT-MOD']
        if allow_free_structure_production:
            self.event_sem = [evsem for evsem in self.event_sem if evsem not in ['AGT', 'PAT', 'REC']]
            self.structures_df = self.strip_structure_roles()  # FIXME: alt to keep it a df

    def generate_sets(self, num_sentences, percentage_L2=0.5, cognates_experiment=False,
                      save_files=False):
        """
        :param num_sentences: number of training AND test sentences to be generated
        :param cognates_experiment: (if True) include cognates and ff only in training sets
        :param percentage_L2: percentage of L2 (e.g., English) vs L1
        :param save_files: whether to save lexicon/concepts etc or just training/test sets
        """
        if not cognates_experiment:
            # (re)set the seed if it's not part of the cognate experiment (where this function is called twice)
            random.seed(self.seed)

        num_train, num_test = calculate_number_of_sentences_per_set(num_sentences)
        sentence_structures_train = self.generate_sentence_structures(num_train, percentage_L2=percentage_L2)
        sentence_structures_test = self.generate_sentence_structures(num_test, percentage_L2=percentage_L2)

        """if cognates_experiment:
            test_set = self.generate_sentences(sentence_structures_test, fname=None,
                                               exclude_cognates=True)
            training_set = self.generate_sentences(sentence_structures_train, fname=None,
                                                   exclude_test_sentences=test_set)

        else:"""
        test_set = self.generate_sentences(sentence_structures_test, fname="test.in")
        self.generate_sentences(sentence_structures_train, fname="train.in", exclude_test_sentences=test_set)

        assert num_test == len(test_set)
        # TODO: Save files here?
        if cognates_experiment:  # return sets of message/sentence pairs
            return test_set, training_set

    def generate_sets_for_cognate_experiment(self, num_sentences, save_input_files=False, seed=0):
        random.seed(seed)  # we might want to change the seed each time we run a new simulation
        # first select cognate-free sentences
        original_test_set, original_training_set = self.generate_sets(num_sentences,
                                                                      cognates_experiment=True)
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
        print self.structures_df
        # if percentages are not set, distribute equally
        sentence_structures = []

        # calculate percentage L2
        # (1 - percentage_L2) *  - num_sentences / self.num_structures

        for i in range(num_sentences / self.num_structures):
            sentence_structures += deepcopy(self.structures)
        # runs if sentence_structures < num_sentences (missing num_sentences % self.num_structures sentences)
        for m in range(num_sentences % self.num_structures):
            sentence_structures.append(deepcopy(self.structures[random.randint(0, self.num_structures - 1)]))


        random.shuffle(sentence_structures)
        return sentence_structures

    def generate_sentences(self, sentence_structures, fname, exclude_test_sentences=[],
                           exclude_cognates=True):
        """
        :param sentence_structures: list of allowed structures for the generated sentences
        :param fname: filename where results will be stored
        :param exclude_test_sentences: list of sentences to exclude (test set needs to contain novel messages only)
        :param exclude_cognates: whether to exclude cognates from the lexicon
        :return: list of generated pairs (sentence, message)
        """
        num_sentences = len(sentence_structures)

        # determine how often we will use NPs vs determiners
        if not self.percentage_noun_phrase:  # use pronouns only
            use_noun_phrase = [0] * num_sentences
        else:  # any other percentage
            number_np = num_sentences * self.percentage_noun_phrase / 100
            use_noun_phrase = number_np * [1] + (num_sentences - number_np) * [0]
            random.shuffle(use_noun_phrase)

        # if add_filler:  # adds filler to both languages
        #    for s in range(num_sentences):
        #        sentence_structures[s][0] = "filler %s" % sentence_structures[s][0]

        # we can keep track of training sentences (messages) that are identical to test ones and exclude them
        generated_pairs = []
        # now select words according to structure
        remaining_structures = sentence_structures
        while remaining_structures:
            remaining_structures, generated_pairs = self.convert_messages_to_sentences(remaining_structures,
                                                                                       generated_pairs,
                                                                                       exclude_test_sentences,
                                                                                       use_noun_phrase,
                                                                                       exclude_cognates,
                                                                                       fname)
        return generated_pairs

    def convert_messages_to_sentences(self, sentence_structures, generated_pairs, exclude_test_sentences,
                                      use_noun_phrase, exclude_cognates, fname):
        sentence_idx = len(generated_pairs)  # keep track of how many sentences we have generated already
        remaining_structures = []
        for pos_full, msg in sentence_structures:
            message = msg.split(';')
            lang = re.search(r"^E=(\S.)", message[-1]).group(1).lower()
            if self.add_filler and lang == 'es' and 'filler' not in pos_full:  # FIXME: why was filler already in pos_full even though I deepcopy?
                pos_full = "filler %s" % deepcopy(pos_full)
            sentence = []
            msg_idx = 0
            add_det = False
            gender = None
            for pos in pos_full.split():
                if '::' in pos:
                    if len(pos.split('::')) == 2:
                        part, level = pos.split("::")
                        syn = self.lexicon[lang][part][level]
                    else:
                        part, level, sublevel = pos.split("::")
                        syn = self.lexicon[lang][part][level][sublevel]
                else:
                    level = ''
                    syn = self.lexicon[lang][pos]

                if type(syn) is dict:
                    random_key = self.random_choice(syn.keys())
                    if not level and 'animate' in random_key:  # this also includes INanimate
                        level = random_key
                    if pos == 'det':
                        message[msg_idx] += "," + random_key  # def/indef info
                        determiners = syn[random_key]
                    elif random_key in ['past', 'present']:
                        if self.ignore_past_tense:
                            random_key = 'present'
                        message[-1] += "," + random_key
                    elif random_key in self.genders:
                        random_key = gender  # gender = random_key

                    if len(syn) == 1 and syn.keys()[0] in self.genders:
                        gender = syn.keys()[0]
                        random_key = gender

                    if random_key not in syn:
                        random_key = self.random_choice(syn.keys(), exclude_cognates=exclude_cognates)
                        gender = random_key
                    w = syn[random_key]

                    if type(w) is dict:
                        random_key = self.random_choice(w.keys(), exclude_cognates=exclude_cognates)
                        if random_key in self.genders:
                            gender = random_key
                        if type(w[random_key]) is list:
                            wd = self.random_choice(w[gender], exclude_cognates=exclude_cognates)
                            if level == 'animate':  # include semantic gender, we can decide later whether to use it
                                message[msg_idx] += "," + gender.upper()
                            if not use_noun_phrase[sentence_idx] and msg_idx == 0:  # go for pronoun (instead of NP)
                                message[0] = re.sub(r"def|indef", "", message[0]) + "PRON"  # remove def/indef info
                                # add pronoun
                                sentence.append(self.lexicon[lang]['pron'][gender])
                            elif add_det or use_noun_phrase[sentence_idx] or msg_idx > 0:
                                if type(determiners) is dict:
                                    sentence.append(determiners[gender])
                                add_det = False  # reset
                                sentence.append(wd)
                            message[msg_idx] += "," + self.get_concept(wd, lang)
                            msg_idx += 1
                        else:
                            add_det = True
                    elif type(w) is list:
                        random_word = self.random_choice(w, exclude_cognates=exclude_cognates)
                        if "AGENT-MOD=" in message and part == "adj":
                            message[message.index("AGENT-MOD=")] += ",%s" % self.get_concept(random_word, lang)
                        else:
                            message[msg_idx] += "," + self.get_concept(random_word, lang)  # nouns
                        if level == 'animate' and 'noun' in pos:  # include semantic gender, we can discard it later
                            message[msg_idx] += "," + gender.upper()
                        if not use_noun_phrase[
                            sentence_idx] and msg_idx == 0 and 'noun' in pos:  # go for pronoun (instead of NP)
                            message[0] = re.sub(r"def|indef", "", message[0]) + ",PRON"
                            add_det = False
                            # add pronoun
                            sentence.append(self.lexicon[lang]['pron'][gender])
                        elif add_det:
                            sentence.append(determiners[gender])
                            add_det = False  # reset
                            sentence.append(random_word)
                        elif use_noun_phrase[sentence_idx]:
                            if add_det:
                                sentence.append(determiners[gender])
                                add_det = False  # reset
                            sentence.append(random_word)
                        elif not use_noun_phrase[sentence_idx] and msg_idx > 0:
                            sentence.append(random_word)
                        if (((lang == 'es' and 'adj' in pos and 'with' not in pos_full) or
                                                         (
                                                                                 lang == 'en' and 'noun' in pos and 'with' not in pos_full and msg_idx < 1))):
                            msg_idx += 2
                        elif 'verb' in pos or (msg_idx > 1 and lang == 'es') or \
                                (lang == 'en' and 'noun' in pos) or (lang == 'es' and 'adj' in pos):
                            msg_idx += 1
                    else:  # elif type == str
                        if not use_noun_phrase[sentence_idx] and w == determiners and msg_idx < 1:
                            continue
                        sentence.append(w)
                elif type(syn) is list:
                    if add_det:
                        det = determiners if gender not in determiners else determiners[gender]
                        sentence.append(det)
                        add_det = False

                    random_word = self.random_choice(syn, exclude_cognates=exclude_cognates)
                    if "AGENT-MOD=" in message and part == "adj":
                        message[message.index("AGENT-MOD=")] += ",%s" % self.get_concept(random_word, lang)
                    else:
                        message[msg_idx] += self.get_concept(random_word,
                                                             lang)  # '%s%s' % ("," if part == "adj" else "", self.get_concept(random_word))  # verb

                    if 'verb' in pos:
                        msg_idx += 1
                    if part != 'adj' or (part == 'adj' and not (not use_noun_phrase[sentence_idx] and msg_idx == 0)):
                        sentence.append(random_word)
                else:
                    sentence.append(syn)

            sentence = u"%s ." % " ".join(sentence)
            unique_roles = [w for w in sentence.split() if w not in self.determiners]
            message = ";".join(message).upper()
            message = re.sub(r",,", ",", message)
            message = re.sub(r"=,", "=", message)
            if sentence_is_unique(message, exclude_test_sentences, generated_pairs, unique_roles):
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

    def random_choice(self, options, exclude_cognates=False):
        choice = random.choice(options)
        if exclude_cognates and choice in self.cognate_values+self.false_friends_values:
            return self.random_choice(options, exclude_cognates)
        return choice

    def save_lexicon(self):
        all_structures = set([pos[0] for pos in self.structures])
        all_pos = set(chain.from_iterable([pos.split() for pos in all_structures]))
        main_pos = set([p.split('::')[0] if '::' in p else p for p in all_pos])  # get rid of animate/inanimate info etc
        if 'pron' not in main_pos:
            main_pos.add('pron')
        if 'with' not in main_pos:
            main_pos.add('with')

        unique_dict = []
        for lang in self.target_lang:  # keep separate for now because of code-switching
            for pos in main_pos:
                lex = list(get_dict_items(pos, self.lexicon[lang.lower()]))
                if any(isinstance(i, list) for i in lex):
                    lex = list(chain.from_iterable(lex))
                    # add cognates and ffs but avoid duplicate words
                    lex = set([v for v in lex if v not in unique_dict])
                    unique_dict.extend(lex)
                with codecs.open('%s/lexicon.in' % self.results_dir, 'a', "utf-8") as f:
                    f.write("{0}:\n{1}\n".format(pos.upper(), "\n".join(lex)))

    def _add_cognates_to_concepts(self):
        for v in self.cognate_values:
            self.concepts.update({v: v.upper()})

    def _add_false_friends_to_concepts(self):
        for v in self.false_friends_values:
            self.concepts_en.update({v: v.upper()})
            self.concepts_es.update({v + "_ES": v.upper() + "_ES"})

    def _reverse_lexicon_to_concept(self):
        concept_to_es_words = {}  # use
        for revkey, revvalue in self.concepts.iteritems():
            if revkey != revvalue.lower():
                if revvalue in concept_to_es_words:
                    concept_to_es_words[revvalue].append(revkey)
                else:
                    concept_to_es_words[revvalue] = [revkey]
        return concept_to_es_words

    def get_determiners_from_lexicon(self):
        return pandas.unique(self.lexicon_df.query("pos == 'det'")[['morpheme_en', 'morpheme_es']].values.ravel('K'))

    def get_concepts_from_lexicon(self, use_simple_semantics):
        if use_simple_semantics:
            return self.lexicon_df['concept'].dropna().unique()
        return self.lexicon_df['compositional_semantics'].dropna().unique()

    def strip_structure_roles(self):
        return [(re.sub(r'|'.join(map(re.escape, [',AGT', ',PAT', ',-1', ',REC'])), '', row[0]),
                row[1], row[2], row[3]) for idx, row in self.structures_df.iterrows()]
        #print structures
        #print re.sub(r'|'.join(map(re.escape, [',AGT', ',PAT', ',-1', ',REC'])), '', structures_df['message'])

    def get_structures(self, structures_csv, sep=",", use_full_verb=False):
        if not os.path.isfile(structures_csv):
            structures_csv = "modules/%s" % structures_csv
        df = pandas.read_csv(structures_csv, sep=sep, header=0)  # first line is the header
        query = "inactive != 'Y'"
        structures = df.query(query)
        keys = ['message', 'percentage']
        if use_full_verb:
            if 'es' in self.lang:
                keys.append('full_verb_es')
            if 'en' in self.lang:
                keys.append('full_verb_en')
        else:  # return structures that split morpheme-suffix
            if 'es' in self.lang:
                keys.append('pos_es')
            if 'en' in self.lang:
                keys.append('pos_en')
        return structures[keys]


def get_clean_lexicon(lexicon_csv, include_false_friends):
    if not os.path.isfile(lexicon_csv):
        lexicon_csv = "modules/%s" % lexicon_csv
    df = pandas.read_csv(lexicon_csv, sep=',', header=0)  # first line is the header
    # remove inactive words:
    query = "inactive != 'Y'"
    if not include_false_friends:
        query = "%s and is_false_friend != 'Y'" % query
    return df.query(query)


def sentence_is_unique(message, exclude_test_sentences, generated_pairs, unique_roles):
    if message in ([x[1] for x in exclude_test_sentences+generated_pairs]) or \
                    len(unique_roles) != len(set(unique_roles)):
        return False
    return True


def read_structures(fname):
    structures = []
    with open(fname) as f:
        for pos, msg in izip_longest(*[f] * 2):
            structures.append((pos.rstrip(), msg.rstrip()))
    return structures


def write_structures(fname, structures):
    with open(fname, 'w') as f:
        for i in structures:
            f.write("%s\n%s\n" % (i[0], i[1]))


def calculate_number_of_sentences_per_set(num_sentences):
    num_test = int(20 * num_sentences / 100)  # Test set = 20% of whole set, training 80%
    num_train = num_sentences - num_test
    return num_train, num_test


if __name__ == "__main__":
    # store under "generated/" if folder was not specified
    res_dir = "../generated/%s" % datetime.now().strftime("%Y-%m-%dt%H.%M")
    sets = SetsGenerator(results_dir=res_dir, use_full_verb_form=False, use_simple_semantics=True,
                         allow_free_structure_production=False, lang='en')
    #sets.generate_sets_for_cognate_experiment(num_sentences=2500, lang='en', save_input_files=True)
    sets.generate_sets(num_sentences=2500)

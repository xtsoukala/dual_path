# -*- coding: utf-8 -*-
import random
import re
import os
import codecs
from datetime import datetime
import sys

reload(sys)
sys.setdefaultencoding("utf-8")  # otherwise Spanish (non-ascii) characters throw an error


class SetsGenerator:
    """
    Overly complicated and ugly class to generate sentence/meaning pairs for the Dual-path model.
    Read at own risk :P (To be refactored)
    """
    def __init__(self, results_dir=None):
        if results_dir:
            self.results_dir = results_dir
        else:  # store under "generated/" if folder was not specified
            self.results_dir = "../generated/%s" % datetime.now().strftime("%Y-%m-%dt%H.%M")

        if os.path.isdir(self.results_dir):
            self.results_dir += datetime.now().strftime(".%S")
            os.makedirs(self.results_dir)
        else:  # create if it doesn't exist
            os.makedirs(self.results_dir)

        self.lexicon = {}
        # Write the lexicon in a dict. Alternatively, we can load files but splitting is more efficient at this point.
        self.lexicon_en = {'en': {'det': {'def': 'the', 'indef': 'a'},
                                  'pron': {'m': 'he', 'f': 'she', 'n': 'it', 'c': ['he', 'she']},
                                  'noun': {
                                      'animate': {'m': 'man boy father brother dog teacher actor grandfather husband '
                                                       'host nephew policeman son uncle waiter bull'.split(),
                                                  'f': 'woman girl mother sister cat nurse actress grandmother wife '
                                                       'hostess niece policewoman daughter aunt waitress cow'.split(),
                                                  },
                                      'inanimate': {'n': 'ball stick toy kite key bag balloon'.split()}
                                      },
                                  'verb': {'intrans': 'swim jump walk run arrive lie sneeze sit die eat'.split(),
                                           'trans': 'push hit kick carry'.split(),
                                           'double': 'give throw show present'.split()},
                                  'aux': {'singular': {'present': 'is', 'past': 'was'},
                                          'plural': {'present': 'are', 'past': 'were'},
                                          },
                                  'being': 'being',
                                  'ing': '-ing',
                                  'verb_suffix': {'present': '-s', 'past': '-ed'},
                                  'by': 'by',
                                  'to': 'to',
                                  'per': '.',
                                  'par': '-par'}  # , 'noun_plural': '-ss'}
                           }

        self.lexicon_es = {'es': {'det': {'def': {'m': 'el', 'f': 'la'},
                                          'indef': {'m': 'un', 'f': 'una'},
                                         },
                                  'pron': {'m': 'él', 'f': 'ella'},
                                  'noun': {'animate': {'m': 'niño padre hermano perro maestro actor abuelo esposo '
                                                            'sobrino policía hijo tío camarero toro'.split(),
                                                       'f': 'mujer niña madre hermana gata enfermera actríz abuela '
                                                            'esposa sobrina policía hija tía camarera vaca'.split()},
                                           'inanimate': {'m': 'palo juguete bolso'.split(),
                                                         'f': 'pelota llave cometa'.split()}
                                           },
                                  'verb': {'intrans': 'nad salt camin corr dorm'.split(),
                                           'trans': 'empuj golpe pate llev'.split(),
                                           'double': 'd tir mostr present_'.split()},
                                  'aux': {'singular': {'present': 'está', 'past': 'estaba'},
                                          'plural': {'present': 'están', 'past': 'estaban'},
                                          },
                                  'ing': '-ando',
                                  'verb_suffix': {'present': '-a', 'past': '-ó'},
                                  'by': 'por',
                                  'to': 'a_',
                                  'per': '.',
                                  'par': '_par'}  # ,'noun_plural': '-ss'}
                           }

        self.lexicon_el = {'el': {'det': {'def': {'m': 'ο', 'f': 'η', 'n': 'το'},
                                          'indef': {'m': 'ένας', 'f': 'μία', 'n': 'ένα'}},
                                  'det-acc': {'m': 'τον', 'f': 'την', 'n': 'το'},
                                  'pron': {'m': 'αυτός', 'f': 'αυτή', 'n': 'αυτό'},
                                  'noun': {
                                      'animate': {'m': 'άντρας πατέρας αδερφός σκύλος'.split(),
                                                  'f': 'γυναίκα  μητέρα αδερφή γάτα'.split(),
                                                  'n': 'αγόρι κορίτσι'.split()
                                                  },
                                      'inanimate': {'f': 'μπάλα τσάντα'.split(),
                                                    'n': 'παιχνίδι κλειδί'.split(),
                                                    'm': 'χαρταετός λοστός'.split()}
                                  },
                                  'verb': {'intrans': 'κολυμπά πηδά περπατά τρέχ'.split(),
                                           'trans': 'σπρώχν χτυπά κλωτσά κουβαλά'.split(),
                                           'double': 'δίν πετά δείχν παρουσιάζ'.split()},
                                  'aux': {'singular': {'present': 'είναι', 'past': 'ήταν'},
                                          'plural': {'present': 'είναι-', 'past': 'ήταν-'}},
                                  'verb_suffix': {'present': '-ει', 'past': '-γε'},
                                  'by': 'από',
                                  'to': 'σ-',
                                  'per': '.',
                                  'par': '-ται'}  # , 'noun_plural': '-ss'}
                           }

        self.identifiability = ['DEF', 'INDEF', 'PRON', 'EMPH']
        # semantic gender, which is a non language-specific concept.
        # The syntactic genders "N(eutral" and "C(ommon)" are not included
        self.concepts = {'M': 'M', 'F': 'F'}
        # note that sister = SIBLING + F, brother = SIBLING + M, etc
        self.concepts_en = {'sister': 'SIBLING', 'brother': 'SIBLING', 'boy': 'CHILD', 'girl': 'CHILD',
                            'mother': 'PARENT', 'father': 'PARENT',  'daughter': 'OFFSPRING', 'son': 'OFFSPRING',
                            'policewoman': 'POLICEMAN', 'policeman': 'POLICEMAN', 'actress': 'ACTOR', 'actor': 'ACTOR',
                            'wife': 'PARTNER', 'husband': 'PARTNER', 'hostess': 'HOST', 'host': 'HOST',
                            'grandmother': 'GRANDPARENT', 'grandfather': 'GRANDPARENT',
                            'waitress': 'WAITER', 'waiter': 'WAITER', 'aunt': 'UNCLES', 'uncle': 'UNCLES',
                            'nephew': 'NIBLING', 'niece': 'NIBLING', 'woman': 'HUMAN', 'man': 'HUMAN',
                            'nurse': 'NURSE',
                            'cat': 'CAT',
                            'dog': 'DOG',
                            'teacher': 'TEACHER',
                             'give': 'GIVE',
                             'carry': 'CARRY',
                             'kick': 'KICK',
                             'run': 'RUN',
                             'throw': 'THROW',
                             'swim': 'SWIM',
                             'walk': 'WALK',
                             'jump': 'JUMP',
                             'show': 'SHOW',
                             'present': 'PRESENT',
                             'hit': 'HIT',
                             'push': 'PUSH',
                             'bag': 'BAG',
                             'ball': 'BALL',
                             'kite': 'KITE',
                             'toy': 'TOY',
                             'stick': 'STICK',
                             'key': 'KEY',
                             'balloon': 'BALLOON',
                            'sit': 'SIT',
                            'sneeze': 'SNEEZE',
                            'lie': 'LIE',
                            'cow': 'COW',
                            'eat': 'EAT',
                            'arrive': 'ARRIVE',
                            'bull': 'BULL',
                            'die': 'DIE'
                            }

        self.concepts_es = {'hermana': 'SIBLING', 'hermano': 'SIBLING', 'ni\xc3\xb1o': 'CHILD', 'ni\xc3\xb1a': 'CHILD',
                            'madre': 'PARENT', 'padre': 'PARENT',  'hija': 'OFFSPRING', 'hijo': 'OFFSPRING',
                            'policía': 'POLICEMAN', 'policía': 'POLICEMAN', 'actriz': 'ACTOR', 'actor': 'ACTOR',
                            'esposa': 'PARTNER', 'esposo': 'PARTNER', 'actríz': 'ACTOR',
                            'abuela': 'GRANDPARENT', 'abuelo': 'GRANDPARENT',
                            'camarera': 'WAITER', 'camarero': 'WAITER', 'tía': 'UNCLES', 'tío': 'UNCLES',
                            'sobrino': 'NIBLING', 'sobrina': 'NIBLING', 'mujer': 'HUMAN', 'hombre': 'HUMAN',
                            'vaca': 'COW', 'toro': 'COW',
                            'gata': 'CAT',
                            'enfermera': 'NURSE', 'd': 'GIVE',
                            'bolso': 'BAG', 'cometa': 'KITE', 'juguete': 'TOY', 'gato': 'CAT',
                            'perro': 'DOG', 'palo': 'STICK', 'llave': 'KEY', 'maestro': 'TEACHER',
                            'pelota': 'BALL', 'present_': 'PRESENT', 'salt': 'JUMP', 'mostr': 'SHOW', 'pate': 'KICK',
                            'dorm': 'SLEEP', 'empuj': 'PUSH', 'tir': 'THROW', 'corr': 'RUN',
                            'camin': 'WALK', 'llev': 'CARRY', 'golpe': 'HIT', 'nad': 'SWIM', 'globo': 'BALLOON'}

        self.concepts_el = {'σκυλί': 'DOG',
                            'κουβαλά': 'CARRY',
                            'άντρας': 'MAN',
                            'γατί': 'CAT',
                            'πετά': 'THROW',
                            'μητέρα': 'MOTHER',
                            'τσάντα': 'BAG',
                            'κορίτσι': 'GIRL',
                            'αδερφός': 'BROTHER',
                            'πατέρας': 'FATHER',
                            'παρουσιάζ': 'PRESENT',
                            'κλειδί': 'KEY',
                            'δείχν': 'SHOW',
                            'αδερφή': 'SISTER',
                            'αγόρι': 'BOY',
                            'τρέχ': 'RUN',
                            'δίν': 'GIVE',
                            'χτυπά': 'HIT',
                            'πηδά': 'JUMP',
                            'μπάλα': 'BALL',
                            'περπατά': 'WALK',
                            'σπρώχν': 'PUSH',
                            'γάτα': 'CAT',
                            'παιχνίδι': 'TOY',
                            'γυναίκα': 'WOMAN',
                            'σκύλος': 'DOG',
                            'κλωτσά': 'KICK',
                            'κοιμάμαι': 'SLEEP',
                            'λοστός': 'STICK',
                            'χαρταετός': 'KITE',
                            'κολυμπά': 'SWIM'}

        self.event_sem = ['PROG', 'SIMPLE', 'PRESENT', 'PAST']
        self.target_lang = ['EN', 'ES']  # , 'EL']
        self.roles = ['AGENT', 'PATIENT', 'ACTION', 'RECIPIENT']
        # how to indicate plural agent etc?
        """self.structures_en = [('det noun::animate aux::singular verb::intrans ing', 'AGENT=;ACTION=;E=EN,PROG,AGT'),
                              # ('det::def noun::animate noun_plural aux::plural verb::intrans ing',
                              # 'AGENT=;ACTION=;E=EN,PROG'),
                              # ('det::def noun::animate noun_plural verb::intrans',
                              # 'AGENT=;ACTION=;E=EN,SIMPLE,PRESENT'),
                              ('det noun::animate verb::intrans verb_suffix', 'AGENT=;ACTION=;E=EN,SIMPLE,AGT'),

                              ('det noun::animate aux::singular verb::trans ing det noun',
                               'AGENT=;ACTION=;PATIENT=;E=EN,PROG,AGT,PAT'),
                              # ('det::def noun::animate noun_plural aux::plural verb::trans ing det noun',
                              # 'AGENT=;ACTION=;PATIENT=;E=EN,PROG,PAT'),
                              # ('det::def noun::animate noun_plural verb::trans det noun',
                              # 'AGENT=;ACTION=;PATIENT=;E=EN,SIMPLE,PRESENT,PAT'),
                              ('det noun::animate verb::trans verb_suffix det noun',
                               'AGENT=;ACTION=;PATIENT=;E=EN,SIMPLE,AGT,PAT'),

                              ('det noun::animate aux::singular verb::double ing '
                              'det noun::inanimate to det noun::animate',
                              'AGENT=;ACTION=;PATIENT=;RECIPIENT=;E=EN,PROG,PAT,-1,REC'),
                              #'AGENT=;ACTION=;PATIENT=;RECIPIENT=;E=EN,PROG,PAT,REC'),
                              ('det noun::animate aux::singular verb::double ing det noun::animate det noun::inanimate',
                               'AGENT=;ACTION=;RECIPIENT=;PATIENT=;E=EN,PROG,AGT,PAT,REC'),
                              # ('det::def noun::animate noun_plural aux::plural verb::trans ing det noun',
                              # 'AGENT=;ACTION=;PATIENT=;E=EN,PROG,PAT'),
                              # ('det::def noun::animate noun_plural verb::trans det noun',
                              # 'AGENT=;ACTION=;PATIENT=;E=EN,SIMPLE,PRESENT,PAT'),
                              ('det noun::animate verb::double verb_suffix det noun::inanimate to det noun::animate',
                               'AGENT=;ACTION=;PATIENT=;RECIPIENT=;E=EN,SIMPLE,PAT,-1,REC'),
                              #'AGENT=;ACTION=;PATIENT=;RECIPIENT=;E=EN,SIMPLE,PAT,REC'),
                              ('det noun::animate verb::double verb_suffix det noun::animate det noun::inanimate',
                               'AGENT=;ACTION=;RECIPIENT=;PATIENT=;E=EN,SIMPLE,AGT,PAT,REC'),

                              #!('det noun aux::singular verb::trans par by det noun::animate',
                              # !'PATIENT=;ACTION=;AGENT=;E=EN,SIMPLE,-1,AGT,PAT')
                             ]"""

        self.structures_en = [('det noun::animate aux::singular verb::intrans ing', 'AGENT=;ACTION=;E=EN,PROG'),
                              ('det noun::animate verb::intrans verb_suffix', 'AGENT=;ACTION=;E=EN,SIMPLE'),
                              ('det noun::animate aux::singular verb::trans ing det noun',
                               'AGENT=;ACTION=;PATIENT=;E=EN,PROG'),
                              ('det noun::animate verb::trans verb_suffix det noun',
                               'AGENT=;ACTION=;PATIENT=;E=EN,SIMPLE'),
                              ('det noun::animate aux::singular verb::double ing '
                               'det noun::inanimate to det noun::animate',
                               'AGENT=;ACTION=;PATIENT=;RECIPIENT=;E=EN,PROG'),
                              ('det noun::animate aux::singular verb::double ing det noun::animate det noun::inanimate',
                               'AGENT=;ACTION=;RECIPIENT=;PATIENT=;E=EN,PROG'),
                              ('det noun::animate verb::double verb_suffix det noun::inanimate to det noun::animate',
                               'AGENT=;ACTION=;PATIENT=;RECIPIENT=;E=EN,SIMPLE'),
                              ('det noun::animate verb::double verb_suffix det noun::animate det noun::inanimate',
                               'AGENT=;ACTION=;RECIPIENT=;PATIENT=;E=EN,SIMPLE'),
                              ]

        self.structures_es = [('det noun::animate aux::singular verb::intrans ing', 'AGENT=;ACTION=;E=ES,PROG'),
                              ('det noun::animate verb::intrans verb_suffix', 'AGENT=;ACTION=;E=ES,SIMPLE'),
                              ('det noun::animate aux::singular verb::trans ing det noun',
                               'AGENT=;ACTION=;PATIENT=;E=ES,PROG'),
                              ('det noun::animate verb::trans verb_suffix det noun',
                               'AGENT=;ACTION=;PATIENT=;E=ES,SIMPLE'),
                              ('det noun::animate aux::singular verb::double ing '
                               'det noun::inanimate to det noun::animate',
                               'AGENT=;ACTION=;PATIENT=;RECIPIENT=;E=ES,PROG'),
                              ('det noun::animate aux::singular verb::double ing '
                               'to det noun::animate det noun::inanimate',
                               'AGENT=;ACTION=;RECIPIENT=;PATIENT=;E=ES,PROG'),
                              ('det noun::animate verb::double verb_suffix det noun::inanimate to det noun::animate',
                               'AGENT=;ACTION=;PATIENT=;RECIPIENT=;E=ES,SIMPLE'),
                              ('det noun::animate verb::double verb_suffix to det noun::animate det noun::inanimate',
                               'AGENT=;ACTION=;RECIPIENT=;PATIENT=;E=ES,SIMPLE')
                              ]

        self.structures_el = [# ('det::def noun::animate noun_plural aux::plural verb::intrans ing',
                              # 'AGENT=;ACTION=;E=EN,PROG'),
                              # ('det::def noun::animate noun_plural verb::intrans',
                              # 'AGENT=;ACTION=;E=EN,SIMPLE,PRESENT'),
                              ('det noun::animate verb::intrans verb_suffix', 'AGENT=;ACTION=;E=EL,AGT,SIMPLE'),

                              # ('det::def noun::animate noun_plural aux::plural verb::trans ing det noun',
                              # 'AGENT=;ACTION=;PATIENT=;E=EN,PROG,PAT'),
                              # ('det::def noun::animate noun_plural verb::trans det noun',
                              # 'AGENT=;ACTION=;PATIENT=;E=EN,SIMPLE,PRESENT,PAT'),
                              ('det noun::animate verb::trans verb_suffix det-acc noun',
                               'AGENT=;ACTION=;PATIENT=;E=EL,SIMPLE,AGT,PAT'),

                              # ('det::def noun::animate noun_plural aux::plural verb::trans ing det noun',
                              # 'AGENT=;ACTION=;PATIENT=;E=EN,PROG,PAT'),
                              # ('det::def noun::animate noun_plural verb::trans det noun',
                              # 'AGENT=;ACTION=;PATIENT=;E=EN,SIMPLE,PRESENT,PAT'),
                              ('det noun::animate verb::double verb_suffix det-acc noun::inanimate '
                               'to det-acc noun::animate',
                               'AGENT=;ACTION=;PATIENT=;RECIPIENT=;E=EL,SIMPLE,AGT,PAT,-1,REC'),
                              #'AGENT=;ACTION=;PATIENT=;RECIPIENT=;E=ES,SIMPLE,AGT,PAT,REC'),
                              ('det noun::animate verb::double verb_suffix to det-acc noun::animate '
                               'det-acc noun::inanimate',
                               'AGENT=;ACTION=;RECIPIENT=;PATIENT=;E=EL,SIMPLE,AGT,PAT,REC'),

                              #('det noun verb::trans par by det-acc noun::animate',
                              # 'PATIENT=;ACTION=;AGENT=;E=EL,SIMPLE,-1,AGT,PAT')
                              ]

    def generate_sets(self, num_sentences, lang, include_bilingual_lex, percentage_pronoun, percentage_l2=50,
                      print_sets=False):
        """
        :param num_sentences: number of train AND test sentences to be generated
        :param lang: language code, leave None for bilingual es-en
        :param include_bilingual_lex: whether lexicon should be bilingual even if generated sentences are in L1
        :param percentage_pronoun: percentage of pronouns vs Noun Phrases (NPs)
        :param percentage_l2: percentage of L2 (usually English) vs L1
        :param print_sets:
        :return:
        """
        if lang.lower() == 'es':
            structures = self.structures_es
            self.lexicon = self.lexicon_es
        elif lang.lower() == 'en':
            structures = self.structures_en
            self.lexicon = self.lexicon_en
        elif lang == 'el':
            structures = self.structures_el
            self.lexicon = self.lexicon_el
        elif "el" in lang and "en" in lang:
            structures = self.structures_en + self.structures_el
            self.lexicon = self.lexicon_en.copy()
            self.lexicon.update(self.lexicon_el)
        else:  # the default mode is the Bilingual English-Spanish model
            structures = self.structures_en + self.structures_es
            self.lexicon = self.lexicon_en.copy()
            self.lexicon.update(self.lexicon_es)

        # Use ALL concepts (there shouldn't be [m]any unique items)
        self.concepts.update(self.concepts_es)
        self.concepts.update(self.concepts_en)
        self.concepts.update(self.concepts_el)

        n = len(structures)
        # First find how many of each structures we will have. Test = 20% of train set
        num_test = int(0.20 * num_sentences)
        num_train = num_sentences - num_test

        # now generate sentence types for train set
        sentence_structures_train = structures * (num_train / n)
        for m in range(num_train % n):
            sentence_structures_train.append(structures[random.randint(0, n - 1)])
        random.shuffle(sentence_structures_train)

        # same for test set (we want sets to be homogeneous when it comes to structures)
        sentence_structures_test = structures * (num_test / n)
        for m in range(num_test % n):
            sentence_structures_test.append(structures[random.randint(0, n - 1)])
        random.shuffle(sentence_structures_test)

        test_set = self.generate_sentences(sentence_structures_test, self.lexicon, fname="test.%s" % lang,
                                           percentage_pronoun=percentage_pronoun, print_sets=print_sets,
                                           return_mess=True)
        self.generate_sentences(sentence_structures_train, self.lexicon, fname="train.%s" % lang, print_sets=print_sets,
                                percentage_pronoun=percentage_pronoun, exclude_test_sentences=test_set)

        with codecs.open('%s/identifiability.in' % self.results_dir, 'w',  "utf-8") as f:
            f.write("%s" % "\n".join(self.identifiability))

        with codecs.open('%s/concepts.in' % self.results_dir, 'w',  "utf-8") as f:
            f.write("%s" % "\n".join(set(self.concepts.values())).encode("utf-8"))

        with open('%s/event_sem.in' % self.results_dir, 'w') as f:
            f.write("%s" % "\n".join(self.event_sem))

        with open('%s/target_lang.in' % self.results_dir, 'w') as f:
            f.write("%s" % "\n".join(self.target_lang))

        with open('%s/roles.in' % self.results_dir, 'w') as f:
            f.write("%s" % "\n".join(self.roles))

        if include_bilingual_lex and lang is "el":
            self.lexicon = self.lexicon_en.copy()
            self.lexicon.update(self.lexicon_el)
        else:  # lang is "es":  # print bilingual EN ES lexicon
            self.lexicon = self.lexicon_en.copy()
            self.lexicon.update(self.lexicon_es)
        self.print_lexicon(self.lexicon)

    def generate_sentences(self, sentence_structures, lexicon, fname, percentage_pronoun, exclude_test_sentences=[],
                           return_mess=False, print_sets=False, use_emphasis_concept=True):
        """
        :param sentence_structures: list of allowed structures for sentences
        :param lexicon: dict that contains words with syntactic labeling
        :param fname: filename with results
        :param percentage_pronoun: percentage of pronouns vs NPs in subject position
        :param exclude_test_sentences: list of sentences to exlcude (test set needs to contain novel messages only)
        :param return_mess: 
        :param print_sets: 
        :param use_emphasis_concept: 
        :return: 
        """
        # determine how often we will use NPs vs determiners
        num_sentences = len(sentence_structures)

        if not percentage_pronoun:  # full NPs
            np = [1] * num_sentences
        else:  # any other percentage
            number_determiners = num_sentences * percentage_pronoun / 100
            np = number_determiners * [0] + (num_sentences - number_determiners) * [1]
            random.shuffle(np)
        use_emphasis_concept = use_emphasis_concept
        # emphasize subject 30% of the times
        emphasis = [0] * num_sentences
        emphasis[::4] = [1] * len(emphasis[::4])  # every fourth subject is emphasized, whether it's NP or pronoun

        # we can keep track of train sentences (messages) that are identical to test ones and exclude them
        full_mess = []
        # now select words according to structure
        sen_idx = 0
        for pos_full, mes in sentence_structures:
            message = mes.split(';')
            lang = re.search(r"^E=(\S.)", message[-1]).group(1).lower()
            sentence = []
            msg_idx = 0
            add_det = False
            gender = None
            for pos in pos_full.split():
                if '::' in pos:  # 2 levels
                    part, level = pos.split("::")
                    syn = lexicon[lang][part][level]
                else:
                    level = ''
                    syn = lexicon[lang][pos]

                if type(syn) is dict:
                    random_key = random.choice(syn.keys())
                    if not level and 'animate' in random_key:  # this also includes INanimate
                        level = random_key
                    if pos == 'det':
                        message[msg_idx] += random_key + ","   # def/indef info
                        determiners = syn[random_key]
                    elif random_key in ['past', 'present']:
                        message[-1] += "," + random_key
                    elif random_key in ['m', 'f', 'n', 'c']:
                        random_key = gender  # gender = random_key

                    if len(syn) == 1 and syn.keys()[0] in ["m", "f", "n"]:
                        gender = syn.keys()[0]
                        random_key = gender

                    if random_key not in syn:
                        random_key = random.choice(syn.keys())
                        gender = random_key
                    w = syn[random_key]

                    if type(w) is dict:
                        random_key = random.choice(w.keys())
                        if random_key in ["m", "f", "n", "c"]:
                            gender = random_key
                        if type(w[random_key]) is list:
                            wd = random.choice(w[gender])
                            if level == 'animate':  # include semantic gender, we can decide later whether to use it
                                message[msg_idx] += gender.upper() + ","
                            if not np[sen_idx] and msg_idx == 0:  # go for pronoun (instead of NP)
                                message[0] = re.sub(r"def|indef", "", message[0]) + "PRON,"  # remove def/indef info
                                message[0] = re.sub("=,", '=', message[0])
                                #add_det = False
                                # add pronoun
                                sentence.append(lexicon[lang]['pron'][gender])
                            elif add_det or np[sen_idx] or msg_idx > 0:
                                if type(determiners) is dict:
                                    sentence.append(determiners[gender])
                                add_det = False  # reset
                                sentence.append(wd)
                            message[msg_idx] += self.get_concept(wd)
                            msg_idx += 1
                        else:
                            add_det = True
                    elif type(w) is list:
                        random_word = random.choice(w)
                        message[msg_idx] += self.get_concept(random_word)  # nouns
                        if level == 'animate':  # include semantic gender, we can decide later whether to use it
                            message[msg_idx] += "," + gender.upper()
                        if not np[sen_idx] and msg_idx == 0:  # go for pronoun (instead of NP)
                            message[0] = re.sub(r"def|indef", "", message[0]) + ",PRON"
                            message[0] = re.sub("=,", '=', message[0])
                            add_det = False
                            # add pronoun
                            sentence.append(lexicon[lang]['pron'][gender])
                        elif add_det or np[sen_idx]:
                            if type(determiners) is dict:
                                sentence.append(determiners[gender])
                            add_det = False  # reset
                            sentence.append(random_word)
                        elif not np[sen_idx] and msg_idx > 0:
                            sentence.append(random_word)

                        if use_emphasis_concept and emphasis[sen_idx] and msg_idx == 0:  # use it even for NPs?
                                message[0] += ",EMPH"
                        msg_idx += 1
                    else:  # elif type == str
                        if not np[sen_idx] and w == determiners and msg_idx < 1:
                            continue
                        sentence.append(w)
                elif type(syn) is list:
                    random_word = random.choice(syn)
                    message[msg_idx] += self.get_concept(random_word)  # verb
                    msg_idx += 1
                    if add_det:
                        det = determiners if gender not in determiners else determiners[gender]
                        sentence.append(det)
                        add_det = False
                    sentence.append(random_word)
                else:
                    sentence.append(syn)

            sentence = u"%s ." % " ".join(sentence)
            message = ";".join(message).upper()

            if message in exclude_test_sentences:
                sentence_structures.append((pos_full, mes))  # find unique sentence, don't add it to the train set
            else:
                sen_idx += 1
                if print_sets:
                    print u"%s## %s" % (sentence, message)
                with codecs.open('%s/%s' % (self.results_dir, fname), 'a',  "utf-8") as f:
                    f.write(u"%s## %s\n" % (sentence, message))

            if return_mess:
                full_mess.append(message)
        return full_mess

    def get_concept(self, word):
        if word in self.concepts:
            return self.concepts[word]
        else:
            self.concepts[word] = word.upper()
            print "'%s': '%s'," % (word, word.upper())
            return word

    def get_layered_key(self, keylist):
        lex = self.lexicon
        for num, it in enumerate(keylist):
            if it in lex:
                lex = lex[it]
            else:
                del keylist[num - 1]
                self.get_layered_key(keylist)

        if len(keylist) > 1:
            return keylist[1]

    def print_lexicon(self, d, key=None, keylist=[]):
        for k, v in d.iteritems():
            keylist.append(k)
            if len(keylist) > 1:
                key = self.get_layered_key(keylist)

            if isinstance(v, dict):
                self.print_lexicon(v, key, keylist=keylist)
            else:
                if type(v) is list:
                    with codecs.open('%s/lexicon.in' % self.results_dir, 'a',  "utf-8") as f:
                        f.write("{0}:\n{1}\n".format(key.upper(), "\n".join(v)))
                else:
                    with codecs.open('%s/lexicon.in' % self.results_dir, 'a',  "utf-8") as f:
                        f.write("{0}:\n{1}\n".format(key.upper(), v))

if __name__ == "__main__":
    sets = SetsGenerator()
    sets.generate_sets(num_sentences=200, lang='enes', include_bilingual_lex=True, percentage_pronoun=50,
                       percentage_l2=50, print_sets=True)

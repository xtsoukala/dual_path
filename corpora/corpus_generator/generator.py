# -*- coding: utf-8 -*-
import random
import re
import os
import codecs
from datetime import datetime
import sys

reload(sys)
sys.setdefaultencoding("utf-8")


class GenerateSets:
    def __init__(self, results_dir=None):
        if results_dir:
            self.results_dir = results_dir
        else:
            self.results_dir = "../generated/%s" % datetime.now().strftime("%Y-%m-%dt%H.%M")

        if os.path.isdir(self.results_dir):
            self.results_dir += datetime.now().strftime(".%S")
            os.makedirs(self.results_dir)
        else:  # create if it doesn't exist
            os.makedirs(self.results_dir)

        self.lexicon = {}
        # Write the lexicon directly. Alternatively we can load files, but splitting a string sounds more efficient.
        # How many genders are there in English? 3 (f/m/n) or 4 (including "common" gender?)
        self.lexicon_en = {'en': {'det': {'def': {'m': 'the', 'f': 'the', 'n': 'the'}, # 'c': 'the',
                                          'indef': {'m': 'a', 'f': 'a', 'n': 'a'}},#{'def': 'the', 'indef': 'a'}, 'c': 'a',
                                  'pron': {'m': 'he', 'f': 'she', 'n': 'it', 'c': ['he', 'she']},
                                  'noun': {
                                      'animate': {'m': 'man boy father brother dog teacher actor grandfather husband '
                                                       'host nephew policeman son uncle waiter bull'.split(),
                                                  'f': 'woman girl mother sister cat nurse actress grandmother wife '
                                                       'hostess niece policewoman daughter aunt waitress cow'.split(),
                                                  #'c': 'nurse teacher baby cousin'.split(),
                                                  #'n':  'cat dog'.split()
                                                  },
                                      'inanimate': {'n': 'ball stick toy kite key bag balloon'.split()}
                                      },
                                  'verb': {'intrans': 'swim jump walk run arrive lie sneeze sit die eat'.split(),
                                           'trans': 'push hit kick carry'.split(),
                                           'double': 'give throw show present'.split()},
                                  'aux': {'singular': {'present': 'is'}, #, 'past': 'was'},
                                          'plural': {'present': 'are'},#, 'past': 'were'}},
                                          },
                                  'being': 'being',
                                  'ing': '-ing',
                                  'verb_suffix': {'present': '-s'},#, 'past': '-ed'},
                                  'by': 'by',
                                  'to': 'to',
                                  'per': '.',
                                  'par': '-par'}  # , 'noun_plural': '-ss'}
                           }

        """'verb': {'intrans': 'dormir saltar caminar correr'.split(),
             'trans': 'empujar golpear patear llevar'.split(),
             'double': 'dar lanzar mostrar presentar'.split()},"""
        self.lexicon_es = {'es': {'det': {'def': {'m': 'el', 'f': 'la'}, 'indef': {'m': 'un', 'f': 'una'},
                                         },
                                  'pron': {'m': 'él', 'f': 'ella'},
                                  'noun': {'animate': {'m': 'niño padre hermano perro maestro actor abuelo esposo '
                                                            'sobrino policía hijo tío camarero toro'.split(),
                                                       'f': 'mujer niña madre hermana gata enfermera actríz abuela '
                                                            'esposa sobrina policía hija tía camarera vaca'.split()},
                                           'inanimate': {'m': 'palo juguete bolso'.split(),
                                                         'f': 'pelota llave cometa'.split()}
                                           },
                                  'verb': {'intrans': 'nad salt camin corr'.split(),
                                           'trans': 'empuj golpe pate llev'.split(),
                                           'double': 'd tir mostr present_'.split()},
                                  'aux': {'singular': {'present': 'está'},#, 'past': 'estaba'},
                                          'plural': {'present': 'están'}#, 'past': 'estaban'}},
                                          },
                                  'ing': '-ando',
                                  'verb_suffix': {'present': '-a'},# 'past': '-ó'},
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
                                      'animate': {'m': 'άντρας πατέρας αδερφός σκύλος'.split(),  # σκύλος
                                                  'f': 'γυναίκα  μητέρα αδερφή γάτα'.split(),  # γάτα
                                                  # 'c': 'nurse teacher'.split(),
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
        # non language-specific concepts -- leave out 'C', common, and 'N', neutral, for now
        self.concepts = {'M': 'M', 'F': 'F'}
        # note that sister = SIBLING + F, brother = SIBLING + M, etc
        self.concepts_en = {'sister': 'SIBLING', 'brother': 'SIBLING', 'boy': 'CHILD', 'girl': 'CHILD',
                            'mother': 'PARENT', 'father': 'PARENT',  'daughter': 'OFFSPRING', 'son': 'OFFSPRING',
                            'policewoman': 'POLICEMAN', 'policeman': 'POLICEMAN', 'actress': 'ACTOR', 'actor': 'ACTOR',
                            'wife': 'PARTNER', 'husband': 'PARTNER', 'hostess': 'HOST', 'host': 'HOST',
                            'grandmother': 'GRANDPARENT', 'grandfather': 'GRANDPARENT',
                            'waitress': 'WAITER', 'waiter': 'WAITER', 'aunt': 'UNCLES', 'uncle': 'UNCLES',
                            'nephew': 'NIBLING', 'niece': 'NIBLING',
                            'nurse': 'NURSE',
                            'cat': 'CAT',
                            'dog': 'DOG',
                            'teacher': 'TEACHER',
                            'woman': 'WOMAN', 'man': 'MAN',
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
                            'esposa': 'PARTNER', 'esposo': 'PARTNER',
                            'abuela': 'GRANDPARENT', 'abuelo': 'GRANDPARENT',
                            'camarera': 'WAITER', 'camarero': 'WAITER', 'tía': 'UNCLES', 'tío': 'UNCLES',
                            'sobrino': 'NIBLING', 'sobrina': 'NIBLING',
                            'vaca': 'COW',
                            'toro': 'COW',
                            'actríz': 'ACTOR',
                            'gata': 'CAT',
                            'enfermera': 'NURSE', 'mujer': 'WOMAN', 'd': 'GIVE',
                            'bolso': 'BAG', 'hombre': 'MAN', 'cometa': 'KITE', 'juguete': 'TOY', 'gato': 'CAT',
                            'perro': 'DOG', 'palo': 'STICK', 'llave': 'KEY', 'maestro': 'TEACHER',
                            'pelota': 'BALL', 'present_': 'PRESENT', 'salt': 'JUMP', 'mostr': 'SHOW', 'pate': 'KICK',
                            'dorm': 'SLEEP', 'empuj': 'PUSH', 'lanz': 'THROW', 'tir': 'THROW', 'corr': 'RUN',
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

        self.event_sem = ['PROG', 'SIMPLE', 'PRESENT', 'PAST', 'PAT', 'REC', 'AGT']
        self.target_lang = ['EN', 'ES'] #, 'EL']
        self.roles = ['AGENT', 'PATIENT', 'ACTION', 'RECIPIENT']
        # PAT: PATIENT, REC: RECIPIENT, AGT: AGENT
        # how to indicate plural agent etc?
        self.structures_en = [('det noun::animate aux::singular verb::intrans ing', 'AGENT=;ACTION=;E=EN,PROG,AGT'),
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
                             ]

        """self.structures_en = [('det noun::animate aux::singular verb::intrans ing', 'AGENT=;ACTION=;E=EN,PROG'),
                              ('det noun::animate verb::intrans verb_suffix', 'AGENT=;ACTION=;E=EN,SIMPLE'),
                              ('det noun::animate aux::singular verb::trans ing det noun',
                               'AGENT=;ACTION=;PATIENT=;E=EN,PROG'),
                              ('det noun::animate verb::trans verb_suffix det noun',
                               'AGENT=;ACTION=;PATIENT=;E=EN,SIMPLE'),
                              ('det noun::animate aux::singular verb::double ing '
                               'det noun::inanimate to det noun::animate',
                               'AGENT=;ACTION=;PATIENT=;RECIPIENT=;E=EN,PROG'),
                              ('det noun::animate aux::singular verb::double ing det noun::animate det noun::inanimate',
                               'AGENT=;ACTION=;RECIPIENT=;PATIENT=;E=EN,PROG,REC'),
                              ('det noun::animate verb::double verb_suffix det noun::inanimate to det noun::animate',
                               'AGENT=;ACTION=;PATIENT=;RECIPIENT=;E=EN,SIMPLE,REC'),
                              ('det noun::animate verb::double verb_suffix det noun::animate det noun::inanimate',
                               'AGENT=;ACTION=;RECIPIENT=;PATIENT=;E=EN,SIMPLE,REC'),
                              ]"""


        self.structures_es = [('det noun::animate aux::singular verb::intrans ing', 'AGENT=;ACTION=;E=ES,AGT,PROG'),
                              # ('det::def noun::animate noun_plural aux::plural verb::intrans ing',
                              # 'AGENT=;ACTION=;E=EN,PROG'),
                              # ('det::def noun::animate noun_plural verb::intrans',
                              # 'AGENT=;ACTION=;E=EN,SIMPLE,PRESENT'),
                              ('det noun::animate verb::intrans verb_suffix', 'AGENT=;ACTION=;E=ES,AGT,SIMPLE'),

                              ('det noun::animate aux::singular verb::trans ing det noun',
                               'AGENT=;ACTION=;PATIENT=;E=ES,PROG,AGT,PAT'),
                              # ('det::def noun::animate noun_plural aux::plural verb::trans ing det noun',
                              # 'AGENT=;ACTION=;PATIENT=;E=EN,PROG,PAT'),
                              # ('det::def noun::animate noun_plural verb::trans det noun',
                              # 'AGENT=;ACTION=;PATIENT=;E=EN,SIMPLE,PRESENT,PAT'),
                              ('det noun::animate verb::trans verb_suffix det noun',
                               'AGENT=;ACTION=;PATIENT=;E=ES,SIMPLE,AGT,PAT'),

                              (
                              'det noun::animate aux::singular verb::double ing '
                              'det noun::inanimate to det noun::animate',
                              'AGENT=;ACTION=;PATIENT=;RECIPIENT=;E=ES,PROG,AGT,PAT,-1,REC'),
                              #'AGENT=;ACTION=;PATIENT=;RECIPIENT=;E=ES,PROG,AGT,PAT,REC'),
                              ('det noun::animate aux::singular verb::double ing '
                              'to det noun::animate det noun::inanimate',
                              'AGENT=;ACTION=;RECIPIENT=;PATIENT=;E=ES,PROG,AGT,PAT,REC'),
                              # ('det::def noun::animate noun_plural aux::plural verb::trans ing det noun',
                              # 'AGENT=;ACTION=;PATIENT=;E=EN,PROG,PAT'),
                              # ('det::def noun::animate noun_plural verb::trans det noun',
                              # 'AGENT=;ACTION=;PATIENT=;E=EN,SIMPLE,PRESENT,PAT'),
                              ('det noun::animate verb::double verb_suffix det noun::inanimate to det noun::animate',
                               'AGENT=;ACTION=;PATIENT=;RECIPIENT=;E=ES,SIMPLE,AGT,PAT,-1,REC'),
                              #'AGENT=;ACTION=;PATIENT=;RECIPIENT=;E=ES,SIMPLE,AGT,PAT,REC'),
                              ('det noun::animate verb::double verb_suffix to det noun::animate det noun::inanimate',
                               'AGENT=;ACTION=;RECIPIENT=;PATIENT=;E=ES,SIMPLE,AGT,PAT,REC'),

                              #!('det noun aux::singular verb::trans par by det noun::animate',
                              #! 'PATIENT=;ACTION=;AGENT=;E=ES,SIMPLE,-1,AGT,PAT')
                              ]

        self.structures_el = [
                              # ('det::def noun::animate noun_plural aux::plural verb::intrans ing',
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

    def generate_sets(self, num_sentences, lang, bilingual_lexicon, percentage_pronoun,
                      extended_evsem, use_subject_emphasis, use_emphasis_concept, percentage_english=50,
                      print_all=False):
        """
            lang: leave None for bilingual
            num_sentences: number of train AND test sentences
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
        elif "el" in lang and "en" in lang:  # actually checking "en" is redundant, as we don't have "el-es"
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
        sentence_type_train = structures * (num_train / n)
        for m in range(num_train % n):
            sentence_type_train.append(structures[random.randint(0, n - 1)])
        random.shuffle(sentence_type_train)

        # same for test set (we want sets to be homogeneous when it comes to structures)
        sentence_type_test = structures * (num_test / n)
        for m in range(num_test % n):
            sentence_type_test.append(structures[random.randint(0, n - 1)])
        random.shuffle(sentence_type_test)

        test_set = self.generate_sentences(sentence_type_test, self.lexicon, fname="test.%s" % lang,
                                           percentage_pronoun=percentage_pronoun,
                                           use_emphasis_concept=use_emphasis_concept,
                                           use_subject_emphasis=use_subject_emphasis,
                                           extended_evsem=extended_evsem, return_mess=True, print_all=print_all)
        self.generate_sentences(sentence_type_train, self.lexicon, fname="train.%s" % lang,
                                percentage_pronoun=percentage_pronoun, use_emphasis_concept=use_emphasis_concept,
                                use_subject_emphasis=use_subject_emphasis,
                                extended_evsem=extended_evsem, exclude_test_sentences=test_set, print_all=print_all)

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

        if bilingual_lexicon and lang is "el":
            self.lexicon = self.lexicon_en.copy()
            self.lexicon.update(self.lexicon_el)
        else:  # lang is "es":  # print bilingual EN ES lexicon
            self.lexicon = self.lexicon_en.copy()
            self.lexicon.update(self.lexicon_es)
        self.print_lexicon(self.lexicon)

    def generate_sentences(self, sentence_type, lexicon, fname, percentage_pronoun, extended_evsem,
                           use_emphasis_concept, use_subject_emphasis, exclude_test_sentences=[],
                           return_mess=False, print_all=False):
        is_prodrop = False
        prodrop_null = False  # whether to append "NULL" in prodrop cases or not
        # determine how often we will use NPs vs pronouns
        num_sentences = len(sentence_type)
        if not percentage_pronoun:  # full NPs
            np = [1] * num_sentences
        else:  # any other percentage
            number_pronouns = num_sentences * percentage_pronoun / 100
            np = number_pronouns * [0] + (num_sentences - number_pronouns) * [1]
            random.shuffle(np)
        use_emphasis_concept = True  # FIXME
        # emphasize subject 30% of the times
        emphasis = [0] * num_sentences
        emphasis[::4] = [1] * len(emphasis[::4])  # every fourth subject is emphasized, whether it's NP or pronoun

        # we can keep track of train sentences (messages) that are identical to test ones and exclude them
        full_mess = []
        # now select words according to structure
        sen_idx = 0
        for pos_full, mes in sentence_type:
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
                        pronoun_list = syn[random_key]
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
                                add_det = False
                                if lang == 'en' or not is_prodrop or (is_prodrop and emphasis[sen_idx]):
                                    # use pronoun if emphasized
                                    sentence.append(lexicon[lang]['pron'][gender])
                                elif prodrop_null:
                                    sentence.append('NULL')
                            elif add_det or np[sen_idx]:  # or not pronouns[sen_idx]:
                                sentence.append(pronoun_list[gender])
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
                            if lang == 'en' or not is_prodrop or (is_prodrop and emphasis[sen_idx]):  # use pron if emph
                                sentence.append(lexicon[lang]['pron'][gender])
                            elif prodrop_null:
                                sentence.append('NULL')
                        elif add_det or np[sen_idx]:  # or not pronouns[sen_idx]:
                            sentence.append(pronoun_list[gender])
                            add_det = False  # reset
                            sentence.append(random_word)

                        if use_emphasis_concept and emphasis[sen_idx] and msg_idx == 0:  # use it even for NPs?
                                message[0] += ",EMPH"
                        msg_idx += 1
                    else:  # elif type == str
                        sentence.append(w)
                elif type(syn) is list:
                    random_word = random.choice(syn)
                    message[msg_idx] += self.get_concept(random_word)  # verb
                    msg_idx += 1
                    if add_det:
                        sentence.append(pronoun_list[gender])
                        add_det = False
                    sentence.append(random_word)
                else:
                    sentence.append(syn)

            sentence = u"%s ." % " ".join(sentence)
            message = ";".join(message).upper()
            if not extended_evsem:
                #message = re.sub(r",PAT|,REC|,AGT|,-1", "", message)
                message = re.sub(r"ES,|EN,", "", message)  # only remove language code for now
            if use_subject_emphasis and emphasis[sen_idx]:
                # increase agent's activation
                #message = re.sub(r",AGT", ",2,AGT", message)
                message += ",EMPHASIS"
            if message in exclude_test_sentences:
                sentence_type.append((pos_full, mes))  # find unique sentence, don't add it to the train set
            else:
                sen_idx += 1
                if print_all:
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
    sets = GenerateSets()
    sets.generate_sets(num_sentences=200, lang='enes', bilingual_lexicon=True,
                       percentage_pronoun=50, use_emphasis_concept=False, use_subject_emphasis=True,
                       extended_evsem=False, percentage_english=50, print_all=True)

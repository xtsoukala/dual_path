# -*- coding: utf-8 -*-
import random
import re
import os
import codecs
from datetime import datetime
import sys
import pickle

reload(sys)
sys.setdefaultencoding("utf-8")  # otherwise Spanish (non-ascii) characters throw an error


class SetsGenerator:
    """
    Overly complicated and ugly class to generate sentence/meaning pairs for the Dual-path model (To be refactored)
    """
    def __init__(self, results_dir, use_gendered_semantics=True, allow_free_structure_production=False,
                 use_full_verb_form=False, ignore_past=False):
        self.results_dir = results_dir
        if os.path.isdir(self.results_dir):  # if this folder name exists already add a timestamp at the end
            self.results_dir += datetime.now().strftime(".%S")
        os.makedirs(self.results_dir)
        self.ignore_past_tense = ignore_past
        self.lexicon = {}
        self.lexicon_en = {'en': {'det': {'def': 'the', 'indef': 'a'},
                                  'pron': {'m': 'he', 'f': 'she', 'n': 'it', 'c': ['he', 'she']},
                                  'noun': {
                                      'animate': {'m': 'man boy father brother dog teacher actor grandfather husband '
                                                       'host nephew policeman son uncle waiter chairman headmaster'
                                                       ' bull'.split(),
                                                  'f': 'woman girl mother sister cat nurse actress grandmother wife '
                                                       'hostess niece policewoman daughter aunt waitress chairwoman'
                                                       ' headmistress cow'.split(),
                                                  },
                                      'inanimate': {'n': 'ball stick toy kite key bag balloon chair pen wallet'.split()}
                                  },
                                  'aux': {'singular': {'present': 'is', 'past': 'was'},
                                          'plural': {'present': 'are', 'past': 'were'},
                                          },
                                  'by': 'by',
                                  'to': 'to',
                                  }
                           }

        self.lexicon_es = {'es': {'det': {'def': {'m': 'el', 'f': 'la'},
                                          'indef': {'m': 'un', 'f': 'una'},
                                          },
                                  'pron': {'m': 'él', 'f': 'ella'},
                                  'noun': {'animate': {'m': 'niño padre hermano perro maestro act0r abuelo esposo '
                                                            'sobrino policía hijo tío camarero toro director '
                                                            'presidente'.split(),
                                                       'f': 'mujer niña madre hermana gata enfermera actríz abuela '
                                                            'esposa sobrina policía hija tía camarera vaca directora '
                                                            'presidenta'.split()},
                                           'inanimate': {'m': 'palo juguete bolso bolígrafo globo'.split(),
                                                         'f': 'pelota llave cometa silla cartera'.split()}
                                           },
                                  'aux': {'singular': {'present': 'está', 'past': 'estaba'},
                                          'plural': {'present': 'están', 'past': 'estaban'},
                                          },
                                  'by': 'por',
                                  'to': 'a_'}
                           }

        if use_full_verb_form:
            self.lexicon_en['en']['verb'] = {'intrans': {'simple': {'present': 'swims jumps walks runs arrives '
                                                                               'sneezes dies eats'.split(),
                                                                    'past': 'swam jumped walked ran arrived '
                                                                            'sneezed died ate'.split()},
                                                         'participle': 'swimming jumping walking running arriving '
                                                                       'sneezing dying eating'.split()},
                                             'trans': {'simple': {'present': 'pushes hits kicks carries'.split(),
                                                                  'past': 'pushed hit kicked carried'.split()},
                                                       'participle': 'pushing hitting kicking carrying'.split()},
                                             'double': {'simple': {'present': 'gives throws shows presents'.split(),
                                                                   'past': 'gave threw showed presented'.split()},
                                                        'participle': 'giving throwing showing presenting'.split()}
                                             }
            self.lexicon_es['es']['verb'] = {'intrans': {'simple': {'present': 'nada salta camina corre llega '
                                                                               'estornuda muere come'.split(),
                                                                    'past': 'nadó saltó caminó corrió llegó '
                                                                            'estornudó moría comía'.split()},
                                                         'participle': 'nadando saltando camindando corriendo llegando '
                                                                       'estornudando muriendo comiendo'.split()},
                                             'trans': {'simple': {'present': 'empuja golpea patea lleva'.split(),
                                                                  'past': 'empujó golpeó pateó llevó'.split()},
                                                       'participle': 'empujando golpeando pateando llevando'.split()},
                                             'double': {'simple': {'present': 'da tira muestra presenta'.split(),
                                                                   'past': 'dio tiró mostró presentó'.split()},
                                                        'participle': 'dando tirando mostrando presentando'.split()}
                                             }
        else:
            self.lexicon_en['en']['verb'] = {'intrans': 'swim jump walk run arrive sneeze die eat'.split(),
                                             'trans': 'push hit kick carry'.split(),
                                             'double': 'give throw show present'.split()}
            self.lexicon_en['en']['ing'] = '-ing'
            self.lexicon_en['en']['verb_suffix'] = {'present': '-s', 'past': '-ed'}
            # ES
            self.lexicon_es['es']['verb'] = {'intrans': 'estornud nad salt camin corr dorm'.split(),
                                             'trans': 'empuj golpe pate llev'.split(),
                                             'double': 'd tir mostr present_'.split()}
            self.lexicon_es['es']['ing'] = '-ando'
            self.lexicon_es['es']['verb_suffix'] = {'present': '-a', 'past': '-ó'}

        self.identifiability = ['DEF', 'INDEF', 'PRON', 'EMPH']
        # semantic gender, which is a non language-specific concept
        self.concepts = {}
        self.concepts_en = {'chair': 'CHAIR', 'pen': 'PEN', 'wallet': 'WALLET', 'bag': 'BAG', 'ball': 'BALL',
                            'kite': 'KITE', 'toy': 'TOY', 'stick': 'STICK', 'key': 'KEY', 'balloon': 'BALLOON'}
        self.concepts_es = {'bolígrafo': 'PEN', 'silla': 'CHAIR', 'cartera': 'WALLET', 'globo': 'BALLOON',
                            'bolso': 'BAG', 'cometa': 'KITE', 'juguete': 'TOY', 'palo': 'STICK', 'llave': 'KEY',
                            'pelota': 'BALL'}
        if use_gendered_semantics:
            self.concepts.update({'M': 'M', 'F': 'F', 'N': 'N'})
            # note that sister = SIBLING + F, brother = SIBLING + M, etc
            self.concepts_en.update({'sister': 'SIBLING', 'brother': 'SIBLING', 'boy': 'CHILD', 'girl': 'CHILD',
                                     'mother': 'PARENT', 'father': 'PARENT',  'daughter': 'OFFSPRING',
                                     'son': 'OFFSPRING', 'policewoman': 'POLICEMAN', 'policeman': 'POLICEMAN',
                                     'actress': 'ACTOR', 'actor': 'ACTOR', 'wife': 'PARTNER', 'husband': 'PARTNER',
                                     'hostess': 'HOST', 'host': 'HOST', 'grandmother': 'GRANDPARENT',
                                     'grandfather': 'GRANDPARENT', 'waitress': 'WAITER', 'waiter': 'WAITER',
                                     'aunt': 'UNCLES', 'uncle': 'UNCLES', 'nephew': 'NIBLING', 'niece': 'NIBLING',
                                     'woman': 'HUMAN', 'man': 'HUMAN', 'chairwoman': 'CHAIRMAN', 'bull': 'BULL',
                                     'headmistress': 'HEADMASTER', 'headmaster': 'HEADMASTER', 'chairman': 'CHAIRMAN',
                                     'nurse': 'NURSE', 'cat': 'CAT', 'dog': 'DOG', 'teacher': 'TEACHER', 'cow': 'COW'})

            self.concepts_es.update({'hermana': 'SIBLING', 'hermano': 'SIBLING', 'ni\xc3\xb1o': 'CHILD',
                                     'ni\xc3\xb1a': 'CHILD', 'madre': 'PARENT', 'padre': 'PARENT', 'hija': 'OFFSPRING',
                                     'hijo': 'OFFSPRING', 'policía': 'POLICEMAN', 'act0r': 'ACTOR',
                                     'esposa': 'PARTNER', 'esposo': 'PARTNER', 'actríz': 'ACTOR',
                                     'abuela': 'GRANDPARENT', 'abuelo': 'GRANDPARENT', 'camarera': 'WAITER',
                                     'camarero': 'WAITER', 'tía': 'UNCLES', 'tío': 'UNCLES', 'sobrino': 'NIBLING',
                                     'sobrina': 'NIBLING', 'mujer': 'HUMAN', 'hombre': 'HUMAN', 'maestro': 'TEACHER',
                                     'presidenta': 'CHAIRMAN', 'presidente': 'CHAIRMAN', 'directora': 'HEADMASTER',
                                     'director': 'HEADMASTER', 'vaca': 'COW', 'toro': 'COW', 'gata': 'CAT',
                                     'enfermera': 'NURSE', 'perro': 'DOG'})
        else:
            self.concepts_en.update({'sister': 'SISTER', 'brother': 'BROTHER', 'boy': 'BOY', 'girl': 'GIRL',
                                     'mother': 'MOTHER', 'father': 'FATHER', 'daughter': 'DAUGHTER',
                                     'son': 'SON', 'policewoman': 'POLICEMAN', 'policeman': 'POLICEWOMAN',
                                     'actress': 'ACTRESS', 'actor': 'ACTOR', 'wife': 'WIFE', 'husband': 'HUSBAND',
                                     'hostess': 'HOSTESS', 'host': 'HOST', 'grandmother': 'GRANDMOTHER',
                                     'grandfather': 'GRANDFATHER', 'waitress': 'WAITRESS', 'waiter': 'WAITER',
                                     'aunt': 'AUNT', 'uncle': 'UNCLE', 'nephew': 'NEPHEW', 'niece': 'NIECE',
                                     'woman': 'WOMAN', 'man': 'MAN', 'chairwoman': 'CHAIRWOMAN', 'bull': 'BULL',
                                     'headmistress': 'HEADMISTRESS', 'headmaster': 'HEADMASTER', 'chairman': 'CHAIRMAN',
                                     'nurse': 'NURSE', 'cat': 'CAT', 'dog': 'DOG', 'teacher': 'TEACHER', 'cow': 'COW'})

            self.concepts_es.update({'hermana': 'SISTER', 'hermano': 'BROTHER', 'ni\xc3\xb1o': 'BOY',
                                     'ni\xc3\xb1a': 'GIRL', 'madre': 'MOTHER', 'padre': 'FATHER', 'hija': 'DAUGHTER',
                                     'hijo': 'SON', 'policía': 'POLICEMAN', 'act0r': 'ACTOR',
                                     'esposa': 'WIFE', 'esposo': 'HUSBAND', 'actríz': 'ACTRESS',
                                     'abuela': 'GRANDMOTHER', 'abuelo': 'GRANDFATHER', 'camarera': 'WAITRESS',
                                     'camarero': 'WAITER', 'tía': 'AUNT', 'tío': 'UNCLE', 'sobrino': 'NEPHEW',
                                     'sobrina': 'NIECE', 'mujer': 'WOMAN', 'hombre': 'MAN', 'maestro': 'TEACHER',
                                     'presidenta': 'CHAIRWOMAN', 'presidente': 'CHAIRMAN', 'directora': 'HEADMISTRESS',
                                     'director': 'HEADMASTER', 'vaca': 'COW', 'toro': 'BULL', 'gata': 'CAT',
                                     'enfermera': 'NURSE', 'perro': 'DOG'})

        if use_full_verb_form:
            self.concepts_en.update({'eating': 'EAT', 'throwing': 'THROW', 'arrived': 'ARRIVE', 'kicked': 'KICK',
                                     'giving': 'GIVE', 'running': 'RUN', 'pushing': 'PUSH', 'arrives': 'ARRIVE',
                                     'arriving': 'ARRIVE', 'died': 'DIE', 'hits': 'HIT', 'gave': 'GIVE',
                                     'kicks': 'KICK', 'dying': 'DIE', 'presented': 'PRESENT', 'hitting': 'HIT',
                                     'showing': 'SHOW', 'threw': 'THROW', 'carried': 'CARRY', 'sneezing': 'SNEEZE',
                                     'dies': 'DIE', 'kicking': 'KICK', 'swimming': 'SWIM', 'walking': 'WALK',
                                     'ate': 'EAT', 'carrying': 'CARRY', 'jumping': 'JUMP', 'presents': 'PRESENT',
                                     'presenting': 'PRESENT', 'showed': 'SHOW', 'pushes': 'PUSH', 'walked': 'WALK',
                                     'throws': 'THROW', 'ran': 'RUN', 'shows': 'SHOW', 'gives': 'GIVE',
                                     'pushed': 'PUSH', 'eats': 'EAT', 'hit': 'HIT', 'sneezes': 'SNEEZE',
                                     'swims': 'SWIM', 'jumps': 'JUMP', 'jumped': 'JUMP', 'runs': 'RUN',
                                     'walks': 'WALK', 'carries': 'CARRY', 'sneezed': 'SNEEZE', 'swam': 'SWIM'})

            self.concepts_es.update({'llegando': 'ARRIVE', 'mostrando': 'SHOW', 'golpea': 'HIT',
                                     'golpeando': 'HIT', 'camina': 'WALK', 'empujando': 'PUSH',
                                     'mostró': 'SHOW', 'empujó': 'PUSH', 'muere': 'DIE', 'presenta': 'PRESENT',
                                     'presentando': 'PRESENT', 'estornudó': 'SNEEZE', 'tirando': 'THROW',
                                     'llevó': 'CARRY', 'patea': 'KICK', 'pateando': 'KICK',
                                     'corriendo': 'RUN', 'camindando': 'WALK', 'golpeó': 'HIT',
                                     'lleva': 'CARRY', 'tiró': 'THROW', 'dando': 'GIVE', 'empuja': 'PUSH',
                                     'llevando': 'CARRY', 'muestra': 'SHOW', 'estornudando': 'SNEEZE',
                                     'nadando': 'SWIM', 'come': 'EAT', 'dio': 'GIVE', 'llegó': 'ARRIVE',
                                     'presentó': 'PRESENT', 'saltando': 'JUMP', 'llega': 'ARRIVE', 'pateó': 'KICK',
                                     'nada': 'SWIM', 'da': 'GIVE', 'tira': 'THROW', 'comiendo': 'EAT',
                                     'comía': 'EAT', 'moría': 'DIE', 'salta': 'JUMP', 'nadó': 'SWIM',
                                     'estornuda': 'SNEEZE', 'corrió': 'RUN', 'muriendo': 'DIE',
                                     'corre': 'RUN', 'saltó': 'JUMP', 'caminó': 'WALK'})
        else:
            self.concepts_en.update({'give': 'GIVE', 'carry': 'CARRY', 'kick': 'KICK', 'run': 'RUN', 'throw': 'THROW',
                                     'swim': 'SWIM', 'walk': 'WALK', 'jump': 'JUMP', 'show': 'SHOW',
                                     'present': 'PRESENT', 'hit': 'HIT', 'push': 'PUSH', 'sneeze': 'SNEEZE',
                                     'die': 'DIE', 'eat': 'EAT', 'arrive': 'ARRIVE'})
            self.concepts_es.update({'d': 'GIVE', 'present_': 'PRESENT', 'salt': 'JUMP', 'mostr': 'SHOW', 'nad': 'SWIM',
                                     'pate': 'KICK', 'dorm': 'SLEEP', 'empuj': 'PUSH', 'tir': 'THROW', 'corr': 'RUN',
                                     'camin': 'WALK', 'llev': 'CARRY', 'golpe': 'HIT', 'estornud': 'SNEEZE'})

        self.event_sem = ['PROG', 'SIMPLE', 'PRESENT', 'PAST']
        self.target_lang = []
        self.roles = ['AGENT', 'PATIENT', 'ACTION', 'RECIPIENT']

        self.structures = []
        self.num_structures = None
        if use_full_verb_form:
            self.structures_en = [['det noun::animate aux::singular verb::intrans::participle', 'AGENT=;ACTION=;E=EN,PROG'],
                                  ['det noun::animate verb::intrans::simple', 'AGENT=;ACTION=;E=EN,SIMPLE'],
                                  ['det noun::animate aux::singular verb::trans::participle det noun',
                                   'AGENT=;ACTION=;PATIENT=;E=EN,PROG'],
                                  ['det noun::animate verb::trans::simple det noun',
                                   'AGENT=;ACTION=;PATIENT=;E=EN,SIMPLE'],
                                  ['det noun::animate aux::singular verb::double::participle '
                                   'det noun::inanimate to det noun::animate',
                                   'AGENT=;ACTION=;PATIENT=;RECIPIENT=;E=EN,PROG'],
                                  ['det noun::animate aux::singular verb::double::participle det noun::animate '
                                   'det noun::inanimate',
                                   'AGENT=;ACTION=;RECIPIENT=;PATIENT=;E=EN,PROG'],
                                  ['det noun::animate verb::double::simple det noun::inanimate to det noun::animate',
                                   'AGENT=;ACTION=;PATIENT=;RECIPIENT=;E=EN,SIMPLE'],
                                  ['det noun::animate verb::double::simple det noun::animate det noun::inanimate',
                                   'AGENT=;ACTION=;RECIPIENT=;PATIENT=;E=EN,SIMPLE'],
                                  ]

            self.structures_es = [['det noun::animate aux::singular verb::intrans::participle', 'AGENT=;ACTION=;E=ES,PROG'],
                                  ['det noun::animate verb::intrans::simple', 'AGENT=;ACTION=;E=ES,SIMPLE'],
                                  ['det noun::animate aux::singular verb::trans::participle det noun',
                                   'AGENT=;ACTION=;PATIENT=;E=ES,PROG'],
                                  ['det noun::animate verb::trans::simple det noun',
                                   'AGENT=;ACTION=;PATIENT=;E=ES,SIMPLE'],
                                  ['det noun::animate aux::singular verb::double::participle '
                                   'det noun::inanimate to det noun::animate',
                                   'AGENT=;ACTION=;PATIENT=;RECIPIENT=;E=ES,PROG'],
                                  ['det noun::animate aux::singular verb::double::participle '
                                   'to det noun::animate det noun::inanimate',
                                   'AGENT=;ACTION=;RECIPIENT=;PATIENT=;E=ES,PROG'],
                                  ['det noun::animate verb::double::simple det noun::inanimate to det noun::animate',
                                   'AGENT=;ACTION=;PATIENT=;RECIPIENT=;E=ES,SIMPLE'],
                                  ['det noun::animate verb::double::simple to det noun::animate det noun::inanimate',
                                   'AGENT=;ACTION=;RECIPIENT=;PATIENT=;E=ES,SIMPLE']
                                  ]
        else:
            self.structures_en = [['det noun::animate aux::singular verb::intrans ing', 'AGENT=;ACTION=;E=EN,PROG'],
                                  ['det noun::animate verb::intrans verb_suffix', 'AGENT=;ACTION=;E=EN,SIMPLE'],
                                  ['det noun::animate aux::singular verb::trans ing det noun',
                                   'AGENT=;ACTION=;PATIENT=;E=EN,PROG'],
                                  ['det noun::animate verb::trans verb_suffix det noun',
                                   'AGENT=;ACTION=;PATIENT=;E=EN,SIMPLE'],
                                  ['det noun::animate aux::singular verb::double ing '
                                   'det noun::inanimate to det noun::animate',
                                   'AGENT=;ACTION=;PATIENT=;RECIPIENT=;E=EN,PROG'],
                                  ['det noun::animate aux::singular verb::double ing det noun::animate '
                                   'det noun::inanimate',
                                   'AGENT=;ACTION=;RECIPIENT=;PATIENT=;E=EN,PROG'],
                                  ['det noun::animate verb::double verb_suffix det noun::inanimate to det noun::animate',
                                   'AGENT=;ACTION=;PATIENT=;RECIPIENT=;E=EN,SIMPLE'],
                                  ['det noun::animate verb::double verb_suffix det noun::animate det noun::inanimate',
                                   'AGENT=;ACTION=;RECIPIENT=;PATIENT=;E=EN,SIMPLE'],
                                  ]

            self.structures_es = [['det noun::animate aux::singular verb::intrans ing', 'AGENT=;ACTION=;E=ES,PROG'],
                                  ['det noun::animate verb::intrans verb_suffix', 'AGENT=;ACTION=;E=ES,SIMPLE'],
                                  ['det noun::animate aux::singular verb::trans ing det noun',
                                   'AGENT=;ACTION=;PATIENT=;E=ES,PROG'],
                                  ['det noun::animate verb::trans verb_suffix det noun',
                                   'AGENT=;ACTION=;PATIENT=;E=ES,SIMPLE'],
                                  ['det noun::animate aux::singular verb::double ing '
                                   'det noun::inanimate to det noun::animate',
                                   'AGENT=;ACTION=;PATIENT=;RECIPIENT=;E=ES,PROG'],
                                  ['det noun::animate aux::singular verb::double ing '
                                   'to det noun::animate det noun::inanimate',
                                   'AGENT=;ACTION=;RECIPIENT=;PATIENT=;E=ES,PROG'],
                                  ['det noun::animate verb::double verb_suffix det noun::inanimate to det noun::animate',
                                   'AGENT=;ACTION=;PATIENT=;RECIPIENT=;E=ES,SIMPLE'],
                                  ['det noun::animate verb::double verb_suffix to det noun::animate det noun::inanimate',
                                   'AGENT=;ACTION=;RECIPIENT=;PATIENT=;E=ES,SIMPLE']
                                  ]
        if not allow_free_structure_production:
            self.event_sem.extend(['AGT', 'PAT', 'REC'])
            additions = [',AGT', ',AGT', ',AGT,PAT', ',AGT,PAT', ',AGT,PAT,REC', ',AGT,-1,PAT,REC',
                         ',AGT,PAT,REC', ',AGT,-1,PAT,REC']
            for i in range(len(additions)):
                self.structures_en[i][1] += additions[i]
                self.structures_es[i][1] += additions[i]

    def generate_sets(self, num_sentences, lang, include_bilingual_lexicon, percentage_pronoun, percentage_l2=50,
                      print_sets=False):
        """
        :param num_sentences: number of train AND test sentences to be generated
        :param lang: language code, leave None for bilingual es-en
        :param include_bilingual_lexicon: whether lexicon should be bilingual even if generated sentences are in L1
        :param percentage_pronoun: percentage of pronouns vs Noun Phrases (NPs)
        :param percentage_l2: percentage of L2 (usually English) vs L1
        :param print_sets:
        :return:
        """
        num_test, num_train = calculate_number_of_sentences_per_set(num_sentences)
        self.get_structures_and_lexicon(lang)

        sentence_structures_train = self.generate_sentence_structures(num_train)
        sentence_structures_test = self.generate_sentence_structures(num_test)

        test_set = self.generate_sentences(sentence_structures_test, self.lexicon, fname="test.%s" % lang,
                                           percentage_pronoun=percentage_pronoun, print_sets=print_sets,
                                           return_mess=True)
        self.generate_sentences(sentence_structures_train, self.lexicon, fname="train.%s" % lang, print_sets=print_sets,
                                percentage_pronoun=percentage_pronoun, exclude_test_sentences=test_set)

        if include_bilingual_lexicon:
            self.lexicon = self.lexicon_en.copy()
            self.lexicon.update(self.lexicon_es)
            self.target_lang.extend(['EN', 'ES'])
            self.concepts.update(self.concepts_en)
            self.concepts.update(self.concepts_es)
        self.print_lexicon(self.lexicon)

        with codecs.open('%s/identifiability.in' % self.results_dir, 'w',  "utf-8") as f:
            f.write("%s" % "\n".join(self.identifiability))

        with codecs.open('%s/concepts.in' % self.results_dir, 'w',  "utf-8") as f:
            f.write("%s" % "\n".join(set(self.concepts.values())).encode("utf-8"))

        with open('%s/event_sem.in' % self.results_dir, 'w') as f:
            f.write("%s" % "\n".join(self.event_sem))

        with open('%s/target_lang.in' % self.results_dir, 'w') as f:
            f.write("%s" % "\n".join(set(self.target_lang)))

        with open('%s/roles.in' % self.results_dir, 'w') as f:
            f.write("%s" % "\n".join(self.roles))

        with codecs.open('%s/lexicon_to_concept.pickled' % self.results_dir, 'w', "utf-8") as pckl:
            pickle.dump(self.concepts, pckl)

    def get_structures_and_lexicon(self, lang):
        lang = lang.lower()
        if lang == 'es':
            structures = self.structures_es
            self.lexicon = self.lexicon_es
            self.target_lang = ['ES']
            self.concepts.update(self.concepts_es)
        elif lang == 'en':
            structures = self.structures_en
            self.lexicon = self.lexicon_en
            self.target_lang = ['EN']
            self.concepts.update(self.concepts_en)
        else:  # the default mode is the Bilingual English-Spanish model
            structures = self.structures_en + self.structures_es
            self.lexicon = self.lexicon_en.copy()
            self.lexicon.update(self.lexicon_es)
            self.target_lang.extend(['ES', 'EN'])
            self.concepts.update(self.concepts_es)
            self.concepts.update(self.concepts_en)
        random.shuffle(structures)
        self.structures = structures
        self.num_structures = len(self.structures)

    def generate_sentence_structures(self, num_sentences):
        sentence_structures = self.structures * (num_sentences / self.num_structures)
        for m in range(num_sentences % self.num_structures):  # runs if sentence_structures < num_sentences
            sentence_structures.append(self.structures[random.randint(0, self.num_structures - 1)])
        random.shuffle(sentence_structures)
        return sentence_structures

    def generate_sentences(self, sentence_structures, lexicon, fname, percentage_pronoun, exclude_test_sentences=[],
                           return_mess=False, print_sets=False):
        """
        :param sentence_structures: list of allowed structures for sentences
        :param lexicon: dict that contains words with syntactic labeling
        :param fname: filename with results
        :param percentage_pronoun: percentage of pronouns vs NPs in subject position
        :param exclude_test_sentences: list of sentences to exlcude (test set needs to contain novel messages only)
        :param return_mess: 
        :param print_sets: 
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
                if '::' in pos:
                    if len(pos.split('::')) == 2:
                        part, level = pos.split("::")
                        syn = lexicon[lang][part][level]
                    else:
                        part, level, sublevel = pos.split("::")
                        syn = lexicon[lang][part][level][sublevel]
                else:
                    level = ''
                    syn = lexicon[lang][pos]

                if type(syn) is dict:
                    random_key = random.choice(syn.keys())
                    if not level and 'animate' in random_key:  # this also includes INanimate
                        level = random_key
                    if pos == 'det':
                        message[msg_idx] += "," + random_key   # def/indef info
                        determiners = syn[random_key]
                    elif random_key in ['past', 'present']:
                        if self.ignore_past_tense:
                            random_key = 'present'
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
                                message[msg_idx] += "," + gender.upper()
                            if not np[sen_idx] and msg_idx == 0:  # go for pronoun (instead of NP)
                                message[0] = re.sub(r"def|indef", "", message[0]) + "PRON"  # remove def/indef info
                                # add pronoun
                                sentence.append(lexicon[lang]['pron'][gender])
                            elif add_det or np[sen_idx] or msg_idx > 0:
                                if type(determiners) is dict:
                                    sentence.append(determiners[gender])
                                add_det = False  # reset
                                sentence.append(wd)
                            message[msg_idx] += "," + self.get_concept(wd)
                            msg_idx += 1
                        else:
                            add_det = True
                    elif type(w) is list:
                        random_word = random.choice(w)
                        message[msg_idx] += "," + self.get_concept(random_word)  # nouns
                        if level == 'animate':  # include semantic gender, we can decide later whether to use it
                            message[msg_idx] += "," + gender.upper()
                        if not np[sen_idx] and msg_idx == 0:  # go for pronoun (instead of NP)
                            message[0] = re.sub(r"def|indef", "", message[0]) + ",PRON"
                            add_det = False
                            # add pronoun
                            sentence.append(lexicon[lang]['pron'][gender])
                        elif add_det:
                            sentence.append(determiners[gender])
                            add_det = False  # reset
                            sentence.append(random_word)
                        elif np[sen_idx]:
                            if add_det:
                                sentence.append(determiners[gender])
                                add_det = False  # reset
                            sentence.append(random_word)
                        elif not np[sen_idx] and msg_idx > 0:
                            sentence.append(random_word)
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
            message = re.sub(r",,", ",", message)
            message = re.sub(r"=,", "=", message)

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


def calculate_number_of_sentences_per_set(num_sentences):
    num_test = int(20 * num_sentences / 100)  # Test set = 20% of whole set, train 80%
    num_train = num_sentences - num_test
    return num_test, num_train

if __name__ == "__main__":
    # store under "generated/" if folder was not specified
    res_dir = "../generated/%s" % datetime.now().strftime("%Y-%m-%dt%H.%M")
    sets = SetsGenerator(results_dir=res_dir, use_full_verb_form=True)
    sets.generate_sets(num_sentences=2500, lang='en', include_bilingual_lexicon=True, percentage_pronoun=50,
                       percentage_l2=50, print_sets=True)

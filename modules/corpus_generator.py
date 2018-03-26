# -*- coding: utf-8 -*-
import random
import re
import os
import codecs
from datetime import datetime
import sys
import pickle
import json
from copy import deepcopy
from itertools import chain, izip_longest

reload(sys)
sys.setdefaultencoding("utf-8")  # otherwise Spanish (non-ascii) characters throw an error
# random.seed(18)


class SetsGenerator:
    """
    Overly complicated and ugly class to generate sentence/meaning pairs for the Dual-path model (To be refactored)
    """
    def __init__(self, results_dir, use_simple_semantics, allow_free_structure_production, use_full_verb_form,
                 ignore_past, percentage_noun_phrase, add_filler, use_adjectives, extend_np_using_with=False):
        """
        :param results_dir:
        :param use_simple_semantics:
        :param allow_free_structure_production:
        :param use_full_verb_form:
        :param ignore_past:
        :param percentage_noun_phrase: percentage of Noun Phrases (NPs) vs pronouns in subject position
        :param percentage_l2: percentage of L2 (e.g., English) vs L1
        :param add_filler: whether to add a filler word (adverb, conjunctive) at the beginning of the sentence
        :param use_adjectives: whether to use adjectives in NPs
        """

        self.results_dir = results_dir
        self.path = os.path.dirname(os.path.realpath('__file__'))
        if 'modules' not in self.path:
            self.path += '/modules/'
        if os.path.isdir(self.results_dir):  # if this folder name exists already add a timestamp at the end
            self.results_dir += datetime.now().strftime(".%S")
        os.makedirs(self.results_dir)
        self.percentage_noun_phrase = percentage_noun_phrase
        self.add_filler = add_filler
        self.ignore_past_tense = ignore_past
        self.use_adjectives = use_adjectives
        self.extend_np_using_with = extend_np_using_with
        self.concept_to_es_words = {}
        self.concepts = {'M': 'M', 'F': 'F'}  # initialize concepts with semantic gender (non language-specific)
        self.concepts_en = {'chair': 'CHAIR', 'pen': 'PEN', 'wallet': 'WALLET', 'bag': 'BAG', 'ball': 'BALL',
                            'kite': 'KITE', 'toy': 'TOY', 'stick': 'STICK', 'key': 'KEY', 'balloon': 'BALLOON',
                            'long': 'LONG', 'tall': 'TALL', 'short': 'SHORT', 'cheap': 'CHEAP', 'sad': 'SAD',
                            'happy': 'HAPPY', 'expensive': 'EXPENSIVE', 'colorful': 'COLORFUL'}
        self.concepts_es = {'bolígrafo': 'PEN', 'silla': 'CHAIR', 'cartera': 'WALLET', 'globo': 'BALLOON',
                            'bolso': 'BAG', 'cometa': 'KITE', 'juguete': 'TOY', 'palo': 'STICK', 'llave': 'KEY',
                            'pelota': 'BALL', 'feliz': 'HAPPY', 'triste': 'SAD', 'alto': 'TALL', 'pequeño': 'SMALL',
                            'alta': 'TALL', 'pequeña': 'SMALL', 'barrato': 'CHEAP', 'barrata': 'CHEAP',
                            'caro': 'EXPENSIVE', 'cara': 'EXPENSIVE', 'larga': 'LONG',
                            'colorido': 'COLORFUL', 'colorida': 'COLORFUL'}
        # source: https://www.realfastspanish.com/vocabulary/spanish-cognates
        self.cognates = {'noun': {'animate': {'f': 'conductor criminal director doctor'.split(),
                                              'm': 'actor animal director doctor inspector'.split()},
                                  'inanimate': {'m': 'chocolate melon piano'.split(),
                                                'f': ['radio']}},
                         'adj': 'popular social simple superficial terrible vulnerable'.split()
                         }
        self.cognate_values = ['actor', 'animal', 'conductor', 'criminal', 'director', 'doctor', 'inspector',
                               'chocolate', 'melon', 'piano', 'radio', 'popular', 'social', 'simple', 'superficial',
                               'terrible', 'vulnerable']
        self._add_cognates_to_concepts()
        # http://mentalfloss.com/article/57195/50-spanish-english-false-friend-words
        # ropa (clothes) - rope / bombero (fire-fighter) - bomber / sano (healthy) - sane / carpeta (folder) - carpet /
        # bizarro (brave) - bizarre / chocar (hit, collide) - choke / contestar (answer) - contest /
        # embarazada (pregnant) - embarassed / enviar (send) - to envy / largo (long) - large /
        # pariente (relative) - parent / pretender (attempt) - pretend / preocupado (worried) - preoccupied /
        # realizar (become true) - realize / recordar (remember) - record / sopa (soup) - soap /
        # soportar (tolerate) - support / tuna (prickly pear) - tuna / vaso (drinking glass) - vase /
        # rapista (barber) - rapist / bizcocho (cake) - biscuit
        self.false_friends = {'noun': {'animate': {'m': 'bombero pariente rapista'.split(),
                                                   'f': 'embarazada pariente'.split()},
                                       'inanimate': {'f': 'ropa carpeta sopa tuna'.split(),
                                                     'm': 'vaso bizcocho'.split()}},
                              'adj': 'sano bizarro largo preocupado'.split()
                              # TODO: 'verb': 'chocar contestar enviar pretender realizar recordar soportar'.split()
                              }
        self.false_friends_values = ['bombero', 'embarazada', 'pariente', 'rapista', 'ropa',
                                     'carpeta', 'sopa', 'tuna', 'vaso', 'bizcocho', 'sano', 'bizarro', 'largo',
                                     'preocupado', 'chocar', 'contestar', 'enviar', 'pretender', 'realizar',
                                     'recordar', 'soportar']
        self._add_false_friends_to_concepts()
        self.lexicon = {}
        self.lexicon_en = {'en': {'det': {'def': 'the', 'indef': 'a'},
                                  'pron': {'m': 'he', 'f': 'she', 'n': 'it'}, #'c': ['he', 'she']},
                                  'noun': {
                                      'animate': {'m': 'man boy father brother teacher grandfather husband '
                                                       'host nephew son uncle waiter monk widower'
                                                       ' bull dog'.split(),
                                                  'f': 'woman girl mother sister nurse actress grandmother wife '
                                                       'hostess niece daughter aunt waitress nun'
                                                       ' widow cow cat'.split(),
                                                  },
                                      'inanimate': {'n': 'ball stick toy kite key bag balloon chair pen wallet'.split()}
                                  },
                                  'adj': {
                                      'animate': 'happy sad tall short'.split(),
                                      'inanimate': 'cheap expensive big colorful'.split()
                                  },
                                  'aux': {'singular': {'present': 'is', 'past': 'was'},
                                          'plural': {'present': 'are', 'past': 'were'},
                                          },
                                  'by': 'by',
                                  'with': 'with',
                                  'to': 'to',
                                  'filler': 'actually'
                                  }
                           }

        self.lexicon_es = {'es': {'det': {'def': {'m': 'el', 'f': 'la'},
                                          'indef': {'m': 'un', 'f': 'una'},
                                          },
                                  'pron': {'m': 'él', 'f': 'ella'},
                                  'noun': {'animate': {'m': 'niño padre hermano perro maestro abuelo esposo '
                                                            'sobrino investigador hijo tío camarero toro '
                                                            'presidente hombre'.split(),
                                                       'f': 'mujer niña madre hermana gata enfermera actríz abuela '
                                                            'esposa sobrina investigadora hija tía camarera vaca '
                                                            'directora presidenta'.split()},
                                           'inanimate': {'m': 'palo juguete bolso bolígrafo globo'.split(),
                                                         'f': 'pelota llave cometa silla cartera'.split()}
                                           },
                                  'adj': {
                                      'animate': {'m': 'feliz triste alto pequeño'.split(),
                                                  'f': 'feliz triste alta pequeña'.split()},
                                      'inanimate': {'m': 'barrato caro grande colorido'.split(),
                                                    'f': 'barrata cara grande colorida'.split()}
                                  },
                                  'aux': {'singular': {'present': 'está', 'past': 'estaba'},
                                          'plural': {'present': 'están', 'past': 'estaban'},
                                          },
                                  'by': 'por',
                                  'to': 'a_',
                                  'with': 'con',
                                  'filler': 'ta'}  # 'pues'}
                           }

        self.lexicon_el = {'el': {'det': {'def': {'m': 'ο', 'f': 'η', 'n': 'το'},
                                          'indef': {'m': 'ένας', 'f': 'μία', 'n': 'ένα'},
                                          },
                                  'pron': {'m': 'αυτός', 'f': 'αυτή', 'n': 'αυτό'},
                                  'noun': {'animate': {'m': 'αγόρι πατέρας αδερφός σκύλος δάσκαλος ηθοποιός παππούς '
                                                            'άντρας ανηψιός αστυνομικός γιός θείος σερβιτόρος διεθυντής'
                                                            'πρόεδρος '
                                                            'ταύρος'.split(),
                                                       'f': 'γυναίκα κορίτσι μητέρα αδερφή νοσοκόμα ηηθοποιός γιαγιά '
                                                            'σύζυγος ανηψιά αστυνομικίνα κόρη θεία σερβιτόρα '
                                                            'διευθύντρια ηπρόεδρος'
                                                            'γάτα αγελάδα'.split()},
                                           'inanimate': {'n': 'ραβδί παιχνίδι στυλό μπαλόνι κλειδί πορτοφόλι'.split(),
                                                         'f': 'τσάντα μπάλα καρέκλα'.split(),
                                                         'm': 'χαρταετός'}
                                           },
                                  'aux': {'singular': {'present': 'είναι', 'past': 'ήταν'},
                                          'plural': {'present': 'είναι', 'past': 'ήταν'},
                                          },
                                  'by': 'από',
                                  'to': 'στ',
                                  'filler': 'επομένως'}
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
            # EL
            self.lexicon_el['el']['verb'] = {'intrans': 'κολυμπά πηδά παρπατά τρέχ φτάν πεθαίν τρώ'.split(),
                                             'trans': 'σπρώσχν χτυπά γλωτσά κουβαλά'.split(),
                                             'double': 'δίν ρίχν δείχν παρουσιάζ'.split()}
            self.lexicon_el['el']['verb_suffix'] = {'present': '-ει', 'past': '-γε'}

        self.identifiability = ['DEF', 'INDEF', 'PRON', 'EMPH']
        if use_simple_semantics:  # update concepts
            self.concepts_en.update({'sister': 'SISTER', 'brother': 'BROTHER', 'boy': 'BOY', 'girl': 'GIRL',
                                     'mother': 'MOTHER', 'father': 'FATHER', 'daughter': 'DAUGHTER',
                                     'son': 'SON', 'policewoman': 'POLICEWOMAN', 'policeman': 'POLICEMAN',
                                     'actress': 'ACTRESS', 'actor': 'ACTOR', 'wife': 'WIFE', 'husband': 'HUSBAND',
                                     'hostess': 'HOSTESS', 'host': 'HOST', 'grandmother': 'GRANDMOTHER',
                                     'grandfather': 'GRANDFATHER', 'waitress': 'WAITRESS', 'waiter': 'WAITER',
                                     'aunt': 'AUNT', 'uncle': 'UNCLE', 'nephew': 'NEPHEW', 'niece': 'NIECE',
                                     'woman': 'WOMAN', 'man': 'MAN', 'bull': 'BULL',
                                     'nurse': 'NURSE', 'cat': 'CAT', 'dog': 'DOG', 'teacher': 'TEACHER', 'cow': 'COW',
                                     'widow': 'WIDOW', 'widower': 'WIDOWER', 'nun': 'NUN', 'monk': 'MONK'})

            self.concepts_es.update({'hermana': 'SISTER', 'hermano': 'BROTHER', 'ni\xc3\xb1o': 'BOY',
                                     'ni\xc3\xb1a': 'GIRL', 'madre': 'MOTHER', 'padre': 'FATHER', 'hija': 'DAUGHTER',
                                     'hijo': 'SON', 'investigador': 'RESEARCHER', 'investigadora': 'FRESEARCHER',
                                     'esposa': 'WIFE', 'esposo': 'HUSBAND', 'actríz': 'ACTRESS',
                                     'abuela': 'GRANDMOTHER', 'abuelo': 'GRANDFATHER', 'camarera': 'WAITRESS',
                                     'camarero': 'WAITER', 'tía': 'AUNT', 'tío': 'UNCLE', 'sobrino': 'NEPHEW',
                                     'sobrina': 'NIECE', 'mujer': 'WOMAN', 'hombre': 'MAN', 'maestro': 'TEACHER',
                                     'presidenta': 'CHAIRWOMAN', 'presidente': 'CHAIRMAN', 'directora': 'HEADMISTRESS',
                                     'vaca': 'COW', 'toro': 'BULL', 'gata': 'CAT',
                                     'enfermera': 'NURSE', 'perro': 'DOG'})
        else:
            # note that sister = SIBLING + F, brother = SIBLING + M, etc
            self.concepts_en.update({'sister': 'SIBLING', 'brother': 'SIBLING', 'boy': 'CHILD', 'girl': 'CHILD',
                                     'mother': 'PARENT', 'father': 'PARENT', 'daughter': 'OFFSPRING',
                                     'son': 'OFFSPRING', 'policewoman': 'POLICEMAN', 'policeman': 'POLICEMAN',
                                     'actress': 'ACTOR', 'actor': 'ACTOR', 'wife': 'PARTNER', 'husband': 'PARTNER',
                                     'hostess': 'HOST', 'host': 'HOST', 'grandmother': 'GRANDPARENT',
                                     'grandfather': 'GRANDPARENT', 'waitress': 'WAITER', 'waiter': 'WAITER',
                                     'aunt': 'UNCLES', 'uncle': 'UNCLES', 'nephew': 'NIBLING', 'niece': 'NIBLING',
                                     'woman': 'HUMAN', 'man': 'HUMAN', 'bull': 'BULL',
                                     'nurse': 'NURSE', 'cat': 'CAT', 'dog': 'DOG', 'teacher': 'TEACHER', 'cow': 'COW',
                                     'widow': 'WIDOW', 'widower': 'WIDOW', 'nun': 'MONK', 'monk': 'MONK'})

            self.concepts_es.update({'hermana': 'SIBLING', 'hermano': 'SIBLING', 'ni\xc3\xb1o': 'CHILD',
                                     'ni\xc3\xb1a': 'CHILD', 'madre': 'PARENT', 'padre': 'PARENT', 'hija': 'OFFSPRING',
                                     'hijo': 'OFFSPRING', 'investigador': 'RESEARCHER', 'investigadora': 'RESEARCHER',
                                     'esposa': 'PARTNER', 'esposo': 'PARTNER', 'actríz': 'ACTOR',
                                     'abuela': 'GRANDPARENT', 'abuelo': 'GRANDPARENT', 'camarera': 'WAITER',
                                     'camarero': 'WAITER', 'tía': 'UNCLES', 'tío': 'UNCLES', 'sobrino': 'NIBLING',
                                     'sobrina': 'NIBLING', 'mujer': 'HUMAN', 'hombre': 'HUMAN', 'maestro': 'TEACHER',
                                     'presidenta': 'CHAIRMAN', 'presidente': 'CHAIRMAN', 'directora': 'HEADMASTER',
                                     'vaca': 'COW', 'toro': 'COW', 'gata': 'CAT',
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
        self.event_sem = ['PROG', 'SIMPLE', 'PRESENT', 'PAST', 'AGT', 'PAT', 'REC']
        self.target_lang = []
        self.roles = ['AGENT', 'PATIENT', 'ACTION', 'RECIPIENT', 'AGENT-MOD', 'PATIENT-MOD']

        self.structures = []
        self.num_structures = None
        if use_full_verb_form:
            self.structures_en = read_structures(os.path.join(self.path, 'corpus/full_verb_structures.en'))
            self.structures_es = read_structures(os.path.join(self.path, 'corpus/full_verb_structures.es'))
        else:  # separate lemma from suffix
            if self.extend_np_using_with:
                self.structures_en = read_structures(os.path.join(self.path, 'corpus/morph_and_with_structures.en'))
                self.structures_es = read_structures(os.path.join(self.path, 'corpus/morph_and_with_structures.es'))
            else:
                self.structures_en = read_structures(os.path.join(self.path, 'corpus/morph_no_with_structures.en'))
                self.structures_es = read_structures(os.path.join(self.path, 'corpus/morph_no_with_structures.es'))

        if allow_free_structure_production:
            self.event_sem = [evsem for evsem in self.event_sem if evsem not in ['AGT', 'PAT', 'REC']]
            self.structures_en = strip_roles(self.structures_en)
            self.structures_es = strip_roles(self.structures_es)

    def add_cognates_and_ff_to_lexicon(self, include_ff=True):
        self.lexicon_en['en']['noun']['animate']['m'] += self.cognates['noun']['animate']['m']
        self.lexicon_en['en']['noun']['animate']['f'] += self.cognates['noun']['animate']['f']
        self.lexicon_en['en']['noun']['inanimate']['n'] += self.cognates['noun']['inanimate']['m']
        self.lexicon_en['en']['noun']['inanimate']['n'] += self.cognates['noun']['inanimate']['f']
        self.lexicon_en['en']['adj']['animate'] += self.cognates['adj']
        self.lexicon_en['en']['adj']['inanimate'] += self.cognates['adj']
        if include_ff:
            self.lexicon_en['en']['noun']['animate']['m'] += self.false_friends['noun']['animate']['m']
            self.lexicon_en['en']['noun']['animate']['f'] += self.false_friends['noun']['animate']['f']
            self.lexicon_en['en']['noun']['inanimate']['n'] += self.false_friends['noun']['inanimate']['m']
            self.lexicon_en['en']['noun']['inanimate']['n'] += self.false_friends['noun']['inanimate']['f']
            self.lexicon_en['en']['adj']['animate'] += self.false_friends['adj']
            self.lexicon_en['en']['adj']['inanimate'] += self.false_friends['adj']
            # TODO self.lexicon_en['en']['verb'] += self.false_friends['verb']
        # same for ES
        self.lexicon_es['es']['noun']['animate']['m'] += self.cognates['noun']['animate']['m']
        self.lexicon_es['es']['noun']['animate']['f'] += self.cognates['noun']['animate']['f']
        self.lexicon_es['es']['noun']['inanimate']['m'] += self.cognates['noun']['inanimate']['m']
        self.lexicon_es['es']['noun']['inanimate']['f'] += self.cognates['noun']['inanimate']['f']
        self.lexicon_es['es']['adj']['animate']['m'] += self.cognates['adj']
        self.lexicon_es['es']['adj']['inanimate']['f'] += self.cognates['adj']
        self.lexicon_es['es']['adj']['animate']['m'] += self.cognates['adj']
        self.lexicon_es['es']['adj']['inanimate']['f'] += self.cognates['adj']
        if include_ff:
            self.lexicon_es['es']['noun']['animate']['m'] += self.false_friends['noun']['animate']['m']
            self.lexicon_es['es']['noun']['animate']['f'] += self.false_friends['noun']['animate']['f']
            self.lexicon_es['es']['noun']['inanimate']['m'] += self.false_friends['noun']['inanimate']['m']
            self.lexicon_es['es']['noun']['inanimate']['f'] += self.false_friends['noun']['inanimate']['f']
            self.lexicon_es['es']['adj']['animate']['m'] += self.false_friends['adj']
            self.lexicon_es['es']['adj']['animate']['f'] += self.false_friends['adj']
            self.lexicon_es['es']['adj']['inanimate']['m'] += self.false_friends['adj']
            self.lexicon_es['es']['adj']['inanimate']['f'] += self.false_friends['adj']
            # TODO: self.lexicon_es['es']['verb'] += self.false_friends['verb']

    def generate_sets_for_cognate_experiment(self, num_sentences, lang, save_lexicon=False, include_ff=True):
        # first select cognate-free sentences
        num_sets = 3 if include_ff else 2
        original_training_set, original_test_set = self.generate_sets(num_sentences, lang,
                                                                      include_bilingual_lexicon=True,
                                                                      save_lexicon=save_lexicon,
                                                                      return_full_sets=True, use_cognates_and_ff=True,
                                                                      sets_for_cognate_experiment=num_sets)
        # replace one sentence per word with a cognate
        cognate_sets = self.generate_replacement_test_sets(original_test_set)
        if include_ff:
            # replace one sentence per word with a false friend
            false_friend_sets = self.generate_replacement_test_sets(original_test_set, cognates=False)
            all_sets = [original_training_set,
                        original_test_set + cognate_sets[1] + false_friend_sets[1]]
        else:
            all_sets = [original_sets[0] + cognate_sets[0],
                   original_sets[1] + cognate_sets[1]]
        random.shuffle(all_sets)
        sets_fname = ['test', 'train']
        for i, set_type in enumerate(all_sets):
                random.shuffle(set_type)
                for sentence, message in set_type:
                    with codecs.open('%s/%s' % (self.results_dir, "%s.in" % sets_fname[i]), 'a', "utf-8") as f:
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
        #for set_type in original_sets:  # test, training
            #replacement_set_type = []
        for sentence, message in original_sets:  # test, training
            # choose between noun and adjective
            lang = re.search(r";E=(\S.),", message).group(1).lower()
            rep_pos = random.choice(['noun', 'adj'])
            if rep_pos == 'adj':
                new_adj = random.choice(replacement_dict['adj'])
                candidate_roles = [r for r in message.split(';') if '-MOD' in r]
                role_to_replace = random.choice(candidate_roles)
                new_role = role_to_replace.split('=')
                new_role[1] = new_adj.upper()  # replace concept, not thematic role
                # in case of false friends
                if not cognates and lang != 'en':
                    new_role[1] += "_ES"
                message = message.replace(role_to_replace, '='.join(new_role))
                old_role = role_to_replace.split('=')[1]  # take arguments, not role
                if lang == 'en':
                    sentence = sentence.replace(" %s " % old_role.lower(), " %s " % new_adj)
                else:  # need to look up concept -> word before replacing
                    if old_role in self.concept_to_es_words:
                        word_to_replace = self.concept_to_es_words[old_role]
                    else:
                        word_to_replace = old_role.lower()
                    for word in word_to_replace:
                        sentence = sentence.replace(" %s " % word, " %s " % new_adj)
            else:  # noun
                ignore = ['-MOD=', 'E=', 'ACTION=']
                candidate_roles = [r for r in message.split(';') if not any(x in r for x in ignore)]
                role_to_replace = random.choice(candidate_roles).split('=')[1].split(',')
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
                    new_word = random.choice(replacement_dict['noun']['animate'][gender])
                else:
                    # find gender of word
                    if lang == 'es':
                        gender = 'm'
                        if word_to_replace in self.lexicon[lang]['noun']['inanimate']['f']:
                            gender = 'f'
                    else:
                        gender = random.choice(['m', 'f'])
                    new_word = random.choice(replacement_dict['noun']['inanimate'][gender])
                new_role = deepcopy(role_to_replace)
                new_role[concept_idx] = new_word.upper()
                if not cognates and lang != 'en':  # Spanish FF
                    new_role[concept_idx] += "_ES"
                message = message.replace(','.join(role_to_replace) + ',', ','.join(new_role) + ',')
                message = message.replace(','.join(role_to_replace) + ';', ','.join(new_role) + ';')
                if sentence.split().count(word_to_replace) > 1:   # if more than once change all roles
                    message = message.replace(role_to_replace[concept_idx] + ',', new_word.upper() + ',')
                sentence = sentence.replace(" %s " % word_to_replace, " %s " % new_word)
            if cognates:
                message += ',COG'
            else:
                message += ',FF'
            replacement_sets.append((sentence, message))
        #replacement_sets.append(replacement_set_type)
        return replacement_sets

    def generate_sets(self, num_sentences, lang, include_bilingual_lexicon, use_cognates_and_ff,
                      debug=False, save_lexicon=False, return_full_sets=False, sets_for_cognate_experiment=None):
        """
        :param num_sentences: number of training AND test sentences to be generated
        :param lang: language code
        :param include_bilingual_lexicon: whether lexicon should be bilingual even if generated sentences are in L1
        :param use_cognates_and_ff: whether to include cognates and false friends in the sentences
        :param debug: whether to print results on screen
        :param save_lexicon: whether to save lexicon/concepts etc or just training/test sets
        :param return_full_sets: whether to return sets of message/sentence pairs
        :param sets_for_cognate_experiment: in case we run a cognate experiment we want to know whether the test set
                will be divided into 2 or 3 parts. Default: None (no cognate experiment)
        """
        if sets_for_cognate_experiment:
            num_test, a = calculate_number_of_sentences_per_set(num_sentences/sets_for_cognate_experiment)
            a, num_train = calculate_number_of_sentences_per_set(num_sentences)  # training set isn't controlled
        else:
            num_test, num_train = calculate_number_of_sentences_per_set(num_sentences)
        self.set_structures_and_lexicon(lang)

        sentence_structures_train = self.generate_sentence_structures(num_train)
        sentence_structures_test = self.generate_sentence_structures(num_test)

        if return_full_sets:
            test_set = self.generate_sentences(sentence_structures_test, fname=None,
                                               debug=debug, return_info_type='full')
            training_set = self.generate_sentences(sentence_structures_train, fname=None, debug=debug,
                                                   exclude_test_sentences=test_set, return_info_type='full')
        else:
            test_set = self.generate_sentences(sentence_structures_test, fname="test.in",
                                               debug=debug, return_info_type='set')
            self.generate_sentences(sentence_structures_train, fname="train.in", debug=debug,
                                    exclude_test_sentences=test_set)

        if save_lexicon:
            if include_bilingual_lexicon:
                if 'EN' not in self.target_lang:
                    self.lexicon.update(self.lexicon_en)
                    self.target_lang.append('EN')
                    self.concepts.update(self.concepts_en)
                elif 'ES' not in self.target_lang:
                    self.lexicon.update(self.lexicon_es)
                    self.target_lang.append('ES')
                    self.concepts.update(self.concepts_es)
            self.print_lexicon(use_cognates_and_ff)

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

            with codecs.open('%s/lexicon_to_concept.pickled' % self.results_dir, 'w', "utf-8") as pckl:
                pickle.dump(self.concepts, pckl)

        if return_full_sets:
            return test_set, training_set

    def set_structures_and_lexicon(self, lang):
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
        self.concept_to_es_words = self._reverse_lexicon_to_concept()  # concept to Spanish word

    def generate_sentence_structures(self, num_sentences):
        sentence_structures = []
        for i in range(num_sentences / self.num_structures):
            sentence_structures += deepcopy(self.structures)
        for m in range(num_sentences % self.num_structures):  # runs if sentence_structures < num_sentences
            sentence_structures.append(deepcopy(self.structures[random.randint(0, self.num_structures - 1)]))
        random.shuffle(sentence_structures)
        return sentence_structures

    def generate_sentences(self, sentence_structures, fname, exclude_test_sentences=[], return_info_type=None,
                           debug=False):
        """
        :param sentence_structures: list of allowed structures for the generated sentences
        :param fname: filename where results will be stored
        :param exclude_test_sentences: list of sentences to exclude (test set needs to contain novel messages only)
        :param return_info_type: 'set' to return the set of generated messages (to exclude them when generating the
        training set), 'full' to return both messages and sentences, None (default)
        :param debug: whether to print results on screen
        :return:
        """
        generated_sentences = []  # keep track of generated sentences
        num_sentences = len(sentence_structures)

        # determine how often we will use NPs vs determiners
        if not self.percentage_noun_phrase:  # use pronouns only
            np = [0] * num_sentences
        else:  # any other percentage
            number_np = num_sentences * self.percentage_noun_phrase / 100
            np = number_np * [1] + (num_sentences - number_np) * [0]
            random.shuffle(np)

        # if add_filler:  # adds filler to both languages
        #    for s in range(num_sentences):
        #        sentence_structures[s][0] = "filler %s" % sentence_structures[s][0]

        # we can keep track of training sentences (messages) that are identical to test ones and exclude them
        full_msg = []
        # now select words according to structure
        sen_idx = 0
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
                                sentence.append(self.lexicon[lang]['pron'][gender])
                            elif add_det or np[sen_idx] or msg_idx > 0:
                                if type(determiners) is dict:
                                    sentence.append(determiners[gender])
                                add_det = False  # reset
                                sentence.append(wd)
                            message[msg_idx] += "," + self.get_concept(wd, lang)
                            msg_idx += 1
                        else:
                            add_det = True
                    elif type(w) is list:
                        random_word = random.choice(w)
                        if "AGENT-MOD=" in message and part == "adj":
                            message[message.index("AGENT-MOD=")] += ",%s" % self.get_concept(random_word, lang)
                        else:
                            message[msg_idx] += "," + self.get_concept(random_word, lang)  # nouns
                        if level == 'animate' and 'noun' in pos:  # include semantic gender, we can discard it later
                            message[msg_idx] += "," + gender.upper()
                        if not np[sen_idx] and msg_idx == 0 and 'noun' in pos:  # go for pronoun (instead of NP)
                            message[0] = re.sub(r"def|indef", "", message[0]) + ",PRON"
                            add_det = False
                            # add pronoun
                            sentence.append(self.lexicon[lang]['pron'][gender])
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
                        if (self.use_adjectives and ((lang == 'es' and 'adj' in pos and 'with' not in pos_full) or
                           (lang == 'en' and 'noun' in pos and 'with' not in pos_full and msg_idx < 1))):
                            msg_idx += 2
                        elif not self.use_adjectives or 'verb' in pos or (msg_idx > 1 and lang == 'es') or \
                                (lang == 'en' and 'noun' in pos) or (lang == 'es' and 'adj' in pos):
                            msg_idx += 1
                    else:  # elif type == str
                        if not np[sen_idx] and w == determiners and msg_idx < 1:
                            continue
                        sentence.append(w)
                elif type(syn) is list:
                    if add_det:
                        det = determiners if gender not in determiners else determiners[gender]
                        sentence.append(det)
                        add_det = False

                    random_word = random.choice(syn)
                    if "AGENT-MOD=" in message and part == "adj":
                        message[message.index("AGENT-MOD=")] += ",%s" % self.get_concept(random_word, lang)
                    else:
                        message[msg_idx] += self.get_concept(random_word, lang) #'%s%s' % ("," if part == "adj" else "", self.get_concept(random_word))  # verb

                    if 'verb' in pos:
                        msg_idx += 1
                    if part != 'adj' or (part == 'adj' and not (not np[sen_idx] and msg_idx == 0)):
                        sentence.append(random_word)
                else:
                    sentence.append(syn)

            sentence = u"%s ." % " ".join(sentence)
            unique_roles = [w for w in sentence.split() if w not in ['a', 'the', 'un', 'una', 'la', 'el']]
            message = ";".join(message).upper()
            message = re.sub(r",,", ",", message)
            message = re.sub(r"=,", "=", message)
            if message in (exclude_test_sentences or generated_sentences) or \
               len(unique_roles) != len(set(unique_roles)):
                sentence_structures.append((pos_full, msg))  # find unique sentence, don't add it to the training set
            else:
                generated_sentences.append(message)
                sen_idx += 1
                if debug:
                    print u"%s## %s" % (sentence, message)
                if fname:  # fname is None in the cognate experiment case
                    with codecs.open('%s/%s' % (self.results_dir, fname), 'a',  "utf-8") as f:
                        f.write(u"%s## %s\n" % (sentence, message))

            if return_info_type == 'set':
                full_msg.append(message)
            elif return_info_type == 'full':
                full_msg.append((sentence, message))
        return full_msg

    def get_concept(self, word, lang):
        if word in self.concepts:
            if word in self.cognate_values:
                return "%s,COG" % self.concepts[word]
            if word in self.false_friends_values:
                return "%s%s,FF" % (self.concepts[word], "_ES" if lang == 'es' else '')
            return self.concepts[word]

        # in case we haven't updated the concept of the word
        self.concepts[word] = word.upper()
        print "'%s': '%s'," % (word, word.upper())  # so that we can add it manually
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

    def print_lexicon(self, use_cognates_and_ff):
        all_structures = set([pos[0] for pos in self.structures])
        all_pos = set(chain.from_iterable([pos.split() for pos in all_structures]))
        main_pos = set([p.split('::')[0] if '::' in p else p for p in all_pos])  # get rid of animate/inanimate info etc
        if 'pron' not in main_pos:
            main_pos.add('pron')
        if 'with' not in main_pos:
            main_pos.add('with')

        if use_cognates_and_ff:
            self.add_cognates_and_ff_to_lexicon()

        unique_dict = []
        for lang in self.target_lang:  # keep separate for now because of code-switching
            for pos in main_pos:
                lex = list(get_dict_items(pos, self.lexicon[lang.lower()]))
                if any(isinstance(i, list) for i in lex):
                    lex = list(chain.from_iterable(lex))
                if use_cognates_and_ff:
                    lex = set([v for v in lex if v not in unique_dict])  # avoid duplicate words
                    unique_dict.extend(lex)
                with codecs.open('%s/lexicon.in' % self.results_dir, 'a', "utf-8") as f:
                    f.write("{0}:\n{1}\n".format(pos.upper(), "\n".join(lex)))

    def _add_cognates_to_concepts(self):
        for v in self.cognate_values:
            self.concepts.update({v: v.upper()})

    def _add_false_friends_to_concepts(self):
        for v in self.false_friends_values:
            self.concepts_en.update({v: v.upper()})
            self.concepts_es.update({v+"_ES": v.upper()+"_ES"})

    def _reverse_lexicon_to_concept(self):
        concept_to_es_words = {}  # use
        for revkey, revvalue in self.concepts.iteritems():
            if revkey != revvalue.lower():
                if revvalue in concept_to_es_words:
                   concept_to_es_words[revvalue].append(revkey)
                else:
                    concept_to_es_words[revvalue] = [revkey]
        return concept_to_es_words


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


def strip_roles(structures):
    structures = [(pos, re.sub(r'|'.join(map(re.escape, [',AGT', ',PAT', ',-1', ',REC'])), '', msg))
                  for pos, msg in structures]
    return structures


def dump_to_json(fname, dictionary):
    # d = json.dumps(dictionary, indent=4)
    with open(fname, 'w') as f:
        json.dump(dictionary, f)


def get_dict_items(key, dictionary):
    if key in dictionary:
        dd = dictionary[key]
        if not isinstance(dd, dict):
            yield dd
        else:
            list_words = []  # TODO: replace with recursive function, this is ugly
            for idx, value in dd.iteritems():
                if not isinstance(value, dict):
                    list_words.append(value)
                else:
                    for r, v in value.iteritems():
                        if not isinstance(v, dict):
                            list_words.append(v)
                        else:
                            for rr, vv in v.iteritems():
                                list_words.append(vv)
            yield flatten_list(list_words)


def flatten_list(nested_list):
    if any(isinstance(i, list) for i in nested_list):
        return flatten_list(list(chain.from_iterable(nested_list)))
    else:
        return nested_list


def calculate_number_of_sentences_per_set(num_sentences):
    num_test = int(20 * num_sentences / 100)  # Test set = 20% of whole set, training 80%
    num_train = num_sentences - num_test
    return num_test, num_train


if __name__ == "__main__":
    # store under "generated/" if folder was not specified
    res_dir = "../generated/%s" % datetime.now().strftime("%Y-%m-%dt%H.%M")
    sets = SetsGenerator(results_dir=res_dir, use_full_verb_form=False, use_simple_semantics=True,
                         allow_free_structure_production=False, ignore_past=True, percentage_noun_phrase=100,
                         add_filler=False, use_adjectives=True)
    sets.generate_sets_for_cognate_experiment(num_sentences=7500, lang='esen', save_lexicon=True)
    #sets.generate_sets(num_sentences=2500, lang='esen', include_bilingual_lexicon=True, debug=True, save_lexicon=True)

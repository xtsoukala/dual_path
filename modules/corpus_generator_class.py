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


class Word:
    def __init__(self, word, pos, concept, lang, syntactic_gender, semantic_gender, animacy,
                 identifiability, tense, maximum_verb_objects):
        self.word = word
        self.concept = concept
        self.lang = lang
        self.semantic_gender = semantic_gender
        if self.semantic_gender:
            self.syntactic_gender = semantic_gender
        else:
            self.syntactic_gender = syntactic_gender
        self.animacy = animacy
        self.identifiability = identifiability
        self.tense = tense
        if self.identifiability:
            self.pos = identifiability
        else:
            self.pos = pos
        self.maximum_verb_objects = maximum_verb_objects


class Languages:
    def __init__(self):
        self.lexica = set()

    def add_word(self, word, concept, lang=None, pos=None, syntactic_gender=None, semantic_gender=None, animacy=False,
                 identifiability=None, tense=None, maximum_verb_objects=None):
        self.lexica.add(Word(word=word, pos=pos, concept=concept, lang=lang, syntactic_gender=syntactic_gender,
                             semantic_gender=semantic_gender, animacy=animacy,
                             identifiability=identifiability, tense=tense, maximum_verb_objects=maximum_verb_objects))


class SetsGenerator:
    """
    Overly complicated and ugly class to generate sentence/meaning pairs for the Dual-path model.
    To be refactored
    """
    def __init__(self, results_dir, allow_free_structure_production=False):
        self.results_dir = results_dir

        if os.path.isdir(self.results_dir):  # if this folder name exists already add a timestamp at the end
            self.results_dir += datetime.now().strftime(".%S")
        os.makedirs(self.results_dir)

        self.lexica = Languages()
        self.lexica.add_word(word=".", pos="PER")
        # first EN language
        lang = "en"
        self.lexica.add_word(word="the", pos="DET", identifiability="DEF", lang=lang)
        self.lexica.add_word(word="a", pos="DET", identifiability="INDEF", lang=lang)
        self.lexica.add_word(word="he", semantic_gender="M", identifiability="PRON", animacy=True, lang=lang)
        self.lexica.add_word(word="she", semantic_gender="F", identifiability="PRON", animacy=True, lang=lang)
        self.lexica.add_word(word="it", identifiability="PRON", lang=lang)
        male_nouns = ('man boy father brother dog teacher actor grandfather '
                      'husband host nephew policeman son uncle waiter bull'.split())
        for noun in male_nouns:
            self.lexica.add_word(word=noun, pos="NOUN", semantic_gender="M", lang=lang, animacy=True)
        female_nouns = ('woman girl mother sister cat nurse actress grandmother '
                        'wife hostess niece policewoman daughter aunt waitress cow'.split())
        for noun in female_nouns:
            self.lexica.add_word(word=noun, pos="NOUN", semantic_gender="F", lang=lang, animacy=True)
        for noun in 'ball stick toy kite key bag balloon'.split():
            self.lexica.add_word(word=noun, pos="NOUN", concept=noun.upper(), lang=lang)

        for intransitive_verb in 'swim jump walk run arrive lie sneeze sit die eat'.split():
            self.lexica.add_word(word=intransitive_verb, pos="VERB",
                                 concept=intransitive_verb.upper(), maximum_verb_objects=0, lang=lang)
        for transitive_verb in 'push hit kick carry'.split():
            self.lexica.add_word(word=transitive_verb, concept=transitive_verb.upper(),
                                 pos="VERB", maximum_verb_objects=1, lang=lang)
        for double_verb in 'give throw show present'.split():
            self.lexica.add_word(word=double_verb, concept=double_verb.upper(),
                                 pos="VERB", maximum_verb_objects=2, lang=lang)

        self.lexica.add_word(word="is", pos="AUX", tense="PRESENT", lang=lang)
        self.lexica.add_word(word="was", pos="AUX", tense="PAST", lang=lang)

        self.lexica.add_word(word="-ing", pos="ING", lang=lang)
        self.lexica.add_word(word="-s", pos="VERB_SUFFIX", tense="PRESENT", lang=lang)
        self.lexica.add_word(word="-ed", pos="VERB_SUFFIX", tense="PAST", lang=lang)
        self.lexica.add_word(word="by", pos="BY", lang=lang)
        self.lexica.add_word(word="to", pos="TO", lang=lang)

        lang = "es"
        self.lexica.add_word(word="un", syntactic_gender="M", pos="DET", identifiability="INDEF", lang=lang)
        self.lexica.add_word(word="una", syntactic_gender="F", pos="DET", identifiability="INDEF", lang=lang)
        self.lexica.add_word(word="el", syntactic_gender="M", pos="DET", identifiability="DEF", lang=lang)
        self.lexica.add_word(word="la", syntactic_gender="F", pos="DET", identifiability="DEF", lang=lang)
        self.lexica.add_word(word="él", semantic_gender="M", identifiability="PRON", animacy=True, lang=lang)
        self.lexica.add_word(word="ella", semantic_gender="F", identifiability="PRON", animacy=True, lang=lang)
        male_nouns = ('niño padre hermano perro maestro act0r abuelo '
                      'esposo sobrino policía hijo tío camarero toro'.split())
        for noun in male_nouns:
            self.lexica.add_word(word=noun, pos="NOUN", semantic_gender="M", lang=lang, animacy=True)
        female_nouns = ('mujer niña madre hermana gata enfermera actríz '
                        'abuela esposa sobrina policía hija tía camarera vaca'.split())
        for noun in female_nouns:
            self.lexica.add_word(word=noun, pos="NOUN", semantic_gender="F", lang=lang, animacy=True)
        for noun in 'palo juguete bolso'.split():
            self.lexica.add_word(word=noun, pos="NOUN", syntactic_gender="M", lang=lang)
        for noun in 'pelota llave cometa'.split():
            self.lexica.add_word(word=noun, pos="NOUN", syntactic_gender="F", lang=lang)

        for intransitive_verb in 'nad salt camin corr dorm'.split():
            self.lexica.add_word(word=intransitive_verb, pos="VERB", maximum_verb_objects=0, lang=lang)
        for transitive_verb in 'empuj golpe pate llev'.split():
            self.lexica.add_word(word=transitive_verb, pos="VERB", maximum_verb_objects=1, lang=lang)
        for double_verb in 'd tir mostr present_'.split():
            self.lexica.add_word(word=double_verb, pos="VERB", maximum_verb_objects=2, lang=lang)

        self.lexica.add_word(word="está", pos="AUX", tense="PRESENT", lang=lang)
        self.lexica.add_word(word="estaba", pos="AUX", tense="PAST", lang=lang)

        self.lexica.add_word(word="-ando", pos="ING", lang=lang)
        self.lexica.add_word(word="-a", pos="VERB_SUFFIX", tense="PRESENT", lang=lang)
        self.lexica.add_word(word="-ó", pos="VERB_SUFFIX", tense="PAST", lang=lang)
        self.lexica.add_word(word="por", pos="BY", lang=lang)
        self.lexica.add_word(word="a_", pos="TO", lang=lang)

        lang = "el"
        self.lexica.add_word(word="ένας", syntactic_gender="M", pos="DET", identifiability="INDEF", lang=lang)
        self.lexica.add_word(word="μία", syntactic_gender="F", pos="DET", identifiability="INDEF", lang=lang)
        self.lexica.add_word(word="ένα", syntactic_gender="N", pos="DET", identifiability="INDEF", lang=lang)
        self.lexica.add_word(word="o", syntactic_gender="M", pos="DET", identifiability="DEF", lang=lang)
        self.lexica.add_word(word="η", syntactic_gender="F", pos="DET", identifiability="DEF", lang=lang)
        self.lexica.add_word(word="το", pos="DET", syntactic_gender="N", identifiability="DEF", lang=lang)

        self.lexica.add_word(word="αυτός", syntactic_gender="M", identifiability="PRON", animacy=True, lang=lang)
        self.lexica.add_word(word="αυτή", syntactic_gender="F", identifiability="PRON", animacy=True, lang=lang)
        self.lexica.add_word(word="αυτή", syntactic_gender="N", identifiability="PRON", animacy=True, lang=lang)
        male_nouns = ('άντρας πατέρας αδερφός σκύλος'.split())
        for noun in male_nouns:
            self.lexica.add_word(word=noun, pos="NOUN", semantic_gender="M", lang=lang, animacy=True)
        female_nouns = ('γυναίκα  μητέρα αδερφή γάτα'.split())
        for noun in female_nouns:
            self.lexica.add_word(word=noun, pos="NOUN", semantic_gender="F", lang=lang, animacy=True)
        self.lexica.add_word(word="κορίτσι", pos="NOUN", semantic_gender="F",
                             syntactic_gender="N", lang=lang, animacy=True)
        self.lexica.add_word(word="αγόρι", pos="NOUN", semantic_gender="F",
                             syntactic_gender="N", lang=lang, animacy=True)

        for noun in 'χαρταετός λοστός'.split():
            self.lexica.add_word(word=noun, pos="NOUN", syntactic_gender="M", lang=lang)
        for noun in 'μπάλα τσάντα'.split():
            self.lexica.add_word(word=noun, pos="NOUN", syntactic_gender="F", lang=lang)
        for noun in 'παιχνίδι κλειδί'.split():
            self.lexica.add_word(word=noun, pos="NOUN", syntactic_gender="N", lang=lang)

        for intransitive_verb in 'κολυμπά πηδά περπατά τρέχ'.split():
            self.lexica.add_word(word=intransitive_verb, pos="VERB", maximum_verb_objects=0, lang=lang)
        for transitive_verb in 'σπρώχν χτυπά κλωτσά κουβαλά'.split():
            self.lexica.add_word(word=transitive_verb, pos="VERB", maximum_verb_objects=1, lang=lang)
        for double_verb in 'δίν πετά δείχν παρουσιάζ'.split():
            self.lexica.add_word(word=double_verb, pos="VERB", maximum_verb_objects=2, lang=lang)

        self.lexica.add_word(word="είναι", pos="AUX", tense="PRESENT", lang=lang)
        self.lexica.add_word(word="ήταν", pos="AUX", tense="PAST", lang=lang)

        self.lexica.add_word(word="-ει", pos="VERB_SUFFIX", tense="PRESENT", lang=lang)
        self.lexica.add_word(word="-γε", pos="VERB_SUFFIX", tense="PAST", lang=lang)
        self.lexica.add_word(word="από", pos="BY", lang=lang)
        self.lexica.add_word(word="σ-", pos="TO", lang=lang)

        self.identifiability = ['DEF', 'INDEF', 'PRON', 'EMPH']
        # semantic gender, which is a non language-specific concept.
        # The syntactic genders "C(ommon)" is not included
        self.concepts = {'M': 'M', 'F': 'F', 'N': 'N'}
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
                            'teacher': 'TEACHER'
                            }

        self.concepts_es = {'hermana': 'SIBLING', 'hermano': 'SIBLING', 'ni\xc3\xb1o': 'CHILD', 'ni\xc3\xb1a': 'CHILD',
                            'madre': 'PARENT', 'padre': 'PARENT',  'hija': 'OFFSPRING', 'hijo': 'OFFSPRING',
                            'policía': 'POLICEMAN', 'actriz': 'ACTOR', 'act0r': 'ACTOR',
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
        self.target_lang = []
        self.roles = ['AGENT', 'PATIENT', 'ACTION', 'RECIPIENT']

        self.structures = []
        self.num_structures = None
        if allow_free_structure_production:
            self.structures_en = [('det noun::animate aux::singular verb::intrans ing', 'AGENT=;ACTION=;E=EN,PROG'),
                                  ('det noun::animate verb::intrans verb_suffix', 'AGENT=;ACTION=;E=EN,SIMPLE'),
                                  ('det noun::animate aux::singular verb::trans ing det noun',
                                   'AGENT=;ACTION=;PATIENT=;E=EN,PROG'),
                                  ('det noun::animate verb::trans verb_suffix det noun',
                                   'AGENT=;ACTION=;PATIENT=;E=EN,SIMPLE'),
                                  ('det noun::animate aux::singular verb::double ing '
                                   'det noun::inanimate to det noun::animate',
                                   'AGENT=;ACTION=;PATIENT=;RECIPIENT=;E=EN,PROG'),
                                  ('det noun::animate aux::singular verb::double ing det noun::animate '
                                   'det noun::inanimate',
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
        else:
            self.event_sem.extend(['AGT', 'PAT', 'REC'])
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
                                  # 'AGENT=;ACTION=;PATIENT=;RECIPIENT=;E=EN,PROG,PAT,REC'),
                                  (
                                  'det noun::animate aux::singular verb::double ing det noun::animate '
                                  'det noun::inanimate',
                                  'AGENT=;ACTION=;RECIPIENT=;PATIENT=;E=EN,PROG,AGT,PAT,REC'),
                                  # ('det::def noun::animate noun_plural aux::plural verb::trans ing det noun',
                                  # 'AGENT=;ACTION=;PATIENT=;E=EN,PROG,PAT'),
                                  # ('det::def noun::animate noun_plural verb::trans det noun',
                                  # 'AGENT=;ACTION=;PATIENT=;E=EN,SIMPLE,PRESENT,PAT'),
                                  (
                                  'det noun::animate verb::double verb_suffix det noun::inanimate to det noun::animate',
                                  'AGENT=;ACTION=;PATIENT=;RECIPIENT=;E=EN,SIMPLE,PAT,-1,REC'),
                                  # 'AGENT=;ACTION=;PATIENT=;RECIPIENT=;E=EN,SIMPLE,PAT,REC'),
                                  ('det noun::animate verb::double verb_suffix det noun::animate det noun::inanimate',
                                   'AGENT=;ACTION=;RECIPIENT=;PATIENT=;E=EN,SIMPLE,AGT,PAT,REC'),

                                  # !('det noun aux::singular verb::trans par by det noun::animate',
                                  # !'PATIENT=;ACTION=;AGENT=;E=EN,SIMPLE,-1,AGT,PAT')
                                  ]

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
                                  # 'AGENT=;ACTION=;PATIENT=;RECIPIENT=;E=ES,PROG,AGT,PAT,REC'),
                                  ('det noun::animate aux::singular verb::double ing '
                                   'to det noun::animate det noun::inanimate',
                                   'AGENT=;ACTION=;RECIPIENT=;PATIENT=;E=ES,PROG,AGT,PAT,REC'),
                                  # ('det::def noun::animate noun_plural aux::plural verb::trans ing det noun',
                                  # 'AGENT=;ACTION=;PATIENT=;E=EN,PROG,PAT'),
                                  # ('det::def noun::animate noun_plural verb::trans det noun',
                                  # 'AGENT=;ACTION=;PATIENT=;E=EN,SIMPLE,PRESENT,PAT'),
                                  (
                                  'det noun::animate verb::double verb_suffix det noun::inanimate to det noun::animate',
                                  'AGENT=;ACTION=;PATIENT=;RECIPIENT=;E=ES,SIMPLE,AGT,PAT,-1,REC'),
                                  # 'AGENT=;ACTION=;PATIENT=;RECIPIENT=;E=ES,SIMPLE,AGT,PAT,REC'),
                                  (
                                  'det noun::animate verb::double verb_suffix to det noun::animate det noun::inanimate',
                                  'AGENT=;ACTION=;RECIPIENT=;PATIENT=;E=ES,SIMPLE,AGT,PAT,REC'),

                                  # !('det noun aux::singular verb::trans par by det noun::animate',
                                  # ! 'PATIENT=;ACTION=;AGENT=;E=ES,SIMPLE,-1,AGT,PAT')
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

        if include_bilingual_lexicon and "el" in lang:
            self.lexicon = self.lexicon_en.copy()
            self.lexicon.update(self.lexicon_el)
            self.target_lang.extend(['EN', 'EL'])
            self.concepts.update(self.concepts_en)
        elif include_bilingual_lexicon and "es" in lang:  # print bilingual EN ES lexicon
            self.lexicon = self.lexicon_en.copy()
            self.lexicon.update(self.lexicon_es)
            self.target_lang.extend(['EN', 'ES'])
            self.concepts.update(self.concepts_en)
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
        elif lang == 'el':
            structures = self.structures_el
            self.lexicon = self.lexicon_el
            self.target_lang = ['EL']
            self.concepts.update(self.concepts_el)
        elif "el" in lang and "en" in lang:
            structures = self.structures_en + self.structures_el
            self.lexicon = self.lexicon_en.copy()
            self.lexicon.update(self.lexicon_el)
            self.target_lang.extend(['EL', 'EN'])
            self.concepts.update(self.concepts_el)
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
        for m in range(num_sentences % self.num_structures):
            sentence_structures.append(self.structures[random.randint(0, self.num_structures - 1)])
        random.shuffle(sentence_structures)
        return sentence_structures

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


def calculate_number_of_sentences_per_set(num_sentences):
    num_test = int(0.20 * num_sentences)  # Test set = 20% of whole set, train 80%
    num_train = num_sentences - num_test
    return num_test, num_train

if __name__ == "__main__":
    sets = SetsGenerator()
    sets.generate_sets(num_sentences=200, lang='enel', include_bilingual_lexicon=True, percentage_pronoun=50,
                       percentage_l2=50, print_sets=True)

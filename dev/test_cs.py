# -*- coding: utf-8 -*-
import pickle
import collections
import os


def _read_lexicon_and_pos(fname):
    """
    :param fname: the name of the file that contains a list of categories (eg. noun, verb) and the lexicon
    :return: lexicon is a list of words, and pos is a dict that contains information regarding the index
             (in the list of lexicon) of the word for each category. E.g. {'noun': [0, 1], 'verb': [2, 3, 4]}
    """
    lexicon = ['', '.']  # position 0 is >almost< never predicted! Check why
    pos = {'': [0], '.': [1]}  # made-up POS for position 0 (empty string) and extra position for period
    prev_pos = ''
    pos_start = pos_end = 2
    for line in _read_file_to_list(fname):
        if line.endswith(":"):  # POS lines are introduced by a colon (:) otherwise it's a lexicon item
            if prev_pos:
                if prev_pos in pos:
                    pos[prev_pos] += range(pos_start, pos_end)
                else:
                    pos[prev_pos] = range(pos_start, pos_end)
                pos_start = pos_end
            prev_pos = line[:-1]  # remove the colon, use it as a dict key for pos (dictionary)
        elif line not in lexicon:  # make sure there are no duplicate words
            lexicon.append(line)
            pos_end += 1
    if prev_pos in pos:
        pos[prev_pos] += range(pos_start, pos_end)
    else:
        pos[prev_pos] = range(pos_start, pos_end)  # this adds the last syntactic category
    return pos, lexicon


def _read_file_to_list(fname):
    """
    :param fname: file name (incl. path)
    :return: Simply reads a file into a list while stripping newlines
    """
    with open(fname) as f:
        lines = [line.rstrip('\n') for line in f]
    return lines


def is_code_switched(sentence_indeces):
    """ This function only checks whetehr words from different languages were used.
    It doesn't verify the validity of the expressed message """
    sentence_no_period = [x for x in sentence_indeces if x != period_idx]  # period common in all lang
    if (all(i >= code_switched_idx for i in sentence_no_period) or
            all(i < code_switched_idx for i in sentence_no_period)):
        return False
    else:
        return True


def get_sentence_grammaticality_and_flex_order(out_sentence_idx, trg_sentence_idx):
    """
    Check a sentence's grammaticality. If the target and output sentences don't have identical POS but differ only
    on the double object expression (e.g., gives the book to him/gives him the book) then return flex_order = True
    NOTE: The grammaticality is judged by the reference (target) sentence, not by the absolute grammaticality of the
    produced sentence. E.g., if the target sentence is "She throw -s the key to the boy ." then
    "She throw -s the key ." will be regarded UNgrammatical, even if it's a correct sentence.
    """
    is_grammatical = True
    has_flex_order = True
    if out_sentence_idx == trg_sentence_idx:  # if sentences are identical no need to check further
        return is_grammatical, not has_flex_order
    out_pos = sentence_indeces_pos(out_sentence_idx)
    trg_pos = sentence_indeces_pos(trg_sentence_idx)
    print out_pos
    print trg_pos
    if out_pos == trg_pos:  # if POS is identical then the sentence is definitely grammatical
        return is_grammatical, not has_flex_order
    # diff between double object sentences -- but also make sure that output sentence is grammatical and that "to"
    # isn't the last word in the sentence.
    if list(set(out_pos).symmetric_difference(trg_pos)) == ['TO'] and out_pos[-1] != 'TO':#and out_pos in allowed_structures():
        return is_grammatical, has_flex_order
    return not is_grammatical, not has_flex_order


def allowed_structures():
    import itertools
    with open(os.path.join(input_path, 'train.enes')) as f:
         trainlines = [line.rstrip('\n') for line in f]
    all_pos = [sentence_indeces_pos(sentence.split("##")[0].split(), convert_to_idx=True)
               for sentence in trainlines]
    all_pos.sort()
    return list(all_pos for all_pos, _ in itertools.groupby(all_pos))


def test_for_flexible_order(out_sentence_idx, trg_sentence_idx, remove_last_word=True, allow_identical=False,
                            ignore_det=True):
    """
    :param out_sentence_idx:
    :param trg_sentence_idx:
    :param remove_last_word:
    :param allow_identical: Whether to return False if sentences are identical
    :return: if produced sentence was not identical to the target one, check if the meaning was correct but
    expressed with a different syntactic structure (due to, e.g., priming)
    """
    ignore_idx = to_preposition_idxs
    if ignore_det:
        ignore_idx.extend([lexicon.index('the'), lexicon.index('a'), lexicon.index('un'), lexicon.index('una'),
                           lexicon.index('la'), lexicon.index('el')])
    if out_sentence_idx == trg_sentence_idx and not allow_identical:  # only check non identical sentences
        return False
    flexible_order = False
    if same_unordered_lists([x for x in out_sentence_idx if x not in ignore_idx],
                            [x for x in trg_sentence_idx if x not in ignore_idx]):
        flexible_order = True
    elif remove_last_word and same_unordered_lists(out_sentence_idx[:-1], trg_sentence_idx[:-1]):
        flexible_order = True
    return flexible_order


def get_code_switched_type(out_sentence_idx, trg_sentence_idx):
    """ Types of code-switches:
            - intra-sentential (in the middle of the sentence)
            - inter-sentential (full switch at sentence boundaries)
            - extra-sentential (insertion of tag)
            - noun borrowing? (if no determiners were switched)

        Note: Returns FALSE if the message conveyed was not correct.
    """
    # First "translate" message into the target language and compare with target sentence
    translated_sentence_candidates = translate_idx_into_monolingual_candidates(out_sentence_idx, trg_sentence_idx[0])
    for translated_sentence_idx in translated_sentence_candidates:
        cs_type = examine_sentences_for_cs_type(translated_sentence_idx, out_sentence_idx, trg_sentence_idx)
        if cs_type:  # if not False no need to look further
            return cs_type
    return cs_type  # returns False


def examine_sentences_for_cs_type(translated_sentence_idx, out_sentence_idx, trg_sentence_idx):
    print translated_sentence_idx
    print(sentence_from_indeces(translated_sentence_idx))
    print(sentence_from_indeces(trg_sentence_idx))
    if not test_for_flexible_order(translated_sentence_idx, trg_sentence_idx, allow_identical=True):
        return False  # output and translated messages are not (flex-)identical, code-switch has wrong meaning
    check_idx = [w for w in out_sentence_idx if w not in trg_sentence_idx]
    print check_idx
    # check if sequence is a subset of the sentence (out instead of trg because target is monolingual)
    if len(check_idx) > 1 and " ".join(str(x) for x in check_idx) in " ".join(str(x) for x in out_sentence_idx):
        # if check_idx == trg_sentence_idx[-len(check_idx):] or check_idx == trg_sentence_idx[-len(check_idx):-1]:
        cs_type = "intra-sentential"
    else:
        check_idx_pos = [pos_lookup(w, pos) for w in check_idx]
        if len(set(check_idx_pos)) == 1:
            cs_type = "%s-borrow" % check_idx_pos[0].lower()
        else:
            # print self.inputs.sentence_from_indeces(out_sentence_idx)
            # print self.inputs.sentence_from_indeces(translated_sentence_idx)
            # print '---TRANSLATION---'
            # print check_idx
            # print "POS: %s" % check_idx_pos
            # print "INSPECT: %s %s" % (check_idx, self.inputs.sentence_from_indeces(check_idx))
            cs_type = "Intra-word switching"
    return cs_type


def translate_idx_into_monolingual_candidates(out_sentence_idx, trg_lang_word_idx):
    if trg_lang_word_idx < code_switched_idx:
        trans = [find_equivalent_translation_idx(idx, remove_candidates_less_than_cs_point=True)
                 if idx >= code_switched_idx else idx for idx in out_sentence_idx]
    else:
        trans = [find_equivalent_translation_idx(idx) if idx < code_switched_idx else idx
                 for idx in out_sentence_idx]
    if any(isinstance(i, list) for i in trans):
        candidate_translations = []
        # decompose into possile translation paths
        len_possible_translations = max(len(l) for l in trans if type(l) is list)
        for i in range(len_possible_translations):
            t = []
            for idx in trans:
                if type(idx) is list:
                    t.append(idx[i])
                else:
                    t.append(idx)
            candidate_translations.append(t)
        return candidate_translations
    return [trans]


def find_equivalent_translation_idx(idx, remove_candidates_less_than_cs_point=False):
    word = lexicon[idx]
    print word
    if word in translation_dict:
        translation = translation_dict[word]
    elif word in reverse_translation_dict:
        translation = reverse_translation_dict[word]
    else:
        concept = lexicon_to_concept[lexicon[idx]]
        all_translations = [w for w in concept_to_words[concept] if w != word]
        if not all_translations:
            # print word, id, concept
            # print all_translations
            return idx
        elif len(all_translations) > 1:
            if remove_candidates_less_than_cs_point:
                return [lexicon.index(translation) for translation in all_translations
                        if lexicon.index(translation) < code_switched_idx]
            else:
                return [lexicon.index(translation) for translation in all_translations
                        if lexicon.index(translation) >= code_switched_idx]
        else:
            translation = all_translations[0]
    return lexicon.index(translation)


def _reverse_lexicon_to_concept(lexicon_to_concept):
    concept_to_words = {}  # use
    for revkey, revvalue in lexicon_to_concept.iteritems():
        if revvalue in concept_to_words:
            concept_to_words[revvalue].append(revkey)
        else:
            concept_to_words[revvalue] = [revkey]
    return concept_to_words


def pos_lookup(word_idx, pos):
    """
    :param word_idx: the index of the word in the lexicon
    :return: It looks up the pos dictionary and returns the category of
    the word (noun, verb etc)
    """
    for pos, idx in pos.iteritems():
        if word_idx in idx:
            return pos


def sentence_indeces_pos(sentence_idx, remove_period=True, convert_to_idx=False):
    """
    :param sentence_idx: sentence in list format. Either contains activations in the lexicon for the sentence
    or the words (in that case, convert_to_idx should be set to True)
    :param remove_period: whether to remove the period (last element) from the sentence (useful when checking POS)
    :param convert_to_idx: if sentence_idx contains list of words, they first need to be converted to the
    respective indeces
    :return:
    """
    if convert_to_idx:
        sentence_idx = sentence_indeces(sentence_idx)
    if remove_period and sentence_idx[-1] == period_idx:
        sentence_idx = sentence_idx[:-1]
    return [pos_lookup(word_idx, pos) for word_idx in sentence_idx]


def sentence_from_indeces(sentence_idx):
    """
    :param sentence_idx: list with sentence indeces
    :return: converts a list of idx into a sentence (string of words)
    """
    return " ".join([lexicon[idx] for idx in sentence_idx])


def sentence_indeces(sentence_lst):
    """
    :param sentence_lst: intended sentence in a list (split string) format, e.g., ['the', 'cat', 'walk', '-s']
    :return: list of activations in the lexicon for the words above (e.g. [0, 4, 33, 20]
    """
    return [lexicon.index(w) for w in sentence_lst]

input_path = '../simulations/2017-09-26t11.51.07_enes_h40_c25/input_cp'
pos, lexicon = _read_lexicon_and_pos(os.path.join(input_path, 'lexicon.in'))
code_switched_idx = lexicon.index('-ó') if '-ó' in lexicon else lexicon.index('él')
period_idx = lexicon.index('.')
lexicon_to_concept = pickle.load(open(os.path.join(input_path, 'lexicon_to_concept.pickled'), 'rb'))
translation_dict = {'-a': '-s', 'a_': 'to', '.': '.', 'está': 'is',
                                 'un': 'a', 'una': 'a', 'el': 'the', 'la': 'the',
                                 '-ando': '-ing', 'ella': 'she', 'él': 'he'}
reverse_translation_dict = {v: k for k, v in translation_dict.iteritems()}
concept_to_words = _reverse_lexicon_to_concept(lexicon_to_concept)
same_unordered_lists = lambda x, y: collections.Counter(x) == collections.Counter(y)
to_preposition_idxs = [lexicon.index('to'), lexicon.index('a_')]

s = 'a tall brother está dando a_ un tío the pelota .'
t = 'a tall brother is giving a uncle the ball .'
sentence_idx = sentence_indeces(s.split())
print get_sentence_grammaticality_and_flex_order(sentence_idx, sentence_indeces(t.split()))
print get_code_switched_type(sentence_idx, sentence_indeces(t.split()))

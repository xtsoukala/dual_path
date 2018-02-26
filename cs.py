def plot_code_switches():
    cs_percentage = [0.0, 0.29599999999999999, 0.57599999999999996, 0.52800000000000002, 0.46399999999999997,
                0.64000000000000001, 0.59199999999999997, 0.65600000000000003, 0.74399999999999999, 0.80000000000000004,
                0.76800000000000002, 0.76000000000000001, 0.85599999999999998, 0.84799999999999998, 0.82399999999999995,
                0.93600000000000005, 0.96799999999999997, 0.98399999999999999, 0.98399999999999999, 1.024]

    type_cs_ES = [(0.078222222222222235, 0.026067339197538099),
                  (0.073777777777777789, 0.023934065809486687),
                  (0.0057777777777777784, 0.0044666113871648407),
                  (0.012444444444444445, 0.015370325747369408),
                  (0.18977777777777777, 0.055924110836378126),
                  (0.0026666666666666666, 0.00),
                  (0.0093333333333333358, 0.0076594168620507056),
                  (0.064000000000000001, 0.03818085616873694),
                  (0.0017777777777777779, 0.0033259176771323925)]
    type_cs_EN = [(0.0080000000000000002, 0.010994948334980428),
                  (0.0013333333333333333, 0.00),
                  (0.0093333333333333341, 0.010749676997731401),
                  (0.00044444444444444447, 0.0018324913891634047),
                  (0.14888888888888893, 0.053475735815299019),
                  (0.16355555555555557, 0.028624430556630432),
                  (0.0044444444444444453, 0.0039752319599996259),
                  (0.00088888888888888893, 0.00),
                  (0.00044444444444444447, 0.0018324913891634047)]

    labels = ['det borrow', 'verb-suffix borrow', 'inter-word switch', 'to borrow', 'intra-sentential', 'noun borrow',
              'verb borrow', '-ing borrow', 'aux borrow']

    allowed = ['verb-suffix borrow', 'intra-sentential', 'noun borrow', 'verb borrow', '-ing borrow', 'other']
    # early bilingual:

    type_cs_ES_early = [(0.19155555555555559, 0.031492895534323329),
                        (0.5471111111111111, 0.090750505899348327),
                        (0.75911111111111118, 0.12771882698111545),
                        (0.22177777777777777, 0.050723165380059228),
                        (4.4497777777777783, 0.55696674103332589),
                        (0.56622222222222229, 0.15102742780904824),
                        (0.35244444444444445, 0.075682246723626029),
                        (0.47688888888888886, 0.04581228472908512),
                        (0.056444444444444457, 0.015882283009071674)]
    type_cs_EN_early = [(0.73066666666666658, 0.16825377657970514),
                        (0.37199999999999994, 0.16093615021008936),
                        (0.61644444444444446, 0.17159066998147471),
                        (0.0075555555555555558, 0.0072894308741585454),
                        (3.0600000000000001, 0.60226682901628681),
                        (0.51511111111111108, 0.069442933316892094),
                        (0.18133333333333335, 0.052931821976744564),
                        (0.63111111111111118, 0.2158005480604947),
                        (0.16755555555555557, 0.062508863569028017)]

    type_EN = []
    type_ES = []
    other_EN = []
    other_ES = []
    for i, item in enumerate(labels):
        if item in allowed:
            type_EN.append(type_cs_EN[i])
            type_ES.append(type_cs_ES[i])
        else:
            other_EN.append(type_cs_EN[i])
            other_ES.append(type_cs_ES[i])
    type_EN.append((sum([x for x, y in other_EN]), 0))
    type_ES.append((sum([x for x, y in other_ES]), sum([y for x, y in other_ES])))
    print other_EN
    print other_ES

    import numpy as np
    import matplotlib.pyplot as plt

    ind = np.arange(len(allowed))  # the x locations for the groups
    width = 0.35  # the width of the bars

    fig, ax = plt.subplots()
    rects_EN = ax.bar(ind, [x[0] for x in type_EN], width, color='r',
                      yerr=[x[1] for x in type_EN])
    rects_ES = ax.bar(ind + width, [x[0] for x in type_ES], width, color='y',
                      yerr=[x[1] for x in type_ES])

    # add some text for labels, title and axes ticks
    label = 'Types of code-switches (% of test set)'
    ax.set_ylabel(label)
    # ax.set_title('Early Spanish-English bilingual model')
    ax.set_title('Late Spanish-English bilingual model (L1 Spanish)')
    ax.set_xticks(ind + width / 2)
    ax.legend((rects_EN[0], rects_ES[0]), ('EN', 'ES'))
    ax.set_xticklabels(allowed, rotation=55)  # rotate labels to fit better
    plt.tight_layout()  # make room for labels
    plt.savefig('/Users/charatsoukala/dual_path/late.png')
    plt.close()



import itertools


def is_code_switched(self, sentence_indeces):
    """ This function only checks whether words from different languages were used.
    It doesn't verify the validity of the expressed message """
    sentence_no_period = [x for x in sentence_indeces if x != self.inputs.period_idx]  # period common in all lang
    if (all(i >= self.inputs.code_switched_idx for i in sentence_no_period) or
            all(i < self.inputs.code_switched_idx for i in sentence_no_period)):
        return False
    else:
        return True

def get_code_switched_type(self, out_sentence_idx, trg_sentence_idx):
    """ Types of code-switches:
            - intra-sentential (in the middle of the sentence)
            - inter-sentential (full switch at sentence boundaries)
            - extra-sentential (insertion of tag)
            - noun borrowing? (if no determiners were switched)

        Note: Returns FALSE if the message conveyed was not correct.
    """
    # First "translate" message into the target language and compare with target sentence
    translated_sentence_candidates = self.translate_idx_into_monolingual_candidates(out_sentence_idx,
                                                                                    trg_sentence_idx[0])
    for translated_sentence_idx in translated_sentence_candidates:
        translated_sentences = list(itertools.chain.from_iterable(translated_sentence_idx))
        cs_type = self.examine_sentences_for_cs_type(translated_sentences, out_sentence_idx, trg_sentence_idx)
        if cs_type:  # if not False no need to look further
            return cs_type
    return False  # no CS type found

def translate_idx_into_monolingual_candidates(self, out_sentence_idx, trg_lang_word_idx):
    if trg_lang_word_idx < self.inputs.code_switched_idx:
        trans = [self.find_equivalent_translation_idx(idx, remove_candidates_less_than_cs_point=True)
                 if (idx >= self.inputs.code_switched_idx and not self._idx_is_cognate_or_ff(idx))
                 else [idx] for idx in out_sentence_idx]
    else:
        trans = [self.find_equivalent_translation_idx(idx)
                 if (idx < self.inputs.code_switched_idx and not self._idx_is_cognate_or_ff(idx)) else [idx]
                 for idx in out_sentence_idx]
    if any(len(i) > 1 for i in trans):
        return [list([x] for x in tup) for tup in list(itertools.product(*trans))]
    return [trans]

def _idx_is_cognate_or_ff(self, idx):
    w = self.inputs.lexicon[idx]
    if w in self.inputs.cognate_values or w in self.inputs.false_friend_values:
        return True
    return False

def examine_sentences_for_cs_type(self, translated_sentence_idx, out_sentence_idx, trg_sentence_idx):
    if not self.test_for_flexible_order(translated_sentence_idx, trg_sentence_idx, allow_identical=True):
        return False  # output and translated messages are not (flex-)identical, code-switch has wrong meaning
    check_idx = [w for w in out_sentence_idx if w not in trg_sentence_idx]
    # check if sequence is a subset of the sentence (out instead of trg because target is monolingual)
    if len(check_idx) > 1 and " ".join(str(x) for x in check_idx) in " ".join(str(x) for x in out_sentence_idx):
        # if check_idx == trg_sentence_idx[-len(check_idx):] or check_idx == trg_sentence_idx[-len(check_idx):-1]:
        cs_type = "alternational CS"
    else:
        check_idx_pos = [self.inputs.pos_lookup(w) for w in check_idx]
        if len(set(check_idx_pos)) == 1:
            cs_type = "%s" % check_idx_pos[0].lower()
        else:
            # print self.inputs.sentence_from_indeces(out_sentence_idx)
            # print self.inputs.sentence_from_indeces(translated_sentence_idx)
            # print "POS: %s. INSP:%s %s" % (check_idx_pos, check_idx, self.inputs.sentence_from_indeces(check_idx))
            cs_type = "inter-word switch"
    return cs_type

def find_equivalent_translation_idx(self, idx, remove_candidates_less_than_cs_point=False):
    word = self.inputs.lexicon[idx]
    if word in self.inputs.translation_dict:
        translation = self.inputs.translation_dict[word]
    elif word in self.inputs.reverse_translation_dict:
        translation = self.inputs.reverse_translation_dict[word]
    else:
        concept = self.inputs.lexicon_to_concept[self.inputs.lexicon[idx]]
        all_translations = [w for w in self.inputs.concept_to_words[concept] if w != word]
        if not all_translations:
            # print word, idx, concept
            return [idx]  # this is the case where a word exists in one language but not the other
        elif len(all_translations) > 1:
            if remove_candidates_less_than_cs_point:
                return [self.inputs.lexicon.index(translation) for translation in all_translations
                        if self.inputs.lexicon.index(translation) < self.inputs.code_switched_idx]
            else:
                return [self.inputs.lexicon.index(translation) for translation in all_translations
                        if self.inputs.lexicon.index(translation) >= self.inputs.code_switched_idx]
        else:
            translation = all_translations[0]
    return [self.inputs.lexicon.index(translation)]





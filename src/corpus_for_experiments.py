from .corpus_generator import SetsGenerator, codecs, random, datetime
from .formatter import is_not_nan


class ExperimentSets:
    def __init__(self, sets_gen):
        self.sets = sets_gen

    def generate_test_set_for_auxiliary(self, num_test_sentences, percentage_l2):
        pass

    def generate_for_cognate_experiment(self, num_training_sentences, percentage_l2, include_ff=False, seed=0,
                                        save_files=True):
        self.sets.random.seed(seed)  # change the seed each time we run a new simulation
        # first select cognate-free sentences
        original_test_set, original_training_set = self.sets.generate_general(num_training=num_training_sentences,
                                                                              percentage_l2=percentage_l2,
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
            self.sets.save_lexicon_and_structures_to_csv()
        self.sets.random.shuffle(all_test_sets)
        with codecs.open('%s/%s' % (self.sets.results_dir, "test.in"), 'w', "utf-8") as f:
            for sentence, message in all_test_sets:
                f.write(u'%s## %s\n' % (sentence, message))

    def generate_replacement_test_sets(self, original_sets, replacement_idx=[], replace_with_cognates=True):
        """
        :param original_sets: the sentence/message pairs that need to be modified to include cognates or false friends
        :param replacement_idx: index (position) of thematic role that needs to be replaced
        :param replace_with_cognates: if False, insert false friends instead (default: True)
        :return:
        """
        replacement_sets = []
        new_replacement_idx = []
        for idx, (sentence, message) in enumerate(original_sets):
            lang = message[-2:]
            all_roles = message.split(';')
            if replacement_idx:
                role_idx_to_replace = all_roles[replacement_idx[idx]]
            else:
                role_idx_to_replace = self.sets.random.choice(range(len(all_roles) - 2))  # avoid switches at last point
                new_replacement_idx.append(role_idx_to_replace)
            concept_to_replace = self.extract_concept_from_role(all_roles[role_idx_to_replace])
            word_to_replace, pos_w, syntactic_gender_w, semantic_gender_w, verb_type = \
                self.get_word_from_concept(concept_to_replace, lang)
            if pos_w == 'verb':
                pos_to_replace = "%s:%s" % (pos_w, verb_type)
            else:
                pos_to_replace = "%s:%sanimate" % (pos_w, "" if is_not_nan(semantic_gender_w) else "in")
            replace_with_word = self.sets.select_random_morpheme_for_lang(pos=pos_to_replace, lang=lang,
                                                                          gender=syntactic_gender_w,
                                                                          exclude_cognates=False,
                                                                          only_get_false_fr=not replace_with_cognates,
                                                                          only_get_cognate=replace_with_cognates)
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
            replacement_idx = new_replacement_idx
        return replacement_sets, replacement_idx

    def extract_concept_from_role(self, role):
        return [x for x in role.split('=')[1].split(',') if x not in self.sets.genders + self.sets.identifiability][0]

    def get_word_from_concept(self, concept, lang):
        w = self.sets.lexicon_df.query("concept == '%s'" % concept)
        return w[['morpheme_%s' % lang, 'pos', 'syntactic_gender_es', 'semantic_gender', 'type']].values[0]


if __name__ == "__main__":
    # store under "generated/" if folder was not specified
    cognate_exp = ExperimentSets(
        sets_gen=SetsGenerator(results_dir="../generated/%s" % datetime.now().strftime("%Y-%m-%dt%H.%M"),
                               cognate_percentage=0.2, use_full_verb_form=False, monolingual_only=False,
                               use_simple_semantics=True, allow_free_structure_production=False, lang='esen'))
    cognate_exp.generate_for_cognate_experiment(num_sentences=2500, percentage_l2=0.5)

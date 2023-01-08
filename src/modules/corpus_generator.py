#!/usr/bin/env python3
import os
import random
import re
import sys
import time
from datetime import datetime

import numpy as np
import pandas as pd
from joblib import Parallel, delayed
from numpy import around

from .formatter import is_not_nan, pairwise_list_view


class SetsGenerator:
    def __init__(
        self,
        allow_free_structure_production,
        lang,
        lexicon_csv,
        structures_csv,
        num_training,
        randomize,
        l2_decimal,
        l2_decimal_dev,
        root_simulations_path,
        generator_timeout,
        auxiliary_experiment=False,
        cognate_experiment=False,
        input_dir=None,
        sim_results_dir=None,
        l1_overt_pronouns=1.0,
        l2_overt_pronouns=1.0
    ):
        """
        :param allow_free_structure_production:
        """
        self.root_simulations_path = root_simulations_path
        self.auxiliary_experiment = auxiliary_experiment
        self.cognate_experiment = cognate_experiment
        self.unique_cognate_per_sentence = False
        self.excluded_concepts = False
        self.randomize = randomize
        self.l2_decimal = l2_decimal
        self.l2_decimal_dev = l2_decimal_dev
        self.allow_free_structure_production = allow_free_structure_production
        self.L = self.get_languages_with_idx(lang)
        self.random = np.random
        self.lexicon_df = self.get_clean_lexicon(lexicon_csv)
        self.languages_with_syntactic_gender = [
            lang
            for lang in self.L.values()
            if f"syntactic_gender_{lang}" in list(self.lexicon_df)
        ]
        self.results_dir = sim_results_dir
        self.input_dir = input_dir
        if input_dir and not os.path.exists(input_dir):
            os.mkdir(input_dir)
        self.input_dir_empty = True
        self.num_training = num_training
        self.num_test = self.calculate_testset_size(num_training)
        self.genders = [
            x for x in self.lexicon_df.semantic_gender.dropna().unique() if "-" not in x
        ]
        self.determiners = self.get_determiners_from_lexicon()
        self.concepts = self.lexicon_df.concept.dropna().unique()
        # source: https://www.realfastspanish.com/vocabulary/spanish-cognates
        # http://mentalfloss.com/article/57195/50-spanish-english-false-friend-words
        self.event_semantic_string = "EVENT-SEM"
        self.structures_df = self.get_structures(structures_csv)
        self.roles = (
            self.structures_df["message"]
            .str.extractall("(;|^)?([A-Z-]*)(=)")[1]
            .unique()
            .tolist()
        )  # AGENT etc
        # exclude event semantics from the roles:
        self.roles = [
            role.strip() for role in self.roles if role != self.event_semantic_string
        ]
        self.df_cache = {}
        self.l1_overt_pronouns = l1_overt_pronouns
        self.l2_overt_pronouns = l2_overt_pronouns
        # TODO: automate
        self.identifiability = ["pron", "def", "indef"]
        self.generator_timeout = generator_timeout
        self.use_message_l2 = False

    @staticmethod
    def get_languages_with_idx(languages):
        return {k + 1: v for k, v in enumerate(languages)}

    def set_new_results_dir(self, results_dir, mk_new_dir=True):
        if mk_new_dir:
            if os.path.isdir(
                results_dir
            ):  # if this folder name exists already add a timestamp at the end
                results_dir += datetime.now().strftime(".%S")
            os.makedirs(results_dir)
        self.results_dir = results_dir

    def create_input_for_simulation(self, simulation_number):
        self.set_new_results_dir(f"{self.root_simulations_path}/{simulation_number}")
        self.random.seed(
            simulation_number
        )  # set new seed each time we run a new simulation
        if self.randomize and self.l2_decimal:
            self.l2_decimal = around(
                self.random.normal(self.l2_decimal, self.l2_decimal_dev), decimals=2
            )
            print(
                f"Input for sim. {simulation_number}: L1 decimal fraction: {1. - self.l2_decimal:.2}, "
                f"L2 decimal fraction: {self.l2_decimal}"
            )
        test_set, training_set = self.generate_general()
        if self.auxiliary_experiment:
            self.generate_auxiliary_experiment_sentences(
                excluded_sentences=training_set
            )

    @staticmethod
    def convert_to_int(x):
        """safely converts string into an integer; NaN is converted to 0"""
        if x != x:
            # in case it's a NaN value
            return 0
        return int(x)

    @staticmethod
    def calculate_testset_size(num_training, test_set_decimal=0.2):
        """
        :param num_training: Number of training sentences
        :param test_set_decimal: default: 0.2 (20%) of sentences are set aside for testing. (80%: training)
        :return: Number of sentences for training and test sets
        """
        return int((num_training * 100 / 80) * test_set_decimal)

    @staticmethod
    def get_unique_event_semantics(dataset):
        """1. Extracts the messages from the sentence-message dataset pair
           2. Extracts all EVENT-SEM contents from the messages
           3. Returns the unique EVENT-SEM content values"""
        message_list = [pair[1] for pair in dataset]
        unique_event_semantics = re.findall(r"EVENT-SEM=(.*?);", "@".join(message_list))
        return set(",".join(unique_event_semantics).split(','))

    def generate_general(self):
        sentence_structures_train = self.generate_sentence_structures(self.num_training)
        sentence_structures_test = self.generate_sentence_structures(self.num_test)
        # save only training set if we're selecting sentences for the cognate experiment
        test_set = self.generate_sentences(sentence_structures_test, fname="test.in")
        training_set = self.generate_sentences(
            sentence_structures_train,
            fname="training.in",
            exclude_test_sentences=test_set,
        )
        assert self.num_test == len(test_set) and self.num_training == len(training_set)
        if self.input_dir_empty:
            self.input_dir_empty = False  # the files are generated in parallel, signal here already & check in function
            self.save_lexicon_and_structures_to_csv(event_semantics=self.get_unique_event_semantics(training_set))
        return test_set, training_set

    def generate_auxiliary_experiment_sentences(
        self, excluded_sentences, test_spanish_only=True, num_test_sentences=750
    ):
        if test_spanish_only:
            self.l2_decimal = 1.0 if self.L[2] == "es" else 0.0
        perfect_structures = self.generate_aux_perfect_sentence_structures(
            num_test_sentences // 2
        )
        self.generate_sentences(
            perfect_structures,
            fname="test_aux.in",
            exclude_test_sentences=excluded_sentences,
        )

    def replace_perfect_with_progressive(self, sentence, message):
        """
        :param sentence:
        :param message:
        :return: replaces has -> is, ha -> está, perfect participle -> progressive participle
        """
        msg = message.replace("PERFECT", "PROGRESSIVE")
        concept = re.search(";ACTION-LINKING=([A-Z]*);", msg).group(1)
        lang = msg[-2:]
        # look up progressive and perfect participles and replace
        res = self.lexicon_df.query(f"pos == 'participle' and concept == '{concept}'")
        progressive = res[f"morpheme_{lang}"].loc[res["aspect"] == "progressive"].max()
        perfect = res[f"morpheme_{lang}"].loc[res["aspect"] == "perfect"].max()
        sent = (
            sentence.replace(" has ", " is ")
            .replace(" ha ", " está ")
            .replace(perfect, progressive)
        )
        return sent, msg

    def get_random_row_idx(self, data_len):
        return self.random.randint(0, data_len) if data_len > 1 else 0

    def generate_sentence_structures(self, num_sentences, filtered_structures=None):
        """
        :param num_sentences: number of message/sentence pairs that need to be generated
        :param filtered_structures: use given structures (that have been filtered before)
        :return:
        """
        num_l2 = self.convert_to_int(self.l2_decimal * num_sentences)
        num_l1 = num_sentences - num_l2

        if filtered_structures is not None:
            pd.options.mode.chained_assignment = (
                None  # it's otherwise impossible to get rid of SettingWithCopyWarning
            )
            df = self.distribute_percentages_equally_if_not_set(filtered_structures)
            percentage_l2 = self.l2_decimal * 100
            percentage_l1 = 100 - percentage_l2
            key = f"percentage_{self.L[1]}"
            existing_percentages = df[key].sum()
            if existing_percentages != percentage_l1:
                # df.loc[:, key] = df[key] * percentage_l1 / existing_percentages
                df.loc[:, key] *= percentage_l1 / existing_percentages
            if percentage_l2:
                key = f"percentage_{self.L[2]}"
                existing_percentages = df[key].sum()
                if existing_percentages != percentage_l2:
                    # df.loc[:, key] = df[key] * percentage_l2 / existing_percentages
                    df.loc[:, key] *= percentage_l2 / existing_percentages
        else:
            df = self.distribute_percentages_equally_if_not_set(self.structures_df)
        self.use_message_l2 = "message_l2" in df.columns
        sentence_structures = self.structures_per_lang_and_occurrance(
            df, num_l1, self.L[1]
        )
        if num_l2:  # repeat the procedure for L2
            sentence_structures_l2 = self.structures_per_lang_and_occurrance(
                df, num_l2, self.L[2]
            )
            sentence_structures = np.append(
                sentence_structures, sentence_structures_l2, axis=0
            )

        assert num_sentences == len(sentence_structures)
        self.random.shuffle(sentence_structures)
        return sentence_structures

    @staticmethod
    def get_index_of_pronoun_sentences(structures, lang):
        """Get all indices of messages that contain a pronoun"""
        return [idx for idx, message in enumerate(structures) if "=pron" in message[0] and f'={lang}' in message[0]]

    def structures_per_lang_and_occurrance(self, df, num_total, lang):
        occurrences = [self.convert_to_int(x) for x in df[f"percentage_{lang}"] * num_total / 100]
        df_copy = df.copy()
        if self.use_message_l2 and lang == self.L[2]:
            df_copy.loc[(pd.notnull(df_copy["message_l2"])), "message"] = df_copy.loc[
                (pd.notnull(df_copy["message_l2"])), "message_l2"
            ]
            df_copy.to_csv(
                f"{self.input_dir}/structures_test.csv", encoding="utf-8", index=False
            )
        sentence_structures = df_copy[["message", lang]].values.repeat(
            occurrences, axis=0
        )
        structures_missing = num_total - len(sentence_structures)
        if structures_missing > 0:
            sentence_structures = np.append(
                sentence_structures,
                df_copy[["message", lang]].sample(n=structures_missing, replace=True),
                axis=0,
            )
        elif structures_missing < 0:
            sentence_structures = np.delete(
                sentence_structures,
                self.random.randint(
                    len(sentence_structures), size=abs(structures_missing)
                ),
                axis=0,
            )
        sentence_structures[
            :, 0
        ] += f";TARGET-LANG={lang}"  # append language code at the end

        return sentence_structures

    def manipulate_pronouns(self, sentence_structures, lang):
        # manipulate the occurance of overt pronouns for this language
        overt_pronouns = 1.0
        if lang == self.L[1] and self.l1_overt_pronouns < 1.0:
            overt_pronouns = self.l1_overt_pronouns
        elif lang == self.L[2] and self.l2_overt_pronouns < 1.0:
            overt_pronouns = self.l2_overt_pronouns

        if overt_pronouns < 1.0:
            # keep only the list items that have L1 as the target lang plus pronouns
            sentences_with_pronoun = len(list(filter(lambda x: '=pron;' in x[0], sentence_structures)))
            pronouns_to_remove = int(sentences_with_pronoun - (sentences_with_pronoun * overt_pronouns))
            all_pronoun_sentence_idx = self.get_index_of_pronoun_sentences(sentence_structures, lang=lang)
            # randomly select x items that will become pro-drop
            idx_to_remove_pron = random.sample(all_pronoun_sentence_idx, pronouns_to_remove)
            for idx in idx_to_remove_pron:
                sentence_structures[idx][1] = sentence_structures[idx][1].replace('pron ', '')

    def distribute_percentages_equally_if_not_set(self, df):
        keys = [f"percentage_{self.L[1]}"]
        if 2 in self.L:  # if there is an L2
            keys.append(f"percentage_{self.L[2]}")
        for key in keys:
            if df[key].sum() == 0:
                df.loc[:, key] = 100 / df.size
        return df

    def generate_aux_perfect_sentence_structures(self, num_sentences):
        """
        :param num_sentences: number of message/sentence pairs that need to be generated
        :return:
        """
        aux_structures = self.structures_df[
            self.structures_df.message.str.contains("PERFECT")
        ]
        return self.generate_sentence_structures(
            num_sentences, filtered_structures=aux_structures
        )

    def generate_sentences(
        self,
        sentence_structures,
        fname,
        exclude_test_sentences=None,
        exclude_eos_cognate=False,
    ):
        """
        :param sentence_structures: list of allowed structures for the generated sentences
        :param fname: filename to store results (they won't be stored if set to None)
        :param exclude_test_sentences: list of sentences to exclude (test set needs to contain novel messages only)
        :return: list of generated pairs (sentence, message)
        """
        replace_aux_sentences = True if fname and "aux" in fname else False
        # keep track of training sentences (messages) that are identical to test ones and exclude them
        generated_pairs = []
        remaining_structures = sentence_structures
        time_start = time.time()
        if "test_cog" not in fname:
            self.save_lexicon_and_structures_to_csv()
        if self.excluded_concepts:
            self.lexicon_df.drop(
                self.lexicon_df.loc[
                    self.lexicon_df.concept.isin(self.excluded_concepts)
                ].index,
                inplace=True,
            )
        while len(
            remaining_structures
        ):  # while loop needed because of the unique sentence restriction
            if time.time() - time_start > self.generator_timeout:
                sys.exit(
                    f"The process timed out (limit: {self.generator_timeout}s). Remaining structures: "
                    f"{len(remaining_structures)} more structures: {set(remaining_structures)} "
                    f"(total: {len(sentence_structures)})."
                )
            remaining_structures, generated_pairs = self.structures_to_sentences(
                remaining_structures,
                generated_pairs,
                exclude_test_sentences,
                replace_aux_sentences,
                exclude_eos_cognate,
            )
        self.random.shuffle(generated_pairs)
        self.save_language_sets(fname, generated_pairs)
        return generated_pairs

    def save_language_sets(self, fname, generated_pairs):
        with open("%s/%s" % (self.results_dir, fname), "w", encoding="utf-8") as f:
            for sentence, message in generated_pairs:
                f.write("%s## %s\n" % (sentence, message))

    @staticmethod
    def get_list_item_by_index(my_list, index):
        """Returns a list item if the index exists, otherwise it returns an empty string"""
        return my_list[index] if index < len(my_list) else ""

    @staticmethod
    def get_semantic_message_id(messages):
        sem_id = [idx for idx, mes in enumerate(messages) if mes.startswith('EVENT-SEM=')]
        if sem_id:
            return sem_id[0]
        return None

    def structures_to_sentences(
        self,
        sentence_structures,
        generated_pairs,
        exclude_test_sentences,
        replace_aux_sentences,
        exclude_eos_cognate=False,
    ):
        sentence_idx = len(
            generated_pairs
        )  # keep track of how many sentences we have generated already
        remaining_structures = []
        for msg, pos_full in sentence_structures:
            message = msg.split(";")
            event_semantics_id = self.get_semantic_message_id(message)
            lang = message[-1].split("=")[1]
            sentence = []
            msg_idx = 0
            gender = None
            buffer_msg_index = None
            pos_list = pos_full.split()
            sentence_length = len(pos_list) - 1
            for i, pos in enumerate(pos_list):
                exclude_cognates = False
                # only one cognate per sentence and not at the end of the sentence
                if self.unique_cognate_per_sentence and (
                    any([",COG" in ms for ms in message])
                    or (exclude_eos_cognate and i == sentence_length)
                ):
                    exclude_cognates = True
                morpheme_df = self.select_random_morpheme_for_lang(
                    pos=pos, lang=lang, gender=gender, exclude_cognates=exclude_cognates
                )
                morpheme_df = morpheme_df
                gender = self.get_syntactic_gender(
                    morpheme_df, lang, prev_gender=gender
                )
                lang_code = (
                    "en"
                    if (
                        (morpheme_df.is_cognate == True)
                        and (not self.unique_cognate_per_sentence)
                    )
                    else lang
                )
                sentence.append(morpheme_df[f"morpheme_{lang_code}"])
                if pos.startswith(
                    "pron"
                ):  # also need to choose a random concept -- only constraint: gender
                    morpheme_df = self.select_random_morpheme_for_lang(
                        pos="noun:animate",
                        lang=lang,
                        gender=gender,
                        use_semantic_gender=True,
                    )
                elif "modal" in pos and "type" in morpheme_df and event_semantics_id:
                    # add the modal verb's "meaning" to the event-semantics
                    message[event_semantics_id] += f',{morpheme_df["type"].upper()}'

                concept = self.get_concept(morpheme_df)
                if concept:
                    semantic_gender = self.get_semantic_gender(
                        morpheme_df["semantic_gender"], syntactic_gender=gender
                    )
                    message[msg_idx] = self.add_concept_and_gender_info(
                        message[msg_idx], concept, semantic_gender
                    )
                    next_pos = self.get_list_item_by_index(pos_list, i + 1)
                    msg_idx, buffer_msg_index = self.get_next_msg_idx(
                        msg_idx, pos, next_pos, buffer_msg_index
                    )
            sentence = "%s ." % " ".join(sentence)
            message = ";".join(message)
            if self.unique_cognate_per_sentence and "COG" not in message:
                sentence_is_unique = False
            else:
                sentence_is_unique = self.sentence_is_unique(
                    message, exclude_test_sentences, generated_pairs
                )
            if replace_aux_sentences and sentence_is_unique:
                prog_sentence, prog_msg = self.replace_perfect_with_progressive(
                    sentence=sentence, message=message
                )
                if self.sentence_is_unique(
                    prog_msg, exclude_test_sentences, generated_pairs
                ):
                    generated_pairs.append((prog_sentence, prog_msg))
                    sentence_idx += 1
                else:  # do not add the perfect structure either
                    sentence_is_unique = False

            if sentence_is_unique:
                generated_pairs.append((sentence, message))
                sentence_idx += 1
            else:  # find unique sentence, don't add it to the training set
                remaining_structures.append((msg, pos_full))
        return remaining_structures, generated_pairs

    def get_query_cache(self, params):
        if params in self.df_cache:
            return self.df_cache[params]
        return False

    def select_random_morpheme_for_lang(
        self,
        pos,
        lang,
        gender,
        only_get_cognate=False,
        only_get_false_friend=False,
        exclude_cognates=False,
        exclude_false_friends=False,
        use_semantic_gender=False,
    ):
        params = repr(locals().values())
        cache = self.get_query_cache(params)
        query = []
        if cache is False:
            if gender and not any([x in pos for x in ["noun", "adj"]]):
                gender = None
            pos_type = None
            all_pos = pos.split(":")
            for n in range(
                0, 5 - len(all_pos)
            ):  # this is simply to be able to unpack even N/A values like number
                all_pos.append(None)
            pos, pos_type, tense, aspect, number = all_pos

            if tense == "cog":
                tense = None
                only_get_cognate = True

            query = [
                f"pos == '{pos}' and morpheme_{lang} == morpheme_{lang}"
            ]  # x == x to avoid NaN values
            if pos_type == "animate":
                query.append("and semantic_gender == semantic_gender")
            elif pos_type == "inanimate":  # checks for NaN
                query.append("and semantic_gender != semantic_gender")
            elif pos_type:
                query.append(f"and type == '{pos_type}'")

            if tense:
                query.append(f"and tense == '{tense}'")
            if aspect:
                query.append(f"and aspect == '{aspect}'")
            if gender and use_semantic_gender:
                query.append(
                    f"and (semantic_gender == '{gender}' or semantic_gender == 'M-F')"
                )
            elif gender and lang in f"syntactic_gender_{lang}" in list(
                self.lexicon_df
            ):  # set the syntactic gender
                query.append(
                    f"and (syntactic_gender_{lang} == '{gender}' or syntactic_gender_{lang} == 'M-F')"
                )
            if exclude_cognates:
                query.append("and is_cognate != True")
            elif exclude_false_friends:
                query.append("and is_false_friend != True")
            elif only_get_cognate:
                query.append("and is_cognate == True")
            elif only_get_false_friend:
                query.append("and is_false_friend == True")
            cache = self.lexicon_df.query(" ".join(query))
        cache_size = len(cache.index)
        if not cache_size:
            sys.exit(f"Error: Empty cache. {params} {cache} {query if query else ''}")
        return cache.iloc[self.get_random_row_idx(cache_size)]

    def save_lexicon_and_structures_to_csv(self, event_semantics=None):
        """
        Matches strings between ;EVENT-SEM= or , E.g.: AGENT=;AGENT-MOD=;ACTION-LINKING=;EVENT-SEM=PRESENT,PROGRESSIVE
        "?" is necessary for multiple matches
        :return: e.g., 'PROGRESSIVE', 'SIMPLE', 'PRESENT', 'PAST', 'AGENT', 'PATIENT'
        """
        # if not os.listdir(self.input_dir): mght have to bring back
        # I have a hard time capturing words with a hyphen: ';EVENT-SEM=|,?([A-Z]*(-([A-Z]*))?)(,|$)'
        if not event_semantics:
            event_semantics = []
            for (
                event_semantic_str
            ) in self.structures_df.message.values.tolist():  # slow loop
                for evsem in event_semantic_str.split(f"{self.event_semantic_string}=")[
                    1
                ].split(","):
                    evsem = evsem.strip()
                    if ":" in evsem:
                        evsem = evsem.split(":")[0]  # remove activation
                    if evsem and evsem not in event_semantics:
                        event_semantics.append(evsem)
        self.list_to_file("event_semantics", event_semantics)
        self.list_to_file("identifiability", self.identifiability)
        self.list_to_file("roles", self.roles)
        self.list_to_file("concepts", self.concepts)
        if not os.path.isfile(f"{self.input_dir}/lexicon.csv"):
            self.lexicon_df.to_csv(
                f"{self.input_dir}/lexicon.csv", encoding="utf-8", index=False
            )
        self.structures_df.to_csv(
            f"{self.input_dir}/structures.csv", encoding="utf-8", index=False
        )

    def list_to_file(self, fname, content):
        with open("%s/%s.in" % (self.input_dir, fname), "w", encoding="utf-8") as f:
            f.write("%s" % "\n".join(content))

    def get_determiners_from_lexicon(self):
        return pd.unique(
            self.lexicon_df.query("pos == 'det'")[
                [f"morpheme_{l}" for l in self.L.values()]
            ].values.ravel()
        )

    def get_structures(self, structures_csv, sep=","):
        if not os.path.isfile(structures_csv):
            structures_csv = "src/%s" % structures_csv
        df = pd.read_csv(structures_csv, sep=sep, header=0)  # first line is the header
        query = f"percentage_{self.L[1]} != 0"
        if 2 in self.L:  # if there is an L2
            query = f"{query} and percentage_{self.L[2]} != 0"
        structures = df.query(query)
        keys = ["message"]
        for l in self.L.values():
            keys.append(l)
            keys.append(f"percentage_{l}")
        if "message_l2" in structures.columns:
            keys.append("message_l2")
        df = structures[keys]
        if self.allow_free_structure_production:
            df.message = df.message.map(
                lambda a: self.remove_roles_from_event_semantics(a)
            )
        return df

    @staticmethod
    def get_clean_lexicon(lexicon_csv):
        if not os.path.isfile(lexicon_csv):
            lexicon_csv = "src/%s" % lexicon_csv
        df = pd.read_csv(lexicon_csv, sep=",", header=0)  # first line is the header
        query = ["inactive != 'Y'"]  # remove inactive words
        lex = df.query(" ".join(query))
        return lex

    def convert_nouns_to_cognates(
        self,
        cognate_decimal_fraction,
        excluded_concepts=[],
        seed=18,
        only_report_values=False,
    ):
        if seed:
            self.random.seed(seed)  # Option to set a seed for consistency
        all_nouns = self.lexicon_df[self.lexicon_df.pos == "noun"]
        all_nouns_count = len(all_nouns.index)
        num_cognates = round(all_nouns_count * cognate_decimal_fraction)
        a = self.lexicon_df.loc[
            (self.lexicon_df.pos == "noun")
            & (  # (self.lexicon_df.semantic_gender.notnull()) &
                ~self.lexicon_df.concept.isin(excluded_concepts)
            ),
        ]
        random_idx = self.random.choice(a.index, num_cognates, replace=False)
        if not only_report_values:
            self.lexicon_df.loc[random_idx, "is_cognate"] = True
            cognate_concepts = self.lexicon_df.loc[random_idx, "concept"].unique()
            self.list_to_file("cognates", cognate_concepts)
        else:
            return self.lexicon_df.loc[random_idx, "concept"].unique()

    def convert_nouns_to_false_friends(
        self,
        cognate_decimal_fraction,
        excluded_concepts=[],
        seed=18,
        bidirectional=False,
    ):
        """Very similar to convert_nouns_to_cognates"""
        if seed:
            self.random.seed(seed)  # Option to set a seed for consistency
        self.lexicon_df.to_csv(
            f"{self.input_dir}/lexicon.csv", encoding="utf-8", index=False
        )
        all_nouns = self.lexicon_df[self.lexicon_df.pos == "noun"]
        all_nouns_count = len(all_nouns.index)
        num_cognates = round(all_nouns_count * cognate_decimal_fraction)
        a = self.lexicon_df.loc[
            (self.lexicon_df.pos == "noun")
            & (  # (self.lexicon_df.semantic_gender.notnull()) &
                ~self.lexicon_df.concept.isin(excluded_concepts)
            ),
        ]
        random_idx = self.random.choice(a.index, num_cognates, replace=False)
        original_morphemes = self.lexicon_df.loc[random_idx, "morpheme_en"]

        self.list_to_file(
            "false_friends", self.lexicon_df.loc[random_idx, "concept"].unique()
        )
        if bidirectional:
            for current_idx, next_idx in pairwise_list_view(
                random_idx, bidirectional=bidirectional
            ):
                self.lexicon_df.loc[
                    current_idx, "morpheme_es"
                ] = original_morphemes.loc[next_idx]
                self.lexicon_df.loc[next_idx, "is_false_friend"] = True
        else:
            all_false_friends = []
            excluded_concepts = self.lexicon_df.loc[random_idx, "concept"]
            for idx in random_idx:
                next_idx = self.random.choice(
                    self.lexicon_df.loc[
                        (self.lexicon_df.pos == "noun")
                        &
                        # (self.lexicon_df.semantic_gender.notnull()) &
                        (~self.lexicon_df.morpheme_es.isin(all_false_friends))
                        & (~self.lexicon_df.morpheme_en.isin(all_false_friends))
                        & (~self.lexicon_df.concept.isin(excluded_concepts)),
                    ].index,
                    1,
                )[0]
                all_false_friends.append(self.lexicon_df.loc[idx, "morpheme_en"])
                self.lexicon_df.loc[idx, "morpheme_es"] = self.lexicon_df.loc[
                    next_idx, "morpheme_en"
                ]
                self.lexicon_df.loc[next_idx, "is_false_friend"] = True
                all_false_friends.append(self.lexicon_df.loc[idx, "morpheme_es"])
        self.lexicon_df.to_csv(
            f"{self.input_dir}/false_friends_lexicon.csv", encoding="utf-8", index=False
        )

    def generate_replacement_test_sets(
        self, original_sets, replacement_idx=None, replace_with_cognates=True
    ):
        """
        :param original_sets: the sentence/message pairs that need to be modified to include cognates or false friends
        :param replacement_idx: index (position) of thematic role that needs to be replaced
        :param replace_with_cognates: if False, insert false friends instead (default: True)
        :return:
        """
        replacement_sets = []
        new_replacement_idx = []
        for idx, (sentence, message) in enumerate(original_sets):
            lang = message[-1].split("=")[1]  # final two letters
            all_roles = message.split(";")
            if replacement_idx:
                role_idx_to_replace = all_roles[replacement_idx[idx]]
            else:
                role_idx_to_replace = self.random.choice(
                    range(len(all_roles) - 2)
                )  # avoid switches at last point
                new_replacement_idx.append(role_idx_to_replace)
            concept_to_replace = self.extract_concept_from_role(
                all_roles[role_idx_to_replace]
            )
            (
                word_to_replace,
                pos_w,
                syntactic_gender_w,
                semantic_gender_w,
                verb_type,
            ) = self.get_word_from_concept(concept_to_replace, lang)
            if pos_w == "verb":
                pos_to_replace = "%s:%s" % (pos_w, verb_type)
            else:
                pos_to_replace = "%s:%sanimate" % (
                    pos_w,
                    "" if is_not_nan(semantic_gender_w) else "in",
                )
            replace_with_word = self.select_random_morpheme_for_lang(
                pos=pos_to_replace,
                lang=lang,
                gender=syntactic_gender_w,
                only_get_false_friend=not replace_with_cognates,
                only_get_cognate=replace_with_cognates,
            )
            all_roles[role_idx_to_replace] = all_roles[role_idx_to_replace].replace(
                concept_to_replace, replace_with_word["concept"]
            )
            if replace_with_cognates:
                all_roles[role_idx_to_replace] += ",COG"
            else:
                all_roles[role_idx_to_replace] += ",FF"
            sentence = sentence.replace(
                f" {word_to_replace} ", " %s " % replace_with_word[f"morpheme_{lang}"]
            )
            message = ";".join(all_roles)
            replacement_sets.append((sentence, message))
        if not replacement_idx:
            replacement_idx = new_replacement_idx
        return replacement_sets, replacement_idx

    def extract_concept_from_role(self, role):
        return [
            x
            for x in role.split("=")[1].split(",")
            if x not in self.genders + self.identifiability
        ][0]

    def get_word_from_concept(self, concept, lang):
        w = self.lexicon_df.query(f"concept == '{concept}'")
        return w[
            [
                f"morpheme_{lang}",
                "pos",
                f"syntactic_gender_{lang}",
                "semantic_gender",
                "type",
            ]
        ].values[0]

    def remove_roles_from_event_semantics(self, msg_str):
        for event in msg_str.split(f"{self.event_semantic_string}=")[1].split(","):
            if (
                ":" in event
            ):  # the user has the option to set the activation, e.g.: 'PATIENT:0.7,AGENT:0.9'
                core_event = event.split(":")[0]
            else:
                core_event = event

            if f"{core_event}=" in msg_str:
                if f"={event}," in msg_str:
                    msg_str = re.sub(f"={event},", "=", msg_str)
                elif f",{event}," in msg_str:
                    msg_str = re.sub(f",{event},", ",", msg_str)
                elif f",{event}" in msg_str:
                    msg_str = re.sub(f",{event}", "", msg_str)
        return msg_str

    @staticmethod
    def get_next_msg_idx(msg_idx, pos, next_pos, buffer_msg_index=None):
        """Returns the following index of the message list
        :param msg_idx: index of the message list (e.g., ['AGENT', 'AGENT-MOD', 'ACTION', 'PATIENT']
        :param pos: current part of speech (e.g., 'det' for determiner, 'noun:animate' for an animate noun)
        :param next_pos: the following part of speech
        :param buffer_msg_index: In case it's not None, it's taken into account if we need to skip/go back to a previous
         index. This hack is because in some languages (e.g., English) we want to use the adjective as 'AGENT-MOD',
         then go back to 'AGENT' for the noun, and finally move to 'ACTION' for the verb.
        :return:
        """
        if buffer_msg_index and buffer_msg_index > msg_idx:
            # resets index
            msg_idx = buffer_msg_index + 1
            buffer_msg_index = None
            return msg_idx, buffer_msg_index

        if "noun" in next_pos and buffer_msg_index is not None:
            tmp_msg_idx = buffer_msg_index
            buffer_msg_index = msg_idx
            msg_idx = tmp_msg_idx
            return msg_idx, buffer_msg_index

        if "det" in pos:
            if not ("noun" in next_pos or "gen" in next_pos):
                buffer_msg_index = msg_idx
            else:
                msg_idx = msg_idx - 1
        return msg_idx + 1, buffer_msg_index

    @staticmethod
    def sentence_is_unique(message, exclude_test_sentences, generated_pairs):
        message_sentence_pairs = (
            generated_pairs + exclude_test_sentences
            if exclude_test_sentences
            else generated_pairs
        )
        if message in ([x[1] for x in message_sentence_pairs]):
            return False
        return True

    @staticmethod
    def add_concept_and_gender_info(message, concept, semantic_gender):
        return (
            f"{message}"
            f'{"," if message[-1] != "=" else ""}'
            f"{concept}"
            f'{f",{semantic_gender}" if semantic_gender else ""}'
        )

    @staticmethod
    def get_concept(morpheme_df):
        concept = False
        if not pd.isnull(morpheme_df["concept"]):
            concept = morpheme_df["concept"]
            if morpheme_df["is_cognate"] is True:
                concept += ",COG"
            elif morpheme_df["is_false_friend"] is True:
                concept += ",FF"
        elif morpheme_df["pos"] == "det":
            concept = morpheme_df["type"]
        return concept

    def get_syntactic_gender(self, morpheme_df, lang, prev_gender=None):
        """
        If the syntactic gender is not set but the semantic one is (and it's not ambiguous, e.g., "M-F"), return the
        semantic gender. Otherwise, return the syntactic gender if it's not empty or ambiguous.
        """
        if (
            lang in self.languages_with_syntactic_gender
            and not pd.isnull(morpheme_df[f"syntactic_gender_{lang}"])
            and not self.has_multiple_possible_genders(
                morpheme_df[f"syntactic_gender_{lang}"]
            )
        ):
            return morpheme_df[f"syntactic_gender_{lang}"]
        elif not pd.isnull(morpheme_df["semantic_gender"]) and (
            lang not in self.languages_with_syntactic_gender
            or pd.isnull(morpheme_df[f"syntactic_gender_{lang}"])
        ):
            if len(morpheme_df["semantic_gender"]) == 1:
                return morpheme_df["semantic_gender"]
            else:
                # ASSUMPTION: multiple genders are connected with a hyphen. Select a gender randomly.
                return self.random.choice(morpheme_df["semantic_gender"].split("-"))
        elif (
            not prev_gender
            and lang not in self.languages_with_syntactic_gender
            and morpheme_df["pos"] == "pron"
        ):
            # this is a HACK for pronouns, in case the language has no syntactic gender information
            other_lang = [l for l in self.L.values() if l not in lang]
            if other_lang:
                other_lang = other_lang[0]
            else:
                other_lang = "es"  # temporary fix: get Spanish gender for pronouns
            return morpheme_df[f"syntactic_gender_{other_lang}"]
        return prev_gender

    @staticmethod
    def get_semantic_gender(semantic_gender, syntactic_gender):
        if not pd.isnull(semantic_gender):
            if semantic_gender == "M-F" and syntactic_gender:
                return syntactic_gender
            return semantic_gender
        return None

    @staticmethod
    def has_multiple_possible_genders(gender, gender_separator="-"):
        if gender_separator in gender:
            return True
        return False

    def generate_cognate_experiment_test_sets(
        self,
        simulation_range,
        num_models,
        cognate_decimal_fraction,
        num_test_sentences,
        cognate_list=None,
        excluded_concepts=None,
    ):
        if cognate_list is None:
            cognate_list = []
            for m in range(num_models):
                cognate_list.extend(
                    self.convert_nouns_to_cognates(
                        cognate_decimal_fraction=cognate_decimal_fraction,
                        excluded_concepts=cognate_list,
                        only_report_values=True,
                    )
                )
        self.lexicon_df.loc[
            self.lexicon_df.concept.isin(cognate_list), "is_cognate"
        ] = True
        if excluded_concepts:
            # awk NF 'FNR==1{print ""}1' *0cog*/input/cognates.in | sort | uniq > exclude_cognates.in
            self.excluded_concepts = list(
                set(excluded_concepts).difference(cognate_list)
            )
        print("cognate list:", cognate_list, "excluded cognates:", excluded_concepts)
        self.list_to_file("all_cognates", cognate_list)
        self.unique_cognate_per_sentence = True
        self.structures_df = self.structures_df[
            ~self.structures_df.message.str.contains("=pron")
        ]
        Parallel(n_jobs=-1)(
            delayed(self.generate_cognate_test_set)(sim, num_test_sentences)
            for sim in simulation_range
        )

    def generate_cognate_test_set(self, simulation_number, num_test_sentences):
        self.set_new_results_dir(
            f"{self.root_simulations_path}/{simulation_number}", mk_new_dir=False
        )
        self.random.seed(
            simulation_number
        )  # set new seed each time we run a new simulation
        if self.randomize and self.l2_decimal:
            self.l2_decimal = around(
                self.random.normal(self.l2_decimal, self.l2_decimal_dev), decimals=2
            )
            print(
                f"Input for sim. {simulation_number}: L1 decimal fraction: {1. - self.l2_decimal:.2}, "
                f"L2 decimal fraction: {self.l2_decimal}"
            )
        sentence_structures_test = self.generate_sentence_structures(num_test_sentences)
        existing_training_set_sentences = self.file_set_to_list(
            f"{self.root_simulations_path}/" f"{simulation_number}/training.in"
        )
        test_set = self.generate_sentences(
            sentence_structures_test,
            fname="test_cog.in",
            exclude_test_sentences=existing_training_set_sentences,
            exclude_eos_cognate=False,
        )
        assert num_test_sentences == len(test_set)

    def generate_test_set(
        self, simulation_number, num_test_sentences, path_to_exclude_training_files=None
    ):
        self.set_new_results_dir(
            f"{self.root_simulations_path}/{simulation_number}", mk_new_dir=True
        )
        self.random.seed(
            simulation_number
        )  # set new seed each time we run a new simulation
        if self.randomize and self.l2_decimal:
            self.l2_decimal = around(
                self.random.normal(self.l2_decimal, self.l2_decimal_dev), decimals=2
            )
            print(
                f"Input for sim. {simulation_number}: L1 decimal fraction: {1. - self.l2_decimal:.2}, "
                f"L2 decimal fraction: {self.l2_decimal}"
            )
        sentence_structures_test = self.generate_sentence_structures(num_test_sentences)
        if path_to_exclude_training_files:
            existing_training_set_sentences = self.file_set_to_list(
                f"{path_to_exclude_training_files}/" f"{simulation_number}/training.in"
            )
        else:
            existing_training_set_sentences = None
        test_set = self.generate_sentences(
            sentence_structures_test,
            fname="test.in",
            exclude_test_sentences=existing_training_set_sentences,
        )
        assert num_test_sentences == len(test_set)

    @staticmethod
    def file_set_to_list(fname):
        """split fname lines by sentence## message"""
        with open(fname, "w", encoding="utf-8") as file:
            lines = [line.strip().split("## ") for line in file]
        return lines

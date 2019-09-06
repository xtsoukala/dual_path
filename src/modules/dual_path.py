# -*- coding: utf-8 -*-
from . import lz4, pickle, defaultdict, logging, SimpleRecurrentNetwork, ones, os, copy_files, time
import threading
import random


class DualPath:
    """
    Dual-path is based on the SRN architecture and has the following layers (plus hidden & context):
    input, (predicted) compress, (predicted) concept, (predicted) identifiability & (predicted) role,
    target language, event-semantics and output.

    The event-semantics unit is the only unit that provides information about the target sentence order.
    E.g. for the dative sentence "A man bakes a cake for the cafe" there are 3 event-sem units: CAUSE, CREATE, TRANSFER

    role-concept and pred_role-pred_concept links are used to store the message

    role, concept and pred_concept units are unbiased to make them more input driven
    """

    def __init__(self, hidden_size, learn_rate, final_learn_rate, momentum, epochs, compress_size,
                 role_copy, input_copy, activate_both_lang, srn_debug, set_weights_folder, set_weights_epoch,
                 input_class, pronoun_experiment, cognate_experiment, auxiliary_experiment, ignore_tense_and_det,
                 only_evaluate, continue_training, separate_hidden_layers, evaluate_test_set, evaluate_training_set,
                 starting_epoch, randomize, simulation_num=None):
        """
        :param hidden_size: Size of the hidden layer
        :param learn_rate: Initial learning rate
        :param final_learn_rate: (Reduced) learning rate after the 1st epoch
        :param momentum: accounts for amount of previous weight changes that are added
        :param epochs: Number of training set iterations during training
        :param compress_size: Size of the compress layers (approximately hidden/3)
        :param role_copy: Whether to keep a copy of the role layer activation
        :param input_copy: Whether to keep a copy of the input layer activation
        :param srn_debug: Whether to show debug messages during training
        :param set_weights_folder: A folder that contains pre-trained weights as initial weights for simulations
        :param set_weights_epoch: In case of pre-trained weights we can also specify num of epochs (stage of training)
        :param input_class: Instance of InputFormatter Class (contains all the input for the model)
        :param pronoun_experiment: Whether to evaluate pronoun production
        :param randomize: if set to False, the exact (free parameter) values are used for each simulation (e.g., hidden
        size, fixed weights), otherwise a new value is sampled within a certain standard deviation.
        :param simulation_num: Number of simulation (useful in case we run several simulations in parallel)
        :param evaluate_test_set: Whether to evaluate test set every x epochs. The only reason NOT to evaluate
        is for speed, if we want to training network and save weights
        :param evaluate_training_set: Whether to evaluate the training set (default: False)
        :param starting_epoch: training can start from a later epoch
        """
        self.inputs = input_class
        self.compress_size = compress_size
        self.hidden_size = hidden_size
        self.simulation_num = simulation_num
        self.pronoun_experiment = pronoun_experiment
        self.cognate_experiment = cognate_experiment
        self.auxiliary_experiment = auxiliary_experiment
        self.training_logger = None
        self.test_logger = None
        self.set_level_logger = None
        self.only_evaluate = only_evaluate
        self.continue_training = continue_training
        self.randomize = randomize
        # Learning rate can be reduced linearly until it reaches the end of the first epoch (then stays stable)
        self.final_lrate = final_learn_rate
        # Compute according to how much the lrate decreases and over how many epochs (num_epochs_decreasing_step)
        num_epochs_decrease = 10  # epochs // 4 if epochs >= 20 else 5
        self.lrate_decrease_step = (learn_rate - final_learn_rate) / (self.inputs.num_training * num_epochs_decrease)
        # num_epochs_decrease = epochs // 4 if epochs >= 20 else 5
        # self.lrate_decrease_step = (learn_rate - final_learn_rate) / num_epochs_decrease
        # Epochs indicate the numbers of iteration of the training set during training. 1000 sentences approximate
        # 1 year in Chang & Janciauskas. In Chang, Dell & Bock the total number of sentences experienced is 60000
        self.epochs = epochs
        self.ignore_tense_and_det = ignore_tense_and_det
        self.activate_both_lang = activate_both_lang
        self.role_copy = role_copy
        self.input_copy = input_copy
        self.set_weights_folder = set_weights_folder
        self.set_weights_epoch = set_weights_epoch
        self.separate_hidden_layers = separate_hidden_layers
        self.evaluate_test_set = evaluate_test_set
        self.evaluate_training_set = evaluate_training_set
        self.starting_epoch = starting_epoch
        self.srn = SimpleRecurrentNetwork(learn_rate=learn_rate, momentum=momentum, rdir=self.inputs.directory,
                                          debug_messages=srn_debug, include_role_copy=role_copy,
                                          include_input_copy=input_copy, separate_hidden_layers=separate_hidden_layers)
        self.initialize_srn()

    def init_logger(self, name):
        logger = logging.getLogger(f"{name}_{self.simulation_num}")
        logger.setLevel(logging.DEBUG)
        logger.propagate = False  # no stdout to console
        logger.addHandler(logging.FileHandler(f"{self.inputs.directory}/{name}.csv"))
        if name in ['test', 'training']:
            header = ("epoch, produced_sentence, target_sentence, is_grammatical, meaning, "
                      "is_code_switched, switched_type")
            if self.auxiliary_experiment:
                header += (",switched_at, switched_participle,switched_right_after, switched_after,switched_at_es_en,"
                           "switched_participle_es_en,switched_right_after_es_en, switched_after_es_en")
            if self.pronoun_experiment:
                header += ",pronoun_error, pronoun_error_flex"
            header += ", produced_pos, target_pos, correct_tense, correct_definiteness, message"
        else:
            header = "epoch, set_name, correct_meaning, correct_pos, total_sentences"
        header += ", entropy"
        logger.info(header)
        return logger

    def initialize_srn(self):
        # Chang: The where, what, and cwhat units were unbiased to make them more input driven
        self.srn.add_layer("input", self.inputs.lexicon_size)  # , convert_input=True)
        self.srn.add_layer("identifiability", self.inputs.identif_size, has_bias=False)
        self.srn.add_layer("concept", self.inputs.concept_size, has_bias=False)
        self.srn.add_layer("role", self.inputs.roles_size)  # tried softmax with fw == 1, it didn't work.
        self.srn.add_layer("compress", self.compress_size)
        self.srn.add_layer("eventsem", self.inputs.event_sem_size)
        self.srn.add_layer("target_lang", self.inputs.num_languages)
        if self.separate_hidden_layers:
            self.srn.add_layer("hidden_semantic", int(self.hidden_size * 2 / 3), recurrent=True)
            self.srn.add_layer("hidden_syntactic", int(self.hidden_size / 3), recurrent=True)
        else:
            self.srn.add_layer("hidden", self.hidden_size, recurrent=True)

        # If pred_role is not softmax the model performs poorly on determiners.
        self.srn.add_layer("pred_role", self.inputs.roles_size, activation_function="softmax")
        self.srn.add_layer("pred_identifiability", self.inputs.identif_size, has_bias=False)
        self.srn.add_layer("pred_concept", self.inputs.concept_size, has_bias=False)
        self.srn.add_layer("pred_compress", self.compress_size)
        self.srn.add_layer("output", self.inputs.lexicon_size, activation_function="softmax")

        # Connect layers
        self.srn.connect_layers("input", "identifiability")
        self.srn.connect_layers("input", "concept")
        self.srn.connect_layers("input", "compress")
        self.srn.connect_layers("identifiability", "role")
        self.srn.connect_layers("concept", "role")
        # hidden layer
        if self.input_copy:
            self.srn.add_layer("input_copy", self.inputs.lexicon_size)
            self.srn.connect_layers("input", "hidden")
        if self.role_copy:  # it does not seem to improve performance, set default to False to keep model simple
            self.srn.add_layer("role_copy", self.inputs.roles_size)
            self.srn.connect_layers("role_copy", "hidden")

        if self.separate_hidden_layers:
            self.srn.connect_layers("role", "hidden_semantic")
            self.srn.connect_layers("eventsem", "hidden_semantic")
            self.srn.connect_layers("target_lang", "hidden_semantic")
            self.srn.connect_layers("compress", "hidden_syntactic")
            # hidden to predicted and output layers
            self.srn.connect_layers("hidden_semantic", "pred_role")
            self.srn.connect_layers("hidden_syntactic", "pred_compress")
        else:
            self.srn.connect_layers("role", "hidden")
            self.srn.connect_layers("eventsem", "hidden")
            self.srn.connect_layers("target_lang", "hidden")
            self.srn.connect_layers("compress", "hidden")
            # hidden to predicted and output layers
            self.srn.connect_layers("hidden", "pred_role")
            self.srn.connect_layers("hidden", "pred_compress")

        self.srn.connect_layers("pred_role", "pred_identifiability")
        self.srn.connect_layers("pred_role", "pred_concept")
        self.srn.connect_layers("pred_identifiability", "output")
        self.srn.connect_layers("pred_concept", "output")
        self.srn.connect_layers("pred_compress", "output")
        if not self.only_evaluate:  # else they will be loaded again at the next phase
            self.srn.load_weights(set_weights_epoch=self.set_weights_epoch, set_weights_folder=self.set_weights_folder,
                                  results_dir=self.inputs.directory, simulation_num=self.simulation_num)

    def feed_line(self, target_sentence_idx, target_lang_act, lang, weights_role_concept, weights_concept_role,
                  weights_role_identif, weights_identif_role, event_semantics, backpropagate=False,
                  activate_target_lang=False):
        produced_sent_ids = []
        sentence_entropy = []
        append_to_produced = produced_sent_ids.append
        append_to_entropy = sentence_entropy.append
        self.srn.set_message_reset_context(weights_role_concept=weights_role_concept,
                                           weights_concept_role=weights_concept_role,
                                           weights_role_identif=weights_role_identif,
                                           weights_identif_role=weights_identif_role,
                                           event_semantics=event_semantics,
                                           target_lang_act=target_lang_act,
                                           activate_language=(activate_target_lang or backpropagate))
        prod_idx = None  # previously produced word (at the beginning of sentence: None)
        for trg_idx in target_sentence_idx:
            self.srn.set_inputs(input_idx=prod_idx, target_idx=trg_idx if backpropagate else None)
            self.srn.feedforward(start_of_sentence=prod_idx is None)
            if backpropagate:
                prod_idx = trg_idx  # training with target word, NOT produced one
                self.srn.backpropagate()
            else:  # no "target" word in this case. Also, return the produced sentence
                # reset the target language for the rest of the sentence (during testing only!)
                if activate_target_lang and prod_idx is None and self.activate_both_lang:
                    # TODO: play with activations, e.g. activate the target language slightly more
                    # ones or: [1, 0.9] if self.inputs.languages.index(lang) == 0 else [0.9, 1]
                    self.srn.set_layer_activation("target_lang", activation=ones(2))
                if False:  # include entropy
                    prod_idx, entropy_idx = self.srn.get_max_output_activation_and_entropy()
                    append_to_entropy(entropy_idx)
                else:
                    prod_idx = self.srn.get_max_output_activation()
                append_to_produced(prod_idx)
                if prod_idx == self.inputs.period_idx:  # end sentence if period produced
                    break

        if not backpropagate:
            return produced_sent_ids, sentence_entropy

    def start_network(self, simulation_num, set_existing_weights):
        """
        :param simulation_num: unique number (integer) of simulation
        Training: for each word of input sentence:
            - compute predicted response
            - determine error, (back)propagate and update weights
            - copy hidden units to context

        In Chang, Dell & Bock (2006) each model subject experienced 60k message-sentence pairs from its training set and
        was tested after 2k epochs. Each training set consisted of 8k pairs and the test set_name of 2k.
        The authors created 20 sets x 8k for 20 subjects
        :set_existing_weights: folder containing trained weights (in case we want to continue training or evaluate only)
        """
        if self.randomize:
            random.seed(simulation_num)  # select a random hidden seed
            self.hidden_size = random.randint(self.hidden_size-10, self.hidden_size+10)
            self.compress_size = int(self.hidden_size // 1.3)
            self.srn.fw = random.randint(10, 30)
            print(f"sim: {simulation_num}, hidden: {self.hidden_size}, compress: {self.compress_size}, "
                  f"fw: {self.srn.fw}")
            self.initialize_srn()

        self.inputs.update_sets(f"{self.inputs.root_directory}/{simulation_num}")
        self.simulation_num = simulation_num
        if set_existing_weights:
            destination_folder = f'{self.inputs.directory}/weights'
            self.set_weights_folder = self.inputs.directory if set_existing_weights else None
            src_folder = os.path.join(set_existing_weights, f"{simulation_num}/weights")
            if self.only_evaluate or self.continue_training:  # copy all weights
                copy_files(src_folder, destination_folder)
            else:  # only copy the starting epoch (such as epoch 0)
                copy_files(src=src_folder, dest=destination_folder, ends_with=f"_{self.set_weights_epoch}")
                if self.set_weights_epoch != 0:  # rename them all to epoch 0
                    os.system(f"rename s/_{self.set_weights_epoch}/_0/ {self.inputs.directory}/weights/*")

        if not self.only_evaluate:
            weights_role_concept = self.inputs.weights_role_concept['training']
            weights_concept_role = self.inputs.weights_concept_role['training']
            weights_role_identif = self.inputs.weights_role_identif['training']
            weights_identif_role = self.inputs.weights_identif_role['training']
            event_semantics = self.inputs.event_sem_activations['training']
            target_lang_act = self.inputs.target_lang_act['training']
            set_lines = self.inputs.trainlines_df
            directory = self.inputs.directory
            epoch_range = range(self.starting_epoch, self.epochs)
            for epoch in epoch_range:
                threading.Thread(target=self.srn.save_weights, args=(directory, epoch), daemon=True).start()
                # times = time.time()
                for line in set_lines.sample(frac=1, random_state=epoch).itertuples():   # random_state is the seed
                    line_idx = line.Index
                    self.feed_line(line.target_sentence_idx, target_lang_act[line_idx], line.lang,
                                   weights_role_concept[line_idx], weights_concept_role[line_idx],
                                   weights_role_identif[line_idx],
                                   weights_identif_role[line_idx],
                                   event_semantics[line_idx], backpropagate=True, activate_target_lang=True)
                    if self.srn.learn_rate > self.final_lrate:  # decrease lrate linearly
                        self.srn.learn_rate -= self.lrate_decrease_step
                    elif self.srn.learn_rate != self.final_lrate:
                        self.srn.learn_rate = self.final_lrate
                # print('loop', time.time() - times, self.srn.learn_rate)
            threading.Thread(target=self.srn.save_weights, args=(directory, epoch_range[-1]), daemon=True).start()

        set_names = set()
        if self.evaluate_training_set:
            set_names.add('training')
            self.training_logger = self.init_logger('training')
        if self.evaluate_test_set:
            self.test_logger = self.init_logger('test')
            set_names.add('test')

        if set_names:
            self.set_level_logger = self.init_logger('set_level')
            self.evaluate_network(set_names=set_names)

    def evaluate_network(self, set_names, top_down_language_activation=False):
        """
        :param set_names: ['test', 'training'] or ['test'] if only the test set is evaluated
        :param top_down_language_activation: activates both languages during the whole test duration
        (not just after the production of the first word)
        """
        results = {
            'correct_meaning': {
                set_name: [] for set_name in set_names
            }, 'correct_pos': {
                set_name: [] for set_name in set_names
            }, 'correct_code_switches': {
                set_name: [] for set_name in set_names
            }, 'all_code_switches': {
                set_name: [] for set_name in set_names
            }, 'type_code_switches': {
                set_name: [] for set_name in set_names
            }
        }

        if self.auxiliary_experiment:
            for aux in ['is', 'has']:
                for point in ['participle', 'aux', 'after', 'right_after']:
                    results['%s_%s' % (aux, point)] = {set_name: [] for set_name in set_names}
                    results['%s_%s_es_en' % (aux, point)] = {set_name: [] for set_name in set_names}
                for lang in ['es', 'en']:
                    for cs_ in ["cs_", ""]:
                        results['correct_%s%s_%s' % (cs_, aux, lang)] = {set_name: [] for set_name in set_names}
        if self.pronoun_experiment:
            results['pronoun_errors_flex'] = {set_name: [] for set_name in set_names}
            results['pronoun_errors'] = {set_name: [] for set_name in set_names}

        if top_down_language_activation:
            self.srn.set_layer_activation("target_lang", activation=ones(2))

        for set_name in set_names:
            if set_name == 'test':
                set_lines = self.inputs.testlines_df
                num_sentences = self.inputs.num_test
            else:
                set_lines = self.inputs.trainlines_df
                num_sentences = self.inputs.num_training
            weights_role_concept = self.inputs.weights_role_concept[set_name]
            weights_concept_role = self.inputs.weights_concept_role[set_name]
            weights_role_identif = self.inputs.weights_role_identif[set_name]
            weights_identif_role = self.inputs.weights_identif_role[set_name]
            event_semantics = self.inputs.event_sem_activations[set_name]
            target_lang_act = self.inputs.target_lang_act[set_name]
            directory = self.inputs.directory

            for i in set_lines.event_sem_message.unique():
                results[i] = {set_name: [] for set_name in set_names}
                results["%s_cs" % i] = {set_name: [] for set_name in set_names}
            logger = self.test_logger if 'test' in set_name else self.training_logger
            buffer_to_produce = [None] * 2
            for epoch in range(self.epochs):
                counter = defaultdict(int)
                counter['type_code_switches'] = defaultdict(int)
                self.srn.load_weights(results_dir=directory, set_weights_folder=directory, set_weights_epoch=epoch)
                for line in set_lines.itertuples():
                    line_idx = line.Index
                    target_pos, target_sentence_idx, target_lang = line.target_pos, line.target_sentence_idx, line.lang
                    produced_idx, entropy_idx = self.feed_line(line.target_sentence_idx + buffer_to_produce,
                                                               target_lang_act[line_idx], line.lang,
                                                               weights_role_concept[line_idx],
                                                               weights_concept_role[line_idx],
                                                               weights_role_identif[line_idx],
                                                               weights_identif_role[line_idx],
                                                               event_semantics[line_idx],
                                                               activate_target_lang=not top_down_language_activation)

                    if self.inputs.test_haber_frequency:
                        if self.inputs.tener_idx in target_sentence_idx:
                            target_sentence_idx = [self.inputs.haber_idx if x == self.inputs.tener_idx
                                                   else x for x in target_sentence_idx]
                        if self.inputs.tener_idx in produced_idx:
                            produced_idx = [self.inputs.haber_idx if x == self.inputs.tener_idx
                                            else x for x in produced_idx]

                    produced_sentence = self.inputs.sentence_from_indeces(produced_idx)
                    produced_pos = self.inputs.sentence_pos(produced_idx)

                    if False:  # debug specific sentence
                        logger.warning('Debugging sentence pair')
                        produced_sentence = 'él tiene comido .'
                        target_sentence = 'él ha comido .'
                        target_lang = 'es'
                        produced_idx = self.inputs.sentence_indeces(produced_sentence)
                        produced_pos = self.inputs.sentence_pos(produced_idx)
                        target_sentence_idx = self.inputs.sentence_indeces(target_sentence)
                        target_pos = self.inputs.sentence_pos(target_sentence_idx)

                    has_correct_pos, has_wrong_det, has_wrong_tense, correct_meaning, cs_type = (False, False, False,
                                                                                                 False, None)
                    (switched_at, switched_participle, switched_right_after, switched_after, switched_at_es_en,
                     switched_participle_es_en, switched_right_after_es_en,
                     switched_after_es_en) = (False, False, False, False, False, False, False, False)
                    has_pronoun_error, has_pronoun_error_flex = False, False
                    is_grammatical, flexible_order = self.inputs.is_sentence_gramatical_or_flex(produced_pos,
                                                                                                target_pos,
                                                                                                produced_idx)
                    code_switched = self.inputs.is_code_switched(produced_idx, target_lang_idx=target_sentence_idx[0])
                    if code_switched:
                        counter['all_code_switches'] += 1
                        if self.cognate_experiment:
                            if ',COG' in line.message:
                                counter['cs_cog'] += 1
                            else:
                                counter['cs_nongcog'] += 1
                    if is_grammatical:
                        counter['correct_pos'] += 1
                        has_correct_pos = True
                        if not code_switched:
                            correct_meaning = self.inputs.has_correct_meaning(produced_idx, target_sentence_idx)
                        else:  # only count grammatically correct CS sentences -- determine CS type here
                            cs_type = self.inputs.get_code_switched_type(produced_idx, target_sentence_idx, target_lang,
                                                                         top_down_language_activation)
                            if top_down_language_activation and cs_type == "inter-sentential":  # don't count it as CS
                                correct_meaning = True
                                code_switched = False
                            elif cs_type:  # TODO: check the failed sentences too
                                counter["%s_cs" % line.event_sem_message] += 1  # counts code-switched types
                                correct_meaning = True
                                counter['correct_code_switches'] += 1
                                counter['type_code_switches'][f"{target_lang}-{cs_type}"] += 1
                                if self.cognate_experiment:  # check for cognates vs FFs vs regular (no lang)
                                    if ',COG' in line.message:
                                        cs_type_with_cognate_status = f"{cs_type}-cog"
                                    elif ',FF' in line.message:
                                        cs_type_with_cognate_status = f"{cs_type}-ff"
                                    else:  # no cognates or false friends
                                        cs_type_with_cognate_status = cs_type
                                    counter['type_code_switches'][cs_type_with_cognate_status] += 1
                                elif self.auxiliary_experiment:
                                    if ',PERFECT' in line.message or ',PROG' in line.message:
                                        (switched_at, switched_participle, switched_right_after, switched_after,
                                         switched_at_es_en, switched_participle_es_en, switched_right_after_es_en,
                                         switched_after_es_en) = self.inputs.check_switch_points(produced_idx,
                                                                                                 produced_pos)
                                        aux = 'has' if ',PERFECT' in line.message else 'is'
                                        if switched_participle:
                                            counter[f'{aux}_participle'] += 1
                                            if switched_participle_es_en:
                                                counter[f'{aux}_participle_es_en'] += 1
                                        if switched_at:
                                            counter[f'{aux}_aux'] += 1
                                            if switched_at_es_en:
                                                counter[f'{aux}_aux_es_en'] += 1
                                        if switched_after:  # anywhere after
                                            counter[f'{aux}_after'] += 1
                                            if switched_after_es_en:
                                                counter[f'{aux}_after_es_en'] += 1
                                            if switched_right_after:  # right after the participle
                                                counter[f'{aux}_right_after'] += 1
                                                if switched_after_es_en:
                                                    counter[f'{aux}_right_after_es_en'] += 1

                                        counter[f"correct_cs_{aux}_{target_lang}"] += 1
                        if correct_meaning:
                            counter['correct_meaning'] += 1
                            # this contains number of ALL correct progressive/perfect sentences, even the CS ones
                            counter["correct_%s_%s" % ('has' if ',PERFECT' in line.message else 'is', target_lang)] += 1
                            counter[line.event_sem_message] += 1
                        else:
                            has_wrong_det = self.inputs.test_without_feature(produced_idx, line.target_sentence_idx,
                                                                             feature="determiners")
                            has_wrong_tense = self.inputs.test_without_feature(produced_idx, line.target_sentence_idx,
                                                                               feature="tense")
                            if self.ignore_tense_and_det and (has_wrong_det or has_wrong_tense):
                                counter['correct_meaning'] += 1  # count determiner mistake as (otherwise) correct
                                print(produced_sentence, "correct meaning,FIXME")  # FIXME
                                correct_meaning += 1
                                counter["correct_%s_%s" % ('has' if ',PERFECT' in line.message
                                                           else 'is', target_lang)] += 1
                        if self.pronoun_experiment and epoch > 0:  # only check the grammatical sentences
                            if self.inputs.has_pronoun_error(produced_idx, line.target_sentence_idx):
                                if self.inputs.test_meaning_without_pronouns(produced_idx, line.target_sentence_idx):
                                    counter['pronoun_errors'] += 1
                                    has_pronoun_error = True
                                else:  # flex: grammatically correct sentences / gender error + wrong meaning
                                    counter['pronoun_errors_flex'] += 1
                                    has_pronoun_error_flex = True
                    if epoch > 0:
                        # NOTE: if meaning is flexible we count it as "flex-False", not "flex-True"
                        meaning = f'{"flex-" if has_wrong_det or has_wrong_tense else ""}{correct_meaning}'
                        pos = f'{"flex-" if flexible_order else ""}{has_correct_pos or flexible_order}'
                        log_info = (epoch, produced_sentence, line.target_sentence,
                                    pos, meaning, code_switched, cs_type)
                        if self.auxiliary_experiment:
                            log_info += (switched_at, switched_participle, switched_right_after, switched_after,
                                         switched_at_es_en, switched_participle_es_en, switched_right_after_es_en,
                                         switched_after_es_en)
                        if self.pronoun_experiment:
                            log_info += (has_pronoun_error, has_pronoun_error_flex)
                        log_info += (' '.join(produced_pos), ' '.join(target_pos), not has_wrong_tense,
                                     not has_wrong_det, f'"{line.message}"',)
                        log_info += (' '.join(entropy_idx),)
                        logger.info(",".join(str(x) for x in log_info))
                self.set_level_logger.info(",".join(str(x) for x in (epoch, set_name, counter['correct_meaning'],
                                                                     counter['correct_pos'], num_sentences)))
                for key in results.keys():
                    results[key][set_name].append(counter[key])

            results['type_code_switches'][set_name] = self.aggregate_dict(self.epochs,
                                                                          results['type_code_switches'][set_name])
        # write (single) simulation results to a pickled file
        with lz4.open(f"{self.inputs.directory}/results.pickled", 'wb') as pckl:
            pickle.dump(results, pckl, protocol=-1)

    @staticmethod
    def aggregate_dict(epochs, results_type_code_switches):
        # convert "type_code_switches" from list of dicts
        # (e.g, [[{'es-noun': 4, 'en-alternational': 1}][{'es-noun': 6, 'en-alternational': 8}]])
        # to a single dict of list (e.g., {'en-alternational': [1, 6, 14], 'es-noun': [4, 8, 22]}
        types_dict = {}
        all_keys = sorted(set().union(*(d.keys() for d in results_type_code_switches)))
        for key in all_keys:
            val = []
            for epoch in range(epochs):
                v = results_type_code_switches[epoch][key] if key in results_type_code_switches[epoch] else 0
                val.append(v)
            types_dict[key] = val
        return types_dict

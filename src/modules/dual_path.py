# -*- coding: utf-8 -*-
from . import logging, SimpleRecurrentNetwork, ones, os, copy_files
import random


class DualPath:
    """
    Dual-path is based on the SRN architecture and has the following layers (plus the recurrent hidden one):
    input, (predicted) compress, (predicted) concept, (predicted) identifiability & (predicted) role,
    target language, event-semantics and output.

    The event-semantics unit is the only unit that provides information about the target sentence order.

    role-concept and pred_role-pred_concept links are used to store the message

    role, concept and pred_concept units are unbiased to make them more input driven
    """

    def __init__(self, hidden_size, learn_rate, final_learn_rate, momentum, epochs, compress_size,
                 role_copy, input_copy, activate_both_lang, srn_debug, set_weights_folder, set_weights_epoch,
                 input_class, pronoun_experiment, auxiliary_experiment, ignore_tense_and_det,
                 only_evaluate, continue_training, separate_hidden_layers, evaluate_test_set, evaluate_training_set,
                 starting_epoch, randomize, hidden_deviation, compress_deviation, fw_deviation, l2_epoch,
                 epoch_deviation, srn_only, priming_experiment, simulation_num=None):
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
        :param srn_only: whether to ignore the message (semantic path) and train using the SRN only
        """
        self.inputs = input_class
        self.compress_size = compress_size
        self.hidden_size = hidden_size
        self.simulation_num = simulation_num
        self.pronoun_experiment = pronoun_experiment
        self.auxiliary_experiment = auxiliary_experiment
        self.priming_experiment = priming_experiment
        self.srn_only = srn_only
        self.training_logger = None
        self.test_logger = None
        self.only_evaluate = only_evaluate
        self.continue_training = continue_training
        self.randomize = randomize
        self.hidden_deviation = hidden_deviation
        self.compress_deviation = compress_deviation
        self.fw_deviation = fw_deviation  # the fixed weights are set at the InputFormatter class
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
        self.l2_epoch = l2_epoch
        self.epoch_deviation = epoch_deviation
        self.srn = SimpleRecurrentNetwork(learn_rate=learn_rate, momentum=momentum, debug_messages=srn_debug,
                                          role_copy=role_copy, input_copy=input_copy,
                                          separate_hidden_layers=separate_hidden_layers)
        self.initialize_srn()

    def init_logger(self, name):
        logger = logging.getLogger(f"{name}_{self.simulation_num}")
        logger.setLevel(logging.DEBUG)
        logger.propagate = False  # no stdout to console
        if name == 'test_priming':
            set_weights_folder = self.set_weights_folder.replace('./simulations/', '')
            filename = f'{set_weights_folder[:19]}-{self.simulation_num}-{name}'
            filename = filename.replace('/', '-')
            logger.addHandler(logging.FileHandler(f"{self.inputs.directory}/{filename}.csv"))
        else:
            logger.addHandler(logging.FileHandler(f"{self.inputs.directory}/{name}.csv"))
        header = ("epoch,produced_sentence,target_sentence,is_grammatical,meaning,"
                  "is_code_switched,switched_type,pos_of_switch_point,first_switch_position")
        if self.auxiliary_experiment:
            header += (",switched_before,switched_right_before,switched_right_after,switched_after_anywhere,"
                       "switched_before_es_en,switched_right_before_es_en,switched_right_after_es_en, "
                       "switched_after_anywhere_es_en")
        elif self.inputs.concepts_to_evaluate:
            header += (",switched_before,switched_at,switched_right_after,switched_second_after,"
                       "switched_after_anywhere,switched_before_es_en,switched_at_es_en,switched_right_after_es_en,"
                       "switched_second_after_es_en,switched_after_anywhere_es_en,point_of_interest_produced_last,"
                       "concept_position")
        if self.pronoun_experiment:
            header += ",pronoun_error,pronoun_error_flex"
        header += (",produced_pos,target_pos,correct_tense,correct_definiteness,message,entropy,l2_epoch,"
                   "target_has_cognate,target_has_false_friend")
        if name == 'test_priming':
            header = ("epoch,produced_sentence,target_sentence,alternative_sentence,"
                      "is_grammatical,meaning,alt_meaning,same_as_prime,prime_sentence,prime_structure,target_structure,prime_lang,target_lang,prime_id,target_id,")
            header += "participant,produced_pos,target_pos,correct_tense,correct_definiteness,message" # ,produced_idx,alt_sentence_idx
        logger.info(header)
        return logger

    def initialize_srn(self):
        compress_size = self.compress_size if self.compress_size is not None else int(self.hidden_size // 1.3)
        # Chang: The where, what, and cwhat units were unbiased to make them more input driven
        self.srn.add_layer("input", self.inputs.lexicon_size)  # , convert_input=True)

        if not self.srn_only:
            self.srn.add_layer("identifiability", self.inputs.identif_size, has_bias=False)
            self.srn.add_layer("concept", self.inputs.concept_size, has_bias=False)
            self.srn.add_layer("role", self.inputs.roles_size, activation_function="softmax")

        self.srn.add_layer("compress", compress_size)

        if not self.srn_only:
            self.srn.add_layer("eventsem", self.inputs.event_sem_size)
            self.srn.add_layer("target_lang", self.inputs.num_languages)

        if self.separate_hidden_layers:
            self.srn.add_layer("hidden_semantic", int(self.hidden_size * 2 / 3), recurrent=True)
            self.srn.add_layer("hidden_syntactic", int(self.hidden_size / 3), recurrent=True)
        else:
            self.srn.add_layer("hidden", self.hidden_size, recurrent=True)

        if not self.srn_only:
            # If pred_role is not softmax the model performs poorly on determiners.
            self.srn.add_layer("pred_role", self.inputs.roles_size, activation_function="softmax")
            self.srn.add_layer("pred_identifiability", self.inputs.identif_size, has_bias=False)
            self.srn.add_layer("pred_concept", self.inputs.concept_size, has_bias=False)

        self.srn.add_layer("pred_compress", compress_size)
        self.srn.add_layer("output", self.inputs.lexicon_size, activation_function="softmax")

        # Connect layers
        if not self.srn_only:
            self.srn.connect_layers("input", "identifiability")
            self.srn.connect_layers("input", "concept")

        self.srn.connect_layers("input", "compress")

        if not self.srn_only:
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
            if not self.srn_only:
                self.srn.connect_layers("role", "hidden")
                self.srn.connect_layers("eventsem", "hidden")
                self.srn.connect_layers("target_lang", "hidden")

            self.srn.connect_layers("compress", "hidden")

            if not self.srn_only:
                # hidden to predicted and output layers
                self.srn.connect_layers("hidden", "pred_role")

            self.srn.connect_layers("hidden", "pred_compress")

        if not self.srn_only:
            self.srn.connect_layers("pred_role", "pred_identifiability")
            self.srn.connect_layers("pred_role", "pred_concept")
            self.srn.connect_layers("pred_identifiability", "output")
            self.srn.connect_layers("pred_concept", "output")

        self.srn.connect_layers("pred_compress", "output")
        # make sure weights will not be loaded again in start_network() function
        if not self.randomize or (not self.only_evaluate and self.simulation_num):
            self.srn.load_weights(set_weights_epoch=self.set_weights_epoch, set_weights_folder=self.set_weights_folder,
                                  simulation_num=self.simulation_num)

    def feed_line(self, target_sentence_idx, target_lang_act, weights_role_concept, weights_concept_role,
                  weights_role_identif, weights_identif_role, event_semantics, backpropagate=False,
                  activate_target_lang=False, include_entropy=True):
        produced_sent_ids = []
        sentence_entropy = []
        append_to_produced = produced_sent_ids.append
        append_to_entropy = sentence_entropy.append
        if self.srn_only:
            self.srn.reset_context_delta_and_crole()
        else:
            self.srn.set_message_reset_context(weights_role_concept=weights_role_concept,
                                               weights_concept_role=weights_concept_role,
                                               weights_role_identif=weights_role_identif,
                                               weights_identif_role=weights_identif_role,
                                               event_semantics=event_semantics,
                                               target_lang_act=target_lang_act,
                                               activate_language=(activate_target_lang or backpropagate))
        prod_idx = None  # previously produced word (at the beginning of sentence: None)
        if self.srn_only and not prod_idx:
            trg_idx = target_sentence_idx[0]
            target_sentence_idx = target_sentence_idx[1:]
            prod_idx = trg_idx
            append_to_produced(prod_idx)  # give the first word to the model

        for trg_idx in target_sentence_idx:
            self.srn.set_inputs(input_idx=prod_idx, target_idx=trg_idx if backpropagate else None)
            self.srn.feedforward(start_of_sentence=prod_idx is None)
            if backpropagate:
                prod_idx = trg_idx  # training with target word, NOT produced one
                self.srn.backpropagate()
            else:  # no "target" word in this case. Also, return the produced sentence
                # reset the target language for the rest of the sentence (during testing only!)
                if activate_target_lang and not self.srn_only and prod_idx is None and self.activate_both_lang:
                    # TODO: play with activations, e.g. activate the target language slightly more
                    # ones or: [1, 0.9] if self.inputs.target_lang.index(lang) == 0 else [0.9, 1]
                    self.srn.set_layer_activation("target_lang", activation=ones(2))
                if include_entropy:
                    prod_idx, entropy_idx = self.srn.get_max_output_activation_and_entropy()
                    append_to_entropy(entropy_idx)
                else:
                    prod_idx = self.srn.get_max_output_activation()
                append_to_produced(prod_idx)
                if prod_idx == self.inputs.period_idx:  # end sentence if period produced
                    break

        if not backpropagate:
            return produced_sent_ids, sentence_entropy

    def start_network(self, simulation_num):
        """
        :param simulation_num: unique number (integer) of simulation
        Training: for each word of input sentence:
            - compute predicted response
            - determine error, (back)propagate and update weights
            - copy hidden units to context

        In Chang, Dell & Bock (2006) each model subject experienced 60k message-sentence pairs from its training set and
        was tested after 2k epochs. Each training set consisted of 8k pairs and the test set_name of 2k.
        The authors created 20 sets x 8k for 20 subjects
        """
        self.simulation_num = simulation_num

        if self.set_weights_folder:
            destination_folder = f'{self.inputs.root_directory}/{simulation_num}/weights'
            src_folder = os.path.join(self.set_weights_folder, f"{simulation_num}/weights")
            if self.only_evaluate or self.continue_training:  # copy all weights
                copy_files(src_folder, destination_folder)
            else:  # only copy the starting epoch (such as epoch 0)
                copy_files(src=src_folder, dest=destination_folder, ends_with=f"_{self.set_weights_epoch}")
                if self.set_weights_epoch != 0:  # rename them all to epoch 0
                    weights_path = f'{self.inputs.root_directory}/{simulation_num}/weights/'
                    for fname in os.listdir(weights_path):
                        if f'w{self.set_weights_epoch}' in fname:
                            new_name = os.path.join(weights_path, fname.replace(f'w{self.set_weights_epoch}', 'w0'))
                            os.rename(os.path.join(weights_path, fname), new_name)
            self.set_weights_folder = destination_folder

        if self.randomize:
            random.seed(simulation_num)  # select a random hidden seed
            self.hidden_size = random.randint(self.hidden_size - self.hidden_deviation,
                                              self.hidden_size + self.hidden_deviation)
            self.compress_size = (random.randint(self.compress_size - self.compress_deviation,
                                                 self.compress_size + self.compress_deviation)
                                  if self.compress_size else int(self.hidden_size // 1.3))
            self.inputs.fixed_weights = random.randint(self.inputs.fixed_weights - self.fw_deviation,
                                                       self.inputs.fixed_weights + self.fw_deviation)

            if self.l2_epoch:
                self.epochs = random.randint(self.l2_epoch - self.epoch_deviation,
                                             self.l2_epoch + self.epoch_deviation)
            elif self.set_weights_epoch:
                self.set_weights_epoch = random.randint(self.set_weights_epoch - self.epoch_deviation,
                                                        self.set_weights_epoch + self.epoch_deviation)
                self.starting_epoch = self.set_weights_epoch
            logging.info(f"sim: {simulation_num}, hidden: {self.hidden_size}, compress: {self.compress_size}, "
                         f"fw: {self.inputs.fixed_weights}, epochs: {self.epochs}, "
                         f"{f'starting weight epoch: {self.set_weights_epoch}' if self.set_weights_epoch else ''}")
            self.initialize_srn()

        self.inputs.update_sets(f"{self.inputs.root_directory}/{simulation_num}")

        if not self.only_evaluate:
            weights_role_concept = self.inputs.weights_role_concept['training']
            weights_concept_role = self.inputs.weights_concept_role['training']
            weights_role_identif = self.inputs.weights_role_identif['training']
            weights_identif_role = self.inputs.weights_identif_role['training']
            event_semantics = self.inputs.event_sem_activations['training']
            target_lang_act = self.inputs.target_lang_act['training']
            set_lines = self.inputs.trainlines_df
            directory = self.inputs.directory

            epoch_range = range(self.starting_epoch, self.epochs + 1)
            for epoch in epoch_range:
                if not self.set_weights_epoch or epoch > self.set_weights_epoch:
                    self.srn.save_weights(directory, epoch)
                for line in set_lines.sample(frac=1, random_state=epoch).itertuples():  # random_state is the seed
                    line_idx = line.Index
                    self.feed_line(target_sentence_idx=line.target_sentence_idx,
                                   target_lang_act=target_lang_act[line_idx],
                                   weights_role_concept=weights_role_concept[line_idx],
                                   weights_concept_role=weights_concept_role[line_idx],
                                   weights_role_identif=weights_role_identif[line_idx],
                                   weights_identif_role=weights_identif_role[line_idx],
                                   event_semantics=event_semantics[line_idx], backpropagate=True,
                                   activate_target_lang=True)
                    if self.srn.learn_rate > self.final_lrate:  # decrease lrate linearly
                        self.srn.learn_rate -= self.lrate_decrease_step
                    elif self.srn.learn_rate != self.final_lrate:
                        self.srn.learn_rate = self.final_lrate

        set_names = set()
        if self.evaluate_training_set:
            set_names.add('training')
            self.training_logger = self.init_logger('training')
        if self.evaluate_test_set:
            self.test_logger = self.init_logger('test')
            set_names.add('test')

        if set_names:
            self.evaluate_network(set_names=set_names)

        if self.priming_experiment:
            self.evaluate_priming()

    def evaluate_network(self, set_names, top_down_language_activation=False):
        """
        :param set_names: ['test', 'training'] or ['test'] if only the test set is evaluated
        :param top_down_language_activation: activates both languages during the whole test duration
        (not just after the production of the first word)
        """
        if top_down_language_activation:
            self.srn.set_layer_activation("target_lang", activation=ones(2))

        pos_interest = 'aux' if self.auxiliary_experiment else None

        for set_name in set_names:
            set_lines = self.inputs.testlines_df if set_name == 'test' else self.inputs.trainlines_df
            weights_role_concept = self.inputs.weights_role_concept[set_name]
            weights_concept_role = self.inputs.weights_concept_role[set_name]
            weights_role_identif = self.inputs.weights_role_identif[set_name]
            weights_identif_role = self.inputs.weights_identif_role[set_name]
            event_semantics = self.inputs.event_sem_activations[set_name]
            target_lang_act = self.inputs.target_lang_act[set_name]
            directory = self.inputs.directory
            logger = self.test_logger if 'test' in set_name else self.training_logger
            buffer_to_produce = [None] * 2
            for epoch in range(self.epochs + 1):
                self.srn.load_weights(set_weights_folder=directory, set_weights_epoch=epoch)
                for line in set_lines.itertuples():
                    line_idx = line.Index
                    target_pos, target_sentence_idx, target_lang = line.target_pos, line.target_sentence_idx, line.lang
                    produced_idx, entropy_idx = self.feed_line(line.target_sentence_idx + buffer_to_produce,
                                                               target_lang_act[line_idx],
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
                    produced_sentence = self.inputs.sentence_from_indices(produced_idx)
                    produced_pos = self.inputs.sentence_pos(produced_idx)
                    debug_specific_sentence = False
                    if debug_specific_sentence:
                        produced_sentence = 'a mother has the toy .'
                        target_sentence = 'una madre tiene el toy .'
                        target_lang = 'es'
                        logging.info(f'Debugging sentence pair: {produced_sentence} target: {target_sentence}')
                        produced_idx = self.inputs.sentence_indices(produced_sentence)
                        produced_pos = self.inputs.sentence_pos(produced_idx)
                        target_sentence_idx = self.inputs.sentence_indices(target_sentence)
                        target_pos = self.inputs.sentence_pos(target_sentence_idx)

                    (has_wrong_det, has_wrong_tense, correct_meaning, cs_type, cs_pos_point,
                     switched_before, switched_right_before, switched_at, switched_right_after, switched_second_after,
                     switched_after_anywhere, switched_before_es_en, switched_right_before_es_en, switched_at_es_en,
                     switched_right_after_es_en, switched_second_after_es_en, switched_after_anywhere_es_en,
                     has_pronoun_error, has_pronoun_error_flex, point_of_interest_produced_last,
                     has_cognate, has_false_friend,
                     concept_position, first_switch_position) = (False, False, False, False, False, False, False,
                                                                 False, False, False, False, False, False, False,
                                                                 False, False, False, False, False, False, False,
                                                                 False, None, None)
                    if self.inputs.cognate_idx:
                        has_cognate = bool(set(target_sentence_idx).intersection(self.inputs.cognate_idx))
                    if self.inputs.false_friend_idx:
                        has_false_friend = bool(set(target_sentence_idx).intersection(self.inputs.false_friend_idx))

                    if produced_idx == target_sentence_idx:  # if sentences are identical, no need to investigate
                        pos, meaning, code_switched = True, True, False  # Assumption: input isn't code-switched
                    else:
                        is_grammatical, flexible_order = self.inputs.is_sentence_gramatical_or_flex(produced_pos,
                                                                                                    target_pos,
                                                                                                    produced_idx)
                        code_switched, first_switch_position = self.inputs.is_code_switched(
                            sentence_idx=produced_idx, target_lang=target_lang,
                            target_sentence_idx=target_sentence_idx, return_position=True, srn_only=self.srn_only)
                        if is_grammatical:
                            if not code_switched:
                                correct_meaning = self.inputs.has_correct_meaning(produced_idx, target_sentence_idx)
                            else:  # only count grammatically correct CS sentences -- determine CS type here
                                cs_type, cs_pos_point = self.inputs.get_code_switched_type(produced_idx, produced_pos,
                                                                                           target_sentence_idx,
                                                                                           target_lang,
                                                                                           top_down_language_activation)
                                if cs_type == "inter-sentential":  # and top_down_language_activation?
                                    correct_meaning = True
                                    code_switched = False  # Assumption: we are not interested in inter-sentential
                                elif cs_type:  # Correct CS only. TODO: check the failed sentences too
                                    correct_meaning = True
                                    if pos_interest and pos_interest in produced_pos:
                                        (switched_before, switched_right_before, switched_right_after,
                                         switched_after_anywhere, switched_before_es_en, switched_right_before_es_en,
                                         switched_right_after_es_en, switched_after_anywhere_es_en
                                         ) = self.inputs.check_cs_around_pos_of_interest(produced_idx, produced_pos,
                                                                                         pos_interest)
                                    elif self.inputs.concepts_to_evaluate:
                                        evaluated_concept_idx = next(iter(set(produced_idx).intersection(
                                            self.inputs.concepts_to_evaluate)), None)
                                        if evaluated_concept_idx:
                                            concept_position = produced_idx.index(evaluated_concept_idx)
                                            (switched_before, switched_at, switched_right_after,
                                             switched_second_after, switched_after_anywhere, switched_before_es_en,
                                             switched_at_es_en, switched_right_after_es_en, switched_second_after_es_en,
                                             switched_after_anywhere_es_en, point_of_interest_produced_last
                                             ) = self.inputs.check_cs_around_idx_of_interest(
                                                produced_idx, evaluated_concept_idx, target_lang, target_sentence_idx)
                            if not correct_meaning:
                                has_wrong_det = self.inputs.test_without_feature(produced_idx, line.target_sentence_idx,
                                                                                 feature="determiners")
                                has_wrong_tense = self.inputs.test_without_feature(produced_idx,
                                                                                   line.target_sentence_idx,
                                                                                   feature="tense")
                            if self.pronoun_experiment:
                                if self.inputs.has_pronoun_error(produced_idx, line.target_sentence_idx):
                                    if self.inputs.test_meaning_without_pronouns(produced_idx,
                                                                                 line.target_sentence_idx):
                                        has_pronoun_error = True
                                    else:  # flex: grammatically correct sentences / gender error + wrong meaning
                                        has_pronoun_error_flex = True

                        meaning = f"{'flex-' if has_wrong_det or has_wrong_tense else ''}{correct_meaning}"
                        pos = is_grammatical or flexible_order

                    log_info = [epoch, produced_sentence, line.target_sentence, pos, meaning, code_switched,
                                cs_type, cs_pos_point, first_switch_position]
                    if pos_interest:
                        log_info.extend(
                            [switched_before, switched_right_before, switched_right_after, switched_after_anywhere,
                             switched_before_es_en, switched_right_before_es_en, switched_right_after_es_en,
                             switched_after_anywhere_es_en])
                    elif self.inputs.concepts_to_evaluate:
                        log_info.extend([switched_before, switched_at, switched_right_after,
                                         switched_second_after, switched_after_anywhere, switched_before_es_en,
                                         switched_at_es_en, switched_right_after_es_en, switched_second_after_es_en,
                                         switched_after_anywhere_es_en, point_of_interest_produced_last,
                                         concept_position])
                    if self.pronoun_experiment:
                        log_info.extend([has_pronoun_error, has_pronoun_error_flex])
                    log_info.extend([' '.join(produced_pos), ' '.join(target_pos), not has_wrong_tense,
                                     not has_wrong_det, f'"{line.message}"', ' '.join(entropy_idx),
                                     self.starting_epoch, has_cognate, has_false_friend])
                    logger.info(",".join(str(x) for x in log_info))


    def evaluate_priming(self):
        
        set_names = ['test']
        set_name = 'test'
        self.set_weights_folder = self.inputs.directory
        self.test_priming_logger = self.init_logger('test_priming')
        self.set_level_priming_logger = self.init_logger('set_level_priming')
        logger = self.test_priming_logger
        
        weights_role_concept = self.inputs.weights_role_concept['test']
        weights_concept_role = self.inputs.weights_concept_role['test']
        weights_role_identif = self.inputs.weights_role_identif['test']
        weights_identif_role = self.inputs.weights_identif_role['test']
        event_semantics = self.inputs.event_sem_activations['test']
        target_lang_act = self.inputs.target_lang_act['test']
        set_lines = self.inputs.testlines_df
        num_sentences = self.inputs.num_test
        directory = self.inputs.directory
        epoch_range = range(self.starting_epoch, self.epochs)
        buffer_to_produce = [None] * 2 
        top_down_language_activation = False


        # Only test priming for last epoch
        epoch = self.epochs

        self.srn.load_weights(set_weights_folder=directory, set_weights_epoch=epoch)

        prime_structure = ''
        prime_sentence = ''
        for line in set_lines.itertuples():
            # Process prime sentence as if training
            line_idx = line.Index
            if ((line_idx % 2) == 0):
                prime_structure = line.sentence_structure
                prime_sentence = line.target_sentence
                prime_lang = line.lang
                self.feed_line(line.target_sentence_idx, target_lang_act[line_idx],
                               weights_role_concept[line_idx],
                               weights_concept_role[line_idx],
                               weights_role_identif[line_idx],
                               weights_identif_role[line_idx],
                               event_semantics[line_idx],
                               backpropagate=True, activate_target_lang=True)
                
            # Process target as if testing
            else:
                target_pos, target_sentence_idx, target_lang = line.target_pos, line.target_sentence_idx, line.lang
                alt_sentence_idx, alternative_sentence = line.alt_sentence_idx, line.alt_sentence
                produced_idx, entropy_idx = self.feed_line(line.target_sentence_idx + buffer_to_produce,
                                                       target_lang_act[line_idx],
                                                       weights_role_concept[line_idx],
                                                       weights_concept_role[line_idx],
                                                       weights_role_identif[line_idx],
                                                       weights_identif_role[line_idx],
                                                       event_semantics[line_idx],
                                                       activate_target_lang=not top_down_language_activation)

                produced_sentence = self.inputs.sentence_from_indices(produced_idx)
                produced_pos = self.inputs.sentence_pos(produced_idx)
                alt_pos = self.inputs.sentence_pos(alt_sentence_idx)

                # We ignore periods. Quite a few sentences without periods are produced that are 
                # otherwise correct
                period_idx = self.inputs.df_query_to_idx("pos == '.'")
                produced_idx_no_period = list(filter(lambda i: i not in period_idx, produced_idx))
                target_sentence_idx_no_period = list(filter(lambda i: i not in period_idx, target_sentence_idx))
                alt_sentence_idx_no_period = list(filter(lambda i: i not in period_idx, alt_sentence_idx))
                    
                target_pos_no_period = self.inputs.sentence_pos(target_sentence_idx_no_period)
                alt_pos_no_period = self.inputs.sentence_pos(alt_sentence_idx_no_period)
                produced_pos_no_period = self.inputs.sentence_pos(produced_idx_no_period)

                has_correct_pos, has_wrong_det, has_wrong_tense, correct_meaning, cs_type = (False, False, False,
                                                                                             False, None)
                correct_alternative_meaning, alt_has_wrong_det, alt_has_wrong_tense = (False, False, False)

                # check for zero length to prevent list index error in is_sentence_gramatical_or_flex()
                if len(produced_pos_no_period) == 0:
                    is_grammatical = False
                    alt_is_grammatical = False
                else:
                    is_grammatical, flexible_order = self.inputs.is_sentence_gramatical_or_flex(produced_pos_no_period,
                                                                                            target_pos_no_period,
                                                                                            produced_pos_no_period)
                    alt_is_grammatical, alt_flexible_order = self.inputs.is_sentence_gramatical_or_flex(produced_pos_no_period,
                                                                                            alt_pos_no_period,
                                                                                            produced_pos_no_period)
                if is_grammatical:
                    has_correct_pos = True
                    
                    correct_meaning = self.inputs.has_correct_meaning(produced_idx_no_period, target_sentence_idx_no_period)

                    if self.ignore_tense_and_det:
                        has_wrong_det = self.inputs.test_without_feature(produced_idx_no_period, target_sentence_idx_no_period,
                                                                         feature="determiners")

                        if (has_wrong_det):
                            correct_meaning = True
                            
                if alt_is_grammatical:
                    correct_alternative_meaning = self.inputs.has_correct_meaning(produced_idx_no_period,
                                                                                  alt_sentence_idx_no_period)
                    if self.ignore_tense_and_det:
                        alt_has_wrong_det = self.inputs.test_without_feature(produced_idx_no_period, alt_sentence_idx_no_period,
                                                                             feature="determiners")
                        if (alt_has_wrong_det):
                            correct_alternative_meaning = True
                     
                
                # NOTE: if meaning is flexible we count it as "flex-False", not "flex-True"
                meaning = f'{"flex-" if has_wrong_det or has_wrong_tense else ""}{correct_meaning}'
                pos = f'{"flex-" if flexible_order else ""}{has_correct_pos or flexible_order}'
                
                target_structure = None
                if correct_alternative_meaning:
                    target_structure = 'passive'
                elif correct_meaning:
                    target_structure = 'active'

                if target_structure == None:
                    same_as_prime = None
                else:
                    same_as_prime = int(target_structure == prime_structure)
                
                log_info = (epoch, produced_sentence, line.target_sentence, alternative_sentence,
                            pos, meaning, correct_alternative_meaning, same_as_prime,)
                log_info += (prime_sentence, prime_structure, target_structure, prime_lang, target_lang,
                             f'p{line_idx-1}',f't{line_idx}', self.simulation_num)
                log_info += (' '.join(produced_pos), ' '.join(target_pos), not has_wrong_tense,
                             not has_wrong_det, f'"{line.message}"',)
                
                logger.info(",".join(str(x) for x in log_info))

                # Reload trained weights for next prime-target pair
                self.srn.load_weights(set_weights_folder=directory, set_weights_epoch=epoch)                

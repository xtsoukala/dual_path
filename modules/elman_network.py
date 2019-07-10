# -*- coding: utf-8 -*-
import sys
import os
from copy import deepcopy
from modules.plotter import Plotter, torch, true_divide
from collections import defaultdict
from torch.distributions import normal


if torch.cuda.is_available():
    print('CUDA')
    torch.set_default_tensor_type('torch.cuda.FloatTensor')


class SimpleRecurrentNetwork:
    def __init__(self, learn_rate, momentum, rdir, separate_hidden_layers=False, context_init_value=0.5,
                 debug_messages=True, include_role_copy=False,
                 include_input_copy=False):
        self.layers = []
        self.layer_idx = defaultdict(int)
        self.backpropagated_layers = []
        self.feedforward_layers = []
        self.context_init_value = context_init_value  # Initial activations of context layer
        self.learn_rate = learn_rate  # learning rate (speed of learning)
        self.momentum = momentum
        self.initialization_completed = False  # needs to be set to True for the model to start training
        self.debug_messages = debug_messages
        self.include_role_copy = include_role_copy
        self.include_input_copy = include_input_copy
        self.separate_hidden_layers = separate_hidden_layers
        # Before producing the first word of each sentence, there is no input from the following layers so init to 0
        self.lesion_syntax = False
        self.lesion_semantics = False
        self.syntactic_layers = ['compress', 'pred_compress']
        self.semantic_layers = ['pred_concept', 'role'] #['role', 'pred_concept', 'pred_identifiability', 'eventsem']#, 'target_lang']
        self.initially_deactive_layers = ['compress', 'concept', 'identifiability', 'role']
        self.current_layer = None
        self.dir = rdir
        self.mse = defaultdict(list)
        self.divergence_error = defaultdict(list)

    def _complete_initialization(self):
        self.feedforward_layers = self.get_feedforward_layers()
        self.backpropagated_layers = self.get_backpropagation_layers()
        for layer in self.layers:  # if there are > 1 layers and if at least one has input weights
            if all(layer.in_weights):
                self.initialization_completed = True
                break

    def add_layer(self, name, size, has_bias=False, activation_function="tanh", convert_input=False, recurrent=False):
        self.layers.append(NeuronLayer(name=name, size=size, has_bias=has_bias, convert_input=convert_input,
                                       is_recurrent=recurrent, activation_function=activation_function,
                                       context_init_value=self.context_init_value))
        self.layer_idx[name] = len(self.layers) - 1

    def connect_layers(self, first_layer_name, second_layer_name):
        first = self.get_layer(first_layer_name)
        second = self.get_layer(second_layer_name)
        second.in_size += first.size
        second.in_layers.append(first)

    def load_weights(self, results_dir, set_weights_folder, set_weights_epoch, simulation_num=None):
        if set_weights_folder:
            weights_fname = os.path.join(set_weights_folder, "weights", "w_%s" % set_weights_epoch)
            self.layers = torch.load(weights_fname)
        else:
            if not set_weights_folder:
                self._create_dir_if_not_exists(results_dir)
                torch.manual_seed(simulation_num if not None else 18)  # set number of simulation as the seed

            for layer in self.layers:
                if not layer.in_size:
                    continue
                layer.sd = 0.05  # or calculate according to input size: self.input_sd(layer.in_size)
                # Using random weights with μ = 0 and low variance is CRUCIAL.
                # np.random.standard_normal has variance of 1 (too high) and np.random.uniform doesn't always have μ = 0
                m = normal.Normal(0, layer.sd)
                layer.in_weights = m.sample([layer.in_size + int(layer.has_bias), layer.size])
            torch.save(self.layers, "%s/weights/w_%s" % (results_dir, set_weights_epoch))
        self.reset_context_delta_and_crole()
        self._complete_initialization()

    def save_weights(self, results_dir, epoch):
        """for layer in self.backpropagated_layers:
            np.savez_compressed("%s/weights/weights_%s" % (results_dir, epoch), layer.in_weights)"""
        torch.save(self.layers, "%s/weights/w_%s" % (results_dir, epoch))

    def set_message_reset_context(self, updated_role_concept, info, activate_language):
        weights_concept_role = torch.t(updated_role_concept)
        role_layer = self.get_layer("role")
        for x in range(role_layer.in_size):  # update this way so as to keep the bias weights intact
            role_layer.in_weights[x] = weights_concept_role[x]

        # pred_concept is split into pred_identifiability and pred_concept (they can have different fixed weights)
        pred_identif = self.get_layer("pred_identifiability")
        pred_concept = self.get_layer("pred_concept")
        for x in range(pred_concept.in_size):  # pred_identif.in_size is the same as pred_concept.in_size
            for s in range(pred_identif.size):
                pred_identif.in_weights[x][s] = updated_role_concept[x][s]
            for s in range(pred_concept.size):
                pred_concept.in_weights[x][s] = updated_role_concept[x][pred_identif.size + s]

        event_sem = self.get_layer("eventsem")
        if event_sem.convert_input:
            event_sem.activation = convert_range(info.event_sem_activations)
        else:
            event_sem.activation = torch.tensor(info.event_sem_activations)  # info.event_sem_activations  # FIXME
        if activate_language:
            self.update_layer_activation("target_lang", activation=torch.tensor(info.target_lang_act))  # FIXME
        self.reset_context_delta_and_crole()

    def boost_non_target_lang(self, target_lang_idx):
        target_lang = self.get_layer("target_lang")
        target_lang.activation[target_lang_idx] -= 0.1
        if target_lang_idx == 0:
            target_lang.activation[1] += 0.1
        else:
            target_lang.activation[0] += 0.1

    def reset_context_delta_and_crole(self):
        if self.separate_hidden_layers:
            recurrent_layer = self.get_layer("hidden_semantic")
            recurrent_layer.context_activation = torch.tensor([self.context_init_value] * recurrent_layer.size)
            recurrent_layer = self.get_layer("hidden_syntactic")
            recurrent_layer.context_activation = torch.tensor([self.context_init_value] * recurrent_layer.size)
        else:
            recurrent_layer = self.get_layer("hidden")
            recurrent_layer.context_activation = torch.tensor([self.context_init_value] * recurrent_layer.size)

        for layer in self.backpropagated_layers:  # Also reset the previous delta values
            layer.previous_delta = torch.empty([])

        if self.include_role_copy:  # if we're using role_copy, reset that as well (to 0, NOT empty)
            self.update_layer_activation("role_copy", activation=None)
        if self.include_input_copy:
            self.update_layer_activation("input_copy", activation=None)

    def set_inputs(self, input_idx, target_idx=None):
        input_layer = self.get_layer("input")
        input_layer.activation = torch.zeros(input_layer.size)
        if input_idx:  # at the beginning of sentence, input_idx is None
            input_layer.activation[input_idx] = 1
        if input_layer.convert_input:  # convert the range of the input between -0.9 and 0.9 instead of 0-1
            input_layer.activation = convert_range(input_layer.activation)

        if target_idx is not None:  # no need to set target when testing
            output_layer = self.get_layer("output")
            output_layer.target_activation = torch.zeros(output_layer.size)
            output_layer.target_activation[target_idx] = 1

    def update_layer_activation(self, layer_name, activation):
        layer = self.get_layer(layer_name)
        if activation is None:  # set to zero
            layer.activation = torch.zeros(layer.size)
        else:
            layer.activation = activation

    def feedforward(self, start_of_sentence=False):
        if not self.initialization_completed:
            sys.exit('The network was not been initialized correctly. Make sure you have added layers (add_layer), '
                     'connected them (connect_layers) and (re)set the weights')
        for layer in self.feedforward_layers:
            layer.in_activation = torch.tensor([])
            for incoming_layer in layer.in_layers:
                # combines the activation of all previous layers (e.g. role and compress and... to hidden)
                if (start_of_sentence and self.lesion_syntax and incoming_layer.name in self.syntactic_layers or
                        self.lesion_semantics and incoming_layer.name in self.semantic_layers):
                    lesion_step = 1  # 11% for syntax, 5% for semantics
                    layer.in_weights[layer.in_activation.size:layer.in_activation.size+incoming_layer.size] = 0

                layer.in_activation = torch.cat((layer.in_activation, incoming_layer.activation))
            if layer.is_recurrent:  # hidden layer only (include context activation)
                layer.in_activation = torch.cat((layer.in_activation, layer.context_activation))  # , 0)
            if layer.has_bias:  # add bias
                layer.in_activation = torch.cat(
                    (layer.in_activation, torch.tensor(1)))  # , 0) #np. append(layer.in_activation, 1)

            if start_of_sentence and layer.name in self.initially_deactive_layers:
                layer.activation = torch.zeros(layer.size)  # set role_copy to zero
                continue
            dot_product = torch.matmul(layer.in_activation, layer.in_weights)
            # Apply activation function to input • weights
            if layer.activation_function == "softmax":
                layer.activation = torch.nn.functional.softmax(dot_product, dim=0) #softmax(dot_product)
            elif layer.activation_function == "tanh":
                layer.activation = dot_product.tanh()
            if self.debug_messages:
                print("Layer: %s. Activation %s" % (layer.name, layer.activation))
        # Copy output of the hidden to "context" (activation of t-1)
        if self.separate_hidden_layers:
            hidden_layer = self.get_layer("hidden_semantic")
            hidden_layer.context_activation = deepcopy(hidden_layer.activation)  # deepcopy otherwise it keeps reference
            hidden_layer = self.get_layer("hidden_syntactic")
            hidden_layer.context_activation = deepcopy(hidden_layer.activation)  # deepcopy otherwise it keeps reference
        else:
            hidden_layer = self.get_layer("hidden")
            hidden_layer.context_activation = deepcopy(hidden_layer.activation)  # deepcopy otherwise it keeps reference

        if self.include_input_copy:
            input_layer = self.get_layer("input")
            self.update_layer_activation("input_copy", activation=deepcopy(input_layer.activation))
        if self.include_role_copy:
            role_layer = self.get_layer("role")
            self.update_layer_activation("role_copy", activation=deepcopy(role_layer.activation))

    @staticmethod
    def convert_to_2d(tensor, transpose=False):
        if len(tensor.size()) == 1:
            return tensor[None, :]  # tensor.view(tensor.size(), 1)
        if transpose:
            return torch.t(tensor)
        return tensor

    def backpropagate(self, epoch):
        self._compute_output_error(epoch)
        for self.current_layer in self.backpropagated_layers:  # Propagate error back to the previous layers
            self._compute_current_layer_gradient()
            self._compute_current_delta_weight_matrix()
            self._update_total_error_for_backpropagation()
            if self.current_layer.name not in ["role", "pred_concept"]:
                self._update_current_weights_and_previous_delta()
            self._backpropagate_error_to_incoming_layers()

    def _compute_output_error(self, epoch):
        # Calculate error[Eo](target - output)
        output_layer = self.get_layer("output")
        self._calculate_mean_square_and_divergence_error(epoch, output_layer.target_activation, output_layer.activation)
        output_layer.gradient = output_layer.target_activation - output_layer.activation  # no derivative here

    def _calculate_mean_square_and_divergence_error(self, epoch, target_activation, output_activation):
        # perform element-wise average along the array (returns single value)
        self.mse[epoch].append(((target_activation - output_activation) ** 2).mean())  # axis=None))  # same as axis=0
        """ Error on the word units was measured in terms of divergence—? ti log(ti/oi)—where oi is the activation for
                            the i output unit on the current word and ti is its target activation
                        divergence_err = np .sum(target_activation)
        # if all(output_activation) == 0:
        #    print output_activation
        with np .errstate(divide='ignore', invalid='ignore'):
            self.divergence_error[epoch].append(target_activation * np .log(np.true_divide(target_activation,
            output_activation)))"""

    def _compute_current_layer_gradient(self):
        if self.current_layer.error_out:  # all layers but "output" (which has error and gradient precomputed)
            # for some layers (hidden and pred_role) there are 2 errors to be backpropagated; sum them
            # error_out = self.current_layer.error_out.sum(0) FIXME
            error_out = self.current_layer.error_out[0]
            for i in range(1, len(self.current_layer.error_out)):
                error_out = error_out.add(self.current_layer.error_out[i])
            self.current_layer.error_out = []  # initialize for following gradient computation
            # Calculate softmax derivative (Do) and then calculate gradient δo = Eo • Do  (or Do * Eo)
            if self.current_layer.activation_function == "softmax":
                self.current_layer.gradient = error_out * softmax_derivative(self.current_layer.activation)
            elif self.current_layer.activation_function == "tanh":
                self.current_layer.gradient = error_out * tanh_derivative(self.current_layer.activation)

    def _compute_current_delta_weight_matrix(self):
        # Compute delta weight matrix Δo = transposed(Io) * δο
        self.current_layer.delta = torch.matmul(torch.t(self.convert_to_2d(self.current_layer.in_activation,
                                                                           transpose=True)),
                                                self.convert_to_2d(self.current_layer.gradient))
        # Do bounded descent according to Chang's script (otherwise it can get stuck in local minima)
        len_delta = torch.sqrt(self.current_layer.delta.pow(2).sum())  # sqrt(np .sum(self.current_layer.delta ** 2))
        #print(len_delta)
        if len_delta > 1:
            self.current_layer.delta = true_divide(self.current_layer.delta, len_delta)

        self.current_layer.delta *= self.learn_rate
        if self.debug_messages:
            print("%s delta (with learn rate): %s" % (self.current_layer.name, self.current_layer.delta))

    def _update_total_error_for_backpropagation(self):
        # Update (back propagate) gradient out (δO) to incoming layers. Compute this * before * updating the weights
        self.current_layer.total_error = torch.matmul(self.current_layer.gradient,
                                                      torch.t(self.current_layer.in_weights))

    def _update_current_weights_and_previous_delta(self):
        """
        Update weights (steepest descent), even if they are given (i.e. between role and concept), by adding
        deltas*learning rate to the previous weight. Alternatively, we can check whether the layer has fixed weights
        (if not self.current_layer.has_fixed_weights) and update only the bias (last layer unit)
        """
        self.current_layer.in_weights += self.current_layer.delta
        # momentum descent: model continues in same direction as previous weight change
        if len(self.current_layer.previous_delta.size()) > 1:
            added_weight = self.momentum * self.current_layer.previous_delta
            self.current_layer.in_weights += added_weight
        # Update previous delta. Deepcopying is important otherwise it keeps reference
        self.current_layer.previous_delta = deepcopy(self.current_layer.delta)

    def _backpropagate_error_to_incoming_layers(self):
        # we only need to backpropagate error to layers that have incoming layers (so not recurrent or bias)
        layer_start = 0
        for prev_layer in self.current_layer.in_layers:
            if prev_layer.in_layers:
                error = self.current_layer.total_error[layer_start:layer_start + prev_layer.size]
                prev_layer.error_out.append(error)
            layer_start += prev_layer.size

    def _create_dir_if_not_exists(self, results_dir):
        if not os.path.isdir('%s/weights' % results_dir):
            # due to multiprocessing and race condition, there are rare cases where os.mkdir throws a "file exists"
            # exception even though we have checked.
            os.makedirs('%s/weights' % results_dir, exist_ok=True)

    def get_layer(self, layer_name):
        return self.layers[self.layer_idx[layer_name]]

    def get_feedforward_layers(self):
        """
        Returns only the layers that have incoming activations (and can therefore backpropagate the error)
        Skip input, role-copy, target-lang & eventsem as their activation is given: no incom. layers
        """
        return [layer for layer in self.layers if layer.in_layers]

    def get_backpropagation_layers(self):
        return [layer for layer in reversed(self.layers) if layer.in_layers]

    def get_max_output_activation(self):
        return int(self.get_layer_activation("output").argmax())

    def get_layer_activation(self, layer_name):
        return self.layers[self.layer_idx[layer_name]].activation

    @staticmethod
    def input_sd(number_of_inputs):
        """
        As pointed out by Chang: Haykin (1997, p.184) argues that you should initialize to sd = 1/number_of_inputs
        """
        return 1.0 / number_of_inputs


class NeuronLayer:
    def __init__(self, name, size, has_bias, activation_function, convert_input,
                 context_init_value, is_recurrent=False):
        """
        :param name: name of the layer (input, hidden etc)
        :param size: layer size
        :param has_bias: whether the layer has bias or not
        :param activation_function: activation function (tanh or softmax). default: tanh (sigmoid function)
        :param is_recurrent: Whether it is a recurrent layer (namely, the hidden layer)
        """
        self.name = name
        self.has_bias = has_bias
        self.convert_input = convert_input
        self.size = size
        self.sd = 0  # it is used to initialize weights
        self.activation = torch.empty(size,
                                      dtype=torch.float64)  # resetting to zeros doesn't seem to bring better results. Maybe empty?
        self.target_activation = torch.zeros(size, dtype=torch.float64)
        self.error_out = []
        self.total_error = []
        self.activation_function = activation_function
        self.in_weights = torch.tensor([])  # weights from incoming layers
        self.in_size = 0
        self.in_layers = []
        self.in_activation = torch.tensor([])
        self.previous_delta = torch.tensor([])
        self.gradient = None
        self.context_activation = None
        # the following two properties are only for the hidden (recurrent) layer
        self.is_recurrent = is_recurrent
        if is_recurrent:
            self.make_recurrent(context_init_value)

    def make_recurrent(self, context_init_value):
        # if it's a recurrent layer we need to increase the in_size to include the layer itself
        self.in_size += self.size
        self.context_activation = torch.tensor([context_init_value] * self.size)


def convert_range(matrix, min_val=-1, max_val=1):
    """ Converts range between min and max values. NOTE: This seems to be creating some issues during training. """
    print('CONVERT')
    if matrix.sum() == 0:
        return matrix + min_val
    else:
        return ((max_val - min_val) * (matrix - matrix.min()) / (matrix.max() - matrix.min())) + min_val


def tanh_derivative(x, input_activation=False):
    """
    If x is the total input to the unit (input_activation set to True) then
    the derivative is 1-tanh(x)**2
    """
    if input_activation:
        return 1.0 - tanh_activation(x).pow(2)
    else:
        return 1.0 - x.pow(2)


def softmax_derivative(x):
    # if i=j this derivative is the same as the derivative of the logistic function. Otherwise: -XiXj
    return x * (1.0 - x)

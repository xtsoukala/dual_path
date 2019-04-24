# -*- coding: utf-8 -*-
import sys
import os
from copy import deepcopy
from modules.plotter import Plotter, np
from collections import defaultdict


class SimpleRecurrentNetwork:
    def __init__(self, learn_rate, momentum, rdir, context_init_value=0.5, debug_messages=True, include_role_copy=False,
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
        # Before producing the first word of each sentence, there is no input from the following layers so init to 0
        self.initially_deactive_layers = ['compress', 'concept', 'identifiability', 'role']
        self.current_layer = None
        self.dir = rdir
        self.mse = defaultdict(list)
        self.divergence_error = defaultdict(list)
        self.python_version = sys.version

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

    def load_weights(self, results_dir, set_weights_folder, plot_stats, set_weights_epoch, simulation_num=None):
        if not set_weights_folder:
            self._create_dir_if_not_exists(results_dir)
            np.random.seed(simulation_num if not None else 18)  # set number of simulation as the seed

        stats = defaultdict(list)
        for layer in self.layers:
            if not layer.in_size:
                continue
            # weights folder should contain the same num of simulations (or more)
            if set_weights_folder:
                w_dir = os.path.join(set_weights_folder, "weights")
                weights_fname = "weights_%s_%s.npz" % (layer.name, set_weights_epoch)
                layer.in_weights = np.load(os.path.join(w_dir, weights_fname))['arr_0']
            else:
                layer.sd = 0.05  # or calculate according to input size: self.input_sd(layer.in_size)
                # Using random weights with μ = 0 and low variance is CRUCIAL.
                # np.random.standard_normal has variance of 1 (too high) and np.random.uniform doesn't always have μ = 0
                layer.in_weights = np.random.normal(0, layer.sd, size=[layer.in_size + int(layer.has_bias), layer.size])
                stats['means'].append(np.mean(layer.in_weights))
                stats['std'].append(np.std(layer.in_weights))
                stats['labels'].append(layer.name)
                np.savez_compressed("%s/weights/weights_%s_0.npz" % (results_dir, layer.name), layer.in_weights)
                if self.debug_messages:
                    with open('%s/weights/weight_stats.out' % results_dir, 'a') as f:
                        f.write("name, max, min, mean, std\n"
                                "%s,%g,%g,%g,%g\n" % (layer.name, np.max(layer.in_weights), np.min(layer.in_weights),
                                                      stats['means'][-1], stats['std'][-1]))
                if plot_stats:
                    plt = Plotter(results_dir=results_dir)
                    plt.plot_layer_stats(stats)

        self.reset_context_delta_and_crole()
        self._complete_initialization()

    def save_weights(self, results_dir, epoch):
        for layer in self.backpropagated_layers:
            np.savez_compressed("%s/weights/weights_%s_%s.npz" % (results_dir, layer.name, epoch), layer.in_weights)

    def set_message_reset_context(self, updated_role_concept, info, activate_language):
        weights_concept_role = updated_role_concept.T
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
            event_sem.activation = info.event_sem_activations
        if activate_language:
            self.update_layer_activation("target_lang", activation=info.target_lang_act)
        self.reset_context_delta_and_crole()

    def boost_non_target_lang(self, target_lang_idx):
        target_lang = self.get_layer("target_lang")
        target_lang.activation[target_lang_idx] -= 0.1
        if target_lang_idx == 0:
            target_lang.activation[1] += 0.1
        else:
            target_lang.activation[0] += 0.1

    def reset_context_delta_and_crole(self):
        recurrent_layer = self.get_layer("hidden")
        recurrent_layer.context_activation = np.array([self.context_init_value] * recurrent_layer.size)
        for layer in self.backpropagated_layers:  # Also reset the previous delta values
            layer.previous_delta = np.empty([])

        if self.include_role_copy:  # if we're using role_copy, reset that as well (to 0, NOT empty)
            self.update_layer_activation("role_copy", activation=None)
        if self.include_input_copy:
            self.update_layer_activation("input_copy", activation=None)

    def set_inputs(self, input_idx, target_idx=None):
        input_layer = self.get_layer("input")
        input_layer.activation = np.zeros(input_layer.size)
        if input_idx:  # at the beginning of sentence, input_idx is None
            input_layer.activation[input_idx] = 1
        if input_layer.convert_input:  # convert the range of the input between -0.9 and 0.9 instead of 0-1
            input_layer.activation = convert_range(input_layer.activation)

        if target_idx is not None:  # no need to set target when testing
            output_layer = self.get_layer("output")
            output_layer.target_activation = np.zeros(output_layer.size)
            output_layer.target_activation[target_idx] = 1

    def update_layer_activation(self, layer_name, activation):
        layer = self.get_layer(layer_name)
        if activation is None:  # set to zero
            layer.activation = np.zeros(layer.size)
        else:
            layer.activation = activation

    def feedforward(self, start_of_sentence=False):
        if not self.initialization_completed:
            sys.exit('The network was not been initialized correctly. Make sure you have added layers (add_layer), '
                     'connected them (connect_layers) and (re)set the weights')
        for layer in self.feedforward_layers:
            layer.in_activation = np.array([])  # minpy
            for incoming_layer in layer.in_layers:
                # combines the activation of all previous layers (e.g. role and compress and... to hidden)
                layer.in_activation = np.concatenate((layer.in_activation, incoming_layer.activation), axis=0)
            if layer.is_recurrent:  # hidden layer only (include context activation)
                layer.in_activation = np.concatenate((layer.in_activation, layer.context_activation), axis=0)
            if layer.has_bias:  # add bias
                layer.in_activation = np.append(layer.in_activation, 1)

            if start_of_sentence and layer.name in self.initially_deactive_layers:
                layer.activation = np.zeros(layer.size)  # set role_copy to zero
                continue
            # Apply activation function to input • weights
            if layer.activation_function == "softmax":
                layer.activation = softmax(np.dot(layer.in_activation, layer.in_weights))
            elif layer.activation_function == "tanh":
                layer.activation = tanh_activation(np.dot(layer.in_activation, layer.in_weights))
            if self.debug_messages:
                print("Layer: %s. Activation %s" % (layer.name, layer.activation))
        # Copy output of the hidden to "context" (activation of t-1)
        hidden_layer = self.get_layer("hidden")
        hidden_layer.context_activation = deepcopy(hidden_layer.activation)  # deepcopy otherwise it keeps reference
        if self.include_input_copy:
            input_layer = self.get_layer("input")
            self.update_layer_activation("input_copy", activation=deepcopy(input_layer.activation))
        if self.include_role_copy:
            role_layer = self.get_layer("role")
            self.update_layer_activation("role_copy", activation=deepcopy(role_layer.activation))

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

        if output_layer.activation_function == "softmax":
            output_layer.gradient = (output_layer.target_activation - output_layer.activation)  # no derivative here
        elif output_layer.activation_function == "tanh":
            output_layer.gradient = ((convert_range(output_layer.target_activation) - output_layer.activation) *
                                     tanh_derivative(output_layer.activation))

    def _calculate_mean_square_and_divergence_error(self, epoch, target_activation, output_activation):
        # perform element-wise average along the array (returns single value)
        self.mse[epoch].append(((target_activation - output_activation) ** 2).mean(axis=None))  # same as axis=0
        """ Error on the word units was measured in terms of divergence—? ti log(ti/oi)—where oi is the activation for
                            the i output unit on the current word and ti is its target activation
                        divergence_err = np.sum(target_activation)
        with np.errstate(divide='ignore', invalid='ignore'):
            self.divergence_error[epoch].append(target_activation * np.log(np.true_divide(target_activation,
            output_activation)))"""

    def _compute_current_layer_gradient(self):
        if self.current_layer.error_out:  # all layers but "output" (which has error and gradient precomputed)
            # for some layers (hidden and pred_role) there are 2 errors to be backpropagated; sum them
            error_out = np.sum(self.current_layer.error_out, axis=0)
            self.current_layer.error_out = []  # initialize for following gradient computation
            # Calculate softmax derivative (Do) and then calculate gradient δo = Eo • Do  (or Do * Eo)
            if self.current_layer.activation_function == "softmax":
                self.current_layer.gradient = error_out * softmax_derivative(self.current_layer.activation)
            elif self.current_layer.activation_function == "tanh":
                self.current_layer.gradient = error_out * tanh_derivative(self.current_layer.activation)

    def _compute_current_delta_weight_matrix(self):
        # Compute delta weight matrix Δo = transposed(Io) * δο
        self.current_layer.delta = np.dot(np.atleast_2d(self.current_layer.in_activation).T,
                                          np.atleast_2d(self.current_layer.gradient))
        # Do bounded descent according to Chang's script (otherwise it can get stuck in local minima)
        len_delta = np.sqrt(np.sum(self.current_layer.delta ** 2))
        if len_delta > 1:
            self.current_layer.delta = np.true_divide(self.current_layer.delta, len_delta)
        self.current_layer.delta *= self.learn_rate
        if self.debug_messages:
            print("%s delta (with learn rate): %s" % (self.current_layer.name, self.current_layer.delta))

    def _update_total_error_for_backpropagation(self):
        # Update (back propagate) gradient out (δO) to incoming layers. Compute this * before * updating the weights
        self.current_layer.total_error = np.dot(self.current_layer.gradient, self.current_layer.in_weights.T)

    def _update_current_weights_and_previous_delta(self):
        """
        Update weights (steepest descent), even if they are given (i.e. between role and concept), by adding
        deltas*learning rate to the previous weight. Alternatively, we can check whether the layer has fixed weights
        (if not self.current_layer.has_fixed_weights) and update only the bias (last layer unit)
        """
        self.current_layer.in_weights += self.current_layer.delta
        # momentum descent: model continues in same direction as previous weight change
        if self.current_layer.previous_delta.size > 1:
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
            if self.python_version.startswith('3'):
                os.makedirs('%s/weights' % results_dir, exist_ok=True)
            else:
                try:
                    os.mkdir('%s/weights' % results_dir)
                except IOError:
                    print('%s/weights already exists' % results_dir)

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
        return np.true_divide(1.0, number_of_inputs)


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
        self.activation = np.zeros(size)  # resetting to zeros doesn't seem to bring better results. Maybe empty?
        self.target_activation = np.zeros(size)
        self.error_out = []
        self.total_error = []
        self.activation_function = activation_function
        self.in_weights = np.array([])  # weights from incoming layers
        self.in_size = 0
        self.in_layers = []
        self.in_activation = []
        self.previous_delta = np.empty([])
        self.gradient = None
        self.context_activation = None
        # the following two properties are only for the hidden (recurrent) layer
        self.is_recurrent = is_recurrent
        if is_recurrent:
            self.make_recurrent(context_init_value)

    def make_recurrent(self, context_init_value):
        # if it's a recurrent layer we need to increase the in_size to include the layer itself
        self.in_size += self.size
        self.context_activation = np.array([context_init_value] * self.size)


def convert_range(matrix, min_val=-1, max_val=1):
    """ Converts range between min and max values. NOTE: This seems to be creating some issues during training. """
    if np.sum(matrix) == 0:
        return matrix + min_val
    else:
        return np.true_divide((max_val - min_val) * (matrix - matrix.min()), (matrix.max() - matrix.min())) + min_val


def tanh_activation(x):
    return np.tanh(x)


def tanh_derivative(x, input_activation=False):
    """
    If x is the total input to the unit (input_activation set to True) then
    the derivative is 1-tanh(x)**2
    """
    if input_activation:
        return 1.0 - np.tanh(x) ** 2
    else:
        return 1.0 - x ** 2


def softmax(x):
    """ Compute softmax values for each sets of scores in x. Normalize input otherwise the exponential of a high number
    will be NaN. Following Chang's advice, normalize by rounding, e.g. to 4 """
    normalized_x = x - x.min()
    return np.round(np.true_divide(np.exp(normalized_x), np.sum(np.exp(normalized_x), axis=0)), 4)


def softmax_derivative(x):
    # if i=j this derivative is the same as the derivative of the logistic function. Otherwise: -XiXj
    return x * (1.0 - x)

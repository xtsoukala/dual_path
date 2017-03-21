# -*- coding: utf-8 -*-
import sys
import os
import numpy as np
from copy import deepcopy
from plotter import Plotter

np.random.seed(18)


class SimpleRecurrentNetwork:
    def __init__(self, learn_rate, momentum, dir, context_init=0.5, debug_messages=True, include_role_copy=False):
        self.layers = []
        self.context_init = context_init  # Initial activations of context layer
        self.learn_rate = learn_rate  # learning rate (speed of learning)
        self.momentum = momentum
        self.initialization_completed = False  # needs to be set to True for the model to start training
        self.debug_messages = debug_messages
        self.include_role_copy = include_role_copy
        # Before producing the first word of each sentence, there is no input from the following layers so init to 0
        self.initially_deactive_layers = ['compress', 'concept', 'identif', 'role']
        self.current_layer = None
        self.dir = dir
        self.output_size = 0
        self.target_activation = []

        self.mse = {}
        self.divergence_error = {}

    def _complete_initialization(self):
        for layer in self.layers:  # if there are > 1 layers and if at least one has input weights
            if all(layer.in_weights):
                self.initialization_completed = True
                break

    def add_layer(self, name, size, has_bias=False, activation_function="tanh",
                  convert_input=False, is_recurrent=False):
        self.layers.append(NeuronLayer(name=name, size=size, has_bias=has_bias, convert_input=convert_input,
                                       is_recurrent=is_recurrent, activation_function=activation_function,
                                       context_init=self.context_init))
        if name == "output":
            self.output_size = size

    def connect_layers(self, first_layer_name, second_layer_name):
        first = self.get_layer(first_layer_name)
        second = self.get_layer(second_layer_name)
        second.in_size += first.size
        second.in_layers.append(first)

    def reset_weights(self, results_dir, set_weights_folder=None, set_weights_epoch=0, plot_stats=False,
                      simulation_num=None):
        if not os.path.isdir('%s/weights' % results_dir):
            os.mkdir('%s/weights' % results_dir)
        means = []
        std = []
        labels = []
        for layer in self.layers:
            if not layer.in_size:
                continue

            if set_weights_folder:  # weights folder should contain the same num of simulations (or more)
                w_dir = os.path.join(set_weights_folder, str(simulation_num) if simulation_num is not None else "",
                                     "weights")
                weights_fname = "weights_%s%s.in" % (layer.name,
                                                     "_%s" % set_weights_epoch if set_weights_epoch is not None else "")
                layer.in_weights = np.genfromtxt(os.path.join(w_dir, weights_fname))
            else:
                layer.sd = input_sd(layer.in_size)
                # Using random weights with mean = 0 and low variance is CRUCIAL.
                # np.random.standard_normal has variance of 1, which is high,
                # and np.random.uniform doesn't always have mean = 0.
                mean = 0
                # layer.in_weights = 2*np.random.random((layer.in_size + int(layer.has_bias), layer.size)) - 1
                layer.in_weights = np.random.normal(mean, layer.sd,
                                                    size=[layer.in_size + int(layer.has_bias), layer.size])
                means.append(layer.in_weights.mean())
                std.append(layer.in_weights.std())
                labels.append(layer.name)
                np.savetxt("%s/weights/weights_%s.in" % (results_dir, layer.name), layer.in_weights)
                with open('%s/weights/weight_stats.out' % results_dir, 'a') as f:
                    f.write("name, max, min, mean, std\n"
                            "%s,%g,%g,%g,%g\n" % (layer.name, layer.in_weights.max(), layer.in_weights.min(),
                                                  layer.in_weights.mean(), layer.in_weights.std()))
        self.reset_context_delta_and_crole()
        self._complete_initialization()

        if plot_stats:
            plt = Plotter(results_dir=results_dir)
            plt.plot_layer_stats(labels=labels, std=std, means=means)

    def save_weights(self, results_dir, epochs=0):
        for layer in self.get_layers_for_backpropagation():
            np.savetxt("%s/weights/weights_%s_%s.in" % (results_dir, layer.name, epochs), layer.in_weights)

    def set_message_reset_context(self, updated_role_concept, event_sem_activations, target_lang_act=None, reset=True):
        weights_concept_role = updated_role_concept.T
        role_layer = self.get_layer("role")
        for x in range(role_layer.in_size):  # update this way so as to keep the bias weights intact
            role_layer.in_weights[x] = weights_concept_role[x]

        # pred_concept is split into pred_identifiability and pred_concept (they can have different fixed weights)
        pred_identif = self.get_layer("pred_identifiability")
        pred_concept = self.get_layer("pred_concept")
        for x in range(pred_concept.in_size):  # pred_identif.in_size == pred_concept.in_size
            for s in range(pred_identif.size):
                pred_identif.in_weights[x][s] = updated_role_concept[x][s]
            for s in range(pred_concept.size):
                pred_concept.in_weights[x][s] = updated_role_concept[x][pred_identif.size + s]

        event_sem = self.get_layer("eventsem")
        if event_sem.convert_input:
            event_sem.activation = convert_range(event_sem_activations)
        else:
            event_sem.activation = event_sem_activations

        if target_lang_act is not None:
            target_lang = self.get_layer("target_lang")
            target_lang.activation = target_lang_act

        if reset:
            self.reset_context_delta_and_crole()

    def reset_context_delta_and_crole(self):
        recurrent_layer = self.get_layer("hidden")
        recurrent_layer.context_activation = np.array([self.context_init] * recurrent_layer.size)
        for layer in self.get_layers_for_backpropagation():  # Also reset the previous delta values
            layer.previous_delta = np.empty([])

        if self.include_role_copy:  # if we're using role_copy, reset that as well (to 0, NOT empty)
            crole = self.get_layer("role_copy")
            crole.activation = np.zeros(crole.size)

    def set_inputs(self, input_idx, target_idx=None):
        input_layer = self.get_layer("input")
        input_layer.activation = np.zeros(input_layer.size)
        if input_idx:  # at the beginning of sentence, input_idx is None
            input_layer.activation[input_idx] = 1
        if input_layer.convert_input:  # convert the range of the input between -0.9 and 0.9 instead of 0-1
            input_layer.activation = convert_range(input_layer.activation)

        if target_idx:  # no need to set target when testing
            self.target_activation = np.zeros(self.output_size)
            self.target_activation[target_idx] = 1

    def set_input_activations(self, inputs, targets):
        input_layer = self.get_layer("input")
        input_layer.activation = inputs
        self.target_activation = targets

    def feed_forward(self, start_of_sentence=False):
        if not self.initialization_completed:
            sys.exit('The network was not been initialized correctly. Make sure you have added layers (add_layer), '
                     'connected them (connect_layers) and reset the weights (reset_weights)')

        for layer in self.layers:
            if not layer.in_layers:
                continue  # skip input, role-copy, target-lang & eventsem as their activation is given: no incom. layers

            layer.in_activation = []
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
            elif layer.activation_function == "sigmoid":
                layer.activation = sigmoid(np.dot(layer.in_activation, layer.in_weights))
            if self.debug_messages:
                print "Layer: %s. Activation %s" % (layer.name, layer.activation)
        # Copy output of the hidden to "context" (activation of t-1)
        hidden_layer = self.get_layer("hidden")
        hidden_layer.context_activation = deepcopy(hidden_layer.activation)  # deepcopy otherwise it keeps reference
        if self.include_role_copy:
            role_layer = self.get_layer("role")
            role_copy_layer = self.get_layer("role_copy")
            role_copy_layer.activation = deepcopy(role_layer.activation)

    def backpropagate(self, epoch):
        self._compute_output_error(epoch)
        # Propagate error back to the previous layers
        for self.current_layer in self.get_layers_for_backpropagation():
            self._compute_current_layer_gradient()
            self._compute_current_delta_weight_matrix()
            self._update_total_error_for_backpropagation()
            self._update_current_weights_and_previous_delta()
            self._backpropagate_error_to_incoming_layers()

    def _compute_output_error(self, epoch):
        # Calculate error[Eo](target - output)
        output_layer = self.get_layer("output")

        self._calculate_mean_square_and_divergence_error(epoch, output_layer.activation)

        if output_layer.activation_function == "softmax":
            output_layer.gradient = self.target_activation - output_layer.activation
        elif output_layer.activation_function == "tanh":
            output_layer.gradient = ((convert_range(self.target_activation) - output_layer.activation) *
                                     tanh_derivative(output_layer.activation))
        elif output_layer.activation_function == "sigmoid":
            output_layer.gradient = ((self.target_activation - output_layer.activation) *
                                     sigmoid_derivative(output_layer.activation))

    def _calculate_mean_square_and_divergence_error(self, epoch, output_activation):
        if epoch not in self.mse:
            self.mse[epoch] = []
        # perform element-wise average along the array (returns single value)
        self.mse[epoch].append(((self.target_activation - output_activation) ** 2).mean(axis=None))

        """ Error on the word units was measured in terms of divergence—? ti log(ti/oi)—where oi is the activation for
                            the i output unit on the current word and ti is its target activation
                        divergence_err = np.sum(self.target_activation)
       if epoch not in self.divergence_error:
            self.divergence_error[epoch] = []
        self.divergence_error[epoch].append(self.target_activation * np.log(np.true_divide(target_activation,
                                                                                               output_activation)))"""

    def _compute_current_layer_gradient(self):
        if self.current_layer.error_out:  # all layers but "output" (which has error and gradient precomputed)
            # for some layers (hidden and pred_role) there are 2 errors to be backpropagated; sum them
            error_out = sum(self.current_layer.error_out)
            self.current_layer.error_out = []  # initialize for following gradient computation
            # Calculate softmax derivative (Do) and then calculate gradient δo = Eo • Do  (or Do * Eo)
            if self.current_layer.activation_function == "softmax":
                self.current_layer.gradient = error_out * softmax_derivative(self.current_layer.activation)
            elif self.current_layer.activation_function == "tanh":
                self.current_layer.gradient = error_out * tanh_derivative(self.current_layer.activation)
            elif self.current_layer.activation_function == "sigmoid":
                self.current_layer.gradient = error_out * sigmoid_derivative(self.current_layer.activation)

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
            print "%s delta (with learn rate): %s" % (self.current_layer.name, self.current_layer.delta)

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

    def get_layer(self, layer_name):
        layer = [x for x in self.layers if x.name is layer_name]
        return layer[0] if layer else layer

    def get_layers_for_backpropagation(self):
        """
        Returns only the layers that have incoming activations (and can therefore backpropagate the error)
        """
        return [layer for layer in reversed(self.layers) if layer.in_layers]

    def get_max_output_activation(self):
        output = self.get_layer("output")
        return output.activation.argmax()

    def get_layer_activation(self, layer_name):
        layer = self.get_layer(layer_name)
        return layer.activation

    def get_predconcept_activation(self):
        output = self.get_layer("pred_concept")
        return output.activation, output.in_activation


class NeuronLayer:
    def __init__(self, name, size, has_bias, activation_function, convert_input, context_init, is_recurrent=False):
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
        self.error_out = []
        self.total_error = []
        self.activation_function = activation_function
        self.in_weights = []  # weights from incoming layers
        self.in_size = 0
        self.in_layers = []
        self.in_activation = []
        self.previous_delta = np.empty([])
        self.gradient = None
        self.context_activation = None
        # the following two properties are only for the hidden (recurrent) layer
        self.is_recurrent = is_recurrent
        if is_recurrent:
            self.make_recurrent(context_init)

    def make_recurrent(self, context_init):
        # if it's a recurrent layer we need to increase the in_size to include the layer itself
        self.in_size += self.size
        self.context_activation = np.array([context_init] * self.size)


def input_sd(number_of_inputs):
    """
    As pointed out by Chang: Haykin (1997, p.184) argues that you should initialize to sd = 1/number_of_inputs
    """
    return np.true_divide(1.0, number_of_inputs)


def convert_range(matrix, min_val=-0.9, max_val=0.9):
    """ Converts range to fit between min and max values """
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


def softmax(x, average=True):
    """Compute softmax values for each sets of scores in x."""
    if average:
        # averaging using max seems to work better than the usual softmax
        xt = np.exp(x - x.max())
        return np.true_divide(xt, np.sum(xt, axis=0))
    # but this is the default. It sometimes gives "RuntimeWarning: invalid value encountered in divide" and returns nan
    return np.true_divide(np.exp(x), np.sum(np.exp(x), axis=0))


def softmax_derivative(x):
    # if i=j this derivative is the same as the derivative of the logistic function. Otherwise: -XiXj
    return x * (1.0 - x)


# The following activation functions are never used
def relu(x):
    return x * (x > 0)


def relu_derivative(x):
    return 1 * (x > 0)


def sigmoid(x):
    return np.true_divide(1.0, (1.0 + np.exp(-x)))


def sigmoid_derivative(x, input_activation=False):
    if input_activation:
        return sigmoid(x) * (1.0 - sigmoid(x))
    else:
        return x * (1.0 - x)

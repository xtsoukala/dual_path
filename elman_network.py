# -*- coding: utf-8 -*-
import sys
import os
import numpy as np
from copy import deepcopy
import matplotlib

matplotlib.use('Agg')  # needed for the server only
import matplotlib.pyplot as plt


class ElmanNetwork:
    def __init__(self, learn_rate, dir, context_init=0.5, debug_messages=True, include_role_copy=False):
        self.layers = []
        self.context_init = context_init  # Initial activations of context layer
        self.learn_rate = learn_rate  # learning rate (speed of learning)
        self.initialization_completed = False  # if it is not set to True the model does not start training
        self.debug_messages = debug_messages
        self.include_role_copy = include_role_copy
        # Before producing the first word of each sentence, there is no input from the following layers so init to 0
        self.initially_deactive_layers = ['compress', 'concept', 'identif', 'role']  # No need to include input and role_copy

        self.dir = dir
        self.output_size = 0
        self.target_activation = []

        self.mse = {}

    def _complete_initialization(self):
        for layer in self.layers:  # if there are > 1 layers and if at least one has input weights
            if all(layer.in_weights):
                self.initialization_completed = True
                break

    def add_layer(self, name, size, has_bias=True, momentum=0.9, has_bounded_descent=True, activation_function="tanh",
                  has_fixed_weights=False, convert_input=False, is_recurrent=False):
        self.layers.append(NeuronLayer(name=name, size=size, has_bias=has_bias, momentum=momentum,
                                       convert_input=convert_input,
                                       is_recurrent=is_recurrent, has_bounded_descent=has_bounded_descent,
                                       activation_function=activation_function, has_fixed_weights=has_fixed_weights))
        if name == "output":
            self.output_size = size

    def connect_layers(self, first_layer_name, second_layer_name):
        first = self._get_layer(first_layer_name)
        second = self._get_layer(second_layer_name)
        second.in_size += first.size
        second.in_layers.append(first)

    def reset_weights(self, set_weights_folder=None, set_weights_epoch=0, plot_stats=False, simulation_num=None):
        if not os.path.isdir('%s/weights' % self.dir):
            os.mkdir('%s/weights' % self.dir)
        means = []
        std = []
        labels = []
        for layer in self.layers:
            if not layer.in_size:
                continue

            if set_weights_folder:
                if layer.has_fixed_weights:
                    layer.in_weights = np.random.uniform(size=[layer.in_size + int(layer.has_bias), layer.size])
                else:  # if set weights, previous simulation should have the same num (or more) of simulations
                    w_dir = os.path.join(set_weights_folder, str(simulation_num) if simulation_num is not None else "",
                                         "weights")
                    if not os.path.isdir(w_dir):
                        w_dir = os.path.join(set_weights_folder, "%s_discarded" % simulation_num, "weights")

                    weights_fname = "weights_%s%s.in" % (layer.name, "_%s" % set_weights_epoch if set_weights_epoch
                                                                                                  is not None else "")
                    layer.in_weights = np.genfromtxt(os.path.join(w_dir, weights_fname))
            else:
                # if it's a recurrent layer we need to increase the in_size (include the recurrency)
                if layer.is_recurrent:
                    layer.in_size += layer.size
                layer.sd = input_sd(layer.size)  # SIZE
                # Using random weights with mean = 0 and low variance is CRUCIAL.
                # np.random.standard_normal has variance of 1, which is high,
                # and np.random.uniform doesn't always have mean = 0.
                mean = 0
                #layer.in_weights = 2*np.random.random((layer.in_size + int(layer.has_bias), layer.size)) - 1
                layer.in_weights = np.random.normal(mean, layer.sd,
                                                    size=[layer.in_size + int(layer.has_bias), layer.size])
                means.append(layer.in_weights.mean())
                std.append(layer.in_weights.std())
                labels.append(layer.name)
                np.savetxt("%s/weights/weights_%s.in" % (self.dir, layer.name), layer.in_weights)
                with open('%s/weights/weight_stats.out' % self.dir, 'a') as f:
                    f.write("name, max, min, mean, std\n"
                            "%s,%g,%g,%g,%g\n" % (layer.name, layer.in_weights.max(), layer.in_weights.min(),
                                                  layer.in_weights.mean(), layer.in_weights.std()))
        self.reset_context_and_delta()
        self._complete_initialization()

        if plot_stats:
            ind = np.arange(len(labels))  # the x locations for the groups
            fig, ax = plt.subplots()
            ax.bar(ind, means, color='r', yerr=std)
            ax.set_xticklabels(labels)
            plt.savefig('%s/weights/summary_weights.pdf' % self.dir)
            plt.close()

    def save_weights(self, epochs=0):
        for layer in self.layers:
            if not layer.has_fixed_weights and np.all(layer.in_weights):
                np.savetxt("%s/weights/weights_%s_%s.in" % (self.dir, layer.name, epochs), layer.in_weights)

    def set_message_reset_context(self, updated_role_concept, event_sem_activations, target_lang_act=None,
                                  topic_emphasis=None, reset=True):
        #updated_role_concept = convert_range(updated_role_concept)
        weights_concept_role = updated_role_concept.T
        role_layer = self._get_layer("role")
        for x in range(role_layer.in_size):  # update this way so as to keep the bias weights intact
            role_layer.in_weights[x] = weights_concept_role[x]

        # pred_concept is split into pred_identifiability and pred_concept. The fixed weights are essentially the same
        pred_identif = self._get_layer("pred_identifiability")
        for x in range(pred_identif.in_size):
            for s in range(pred_identif.size):
                pred_identif.in_weights[x][s] = updated_role_concept[x][s]
        pred_concept = self._get_layer("pred_concept")
        for x in range(pred_concept.in_size):
            for s in range(pred_concept.size):
                pred_concept.in_weights[x][s] = updated_role_concept[x][pred_identif.size + s]

        event_sem = self._get_layer("eventsem")
        if event_sem.convert_input:
            event_sem.activation = convert_range(event_sem_activations)
        else:
            event_sem.activation = event_sem_activations

        if target_lang_act is not None:
            target_lang = self._get_layer("target_lang")
            target_lang.activation = target_lang_act

        if topic_emphasis is not None:
            topic_emph = self._get_layer("topic_emphasis")
            topic_emph.activation = topic_emphasis

        if reset:
            self.reset_context_and_delta()

    def reset_context_and_delta(self):
        recurrent_layer = self._get_layer("hidden")
        recurrent_layer.context_activation = np.array([self.context_init] * recurrent_layer.size)

        for layer in self._get_layers_for_backpropagation():  # Also reset the previous delta values
            layer.previous_delta = np.empty([])

        if self.include_role_copy:  # if we're using role_copy, reset that as well (to 0, NOT empty)
            crole = self._get_layer("role_copy")
            crole.activation = np.zeros(crole.size)

    def set_inputs(self, input_idx, target_idx=None):
        input_layer = self._get_layer("input")
        input_layer.activation = np.zeros(input_layer.size)
        if input_idx:  # at the beginning of sentence, input_idx is None
            input_layer.activation[input_idx] = 1
        if input_layer.convert_input:  # convert the range of the input between -0.9 and 0.9 instead of 0-1
            input_layer.activation = convert_range(input_layer.activation)

        if target_idx:  # no need to set target when testing
            self.target_activation = np.zeros(self.output_size)
            self.target_activation[target_idx] = 1

    def set_input_activations(self, inputs, targets):
        input_layer = self._get_layer("input")
        input_layer.activation = inputs
        self.target_activation = targets

    def feed_forward(self, start_of_sentence=False):
        if not self.initialization_completed:
            sys.exit('The network was not been initialized correctly. Make sure you have added layers (add_layer), '
                     'connected them (connect_layers) and reset the weights (reset_weights)')

        for layer in self.layers:
            if not layer.in_layers:
                continue  # for instance skip input & eventsem as their activation is given, no incoming layers

            layer.in_activation = []
            for incoming_layer in layer.in_layers:
                # combines the activation of all previous layers (e.g. role and compress and... to hidden)
                layer.in_activation = np.concatenate((layer.in_activation, incoming_layer.activation), axis=0)
            if layer.is_recurrent:  # hidden layer only (context activation)
                layer.in_activation = np.concatenate((layer.in_activation, layer.context_activation), axis=0)
            if layer.has_bias:  # add bias
                layer.in_activation = np.append(layer.in_activation, 1)

            if start_of_sentence and layer.name in self.initially_deactive_layers:
                layer.activation = np.zeros(layer.size)  # set role_copy to zero
                continue
            # Apply activation function to input • weights
            if layer.activation_function == "softmax":
                layer.activation = softmax(np.dot(layer.in_activation, layer.in_weights))
            else:  # elif layer.activation_function == "tanh":
                layer.activation = tanh_activation(np.dot(layer.in_activation, layer.in_weights))
            '''elif layer.activation_function == "relu":
                layer.activation = relu(np.dot(layer.in_activation, layer.in_weights))
            elif layer.activation_function == "sigmoid":
                layer.activation = sigmoid(np.dot(layer.in_activation, layer.in_weights))'''
            if self.debug_messages:
                print "Layer: %s. Activation %s" % (layer.name, layer.activation)
        # Copy output of the hidden to "context" (activation of t-1)
        hidden_layer = self._get_layer("hidden")
        hidden_layer.context_activation = deepcopy(hidden_layer.activation)  # deepcopy otherwise it keeps reference
        if self.include_role_copy:
            role_layer = self._get_layer("role")
            role_copy_layer = self._get_layer("role_copy")
            role_copy_layer.activation = deepcopy(role_layer.activation)

    def backpropagate(self, epoch):
        # STEP 1: Calculate error [Eo] (target - output)
        output_layer = self._get_layer("output")

        """ Error on the word units was measured in terms of divergence—? ti log(ti/oi)—where oi is the activation for
            the i output unit on the current word and ti is its target activation
        divergence_err = np.sum(self.target_activation) """
        if epoch not in self.mse:  # Mean Square Error
            self.mse[epoch] = []
        self.mse[epoch].append(((self.target_activation - output_layer.activation) ** 2).mean(axis=None))
        """  ax=0: average performed along the row, for each column. ax=1: along the column for each row (returns array)
             ax=None: average is performed element-wise along the array (returns single value)
        """

        if output_layer.activation_function == "softmax":
            output_layer.gradient = self.target_activation - output_layer.activation
        else:  # elif output_layer.activation_function == "tanh":
            output_layer.gradient = (convert_range(self.target_activation) - output_layer.activation) * \
                                    tanh_derivative(output_layer.activation)
        '''elif output_layer.activation_function == "relu":
            output_layer.gradient = (convert_range(target.activation) - output_layer.activation) * \
                                    relu_derivative(output_layer.activation)
        elif output_layer.activation_function == "sigmoid":
            output_layer.gradient = (target.activation - output_layer.activation) * \
                                    sigmoid_derivative(output_layer.activation)'''

        # Propagate error back to the previous layers
        for layer in self._get_layers_for_backpropagation():
            if layer.error_out:  # output layer is the only one that has error and gradient precomputed
                error = sum(layer.error_out)  # for hidden and input there are 2 backprop. errors, sum it
                layer.error_out = []  # initialize for following gradient computation
                # Calculate softmax derivative (Do) and then calculate gradient δo = Eo • Do  (or Do * Eo)
                if layer.activation_function == "softmax":
                    layer.gradient = error * softmax_derivative(layer.activation)
                else:  # if layer.activation_function == "tanh":
                    layer.gradient = error * tanh_derivative(layer.activation)
                '''elif layer.activation_function == "relu":
                    layer.gradient = error * relu_derivative(layer.activation)
                elif layer.activation_function == "sigmoid":
                    layer.gradient = error * sigmoid_derivative(layer.activation)'''

            # Update (back propagate) gradient out (δO) to incoming layers. Compute this * before * updating the weights
            total_error = np.dot(layer.gradient, layer.in_weights.T)

            # Compute delta weight matrix Δo = transposed(Io) * δο
            layer.delta = np.dot(np.atleast_2d(layer.in_activation).T, np.atleast_2d(layer.gradient))
            if layer.has_bounded_descent:  # Do bounded descent according to Chang's script
                delta_sq = layer.delta ** 2
                sum_deltas = np.sum(delta_sq)
                len_delta = np.sqrt(sum_deltas)  # split sum deltas and len delta for less memory consumption
                if len_delta > 1:
                    layer.delta = np.true_divide(layer.delta, len_delta)

            layer.delta *= self.learn_rate
            if self.debug_messages:
                print "%s delta (with learn rate): %s" % (layer.name, layer.delta)

            # Update weights, unless they are given (i.e. between role and concept).
            if not layer.has_fixed_weights:  # Update weights is False if we backpropagate at the eos
                # Update weights (steepest descent) by adding deltas*learning rate to the previous weight
                layer.in_weights += layer.delta
                # momentum descent: model continues in same direction as previous weight change
                if layer.previous_delta.size > 1:
                    added_weight = layer.momentum * layer.previous_delta
                    layer.in_weights += added_weight
            elif layer.has_bias:  # layer HAS fixed weights but it also has bias. Update bias ONLY
                layer.in_weights[-1] += layer.delta[-1]
                if layer.previous_delta.size > 1:  # add momentum
                    added_weight = layer.momentum * layer.previous_delta[-1]
                    layer.in_weights[-1] += added_weight
            layer.previous_delta = deepcopy(layer.delta)  # deepcopying is important otherwise it keeps reference
            layer_start = 0
            for prev_layer in layer.in_layers:
                error = total_error[layer_start:layer_start + prev_layer.size]
                layer_start += prev_layer.size
                prev_layer.error_out.append(error)  # back propagate the error to the previous layers

    '''def set_layer_activation(self, layer_name, activation):
        layer = [x for x in self.layers if x.name is layer_name][0]
        layer.activation = activation'''

    def _get_layer(self, layer_name):
        layer = [x for x in self.layers if x.name is layer_name]
        return layer[0] if layer else layer

    def _get_layers_for_backpropagation(self):
        """
        Returns only the layers that have incoming activations (and should therefore backpropagate the error)
        """
        return [layer for layer in reversed(self.layers) if layer.in_layers]

    def get_max_output_activation(self):
        output = self._get_layer("output")
        return output.activation.argmax()

    def get_layer_activation(self, layer_name):
        layer = self._get_layer(layer_name)
        return layer.activation

    def get_predconcept_activation(self):
        output = self._get_layer("pred_concept")
        return output.activation, output.in_activation

    def plot_layers(self, fig, plot_weights=False):  # by default it plots activations unless plot_weights is True
        if fig is None:  # init fig
            fig = plt.figure(figsize=(14, 8.2))  # (width, height)
            cax = fig.add_axes([0.5, 0.8, 1.95, 0.85])  # [r l w h]
            # fig2 = plt.figure(figsize=(9, 8.2))  # (width, height)
            # cax = fig2.add_axes([1.5, 0.8, 1.95, 0.85])  # [r l w h]
            cax.get_xaxis().set_visible(False)
            cax.get_yaxis().set_visible(False)
            cax.patch.set_alpha(0)
            cax.set_frame_on(False)  # removes borders around plot
            for idx, layer in enumerate(self._get_layers_for_backpropagation()):
                ax = fig.add_subplot("24%s" % idx)
                ax.set_title(layer.name)
                if plot_weights:
                    plt.imshow(layer.in_weights)
                    plt.colorbar(orientation='vertical')
                else:
                    if layer.name == "output":
                        continue
                    if idx > 9:
                        ax = fig.add_subplot("34%s" % (idx if idx < 10 else int(idx / 2)))
                    else:
                        ax = fig.add_subplot("34%s" % (idx if idx < 10 else int(idx / 2)))
                    ax.set_title(layer.name)
                    ax.get_yaxis().set_visible(False)
                    # plt.step(-1, 1)
                    plt.imshow(np.atleast_2d(layer.activation))
                    if idx == 0:
                        plt.colorbar(orientation='vertical')  # show colorbar
            plt.show(block=False)  # doesn't work for all Python versions. If plot doesn't show, set block to True
        else:
            if plot_weights:
                # 8 layers, plot 4 + 4
                for idx, layer in enumerate(self._get_layers_for_backpropagation()):
                    ax = fig.add_subplot("24%s" % idx)
                    ax.set_title(layer.name)
                    plt.imshow(layer.in_weights)
            else:
                for idx, layer in enumerate(self.layers):
                    if idx > 9:
                        ax = fig.add_subplot("34%s" % (idx if idx < 10 else int(idx / 2)))
                    else:
                        ax = fig.add_subplot("34%s" % (idx if idx < 10 else int(idx / 2)))
                    ax.clear()  # otherwise it shows previous activations
                    ax.set_title(layer.name)
                    plt.imshow(np.atleast_2d(layer.activation))
        plt.draw()
        return fig


class NeuronLayer:
    def __init__(self, name, size, has_bias, has_bounded_descent, momentum, activation_function, has_fixed_weights,
                 convert_input, is_recurrent=False):
        """
        :param name: name of the layer (input, hidden etc)
        :param size: layer size
        :param has_bias: whether the layer has bias or not
        :param momentum: amount of previous weight changes that are taken into account
        :param has_bounded_descent: whether to use bounded descent algorithm or not
        :param activation_function: activation function (tanh or softmax). default: tanh (sigmoid function)
        :param is_recurrent: Whether it is a recurrent layer (namely, the hidden layer)
        """
        self.name = name
        self.has_bias = has_bias
        self.convert_input = convert_input
        self.bias_nodes = []
        self.size = size
        self.sd = 0  # it is used to initialize weights
        self.activation = np.zeros(size)  # resetting to zeros doesn't seem to bring better results. Maybe empty?
        self.error_out = []
        self.momentum = momentum
        self.has_bounded_descent = has_bounded_descent
        self.activation_function = activation_function
        self.in_weights = []  # weights from incoming layers
        self.in_size = 0
        self.in_layers = []
        self.in_activation = []
        self.gradient = None
        self.previous_delta = np.empty([])
        self.has_fixed_weights = has_fixed_weights
        # the following two properties are only for the hidden (recurrent) layer
        self.is_recurrent = is_recurrent
        self.context_activation = np.zeros(size)


def input_sd(number_of_inputs):
    """
    As pointed out by Chang: Haykin (1997, p.184) argues that you should initialize to sd = 1/number_of_inputs
    """
    return np.true_divide(1.0, number_of_inputs)


def convert_range(matrix, min_val=-0.9, max_val=0.9):
    """ Converts range to fit between min and max values """
    '''if len(matrix) == 1:
        return [min_val] if matrix == [0] else [max_val]'''
    if np.sum(matrix) == 0:
        return matrix + min_val
    else:
        return np.true_divide((max_val - min_val) * (matrix - matrix.min()), (matrix.max() - matrix.min())) + min_val
        #return (max_val - min_val) * (matrix - min(matrix)) / (max(matrix) - min(matrix)) + min_val


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

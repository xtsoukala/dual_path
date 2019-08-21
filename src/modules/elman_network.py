# -*- coding: utf-8 -*-
from scipy.stats import entropy
from . import os, sys, torch, zeros, cat, stack, empty, pickle, lz4, defaultdict

# remove
from functools import wraps
from time import time

#from memory_profiler import profile


def measure(func):
    @wraps(func)
    def _time_it(*args, **kwargs):
        start = time() / 100
        try:
            return func(*args, **kwargs)
        finally:
            print(func.__name__, ':', (time() / 100) - start)
    return _time_it


class SimpleRecurrentNetwork:
    def __init__(self, learn_rate, momentum, rdir, separate_hidden_layers=False,
                 debug_messages=True, include_role_copy=False, include_input_copy=False):
        self.layers = {}
        self.backpropagated_layers = []
        self.feedforward_layers = []
        self.learn_rate = learn_rate  # learning rate (speed of learning)
        self.momentum = momentum
        self.context_value = 0.5
        self.initialization_completed = False  # needs to be set to True for the model to start training
        self.debug_messages = debug_messages
        self.include_role_copy = include_role_copy
        self.include_input_copy = include_input_copy
        self.separate_hidden_layers = separate_hidden_layers
        # Before producing the first word of each sentence, there is no input from the following layers so init to 0
        self.lesion_syntax = False
        self.lesion_semantics = False
        self.syntactic_layers = ('compress', 'pred_compress')
        self.semantic_layers = ('pred_concept', 'role')  # 'pred_identifiability', 'eventsem', 'target_lang']
        self.initially_deactive_layers = ('compress', 'concept', 'identifiability', 'role')
        self.current_layer = None
        self.dir = rdir
        self.mse = defaultdict(list)
        self.divergence_error = defaultdict(list)
        self.normal_distribution = torch.distributions.normal.Normal

    def _complete_initialization(self):
        self.feedforward_layers = self.get_feedforward_layers()
        self.backpropagated_layers = self.get_backpropagation_layers()
        for layer in self.layers.values():  # if there are > 1 layers and if at least one has input weights
            if all(layer.in_weights):
                self.initialization_completed = True
                break

    def add_layer(self, name, size, has_bias=False, activation_function="tanh", convert_input=False, recurrent=False):
        self.layers[name] = NeuronLayer(name=name, size=size, has_bias=has_bias, convert_input=convert_input,
                                        is_recurrent=recurrent, activation_function=activation_function)

    def connect_layers(self, first_layer_name, second_layer_name):
        second = self.layers[second_layer_name]
        second.in_size += self.layers[first_layer_name].size
        second.in_layer_names += (first_layer_name,)

    def load_weights(self, results_dir, set_weights_folder, set_weights_epoch, simulation_num=None):
        if set_weights_folder:
            if simulation_num is not None:
                weights_fname = os.path.join(set_weights_folder, str(simulation_num),
                                             "weights", f"w{set_weights_epoch}.lz4")
            else:
                weights_fname = os.path.join(set_weights_folder, "weights", f"w{set_weights_epoch}.lz4")
            with lz4.open(weights_fname, 'rb') as f:
                self.layers = pickle.load(f)
        else:
            torch.manual_seed(simulation_num)  # set number of simulation as the seed
            sd = 0.05  # or calculate according to input size (self.input_sd(layer.in_size) and move to the loop
            # np.random.standard_normal has variance of 1 (too high) and np.random.uniform doesn't always have μ = 0
            m = self.normal_distribution(0, sd)  # Using random weights with μ = 0 and low variance is CRUCIAL.
            for layer in self.layers.values():
                # if layer.in_size:
                layer.in_weights = m.sample([layer.in_size + int(layer.has_bias), layer.size])

            if simulation_num:
                self._create_dir_if_not_exists(results_dir)
                self.save_weights(results_dir, set_weights_epoch)
        self.reset_context_delta_and_crole()
        self._complete_initialization()

    #@measure
    def save_weights(self, results_dir, epoch):
        self._create_dir_if_not_exists(results_dir)
        if self.layers:
            with lz4.open(f"{results_dir}/weights/w{epoch}.lz4", 'wb') as pckl:
                pickle.dump(self.layers, pckl, protocol=-1)

    def set_message_reset_context(self, weights_role_concept, weights_concept_role, weights_role_identif,
                                  weights_identif_role, event_semantics, target_lang_act, activate_language):
        # FIXME: bias weights?
        self.set_layer_in_weights("role", cat((weights_identif_role, weights_concept_role)))
        self.set_layer_in_weights("pred_identifiability", weights_role_identif)
        self.set_layer_in_weights("pred_concept", weights_role_concept)

        self.set_layer_activation("eventsem", event_semantics)
        if activate_language:
            self.set_layer_activation("target_lang", activation=target_lang_act)
        self.reset_context_delta_and_crole()

    def reset_context_delta_and_crole(self):
        self.set_context_activation("hidden", reset=True)
        for layer in self.backpropagated_layers:  # Also reset the previous delta values
            layer.previous_delta = empty([])
        """"for layer_name in self.backpropagated_layers:  # Also reset the previous delta values
            self.layers[layer_name].previous_delta = empty([])"""

        if self.include_role_copy:  # if we're using role_copy, reset that as well (to 0, NOT empty)
            self.initialize_layer_activation("role_copy")
        if self.include_input_copy:
            self.initialize_layer_activation("input_copy")

    def set_inputs(self, input_idx, target_idx=None):
        self.initialize_layer_activation("input", activate_id=[input_idx, 1] if input_idx else None)
        """if input_layer.convert_input:  # convert the range of the input between -0.9 and 0.9 instead of 0-1
            input_layer.activation = convert_range(input_layer.activation)"""
        if target_idx is not None:  # no need to set target when testing
            self.initialize_target_activation("output", activate_idx=target_idx, value=1)

    def initialize_layer_activation(self, layer_name, activate_id=None):
        layer = self.layers[layer_name]
        layer.activation = zeros(layer.size)
        if activate_id:
            idx, act = activate_id
            layer.activation[idx] = act

    def initialize_target_activation(self, layer_name, activate_idx, value):
        layer = self.layers[layer_name]
        layer.target_activation = zeros(layer.size)
        layer.target_activation[activate_idx] = value

    def get_feedforward_layers(self):
        """
        Returns only the layers that have incoming activations (and can therefore backpropagate the error)
        Skip input, role-copy, target-lang & eventsem as their activation is given: no incom. layers
        """
        return [layer for layer in self.layers.values() if layer.in_layer_names]

    def get_backpropagation_layers(self):
        return self.feedforward_layers[::-1]

    def feedforward(self, start_of_sentence=False):
        if not self.initialization_completed:
            sys.exit('The network was not been initialized correctly. Make sure you have added layers (add_layer), '
                     'connected them (connect_layers) and (re)set the weights')
        for layer in self.feedforward_layers:
            # combines the activation of all previous layers (e.g. role and compress and... to hidden)
            layer.in_activation = cat([self.layers[incoming_layer_name].activation
                                             for incoming_layer_name in layer.in_layer_names])
            """for incoming_layer in layer.in_layers:
                if (start_of_sentence and self.lesion_syntax and incoming_layer.name in self.syntactic_layers or
                        self.lesion_semantics and incoming_layer.name in self.semantic_layers):
                    lesion_step = 1  # 11% for syntax, 5% for semantics
                    layer.in_weights[layer.in_activation.size:layer.in_activation.size + incoming_layer.size] = 0
                layer.in_activation = cat((layer.in_activation, incoming_layer.activation))"""
            if layer.is_recurrent:  # hidden layer only (include context activation)
                layer.in_activation = cat((layer.in_activation, layer.context_activation))  # , 0)
            if layer.has_bias:  # add bias
                layer.in_activation = cat((layer.in_activation, torch.tensor(1)))
                # , 0) #np. append(layer.in_activation, 1)

            if start_of_sentence and layer.name in self.initially_deactive_layers:
                layer.activation = zeros(layer.size)  # set role_copy to zero   # zeros?
                continue
            layer.activation = self.activation_function(dot_product=layer.in_activation.matmul(layer.in_weights),#matmul(layer.in_activation, layer.in_weights),
                                                        activation_function=layer.activation_function)
        # Copy output of the hidden to "context" (activation of t-1)
        self.set_context_activation("hidden")

        if self.include_input_copy:
            self.set_layer_activation("input_copy", activation=self.get_layer_activation("input").clone())
        if self.include_role_copy:
            self.set_layer_activation("role_copy", activation=self.get_layer_activation("role").clone())

    @staticmethod
    def activation_function(dot_product, activation_function):
        if activation_function == "softmax":
            return dot_product.softmax(dim=0)
        return dot_product.tanh()  # elif activation_function == "tanh"

    @staticmethod
    def convert_to_2d(tensor):
        return tensor[None, :]  # if len(tensor.size()) == 1

    #@profile
    def backpropagate(self):
        self.compute_output_error()
        for self.current_layer in self.backpropagated_layers:  # Propagate error back to the previous layers
            #self.current_layer = self.layers[layer_name]
            self._compute_current_layer_gradient()
            self._compute_current_delta_weight_matrix()
            self._update_total_error_for_backpropagation()
            if self.current_layer.name not in ["role", "pred_concept"]:
                self._update_current_weights_and_previous_delta()
            self._backpropagate_error_to_incoming_layers()

    def _compute_current_layer_gradient(self):
        if self.current_layer.error_out:  # all layers but "output" (which has error and gradient precomputed)
            # for some layers (hidden and pred_role) there are 2 errors to be backpropagated; sum them
            error_out = stack(self.current_layer.error_out, dim=0).sum(dim=0)
            self.current_layer.error_out = []  # initialize for following gradient computation
            # Calculate derivative (Do) and gradient δo = Eo • Do  (or Do * Eo)
            self.current_layer.gradient = error_out * derivative(self.current_layer.activation,
                                                                 self.current_layer.activation_function)

    def _compute_current_delta_weight_matrix(self):
        # Compute delta weight matrix Δo = transposed(Io) * δο
        # 2d -> make sure before
        self.current_layer.delta = self.current_layer.in_activation[None, :].t().mm(self.current_layer.gradient[
                                                                                    None, :])
        # Do bounded descent according to Chang's script (otherwise it can get stuck in local minima)
        len_delta = self.current_layer.delta.pow(2).sum().sqrt()  # sqrt(sum(self.current_layer.delta ** 2))
        if len_delta > 1:
            self.current_layer.delta.div_(len_delta)

        self.current_layer.delta.mul_(self.learn_rate)  # multiply

    def _update_total_error_for_backpropagation(self):
        # Update (back propagate) gradient out (δO) to incoming layers. Compute this * before * updating the weights
        self.current_layer.total_error = self.current_layer.gradient.matmul(self.current_layer.in_weights.t())

    def _update_current_weights_and_previous_delta(self):
        """
        Update weights (steepest descent), even if they are given (i.e. between role and concept), by adding
        deltas*learning rate to the previous weight. Alternatively, we can check whether the layer has fixed weights
        (if not self.current_layer.has_fixed_weights) and update only the bias (last layer unit)
        """
        self.current_layer.in_weights.add_(self.current_layer.delta)
        # momentum descent: model continues in same direction as previous weight change
        if len(self.current_layer.previous_delta.size()) > 1:
            self.current_layer.in_weights.add_(self.momentum * self.current_layer.previous_delta)
        # Update previous delta. Clone otherwise it keeps reference
        self.current_layer.previous_delta = self.current_layer.delta.clone()

    def _backpropagate_error_to_incoming_layers(self):
        # we only need to backpropagate error to layers that have incoming layers (so not recurrent or bias)
        layer_start = 0
        """for prev_layer in self.current_layer.in_layers:
            if prev_layer.in_layers:
                prev_layer.error_out.append(self.current_layer.total_error[layer_start:layer_start + prev_layer.size])
            layer_start += prev_layer.size"""
        for prev_layer_name in self.current_layer.in_layer_names:
            prev_layer = self.layers[prev_layer_name]
            if prev_layer.in_layer_names:
                prev_layer.error_out.append(self.current_layer.total_error[layer_start:layer_start + prev_layer.size])
            layer_start += prev_layer.size

    @staticmethod
    def _create_dir_if_not_exists(results_dir):
        if not os.path.isdir(f'{results_dir}/weights'):
            # due to multiprocessing and race condition, there are rare cases where os.mkdir throws a "file exists"
            # exception even though we have checked.
            os.makedirs(f'{results_dir}/weights', exist_ok=True)

    def get_layer_activation(self, layer_name):
        return self.layers[layer_name].activation

    def set_layer_activation(self, layer_name, activation):
        self.layers[layer_name].activation = activation

    def set_layer_in_weights(self, layer_name, weights):
        self.layers[layer_name].in_weights = weights

    def set_context_activation(self, layer_name, reset=False):
        layer = self.layers[layer_name]
        if reset:
            layer.context_activation = layer.context_activation.fill_(self.context_value)
        else:
            layer.context_activation = layer.activation.clone()

    def get_max_output_activation(self, layer_name="output"):
        return int(self.layers[layer_name].activation.argmax())

    def get_max_output_activation_and_entropy(self, layer_name="output"):
        output_activation = self.layers[layer_name].activation
        return int(output_activation.argmax()), self.calculate_tensor_entropy(output_activation)

    def compute_output_error(self):
        # Calculate error[Eo](target - output)
        # calculate_mean_square_and_divergence_error(epoch, output_layer.target_activation, output_layer.activation)
        output = self.layers["output"]
        output.gradient = output.target_activation - output.activation

    @staticmethod
    def calculate_tensor_entropy(output_tensor):
        return str(entropy(output_tensor, base=None))

    @staticmethod
    def input_sd(number_of_inputs):
        """
        As pointed out by Chang: Haykin (1997, p.184) argues that you should initialize to sd = 1/number_of_inputs
        """
        return 1.0 / number_of_inputs


class NeuronLayer:
    def __init__(self, name, size, has_bias, activation_function, convert_input, is_recurrent=False):
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
        # resetting to zeros doesn't seem to bring better results. Maybe empty?
        self.activation = empty(size, dtype=torch.float64)
        self.target_activation = zeros(size, dtype=torch.float64)
        self.error_out = []
        self.total_error = []
        self.activation_function = activation_function
        self.in_weights = torch.tensor([])  # weights from incoming layers
        self.in_size = 0
        self.in_layer_names = ()
        self.in_activation = None
        self.previous_delta = torch.tensor([])
        self.gradient = None
        self.context_activation = None
        # the following two properties are only for the hidden (recurrent) layer
        self.is_recurrent = is_recurrent
        if is_recurrent:
            self.make_recurrent()

    def make_recurrent(self):
        # if it's a recurrent layer we need to increase the in_size to include the layer itself
        self.in_size += self.size
        self.context_activation = zeros(self.size)


def derivative(x, activation_function):
    if activation_function == "tanh":
        return 1.0 - x.pow(2)
    # else softmax: if i=j this derivative is the same as the derivative of the logistic function. Otherwise: -XiXj
    return x * (1.0 - x)

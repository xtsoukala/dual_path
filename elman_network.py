import math
import random
import sys

""" based on the following tutorial: http://mnemstudio.org/neural-networks-elman.htm
and on articles by Jeffrey L. Elman, Laurene Fausett, and Ben Krose & Patrick van der Smagt """


class Elman:
    def __init__(self, num_tests, sample_size, input_size, hidden_size, output_size, context_size, learning_rate,
                 epochs, beArray, sample_input):
        self.num_tests = num_tests
        self.sample_size = sample_size
        self.input_size = input_size
        self.hidden_size = hidden_size
        self.output_size = output_size
        self.context_size = context_size
        self.learn_rate = learning_rate
        self.epochs = epochs

        self.mBEArray = beArray
        self.sample_input = sample_input

        self.weight_ih = []  # Input to Hidden Weights (with Biases).
        self.weight_ch = []  # Context to Hidden Weight (with Biases).
        self.weight_ho = []  # Hidden to Output Weights (with Biases).
        self.weight_hc = []  # Hidden to Context Weights (no Biases).

        # activations
        self.input = []
        self.hidden = []
        self.target = []
        self.actual = []
        self.context = []

        # unit errors
        self.err_out = []
        self.err_hidden = []

    def initialize_arrays(self):
        for i in range(self.input_size + 1):  # The extra element represents the bias node
            self.weight_ih.append([0.0] * self.hidden_size)
            for j in range(self.hidden_size):
                # Assign a random weight value between -0.5 and 0.5
                self.weight_ih[i][j] = random.random() - 0.5

        for i in range(self.context_size + 1):
            self.weight_ch.append([0.0] * self.hidden_size)
            for j in range(self.hidden_size):
                self.weight_ch[i][j] = random.random() - 0.5

        for i in range(self.hidden_size + 1):
            self.weight_ho.append([0.0] * self.output_size)
            for j in range(self.output_size):
                self.weight_ho[i][j] = random.random() - 0.5

        for i in range(self.output_size + 1):
            self.weight_hc.append([0.0] * self.context_size)
            for j in range(self.context_size):
                # These are all fixed weights set to 0.5
                self.weight_hc[i][j] = 0.5

        self.input = [0.0] * self.input_size
        self.hidden = [0.0] * self.hidden_size
        self.target = [0.0] * self.output_size
        self.actual = [0.0] * self.output_size
        self.context = [0.0] * self.context_size
        self.err_out = [0.0] * self.output_size
        self.err_hidden = [0.0] * self.hidden_size

    def feed_forward(self):
        # Calculate input and context connections to hidden layer.
        for j in range(self.hidden_size):
            total = 0.0
            for i in range(self.input_size):
                total += self.input[i] * self.weight_ih[i][j]

            for i in range(self.context_size):
                total += self.context[i] * self.weight_ch[i][j]

            # Add in bias.
            total += self.weight_ih[self.input_size][j]
            total += self.weight_ch[self.context_size][j]
            self.hidden[j] = sigmoid(total)

        # Calculate the hidden to output layer.
        for j in range(self.output_size):
            total = 0.0
            for i in range(self.hidden_size):
                total += self.hidden[i] * self.weight_ho[i][j]

            # Add in bias.
            total += self.weight_ho[self.hidden_size][j]
            self.actual[j] = sigmoid(total)

        # Copy output of the hidden to context layer.
        for i in range(self.context_size):
            self.context[i] = self.hidden[i]
        return

    def back_propagate(self):
        # Calculate the output layer error (step 3 for output cell).
        for j in range(self.output_size):
            self.err_out[j] = (self.target[j] - self.actual[j]) * sigmoid_derivative(self.actual[j])

        # Calculate the hidden layer error (step 3 for hidden cell).
        for i in range(self.hidden_size):
            self.err_hidden[i] = 0.0
            for j in range(self.output_size):
                self.err_hidden[i] += self.err_out[j] * self.weight_ho[i][j]

            self.err_hidden[i] *= sigmoid_derivative(self.hidden[i])

        # Update the weights for the output layer (step 4).
        for j in range(self.output_size):
            for i in range(self.hidden_size):
                self.weight_ho[i][j] += (self.learn_rate * self.err_out[j] * self.hidden[i])

            # Update the bias.
            self.weight_ho[self.hidden_size][j] += (self.learn_rate * self.err_out[j])

        # Update the weights for the hidden layer (step 4).
        for j in range(self.hidden_size):
            for i in range(self.input_size):
                self.weight_ih[i][j] += (self.learn_rate * self.err_hidden[j] * self.input[i])

            # Update the bias.
            self.weight_ih[self.input_size][j] += (self.learn_rate * self.err_hidden[j])

        return

    def train_network(self):
        sample = 0

        for it in range(0, self.epochs + 1):
            if sample == 0:
                for i in range(self.input_size):
                    self.input[i] = self.mBEArray[i]
            else:
                for i in range(self.input_size):
                    self.input[i] = self.sample_input[sample - 1][i]

            # After the samples are entered into the input units, the sample are
            # then offset by one and entered into target-output units for
            # later comparison.
            if sample == self.sample_size - 1:
                for i in range(self.input_size):
                    self.target[i] = self.mBEArray[i]
            else:
                for i in range(self.input_size):
                    self.target[i] = self.sample_input[sample][i]

            self.feed_forward()

            err = 0.0
            for i in range(self.output_size):
                err += math.sqrt(math.fabs(self.target[i] - self.actual[i]))
            err = 0.5 * err

            self.back_propagate()

            sample += 1
            if sample == self.sample_size:
                sample = 0

        sys.stdout.write("Done training. Iterations = %s\n" % self.epochs + 1)

    def test_network(self):
        # Test the network with random input patterns.
        for j in range(self.num_tests):
            # initialize?
            self.input = [1.0, 0.0, 0.0, 0.0, 0.0, 0.0]
            sys.stdout.write("\n(0) ")

            self.feed_forward()

            stopSample = False
            success = False
            index = 0
            predicted = 0
            while stopSample == False:
                for i in range(self.output_size):
                    sys.stdout.write("{:03.3f} ".format(self.actual[i]))
                    if self.actual[i] >= 0.3:
                        # The output unit with the highest value (usually over 3.0)
                        # is the network's predicted unit that it expects to appear
                        # in the next input vector.
                        # For example, if the 3rd output unit has the highest value,
                        # the network expects the 3rd unit in the next input to
                        # be 1.0
                        # If the actual value isn't what it expected, the random
                        # sequence has failed, and a new test sequence begins.
                        predicted = i
                sys.stdout.write("\n")

                index += 1
                if index == self.output_size - 1:
                    stopSample = True

                # Enter a random number between 0 and INPUT_NEURONS.
                rand_num = random.randrange(0, self.input_size)
                sys.stdout.write("(%s)" % rand_num)
                for i in range(self.input_size):
                    if i == rand_num:
                        self.input[i] = 1.0
                        if i == predicted:
                            success = True
                        else:
                            # failure. Stop this sample and try a new sample.
                            stopSample = True
                    else:
                        self.input[i] = 0.0

                self.feed_forward()  # then go back and enter another number into this sample sequence.

            if index > self.output_size - 2 and success:
                # If the random sequence happens to be in the correct order, the network reports success.
                sys.stdout.write("Success.\n Completed %s tests.\n" % j)
                break
            else:
                sys.stdout.write("Failed.\n")
                if j >= self.num_tests:
                    sys.stdout.write("Completed %s tests with no success.\n" % j)
                    break


def sigmoid(x):
    return 1.0 / (1.0 + math.exp(-x))


def sigmoid_derivative(x):
    return x * (1.0 - x)

if __name__ == '__main__':
    # BEVector is the symbol used to "B"egin or "E"nd a sequence.
    BE_VECTOR = [1.0, 0.0, 0.0, 0.0, 0.0, 0.0]

    #                 0    1    2    3    4    5
    SAMPLE_INPUT = [[0.0, 0.0, 0.0, 1.0, 0.0, 0.0],
                    [0.0, 0.0, 0.0, 0.0, 0.0, 1.0],
                    [0.0, 0.0, 1.0, 0.0, 0.0, 0.0]]

    NUM_TESTS = 10000
    NUM_SAMPLES = 4
    INPUT_NEURONS = 6
    HIDDEN_NEURONS = 3
    OUTPUT_NEURONS = 6
    CONTEXT_NEURONS = 3
    LEARNING_RATE = 0.2  # Rho.
    TRAINING_REPS = 2000

    elman = Elman(NUM_TESTS, NUM_SAMPLES, INPUT_NEURONS, HIDDEN_NEURONS, OUTPUT_NEURONS, CONTEXT_NEURONS,
                  LEARNING_RATE, TRAINING_REPS, BE_VECTOR, SAMPLE_INPUT)
    elman.initialize_arrays()
    elman.train_network()
    elman.test_network()

from nn import NeuralNetwork
import os

''' From Chang F., 2002:
    Learning algorithm: back-propagation, using a modified momentum algorithm (doug momentum)
    doug momentum: similar to standard momentum descent with the exception that the pre-momentum weight step
    vector is bounded so that its length cannot exceed 1.0 (Rohde, 1999).

    Batch size was set to be the size of the training set

    The cwhere and word units used the soft-max activation function.
    Soft-max units caused the output to be passed through an exponential function, which magnified small differences,
    and the result was then normalized (leaving only the most activated unit, and squashing the activation of all
    the weaker competitors). Because soft-max units were used for the word output units, the error function for these
    units was the divergence function (sum over all units: target × log(target/output)).
    All other units used the logistic activation function.
'''

infolder = 'chang_input'
fname = 'lexicon.in'
lexicon = [line.rstrip('\n') for line in open(os.path.join(infolder, fname))]

# Comparing Chang, 2002 (Fig.1) and Chang&Fitz, 2014 (Fig. 2), it seems that
# "where" is renamed to "role" and "what" to concept 
fname = 'roles.in'
roles = [line.rstrip('\n') for line in open(os.path.join(infolder, fname))]

fname = 'concepts.in'
concepts = [line.rstrip('\n') for line in open(os.path.join(infolder, fname))]

fname = 'event-sem.in'
event_sem = [line.rstrip('\n') for line in open(os.path.join(infolder, fname))]

# 4 input layers

# the event-semantics unit is the only unit that provides information about the target sentence order
# e.g. for the dative sentence "A man bake a cake for the cafe| there are 3 event-sem units:
# CAUSE, CREATE, TRANSFER
event_sem_size = len(event_sem)
# if we want to define :det etc later, we can convert the lexicon into a dict of lists, e.g. 'det': ['the', 'a']
lexicon_size = len(lexicon)
concept_size = len(concepts)
roles_size = len(roles)
# same for c
c_lexicon_size = lexicon_size
c_concept_size = concept_size
c_roles_size = roles_size

''' http://tedlab.mit.edu/~dr/Lens/Commands/addGroup.html
c_lexicon_size: addGroup cword $lexSize ELMAN ELMAN_CLAMP ELMAN_CLAMP -BIASED OUT_NORM
c_compress_size: addGroup ccompress $ccompressSize -BIASED
c_concept_size: addGroup cwhat $semSize OUTPUT TARGET_COPY -BIASED -WRITE_OUTPUTS
c_roles_size: addGroup cwhere2 $whereSize ELMAN ELMAN_CLAMP ELMAN_CLAMP -BIASED
[why 2?] addGroup cwhere $whereSize SOFT_MAX -BIASED
event_sem_size: addGroup eventsem $eventsemSize LINEAR -BIASED
context_size: addGroup context $contextSize ELMAN OUT_INTEGR -BIASED
hidden_size: addGroup hidden $hiddenSize -BIASED
role_size: addGroup where $whereSize -BIASED
concept_size: addGroup what $semSize -BIASED
compress_size: addGroup compress $compressSize -BIASED
(how do cword and targ differ?) : addGroup targ $lexSize INPUT
lexicon_size: addGroup word $lexSize OUTPUT SOFT_MAX STANDARD_CRIT USE_OUTPUT_HIST USE_TARGET_HIST -BIASED'''
'''sent_pos
int time
direction = 2
mode = 0
mode_type = 0
learn_level = 300'''

# Hidden layers (context and hidden), values taken from dualpath3.in
# compress is also hidden
hidden_size = 20
context_size = hidden_size
compress_size = 10  # is it coincidence that it's hidden/2?
c_compress_size = compress_size

# Learning rate started at 0.2 and was reduced linearly until it reached 0.05 at 2000 epochs,
#  where it was fixed for the rest of training. Values taken from Chang F., 2002
learn_rate = 0.2
epochs = 2000
doug_momentum = 0.9
# batch size = len(training_set) , 501 in Chang 2002

# all other units except context have bias
# context units are elman units that were initialized to 0.5 at the beginning of a sentence.
context = 0.5

# role-concept and c_role-c_concept links are used to store the message.
#


def clear_message():
    # TODO: before the production of each sentence, the links between role and concept units are set to 0
    # initially, and then individual links between roles and concepts were made by setting the weight to 6 (why 6?)
    # Same weight for c_role, c_concept
    initialize = True

nn = NeuralNetwork(2, 2, 2, hidden_layer_weights=[0.15, 0.2, 0.25, 0.3], hidden_layer_bias=0.35,
                   output_layer_weights=[0.4, 0.45, 0.5, 0.55], output_layer_bias=0.6)
for i in range(10000):
    nn.train([0.05, 0.1], [0.01, 0.99])
    print(i, round(nn.calculate_total_error([[[0.05, 0.1], [0.01, 0.99]]]), 9))

import math
#import numpy as np

# lexicon_str = "dog cat chases bites the a is are"
# lexicon = lexicon_str.split()
# It's better to load from file. Keep the lexicon string as toy
fname = 'lexicon.in'
lexicon = [line.rstrip('\n') for line in open(fname)]

# Comparing Chang, 2002 (Fig.1) and Chang&Fitz, 2014 (Fig. 2), it seems that
# "where" is renamed to "role" and "what" to concept 
fname = 'roles.in'
roles = [line.rstrip('\n') for line in open(fname)]

fname = 'concepts.in'
concepts = [line.rstrip('\n') for line in open(fname)]

fname = 'event-sem.in'
event_sem = [line.rstrip('\n') for line in open(fname)]

''' taken from the Processing code
syntactic_categories = "N N N N N N V V V D D P S"
code_message = "ACTION CHASE AGENT DOG PATIENT CAT"  
basic_sentence = "the boy threw the box to the dog ."
basic_message = "THROW(BOY,BOX,DOG)"
prime_sentence = "a girl showed a cat a ball ."
basic_roles_list = "_ AGENT ACTION _ PATIENT _ _ GOAL _ _ _"
basic_concept_list = "_ BOY THROW _ BOX _ _ DOG _ _ _"
extra_messages = ["ACTION THROW AGENT BOY PATIENT BOX GOAL DOG",
                 "ACTION SHOW AGENT GIRL PATIENT BALL GOAL BOY",
                 "ACTION PUSH AGENT DOG PATIENT BALL GOAL BOX"]
extra_messages_lab = ["THROW(BOY,BOX,DOG)",
                      "SHOW(GIRL,BALL,BOY)",
                      "PUSH(DOG, BALL, BOX)"]'''

# 4 input layers
event_sem_size = len(event_sem)

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

# check the paper to see what the learning rate is
learn_rate = 0.1


def sigmoid(x):
    return 1 / (1 + math.exp(-x))


def sigmoid_prime(x):
    return sigmoid(x)*(1-sigmoid(x))

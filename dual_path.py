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

# Hidden layers (context and hidden), values taken from dualpath3.in
# compress is also hidden
hidden_size = 20
context_size = hidden_size
compress_size = 10 # is it coincidence that it's hidden/2?
# I guess compress_size and c_compress_size need to have the same size
c_compress_size = compress_size
'''sent_pos
int time
direction = 2
mode = 0
mode_type = 0
learn_level = 300'''
# check the paper to see what the learning rate is
learn_rate = 0.1


def sigmoid(x):
    return 1 / (1 + math.exp(-x))


def sigmoid_prime(x):
    return sigmoid(x)*(1-sigmoid(x))

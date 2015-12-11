# -*- coding: utf-8 -*-
import os
from elman_network import Elman

""" From Chang F., 2002:
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
"""
''' http://tedlab.mit.edu/~dr/Lens/Commands/addGroup.html
    prev_lexicon_size: addGroup cword $lexSize ELMAN ELMAN_CLAMP ELMAN_CLAMP -BIASED OUT_NORM
    prev_compress_size: addGroup ccompress $ccompressSize -BIASED
    prev_concept_size: addGroup cwhat $semSize OUTPUT TARGET_COPY -BIASED -WRITE_OUTPUTS
    prev_roles_size: addGroup cwhere2 $whereSize ELMAN ELMAN_CLAMP ELMAN_CLAMP -BIASED
    [why 2?] addGroup cwhere $whereSize SOFT_MAX -BIASED
    event_sem_size: addGroup eventsem $eventsemSize LINEAR -BIASED
    context_size: addGroup context $contextSize ELMAN OUT_INTEGR -BIASED
    hidden_size: addGroup hidden $hiddenSize -BIASED
    role_size: addGroup where $whereSize -BIASED
    concept_size: addGroup what $semSize -BIASED
    compress_size: addGroup compress $compressSize -BIASED
    (how do cword and targ differ?) : addGroup targ $lexSize INPUT
    lexicon_size: addGroup word $lexSize OUTPUT SOFT_MAX STANDARD_CRIT USE_OUTPUT_HIST USE_TARGET_HIST -BIASED
    sent_pos
    int time
    direction = 2
    mode = 0
    mode_type = 0
    learn_level = 300
'''


class DualPath:
    def __init__(self, infolder='chang_input', lex_fname='lexicon.in', concept_fname='concepts.in',
                 role_fname='roles.in', eventsem_fname='event-sem.in'):
        self.folder = infolder
        self.pos, self.lexicon = self._read_lexicon_and_pos(lex_fname)
        self.concepts = self._read_concepts(concept_fname)
        self.roles = self._read_file_to_list(role_fname)
        self.event_sem = self._read_file_to_list(eventsem_fname)

        """ Dual Path has 4 input layers.
        The event-semantics unit is the only unit that provides information about the target sentence order
        e.g. for the dative sentence "A man bake a cake for the cafe" there are 3 event-sem units:
        CAUSE, CREATE, TRANSFER

        role-concept and prev_role-prev_concept links are used to store the message

        role, concept and prev_concept units are unbiased to make them more input driven (all other units except
        concept had bias) """

        self.event_sem_size = len(self.event_sem)
        # lexicon is one of the input layers
        self.lexicon_size = len(self.lexicon)
        # in our case lexicon size is the same as concept size,
        # but we want to allow synonyms etc (same concept, different word)
        self.concept_size = len(self.concepts)
        # basically accounts for POS (syntactic categories)
        # is compress also hidden?
        self.compress_size = len(self.pos)

        self.roles_size = len(self.roles)
        # same for previous
        self.prev_lexicon_size = self.lexicon_size
        self.prev_concept_size = self.concept_size
        self.prev_roles_size = self.roles_size
        self.prev_compress_size = self.compress_size

        # Hidden layers (context and hidden), values are taken from dualpath3.in
        self.hidden_size = 20
        # According to Chang, context layer is roughly hidden/3. Why not equal to hidden..?
        self.context_size = self.hidden_size  # round(self.hidden_size / 3, -1)

        # Learning rate started at 0.2 and was reduced linearly until it reached 0.05 at 2000 epochs,
        # where it was fixed for the rest of training. Values taken from Chang F., 2002
        self.learn_rate = 0.2
        self.epochs = 2000
        # Doug momentum is similar to standard momentum descent with the exception that the pre-momentum weight step
        # vector is bounded so that its length cannot exceed 1.0
        self.doug_momentum = 0.9
        # batch size = len(training_set) , 501 in Chang 2002

        # all other units except context have bias
        # context units are Elman units that were initialized to 0.5 at the beginning of a sentence.
        self.context = 0.5

    def _read_lexicon_and_pos(self, fname):
        """
        :param fname: the name of the file that contains a list of categories (eg. noun, verb) and the lexicon
        :return: lexicon is a list of words, and pos is a dict that contains information regarding the index
        (in the list of lexicon) of the word for each category. E.g. {'noun': [0, 1], 'verb': [2, 3, 4]}
        """
        pos = dict()
        lexicon = []
        prev_pos = ''
        # Keep in mind that in the Lens algorithm by Chang, indexes start from 1, not 0
        pos_start = pos_end = 0
        with open(os.path.join(self.folder, fname)) as f:
            # skip first line (header)
            next(f)
            for line in f:
                line = line.rstrip('\n')
                if line.startswith(":"):
                    if prev_pos:
                        pos[prev_pos] = range(pos_start, pos_end)
                        pos_start = pos_end
                    prev_pos = line[1:]
                else:
                    lexicon.append(line)
                    pos_end += 1
        return pos, lexicon

    def _read_concepts(self, fname):
        """ Comparing Chang, 2002 (Fig.1) and Chang&Fitz, 2014 (Fig. 2), it seems that
        "where" is renamed to "role" and "what" to concept

        If lexicon-concepts are always mapped 1-to-1 we can simply take lexicon and uppercase it
        i.e. concepts = [x.upper() for x in lexicon], otherwise all we need to do is read the file
        and ignore the lines that start with a colon """
        return [line.rstrip('\n') for line in open(os.path.join(self.folder, fname))
                if not line.startswith(":")]

    def _read_file_to_list(self, fname):
        """
        We simply need to read the roles or event-semantics files into a list
        """
        return [line.rstrip('\n') for line in open(os.path.join(self.folder, fname))]

    def role_index(self, role):
        """
        :param role: the name of the role (e.g. ACTION, AGENT, PATIENT)
        :return: the index from the roles list.
        Warning: intentionally, there was no Exception added in case the role doesn't exist in the
        predefined list of roles. In that case, an error should be raised as it would be critical.
        In the future, we can automatically add new roles to the list.
        """
        return self.roles.index(role)

    def pos_lookup(self, word_idx):
        """
        :param word_idx: The index of a given word (as stored in the lexicon)
        :return: It looks up the pos dictionary and returns the category of the word (noun, verb etc)
        """
        for pos, idx in self.pos.iteritems():
            if word_idx in idx:
                return pos
        # in (hopefully rare) case that the word index not available
        return False

    def word_lookup(self, word_idx):
        return self.lexicon[word_idx]

    def word_index(self, word):
        return self.lexicon.index(word)

    def event_index(self, event):
        return self.event_sem.index(event)

    def concept_index(self, concept):
        return self.concepts.index(concept)

    def retrieve_sentence(self, sentence):
        """
        :param sentence: intended sentence from train file
        :return: list of activations in the lexicon
        """
        return [self.word_index(w) for w in sentence.split()]

    def activate_message(self, message):
        """
        :param message: string, e.g. "A=CARRY X=FATHER,THE Y=STICK,A E=PAST,PROG,XX,YY" which maps roles (A,X,Y) with
         concepts and also gives information about the event-semantics (E)
        """
        self.clear_message()
        event_list = []
        for info in message.split():
            i = info.split("=")
            if i[0] == "E":
                for event in i[1].split(","):
                    event_list.append(self.event_index(event))
                self.link_event_sem(event_list)
            else:
                concepts = []
                for concept in i[1].split(","):
                    concepts.append(self.concept_index(concept))
                self.link_role_concept(self.role_index(i[0]), concepts)

    def link_event_sem(self, event_list):
        # TODO: link them
        print event_list

    def link_role_concept(self, role, concepts):
        # TODO: link them
        print role, concepts

"""     gia kathe frasi:
        - dose input (sentence)
        - init prin ti frasi
        - gia kathe leksi sti frasi, dose input kai target (next word)
        - compute predicted response
        - determine error, propagate and update weights
        - copy hidden units to context
        sentences = ["a man walk -s . .", "a boy walk -s . ."]
        for sentence in sentences:
            self.clear_message()
            for i, word_idx in enumerate(sentence.split()):
                # feed the word to the network
                self.input[word_idx] = 1.0
                self.target[sent]
"""

    def train_elman(self, nn, trainfile = 'train_c.en'):
        """
        :param nn: the SRN network is given as input
        :param trainfile: the name of the train file. The first line is the target
        sentence and the second line contains the message (A=THROW etc)
        """
        with open(os.path.join(self.folder, trainfile)) as f:
            for line in f:
                if line.startswith("#mess:"):
                    nn.clear_message()
                    message = line.split('#mess:   ')[1]
                    #self.link_sentences(sentence, message)
                else:
                    # pou paei to for-loop? Ana frasi i' ana leksi?
                    for it in range(0, self.epochs + 1):
                        #print line
                        for word_idx in self.retrieve_sentence(line):
                            nn.clear_input_set_target()
                            #print word_idx, self.word_lookup(word_idx)
                            nn.input[word_idx] = 1.0
                            
                            #print nn.input
                            print nn.target
                            nn.feed_forward()
                            nn.back_propagate()
                            print nn.predicted


def max_activation(lista):
    return lista.index(max(lista))

def __main__():
    dualp = DualPath()

    trainfile = os.path.join(dualp.folder, 'train_c.en')
    testfile = os.path.join(dualp.folder, 'test_c.en')

    elman = Elman(lexicon_size=dualp.lexicon_size, hidden_size=dualp.hidden_size, output_size=dualp.lexicon_size,
                  eventsem_size=dualp.event_sem_size, concept_size=dualp.concept_size,
                  compress_size=dualp.compress_size, roles_size=dualp.roles_size, learning_rate=dualp.learn_rate,
                  epochs=dualp.epochs, train_file=trainfile, test_file=testfile)

    dualp.train(elman)


    elman.train_network()
    elman.test_network()

import os
from nn import NeuralNetwork

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
        e.g. for the dative sentence "A man bake a cake for the cafe| there are 3 event-sem units:
        CAUSE, CREATE, TRANSFER

        role-concept and c_role-c_concept links are used to store the message """

        self.event_sem_size = len(self.event_sem)
        self.lexicon_size = len(self.lexicon)
        self.concept_size = len(self.concepts)
        self.roles_size = len(self.roles)
        # same for c
        self.c_lexicon_size = self.lexicon_size
        self.c_concept_size = self.concept_size
        self.c_roles_size = self.roles_size

        # Hidden layers (context and hidden), values are taken from dualpath3.in
        # compress is also hidden
        self.hidden_size = 20
        self.context_size = self.hidden_size
        self.compress_size = 10  # is it coincidence that it's hidden/2?
        self.c_compress_size = self.compress_size

        # Learning rate started at 0.2 and was reduced linearly until it reached 0.05 at 2000 epochs,
        # where it was fixed for the rest of training. Values taken from Chang F., 2002
        self.learn_rate = 0.2
        self.epochs = 2000
        self.doug_momentum = 0.9
        # batch size = len(training_set) , 501 in Chang 2002

        # all other units except context have bias
        # context units are Elman units that were initialized to 0.5 at the beginning of a sentence.
        self.context = 0.5

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

    def _read_lexicon_and_pos(self, fname):
        '''
        :param fname: the name of the file that contains a list of categories (eg. noun, verb) and the lexicon
        :return: lexicon is a list of words, and pos is a dict that contains information regarding the index
        (in the list of lexicon) of the word for each category. E.g. {'noun': [0, 1], 'verb': [2, 3, 4]}
        '''
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
                print line
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
        ''' Comparing Chang, 2002 (Fig.1) and Chang&Fitz, 2014 (Fig. 2), it seems that
        "where" is renamed to "role" and "what" to concept

        If lexicon-concepts are always mapped 1-to-1 we can simply take lexicon and uppercase it
        i.e. concepts = [x.upper() for x in lexicon], otherwise all we need to do is read the file
        and ignore the lines that start with a colon'''
        return [line.rstrip('\n') for line in open(os.path.join(self.folder, fname))
                    if not line.startswith(":")]

    def _read_file_to_list(self, fname):
        """
        We simply need to read the roles or event-semantics files into a list
        """
        return [line.rstrip('\n') for line in open(os.path.join(self.folder, fname))]

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

    def word_index(self, word):
        return self.lexicon.index(word)

    def clear_message(self):
        # TODO: before the production of each sentence, the links between role and concept units are set to 0
        # initially, and then individual links between roles and concepts were made by setting the weight to 6 (why 6?)
        # Same weight for c_role, c_concept
        initialize = True

    def train(self, trainfile = 'train.en'):
        '''nn = NeuralNetwork(2, 2, 2, hidden_layer_weights=[0.15, 0.2, 0.25, 0.3], hidden_layer_bias=0.35,
                   output_layer_weights=[0.4, 0.45, 0.5, 0.55], output_layer_bias=0.6)'''

        # TODO: Well, obviously check the NN
        nn = NeuralNetwork()

        with open(os.path.join(self.folder, trainfile)) as f:
            for line in f:
                print line
                # nn.train([0.05, 0.1], [0.01, 0.99])
                # print(i, round(nn.calculate_total_error([[[0.05, 0.1], [0.01, 0.99]]]), 9))


dualp = DualPath()

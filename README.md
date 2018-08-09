# Bilingual Dual-path model

![Bilingual dual-path model architecture](bilingual-dual-path.png)

Dual-path is a computational model of (monolingual) sentence production by [Chang, 2002](https://sites.google.com/site/sentenceproductionmodel/Home/chang-2002). Tutorial: https://sites.google.com/site/sentenceproductionmodel/Home/tutorial


From Chang, 2002:
```
Learning algorithm: back-propagation, using a modified momentum algorithm (doug momentum)
Doug momentum: similar to standard momentum descent with the exception that the pre-momentum
weight step vector is bounded so that its length cannot exceed 1.0 (Rohde, 1999).

The cwhere and word units used the soft-max activation function.
Soft-max units caused the output to be passed through an exponential function, which magnified
small differences, and the result was then normalized (leaving only the most activated unit, and
squashing the activation of all the weaker competitors). Because soft-max units were used for 
the word output units, the error function for these units was the divergence function 
(sum over all units: target × log(target/output)). 
All other units used the logistic activation function.
```

To see all the parameters of the model: 


```
python dual_path.py -h 
```

```
usage: dual_path.py [-h] [-hidden HIDDEN] [-compress COMPRESS]
                    [-epochs EPOCHS] [-l2_epochs L2_EPOCHS]
                    [-l2_percentage L2_PERCENTAGE] [-input INPUT]
                    [-lexicon_csv LEXICON_CSV] [-trainingset TRAININGSET]
                    [-testset TESTSET] [-resdir RESDIR] [-lang LANG]
                    [-lrate LRATE] [-final_lrate FINAL_LRATE]
                    [-momentum MOMENTUM] [-set_weights SET_WEIGHTS]
                    [-set_weights_epoch SET_WEIGHTS_EPOCH] [-fw FW] [-fwi FWI]
                    [-cognate_percentage COGNATE_PERCENTAGE]
                    [-generate_num GENERATE_NUM] [-test_every TEST_EVERY]
                    [-title TITLE] [-sim SIM] [-np NP] [-pron EMPHASIS]
                    [-threshold THRESHOLD] [--prodrop] [--crole] [--cinput]
                    [--debug] [--nolang] [--nodlr] [--nogender]
                    [--monolingual] [--comb-sem] [--no-shuffle]
                    [--full-verb-form] [--allow-free-structure]
                    [--gender_error_experiment] [--filler] [--emb]
                    [--cognates] [--flex_eval] [--nomultiprocessing]

optional arguments:
  -h, --help            show this help message and exit
  -hidden HIDDEN        Number of hidden layer units. (default: 90)
  -compress COMPRESS    Number of compress layer units (default: 45)
  -epochs EPOCHS, -total_epochs EPOCHS
                        Number of training set iterations during (total)
                        training. (default: 20)
  -l2_epochs L2_EPOCHS, -l2e L2_EPOCHS
                        # of epoch when L2 input gets introduced (default:
                        None)
  -l2_percentage L2_PERCENTAGE, -l2_perc L2_PERCENTAGE
                        % of L2 input (default: 0.5)
  -input INPUT          (Input) folder that contains all input files (lexicon,
                        concepts etc) (default: None)
  -lexicon_csv LEXICON_CSV
                        CSV file that contains the lexicon and concepts
                        (default: lexicon.csv)
  -trainingset TRAININGSET, -training TRAININGSET
                        File name that contains the message-sentence pair for
                        training. (default: training.in)
  -testset TESTSET, -test TESTSET
                        Test set file name (default: test.in)
  -resdir RESDIR, -r RESDIR
                        Prefix of results folder name; will be stored under
                        folder "simulations"and a timestamp will be added
                        (default: None)
  -lang LANG            In case we want to generate a new set, we need to
                        specify the language (en, es or any combination [enes,
                        esen] for bilingual) (default: esen)
  -lrate LRATE          Learning rate (default: 0.15)
  -final_lrate FINAL_LRATE, -flrate FINAL_LRATE
                        Final learning rate after linear decrease in the first
                        1 epoch(2k sentences). If not set, rate doesn't
                        decrease (default: 0.02)
  -momentum MOMENTUM    Amount of previous weight changes that are taken into
                        account (default: 0.75)
  -set_weights SET_WEIGHTS, -sw SET_WEIGHTS
                        Set a folder that contains pre-trained weights as
                        initial weights for simulations (default: None)
  -set_weights_epoch SET_WEIGHTS_EPOCH, -swe SET_WEIGHTS_EPOCH
                        In case of pre-trained weights we can also specify num
                        of epochs (stage of training) (default: None)
  -fw FW, -fixed_weights FW
                        Fixed weight value for concept-role connections
                        (default: 25)
  -fwi FWI, -fixed_weights_identif FWI
                        Fixed weight value for identif-role connections
                        (default: 10)
  -cognate_percentage COGNATE_PERCENTAGE
                        Amount of sentences with cognates in test/training
                        sets (default: 0.35)
  -generate_num GENERATE_NUM
                        Sum of test/training sentences to be generated (only
                        if no input was set) (default: 2500)
  -test_every TEST_EVERY
                        Test network every x epochs (default: 1)
  -title TITLE          Title for the plots (default: None)
  -sim SIM              training several simulations (sim) at once to take the
                        average of the results (Monte Carlo approach)
                        (default: 2)
  -np NP                Defines percentage of Noun Phrases(NPs) vs pronouns on
                        the subject level (default: 100)
  -pron EMPHASIS        Percentage of overt pronouns in ES (default: 0)
  -threshold THRESHOLD  Threshold for performance of simulations. Any
                        simulations that performs has a percentage of correct
                        sentences < threshold are discarded (default: 30)
  --prodrop             Indicates that it is a pro-drop lang (default: False)
  --crole               If (role copy) is set, the produced role layer is
                        copied back to the comprehension layer (default:
                        False)
  --cinput              If (copy input) is set, the previous activation of the
                        input layer is stored (default: False)
  --debug               Debugging info for SRN layers and deltas (default:
                        False)
  --nolang              Exclude language info during TESTing (default: False)
  --nodlr               Keep lrate stable (final_lrate) (default: True)
  --nogender            Exclude semantic gender for nouns (default: True)
  --monolingual         Do not include L2 lexicon (default: False)
  --comb-sem            Produce combined concepts instead of simple ones
                        (e.g., PARENT+M instead of FATHER) (default: True)
  --no-shuffle          Do not shuffle training set after every epoch
                        (default: True)
  --full-verb-form, --fv
                        Use full lexeme for verbs instead of splitting into
                        lemma/suffix (default: False)
  --allow-free-structure, --af
                        The model is not given role information in the event
                        semantics and it it therefore allowed to use any
                        syntactic structure (which is important for testing,
                        e.g., priming) (default: False)
  --gender_error_experiment
                        Evaluate pronoun production (default: False)
  --filler              Add filler word ("actually", "pues") at the beginning
                        of the sentence (default: False)
  --emb                 Represent semantics using word embeddings instead of
                        one-hot vectors. (default: False)
  --cognates            Run cognate experiment (default: False)
  --flex_eval           Ignore mistakes on determiners (definiteness) and
                        tense (past, present) (default: False)
  --nomultiprocessing, --no_multiprocessing
                        Use multiprocessing for parallel simulations (default:
                        True)```


The output is stored under the given results folder (-resdir) in the following format:

```
--------1--------
OUT:a waiter give -s a bag to a host .
TRG:a waiter give -s a host a bag .
Grammatical:True Tense:True Definiteness:True Meaning:flex-correct 
AGENT=INDEF,WAITER,M;ACTION=GIVE;RECIPIENT=INDEF,HOST,M;PATIENT=INDEF,BAG;E=SIMPLE,AGT,-1,PAT,REC,PRESENT,EN
--------1--------
OUT:a popular bull is golp -ing the man .
TRG:a popular bull is hit -ing the man .
Grammatical:True Tense:True Definiteness:True Meaning:correct (code-switch: verb)
AGENT=INDEF,BULL,M;AGENT-MOD=POPULAR,M,COG;ACTION=HIT;PATIENT=DEF,MAN,M;E=PROG,AGT,PAT,PRESENT,EN
```

Where OUT: is the produced sentence, TRG: the target (intended) sentence. Grammatical: Whether the sentence is grammatically correct, even if it conveys the wrong meaning. Tense: Whether the tense (present, past) is correct. Definiteness: Wether the determiners have the correct definiteness (definite, indefinite), Meaning: Whether the sentence expresses the message correctly (all concepts need to be correctly produced).
The last sentence is the message used to produce the sentence.
    

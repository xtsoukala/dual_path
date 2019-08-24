# Bilingual Dual-path model

![Bilingual dual-path model architecture](img/bilingual-dual-path.png)

Dual-path is a computational model of (monolingual) sentence production by [Chang, 2002](https://sites.google.com/site/sentenceproductionmodel/Home/chang-2002). Tutorial: https://sites.google.com/site/sentenceproductionmodel/Home/tutorial


From Chang, 2002:
```
The learning algorithm is back-propagation, using a modified momentum algorithm (doug momentum)
Doug momentum: similar to standard momentum descent with the exception that the pre-momentum
weight step vector is bounded so that its length cannot exceed 1.0 (Rohde, 1999).

The output and role units use the softmax activation function. All other units use the logistic activation function.
```

It it recommended to run the Bilingual Dual-path model using Python3.6 and above. To install requirements:

```
pip3 install -r requirements.txt
```

To see all the parameters of the model: 


```
python3 src/start_dual_path.py -h 
```

```
usage: start_dual_path.py [-h] [--hidden HIDDEN] [--compress COMPRESS]
                          [--epochs EPOCHS] [--l2_epochs L2_EPOCHS]
                          [--l2_percentage L2_PERCENTAGE] [--input INPUT]
                          [--lexicon LEXICON] [--structures STRUCTURES]
                          [--trainingset TRAININGSET] [--testset TESTSET]
                          [--resdir RESDIR] [--lang LANG] [--lrate LRATE]
                          [--final_lrate FINAL_LRATE] [--momentum MOMENTUM]
                          [--set_weights SET_WEIGHTS]
                          [--set_weights_epoch SET_WEIGHTS_EPOCH] [--fw FW]
                          [--fwi FWI]
                          [--cognate_percentage COGNATE_PERCENTAGE]
                          [--generate_training_num GENERATE_TRAINING_NUM]
                          [--title TITLE] [--sim SIM] [--sim_from SIM_FROM]
                          [--sim_to SIM_TO] [--pron OVERT_PRONOUNS]
                          [--threshold THRESHOLD] [--config CONFIG]
                          [--prodrop] [--crole] [--cinput] [--debug] [--cs]
                          [--nodlr] [--gender] [--monolingual] [--comb-sem]
                          [--noeval] [--eval_training] [--evaluate]
                          [--continue_training] [--allow-free-structure]
                          [--emb] [--cognates] [--aux] [--tener]
                          [--haber_frequency] [--gender_error_experiment]
                          [--flex_eval] [--separate]

optional arguments:
  -h, --help            show this help message and exit
  --hidden HIDDEN       Number of hidden layer units. (default: 70)
  --compress COMPRESS, -c COMPRESS
                        Number of compress layer units. The size should be
                        approximately 2/3 of the hidden one (default: 60)
  --epochs EPOCHS, --total_epochs EPOCHS
                        Number of training set iterations during (total)
                        training. (default: 20)
  --l2_epochs L2_EPOCHS, --l2e L2_EPOCHS
                        # of epoch when L2 input gets introduced (default:
                        None)
  --l2_percentage L2_PERCENTAGE, --l2_perc L2_PERCENTAGE
                        % of L2 input (default: 0.5)
  --input INPUT         (Input) folder that contains all input files (lexicon,
                        concepts etc) (default: None)
  --lexicon LEXICON     CSV file that contains lexicon and concepts (default:
                        None)
  --structures STRUCTURES
                        CSV file that contains the structures (default: None)
  --trainingset TRAININGSET, --training TRAININGSET
                        File name that contains the message-sentence pair for
                        training. (default: training.in)
  --testset TESTSET, --test TESTSET
                        Test set file name (default: None)
  --resdir RESDIR, -r RESDIR
                        Prefix of results folder name; will be stored under
                        folder "simulations" and a timestamp will be added
                        (default: None)
  --lang LANG           In case we want to generate a new set, we need to
                        specify the language (en, es or any combination [enes,
                        esen] for bilingual) (default: esen)
  --lrate LRATE         Learning rate (default: 0.1)
  --final_lrate FINAL_LRATE, --flrate FINAL_LRATE
                        Final learning rate after linear decrease. If not set,
                        rate does not decrease (default: 0.02)
  --momentum MOMENTUM   Amount of previous weight changes that are taken into
                        account (default: 0.9)
  --set_weights SET_WEIGHTS, --sw SET_WEIGHTS
                        Set a folder that contains pre-trained weights as
                        initial weights for simulations (default: None)
  --set_weights_epoch SET_WEIGHTS_EPOCH, --swe SET_WEIGHTS_EPOCH
                        In case of pre-trained weights we can also specify num
                        of epochs (stage of training) (default: 0)
  --fw FW, --fixed_weights FW
                        Fixed weight value for concept-role connections
                        (default: 10)
  --fwi FWI, --fixed_weights_identif FWI
                        Fixed weight value for identif-role connections
                        (default: 10)
  --cognate_percentage COGNATE_PERCENTAGE
                        Amount of sentences with cognates in test/training
                        sets (default: 0.35)
  --generate_training_num GENERATE_TRAINING_NUM
                        Sum of test/training sentences to be generated (only
                        if no input was set) (default: 2000)
  --title TITLE         Title for the plots (default: None)
  --sim SIM             training several simulations at once to take the
                        results' average (Monte Carlo approach) (default: 2)
  --sim_from SIM_FROM   To train several simulations with range other than (0,
                        number_of_simulations) you need to set the sim_from
                        and sim_to values (default: None)
  --sim_to SIM_TO       See sim_from (the simulations includes sim_to)
                        (default: None)
  --pron OVERT_PRONOUNS
                        Percentage of overt pronouns in es (default: 0)
  --threshold THRESHOLD
                        Threshold for performance of simulations. Any
                        simulations that performs has a percentage of correct
                        sentences < threshold are discarded (default: 0)
  --config CONFIG       Read arguments from file (default: False)
  --prodrop             Indicates that it is a pro-drop lang (default: False)
  --crole               If (role copy) is set, the produced role layer is
                        copied back to the comprehension layer (default:
                        False)
  --cinput              If (copy input) is set, the previous activation of the
                        input layer is stored (default: False)
  --debug               Debugging info for SRN layers and deltas (default:
                        False)
  --cs, --code-switching
                        Activate both languages during TESTing (default:
                        False)
  --nodlr               Keep lrate stable (final_lrate) (default: True)
  --gender              Include semantic gender for nouns (default: False)
  --monolingual         Do not include L2 lexicon (default: False)
  --comb-sem            Produce combined concepts instead of simple ones
                        (e.g., PARENT+M instead of FATHER) (default: True)
  --noeval              Do not evaluate test set (default: True)
  --eval_training       Evaluate training sets (default: False)
  --evaluate            Do not train, only evaluate test sets (default: False)
  --continue_training, --continue
                        Continue training for more epochs (default: False)
  --allow-free-structure, --af
                        The model is not given role information in the event
                        semantics and it is therefore allowed to use any
                        syntactic structure (which is important for testing,
                        e.g., priming) (default: False)
  --emb                 Represent semantics using word embeddings instead of
                        one-hot vectors. (default: False)
  --cognates            Run cognate experiment (default: False)
  --aux                 Run auxiliary asymmetry experiment (default: False)
  --tener               Run auxiliary asymmetry experiment and replace all
                        instances of "haber" with "tener" (default: False)
  --haber_frequency     Run auxiliary asymmetry experiment making haber and
                        tener perfect synonyms (default: False)
  --gender_error_experiment
                        Evaluate pronoun production (default: False)
  --flex_eval           Ignore mistakes on determiners (definiteness) and
                        tense (past, present) (default: False)
  --separate            Two hidden layers instead of one; separate hidden
                        layer of semantic and syntactic path (default: False)
```

The output is stored under the given results folder (-resdir, or by default "simulations/") in a csv format:

```
epoch	 produced_sentence	 target_sentence	 is_grammatical	 meaning	 is_code_switched produced_pos
19	a father has shown una llave .	a father has shown a key .	True	True	True det noun aux participle det noun .
19	the busy girl está corriendo .	the girl is running .	flex-True	False	True det adj noun aux participle .
19	she has given a ball .	she has given a ball .	True	True	False pron aux participle det noun .

target_pos	 correct_tense	 correct_definiteness	 message
det noun aux participle det noun .	True	True AGENT=indef,FATHER;AAL=SHOW;PATIENT=indef,KEY;E=PRESENT,PERFECT,AGENT,AAL,PATIENT,en
det noun aux participle .	True	True	AGENT=def,GIRL;AAL=RUN;E=PRESENT,PROG,AGENT,AAL,en
pron aux participle det noun .	True	True	AGENT=pron,GRANDMOTHER;AAL=GIVE;PATIENT=indef,BALL;E=PRESENT,PERFECT,AGENT,AAL,PATIENT,en
```

The default csv headers are: epoch, produced_sentence, target_sentence, is_grammatical, meaning, is_code_switched, switched_type, produced_pos, target_pos, correct_tense, correct_definiteness, message

Note: The input files for the gender error experiment can be found [here](https://github.com/xtsoukala/gender_error_experiment)

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

It it recommended to run the Bilingual Dual-path model using Python3.6 and above. It has been tested on MacOS and Ubuntu
 and seems to have encoding issues on Windows.
 
To install the requirements:

```
pip3 install -r requirements.txt
```

To run 4 simulations for 20 epochs that generate Spanish-English code-switched sentences you can run:
```
python3 src/start_dual_path.py --sim 4 --cs --resdir results
```

The results will be under the folder "simulations". If the flag "resdir" is used, the results will be under "simulations/results" (the name given at "resdir") otherwise they will be stored under simulations/year-month-day/hour_minutes_seconds_esen_sim4_h<number_hidden_units>_c<number_compressed_units>_fw<fixed_weights_value>_e<number_epochs>, 
where "esen" is the language pair, sim4 the number of simulations, h the number of hidden units and c the number of 
compress units. fw is the fixed weight between concepts and roles, and e20 the number of epochs.

To run a monolingual version you can run:

```
python3 src/start_dual_path.py --sim 4 --languages en --resdir english
```

and 

```
python3 src/start_dual_path.py --sim 4 --languages es --resdir spanish
```

which use the English-only or Spanish-only columns in /data/lexicon.csv and /data/structures.csv. 

If there are not enough resources (words) to generate unique sentences in the structures requested in structures.csv, you will need to do one of the following: i) increase the entries in lexicon.csv, ii) reduce the structures in structures.csv OR the percentage that a specific structure appears in the training/test sets (column: percentage_es or percentage_en, depending on the language) iii) decrease the number of generated sets (default: 2000 unique sentences, reduce to, e.g., 1800). 

Example error when generating English-only sentences with the default lexicon.csv and structures.csv: 

```
Generating input for 4 simulations using: ./data/lexicon.csv (lexicon) and ./data/structures.csv (structures)

The process timed out (limit: 240s). Remaining structures: 16 more structures: {('AGENT=pron;ACTION-LINKING=;EVENT-SEM=PRESENT,PROGRESSIVE,AGENT,ACTION-LINKING;TARGET-LANG=en', 'pron aux::present:progressive:singular participle:intrans::progressive')} (total: 2000).
```

The lexicon and structures can be altered via the .csv files. The default files used are under the folder "data", but any .csv file (with the correct columns) can be given as input:

```
python3 src/start_dual_path.py --structures path_to_new_structures --lexicon path_to_new_lexicon
```

To run the model in a different language pair, one will need to alter the lexicon, structures, and give as language a new code (e.g., "el" for Greek and morpheme_el for Greek words in the lexicon).

To see all the parameters of the model: 


```
python3 src/start_dual_path.py -h 
```

```
usage: start_dual_path.py [-h] [--hidden HIDDEN] [--compress COMPRESS]
                                                    [--epochs EPOCHS] [--l2_epoch L2_EPOCH]
                          [--l2_decimal_fraction L2_DECIMAL_FRACTION]
                          [--input INPUT] [--resdir RESDIR]
                          [--lexicon LEXICON] [--structures STRUCTURES]
                          [--trainingset TRAININGSET] [--testset TESTSET]
                          [--primingset PRIMINGSET]
                          [--languages [LANGUAGES ...]]
                          [--target_lang [TARGET_LANG ...]] [--lrate LRATE]
                          [--final_lrate FINAL_LRATE] [--momentum MOMENTUM]
                          [--set_weights SET_WEIGHTS]
                          [--set_weights_epoch SET_WEIGHTS_EPOCH] [--fw FW]
                          [--fwi FWI]
                          [--cognate_decimal_fraction COGNATE_DECIMAL_FRACTION]
                          [--exclude_cognates EXCLUDE_COGNATES]
                          [--cognate_list COGNATE_LIST]
                          [--false_friends_lexicon FALSE_FRIENDS_LEXICON]
                          [--concepts_to_evaluate CONCEPTS_TO_EVALUATE]
                          [--pron OVERT_PRONOUNS]
                          [--messageless_decimal_fraction MESSAGELESS_DECIMAL_FRACTION]
                          [--generate_training_num GENERATE_TRAINING_NUM]
                          [--generate_test_num GENERATE_TEST_NUM]
                          [--training_files_path TRAINING_FILES_PATH]
                          [--title TITLE] [--sim SIM] [--sim_from SIM_FROM]
                          [--sim_to SIM_TO] [--threshold THRESHOLD]
                          [--config_file CONFIG_FILE]
                          [--generator_timeout GENERATOR_TIMEOUT]
                          [--hidden_dev HIDDEN_DEV]
                          [--compress_dev COMPRESS_DEV] [--fw_dev FW_DEV]
                          [--epoch_dev EPOCH_DEV]
                          [--l2_decimal_dev L2_DECIMAL_DEV]
                          [--num_cognate_models_for_test_set NUM_COGNATE_MODELS_FOR_TEST_SET]
                          [--prodrop] [--crole] [--cinput] [--debug] [--cs]
                          [--nodlr] [--gender] [--noeval] [--eval_training]
                          [--evaluate] [--only_generate_test]
                          [--continue_training] [--allow-free-structure]
                          [--emb] [--cognates] [--false_friends] [--aux]
                          [--priming] [--tener] [--synonym]
                          [--gender_error_experiment] [--flex_eval]
                          [--separate] [--norandomization] [--defpro]
                          [--srn_only]

optional arguments:
  -h, --help            show this help message and exit
  --hidden HIDDEN       Number of hidden layer units. (default: 80)
  --compress COMPRESS, -c COMPRESS
                        Number of compress layer units. The size should be
                        approximately 2/3 of the hidden one (default: None)
  --epochs EPOCHS       Number of total training set iterations during (full)
                        training. (default: 20)
  --l2_epoch L2_EPOCH   # of epoch when L2 input gets introduced (default:
                        None)
  --l2_decimal_fraction L2_DECIMAL_FRACTION
                        Decimal fraction of L2 input (0.0-1.0) (default: 0.5)
  --input INPUT         (Input) folder that contains all input files (lexicon,
                        concepts etc) (default: None)
  --resdir RESDIR       Name of results folder, where the simulations will be
                        stored (default: None)
  --lexicon LEXICON     CSV file that contains lexicon and concepts (default:
                        None)
  --structures STRUCTURES
                        CSV file that contains the structures (default: None)
  --trainingset TRAININGSET, --training TRAININGSET
                        File name that contains the message-sentence pair for
                        training. (default: training.in)
  --testset TESTSET     Test set file name (default: None)
  --primingset PRIMINGSET
                        File name that contains the message-sentence pairs for
                        the priming experiment. (default: None)
  --languages [LANGUAGES ...]
                        To generate a new set, specify the languages (e.g.,
                        en, es) (default: ['en', 'es'])
  --target_lang [TARGET_LANG ...]
                        Values for the target language node. It may differ
                        from the input languages (e.g., lang=en but
                        target_lang=en es) (default: None)
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
                        of epochs (stage of training) (default: None)
  --fw FW, --fixed_weights FW
                        Fixed weight value for concept-role connections
                        (default: 15)
  --fwi FWI, --fixed_weights_identif FWI
                        Fixed weight value for identif-role connections
                        (default: 10)
  --cognate_decimal_fraction COGNATE_DECIMAL_FRACTION
                        Amount of sentences with cognates in test/training
                        sets (default: 0.3)
  --exclude_cognates EXCLUDE_COGNATES
                        Filename with concepts; exclude from cognate selection
                        the concepts of this list (default: None)
  --cognate_list COGNATE_LIST
                        Filename with concepts; use these instead of ones in
                        lexicon.csv (default: None)
  --false_friends_lexicon FALSE_FRIENDS_LEXICON
                        Csv file with false friends lexicon; use these in
                        lexicon.csv (default: None)
  --concepts_to_evaluate CONCEPTS_TO_EVALUATE
                        Filename with concepts of words that will become the
                        focus around code-switched points (e.g., cognates of
                        all models) (default: None)
  --pron OVERT_PRONOUNS
                        Decimal_fraction of overt Spanish pronouns (default:
                        0)
  --messageless_decimal_fraction MESSAGELESS_DECIMAL_FRACTION
                        Fraction of messageless sentences in training set
                        (default: 0)
  --generate_training_num GENERATE_TRAINING_NUM
                        Sum of test/training sentences to be generated (only
                        if no input was set) (default: 2000)
  --generate_test_num GENERATE_TEST_NUM
                        Total test sentences for experiments (default: 600)
  --training_files_path TRAINING_FILES_PATH
                        When generating test sentences, exclude the
                        training.in files under this path. (default: None)
  --title TITLE         Title for the plots (default: None)
  --sim SIM             training several simulations at once to take the
                        results' average (Monte Carlo approach) (default: 2)
  --sim_from SIM_FROM   To train several simulations with range other than (0,
                        number_of_simulations) you need to set the sim_from
                        and sim_to values (the simulations include sim_from
                        and sim_to) (default: None)
  --sim_to SIM_TO       See sim_from (the simulations include sim_to)
                        (default: None)
  --threshold THRESHOLD
                        Threshold for performance of simulations. Any
                        simulations that performs has a percentage of correct
                        sentences < threshold are discarded (default: 0)
  --config_file CONFIG_FILE
                        Read arguments from file (default: False)
  --generator_timeout GENERATOR_TIMEOUT
                        Number of seconds before the sentence generation
                        process times out (default: 60)
  --hidden_dev HIDDEN_DEV
                        Maximum deviation for the number of hidden layer units
                        when randomization is used. Defaults to 10. (default:
                        10)
  --compress_dev COMPRESS_DEV
                        Maximum deviation for the number of compress layer
                        units when randomization is used. Defaults to 10.
                        (default: 10)
  --fw_dev FW_DEV       Maximum deviation for the fixed weight value for
                        concept-role connections when randomization is used.
                        Defaults to 5. (default: 5)
  --epoch_dev EPOCH_DEV
                        Maximum deviation for the starting epoch/l2_epoch
                        value. Defaults to 2. (default: 2)
  --l2_decimal_dev L2_DECIMAL_DEV
                        Standard deviation for the decimal fraction of L2
                        input when randomization is used. Defaults to 0.08.
                        (default: 0.08)
  --num_cognate_models_for_test_set NUM_COGNATE_MODELS_FOR_TEST_SET
                        Number of cognate models to generate test sets for.
                        (default: 0)
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
  --noeval              Do not evaluate test set (default: True)
  --eval_training       Evaluate training sets (default: False)
  --evaluate            Do not train, only evaluate test sets (default: False)
  --only_generate_test  Do not run simulations (default: False)
  --continue_training   Continue training for more epochs (default: False)
  --allow-free-structure, --af
                        The model is not given role information in the event
                        semantics and it is therefore allowed to use any
                        syntactic structure (which is important for testing,
                        e.g., priming) (default: False)
  --emb                 Represent semantics using word embeddings instead of
                        one-hot vectors. (default: False)
  --cognates            Run cognate experiment (default: False)
  --false_friends, --ff
                        Run false friends experiment (default: False)
  --aux                 Run auxiliary asymmetry experiment (default: False)
  --priming             Run priming experiment (default: False)
  --tener               Run auxiliary asymmetry experiment and replace all
                        instances of "haber" with "tener" (default: False)
  --synonym             Run auxiliary asymmetry experiment making haber and
                        tener perfect synonyms (default: False)
  --gender_error_experiment
                        Evaluate pronoun production (default: False)
  --flex_eval           Ignore mistakes on determiners (definiteness) and
                        tense (past, present) (default: False)
  --separate            Two hidden layers instead of one; separate hidden
                        layer of semantic and syntactic path (default: False)
  --norandomization     By default, we sample the free parameters (fixed
                        weight, hidden/compress size, l2 decimal) within a
                        certain standard deviation. Using this flag
                        deactivates this setting. (default: True)
  --defpro              Merge def/indef/pron into a single unitwith different
                        activations (default: False)
  --srn_only            Run the SRN alone, without the semantic path (default:
                        False)
(base) ctsoukala@Charas-MBP dual_path %
(base) ctsoukala@Charas-MBP dual_path %
(base) ctsoukala@Charas-MBP dual_path %
(base) ctsoukala@Charas-MBP dual_path %
(base) ctsoukala@Charas-MBP dual_path %
(base) ctsoukala@Charas-MBP dual_path %
(base) ctsoukala@Charas-MBP dual_path %
(base) ctsoukala@Charas-MBP dual_path %
(base) ctsoukala@Charas-MBP dual_path %
(base) ctsoukala@Charas-MBP dual_path %
(base) ctsoukala@Charas-MBP dual_path %
(base) ctsoukala@Charas-MBP dual_path %
(base) ctsoukala@Charas-MBP dual_path %
(base) ctsoukala@Charas-MBP dual_path %
(base) ctsoukala@Charas-MBP dual_path %
(base) ctsoukala@Charas-MBP dual_path %
(base) ctsoukala@Charas-MBP dual_path %
(base) ctsoukala@Charas-MBP dual_path %
(base) ctsoukala@Charas-MBP dual_path %
(base) ctsoukala@Charas-MBP dual_path %
(base) ctsoukala@Charas-MBP dual_path %
(base) ctsoukala@Charas-MBP dual_path % python src/start_dual_path.py -h
usage: start_dual_path.py [-h] [--hidden HIDDEN] [--compress COMPRESS]
                          [--epochs EPOCHS] [--l2_epoch L2_EPOCH]
                          [--l2_decimal_fraction L2_DECIMAL_FRACTION]
                          [--input INPUT] [--resdir RESDIR]
                          [--lexicon LEXICON] [--structures STRUCTURES]
                          [--trainingset TRAININGSET] [--testset TESTSET]
                          [--primingset PRIMINGSET]
                          [--languages [LANGUAGES ...]]
                          [--target_lang [TARGET_LANG ...]] [--lrate LRATE]
                          [--final_lrate FINAL_LRATE] [--momentum MOMENTUM]
                          [--set_weights SET_WEIGHTS]
                          [--set_weights_epoch SET_WEIGHTS_EPOCH] [--fw FW]
                          [--fwi FWI]
                          [--cognate_decimal_fraction COGNATE_DECIMAL_FRACTION]
                          [--exclude_cognates EXCLUDE_COGNATES]
                          [--cognate_list COGNATE_LIST]
                          [--false_friends_lexicon FALSE_FRIENDS_LEXICON]
                          [--concepts_to_evaluate CONCEPTS_TO_EVALUATE]
                          [--pron OVERT_PRONOUNS]
                          [--messageless_decimal_fraction MESSAGELESS_DECIMAL_FRACTION]
                          [--generate_training_num GENERATE_TRAINING_NUM]
                          [--generate_test_num GENERATE_TEST_NUM]
                          [--training_files_path TRAINING_FILES_PATH]
                          [--title TITLE] [--sim SIM] [--sim_from SIM_FROM]
                          [--sim_to SIM_TO] [--threshold THRESHOLD]
                          [--config_file CONFIG_FILE]
                          [--generator_timeout GENERATOR_TIMEOUT]
                          [--hidden_dev HIDDEN_DEV]
                          [--compress_dev COMPRESS_DEV] [--fw_dev FW_DEV]
                          [--epoch_dev EPOCH_DEV]
                          [--l2_decimal_dev L2_DECIMAL_DEV]
                          [--num_cognate_models_for_test_set NUM_COGNATE_MODELS_FOR_TEST_SET]
                          [--prodrop] [--crole] [--cinput] [--debug] [--cs]
                          [--nodlr] [--gender] [--noeval] [--eval_training]
                          [--evaluate] [--only_generate_test]
                          [--continue_training] [--allow-free-structure]
                          [--emb] [--cognates] [--false_friends] [--aux]
                          [--priming] [--tener] [--synonym]
                          [--gender_error_experiment] [--flex_eval]
                          [--separate] [--norandomization] [--defpro]
                          [--srn_only]

optional arguments:
  -h, --help            show this help message and exit
  --hidden HIDDEN       Number of hidden layer units. (default: 80)
  --compress COMPRESS, -c COMPRESS
                        Number of compress layer units. The size should be
                        approximately 2/3 of the hidden one (default: None)
  --epochs EPOCHS       Number of total training set iterations during (full)
                        training. (default: 20)
  --l2_epoch L2_EPOCH   # of epoch when L2 input gets introduced (default:
                        None)
  --l2_decimal_fraction L2_DECIMAL_FRACTION
                        Decimal fraction of L2 input (0.0-1.0) (default: 0.5)
  --input INPUT         (Input) folder that contains all input files (lexicon,
                        concepts etc) (default: None)
  --resdir RESDIR       Name of results folder, where the simulations will be
                        stored (default: None)
  --lexicon LEXICON     CSV file that contains lexicon and concepts (default:
                        None)
  --structures STRUCTURES
                        CSV file that contains the structures (default: None)
  --trainingset TRAININGSET, --training TRAININGSET
                        File name that contains the message-sentence pair for
                        training. (default: training.in)
  --testset TESTSET     Test set file name (default: None)
  --primingset PRIMINGSET
                        File name that contains the message-sentence pairs for
                        the priming experiment. (default: None)
  --languages [LANGUAGES ...]
                        To generate a new set, specify the languages (e.g.,
                        en, es) (default: ['en', 'es'])
  --target_lang [TARGET_LANG ...]
                        Values for the target language node. It may differ
                        from the input languages (e.g., lang=en but
                        target_lang=en es) (default: None)
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
                        of epochs (stage of training) (default: None)
  --fw FW, --fixed_weights FW
                        Fixed weight value for concept-role connections
                        (default: 15)
  --fwi FWI, --fixed_weights_identif FWI
                        Fixed weight value for identif-role connections
                        (default: 10)
  --cognate_decimal_fraction COGNATE_DECIMAL_FRACTION
                        Amount of sentences with cognates in test/training
                        sets (default: 0.3)
  --exclude_cognates EXCLUDE_COGNATES
                        Filename with concepts; exclude from cognate selection
                        the concepts of this list (default: None)
  --cognate_list COGNATE_LIST
                        Filename with concepts; use these instead of ones in
                        lexicon.csv (default: None)
  --false_friends_lexicon FALSE_FRIENDS_LEXICON
                        Csv file with false friends lexicon; use these in
                        lexicon.csv (default: None)
  --concepts_to_evaluate CONCEPTS_TO_EVALUATE
                        Filename with concepts of words that will become the
                        focus around code-switched points (e.g., cognates of
                        all models) (default: None)
  --pron OVERT_PRONOUNS
                        Decimal_fraction of overt Spanish pronouns (default:
                        0)
  --messageless_decimal_fraction MESSAGELESS_DECIMAL_FRACTION
                        Fraction of messageless sentences in training set
                        (default: 0)
  --generate_training_num GENERATE_TRAINING_NUM
                        Sum of test/training sentences to be generated (only
                        if no input was set) (default: 2000)
  --generate_test_num GENERATE_TEST_NUM
                        Total test sentences for experiments (default: 600)
  --training_files_path TRAINING_FILES_PATH
                        When generating test sentences, exclude the
                        training.in files under this path. (default: None)
  --title TITLE         Title for the plots (default: None)
  --sim SIM             training several simulations at once to take the
                        results' average (Monte Carlo approach) (default: 2)
  --sim_from SIM_FROM   To train several simulations with range other than (0,
                        number_of_simulations) you need to set the sim_from
                        and sim_to values (the simulations include sim_from
                        and sim_to) (default: None)
  --sim_to SIM_TO       See sim_from (the simulations include sim_to)
                        (default: None)
  --threshold THRESHOLD
                        Threshold for performance of simulations. Any
                        simulations that performs has a percentage of correct
                        sentences < threshold are discarded (default: 0)
  --config_file CONFIG_FILE
                        Read arguments from file (default: False)
  --generator_timeout GENERATOR_TIMEOUT
                        Number of seconds before the sentence generation
                        process times out (default: 60)
  --hidden_dev HIDDEN_DEV
                        Maximum deviation for the number of hidden layer units
                        when randomization is used. Defaults to 10. (default:
                        10)
  --compress_dev COMPRESS_DEV
                        Maximum deviation for the number of compress layer
                        units when randomization is used. Defaults to 10.
                        (default: 10)
  --fw_dev FW_DEV       Maximum deviation for the fixed weight value for
                        concept-role connections when randomization is used.
                        Defaults to 5. (default: 5)
  --epoch_dev EPOCH_DEV
                        Maximum deviation for the starting epoch/l2_epoch
                        value. Defaults to 2. (default: 2)
  --l2_decimal_dev L2_DECIMAL_DEV
                        Standard deviation for the decimal fraction of L2
                        input when randomization is used. Defaults to 0.08.
                        (default: 0.08)
  --num_cognate_models_for_test_set NUM_COGNATE_MODELS_FOR_TEST_SET
                        Number of cognate models to generate test sets for.
                        (default: 0)
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
  --noeval              Do not evaluate test set (default: True)
  --eval_training       Evaluate training sets (default: False)
  --evaluate            Do not train, only evaluate test sets (default: False)
  --only_generate_test  Do not run simulations (default: False)
  --continue_training   Continue training for more epochs (default: False)
  --allow-free-structure, --af
                        The model is not given role information in the event
                        semantics and it is therefore allowed to use any
                        syntactic structure (which is important for testing,
                        e.g., priming) (default: False)
  --emb                 Represent semantics using word embeddings instead of
                        one-hot vectors. (default: False)
  --cognates            Run cognate experiment (default: False)
  --false_friends, --ff
                        Run false friends experiment (default: False)
  --aux                 Run auxiliary asymmetry experiment (default: False)
  --priming             Run priming experiment (default: False)
  --tener               Run auxiliary asymmetry experiment and replace all
                        instances of "haber" with "tener" (default: False)
  --synonym             Run auxiliary asymmetry experiment making haber and
                        tener perfect synonyms (default: False)
  --gender_error_experiment
                        Evaluate pronoun production (default: False)
  --flex_eval           Ignore mistakes on determiners (definiteness) and
                        tense (past, present) (default: False)
  --separate            Two hidden layers instead of one; separate hidden
                        layer of semantic and syntactic path (default: False)
  --norandomization     By default, we sample the free parameters (fixed
                        weight, hidden/compress size, l2 decimal) within a
                        certain standard deviation. Using this flag
                        deactivates this setting. (default: True)
  --defpro              Merge def/indef/pron into a single unitwith different
                        activations (default: False)
  --srn_only            Run the SRN alone, without the semantic path (default:
                        False)
```

The output is stored under "simulations", under the given results folder (--resdir, or by default a time-stamp-derived folder) in a csv format:

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

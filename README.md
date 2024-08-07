# Bilingual Dual-path model

![Bilingual dual-path model architecture](img/bilingual-dual-path.png)

Dual-path is a computational model of (monolingual) sentence production by [Chang, 2002](https://sites.google.com/site/sentenceproductionmodel/Home/chang-2002). Tutorial: https://sites.google.com/site/sentenceproductionmodel/Home/tutorial

The Bilingual Dual-path model is an extension of Dual-path, aiming to simulate bilingual sentence production and code-switching.

# How it works

The model is trained on pairs of (so far artificially generated) sentences and the corresponding message, which, in turn, contains thematic roles (which I've named AGENT, PATIENT, but you can use a different annotation) that correspond to a concept. For instance, here are two phrases from a training set (the format is: sentence ## message):

```
a waiter carries a book .## AGENT=indef,WAITER;ACTION-LINKING=CARRY;PATIENT=indef,BOOK;EVENT-SEM=SIMPLE,PRESENT,AGENT,ACTION-LINKING,PATIENT;TARGET-LANG=en
she is focused .## AGENT=pron,MOTHER;ACTION-LINKING=BE;ATTR=FOCUSED,F;EVENT-SEM=SIMPLE,PRESENT,AGENT,ACTION-LINKING,ATTR;TARGET-LANG=en
```

The model is trained on these examples in the following manner: it receives a message (e.g.: `AGENT` in the `role` layer is linked to `WAITER` in the `CONCEPT` layer, and also to `indef` in the `identifier` layer; at the same time, `PATIENT` is linked to `BOOK` etc) and it outputs a sentence word-by-word. Each produced word is also given as input (`input` layer), and if the target is different than the produced word, the error is backpropagated. Note that the hidden layer is reset each time there is a new message, so there is no context between sentences.

# Installation

To run this project you need a Python version >= 3.6. To install the requirements, it it recommended that you first create and activate a virtual environment. There are several ways to create a virtual environment; for instance:

- `conda create -y --name dual python=3.11`, where `dual` is the name of the environment.
To activate it, run:
- `conda activate dual`

Once you are in the virtual environment, install all Python packages:

```
pip install -r requirements.txt
```

It has been tested on MacOS, Ubuntu, and WSL on Windows; it seems to have encoding issues on (non-WSL) Windows.

**Note**: If you have issues installing the dependencies on an M1 Mac, try running: `xcodebuild -runFirstLaunch` and repeat the installation process.

# How to run the simulations

To run `4 simulations` for `20 epochs` that generate Spanish-English `code-switched sentences`, and store the results under a folder named `results`, run:

```
python src/start_dual_path.py --sim 4 --epochs 20 --cs --resdir results --lang es en
```

All results are stored under the folder `simulations`. If the flag `--resdir` is used, the results will be under `simulations/results` (the name given at `--resdir`) otherwise they will be stored under:

`simulations/year-month-day/hour_minutes_seconds_esen_sim4_h<number_hidden_units>_c<number_compressed_units>_fw<fixed_weights_value>_e<number_epochs>`

where `esen` is the language pair (Spanish-English in this case), `sim4` the number of simulations, `h` the number of hidden units and `c` the number of compress units. `fw` is the fixed weight between concepts and roles, and `e20` the number of epochs.

## Lexicon and Structures

The default lexicon and structure files are under the `data` folder (`/data/lexicon.csv` and `/data/structures.csv`). **These are needed if you want to generate random sentences using specific structures.** The .csv files can be altered, and any .csv file (containing the expected columns) can be given as input:

```
python src/start_dual_path.py --structures path_to_new_structures --lexicon path_to_new_lexicon
```

An example of the lexicon headers and content:

```csv
morpheme_es,morpheme_en,concept,compositional_concept,pos,semantic_gender,syntactic_gender_es,type,tense,aspect,number,inactive,is_cognate,is_false_friend
la,the,,,det,,F,def,,,,,,
el,the,,,det,,M,def,,,,,,
una,a,,,det,,F,indef,,,,,,
él,he,,,pron,,M,subject,,,,,,
ella,she,,,pron,,F,subject,,,,,,
hombre,man,MAN,HUMAN,noun,M,M,,,,,,
niño,boy,BOY,CHILD,noun,M,M,,,,,,
```

**Note**: The .csv currently uses comma as the column separator. If you open it with MS Excel you might experience encoding issues. If it's not displayed correctly, I recommend using **[LibreOffice](https://www.libreoffice.org/)**.

### Structures

The basic idea of the model is that it expresses ("converts") a semantic message into a written sentence. The structures.csv file contains a generic message and its generic Part of Speech (POS) equivalent.

Let's take the second example from [this file](data/code-switching/structures.csv):

The generic POS is:

`det noun:animate aux::present:progressive:singular participle:intrans::progressive`

and it corresponds to this generic message:

`AGENT=;ACTION-LINKING=;EVENT-SEM=PRESENT,PROGRESSIVE,AGENT,ACTION-LINKING`

Based on this information and the [lexicon file](data/code-switching/lexicon.csv), the [corpus_generator](src/modules/corpus_generator.py) script [picks a random morpheme](src/modules/corpus_generator.py#369) (word) of that POS and target language.

For instance, to fill the `det` (determiner) position, the script would randomly select one of the [first four items](data/code-switching/lexicon.csv) from the corresponding column; morpheme_en for English, morpheme_es for Spanish.

In some cases, we are interested in restricting the POS. For instance, we might want only animate nouns. In that case, the POS has the filter `noun:animate` and the script only looks for items with a semantic gender (6th column in the lexicon). Some items, such as verbs and participles, have multiple properties: type, tense, aspect, number (see the corresponding lexicon.csv headers). If you notice the POS example above, the auxiliary verb is followed by two colons. This means that the first property (the type) is of no interest, and is therefore left blank, and the second colon refers to the tense, which is "present" in this example.

### New language pair

To run the model in a different language pair, one will need to alter the lexicon, structures, and give a new language code (e.g., `el` for Greek and `morpheme_el` for Greek words in the lexicon). Make sure you give a 2-letter language code for each language (e.g., `morpheme_el` in the first column of lexicon.csv if the L1 is Greek, and `morpheme_es` in the second column if the L2 is Spanish.)

## Monolingual version

To run a monolingual version:

```
python src/start_dual_path.py --sim 4 --languages en --resdir english
```

and 

```
python src/start_dual_path.py --sim 4 --languages es --resdir spanish
```

which use the English-only (`morpheme_en`) or Spanish-only (`morpheme_es`) columns in the lexicon (`lexicon.csv`) and structures (`structures.csv`).

**Note**: If there are not enough resources (words) to generate unique sentences in the structures requested in structures.csv, you will need to do one of the following: 

1. increase the entries in lexicon.csv
2. reduce the structures in structures.csv OR the percentage that a specific structure appears in the training/test sets (column: percentage_es or percentage_en, depending on the language) 
3. decrease the number of generated sets (default: 2000 unique sentences, reduce to, e.g., 1800)

## Late bilingual models

To simulate late bilinguals (that are exposed to the L2 later in life), you must follow a two-step process:

1. train a monolingual version with the L1
2. Use the weights of the monolingual model to train a bilingual model.

For instance, if you want to train a late bilingual model with L1 English and L2 Spanish for a total of 40 epochs, you first need to train a *monolingual* English model for the amount of epochs that the speakers are monolingual-only (e.g., 10 for 1/4th of the total epochs). In the monolingual simulation you use the same bilingual lexicon as the final one, but you need to specify that you do not want any L2 input (`--l2-decimal-fraction 0`). In the `--lang` argument the L1 comes first, so in this case provide `--lang en es`, or `--lang es en` for L1 Spanish.

For monolingual English:

```
python src/start_dual_path.py --lang en es --lexicon  data/code-switching/lexicon.csv --structures data/code-switching/structures.csv --epochs 10 --sim 4 --l2-decimal-fraction 0 --resdir monolingual_model
```

After this model is trained:
- using the `--sw` (`--set-weights`) flag, provide the trained weights from the previous simulations (folder: `simulations/monolingual_model`)
- provide the same lexicon, structures, and languages as before
- specify that the L2 epoch (`--l2-epoch`) starts at 10 (the last epoch of the monolingual model)
- If you want the test the model's code-switching behavior already, use the `--cs` flag.

```
python src/start_dual_path.py --epochs 40 --lexicon data/code-switching/lexicon.csv  --structures data/code-switching/structures.csv --sim 4 --l2-epoch 10 --lang en es --sw simulations/monolingual_model --cs
```

**Note**: The main difference between the `--l2-epoch` and `--swe` flags is that in the latter case, the `swe`-th weight becomes the initial training weight, and training continues for `--epoch` more epochs. Whereas in the case of `--l2-epoch`, the initial model weights stay intact and training continues for `--epoch` minus `--l2-epoch` epochs.
- For instance, if `epoch` is set to 10, and `l2-epoch` is set to 2, the model will be trained for 8 more epochs. If, instead, `swe` is set to 2, the model will be trained for 10 epochs, using swe 2 as the intial training weights.

## Continue training a model

If you have trained a model for fewer epochs than you would like, and you want to continue the training process for more epochs with the same input, provide the weights (`--sw`), the last epoch of the trained model (`--swe`, meaning the epoch where you want to start training from, e.g., 10 in the monolingual example above), the final epoch you want to reach, and use the `--continue` flag. The input is implicitly copied and you do not need to specify it. For instance, to train the monolingual version above to a total of 40 epochs instead of 10, run:

```
python src/start_dual_path.py --sw simulations/monolingual --swe 10 --epochs 40 --input simulations/monolingual/input --sim 4 --continue --resdir monolingual_40_epochs
```

# Simulation results

As mentioned above, the output is stored under `simulations`, under the given results folder (`--resdir`, or, by default, a time-stamp-derived folder).

A results folder will contain at least the following files:

1. all_results.csv
2. performance.csv
3. a collective performance graph, named <num_of_simulations>_performance.png
4. commandline_args.txt
5. `input` folder
6. a numbered folder for each simulation (e.g., `1`, `2`, `3`, if 3 simulations were ran)

- `all_results.csv` contains information such as the epoch and network (simulation) number, the produced and target sentences, whether that sentence is grammatical and expresses the intended meaning etc:

```csv
epoch,produced_sentence,target_sentence,is_grammatical,meaning,is_code_switched,switched_type,pos_of_switch_point,first_switch_position,produced_pos,target_pos,correct_tense,correct_definiteness,message,entropy,l2_epoch,target_has_cognate,target_has_false_friend,network_num,switch_from

10,he arrives .,he arrives .,True,1,0,False,False,None,pron verb .,pron verb .,True,True,"AGENT=pron,HOST;ACTION-LINKING=ARRIVE;EVENT-SEM=SIMPLE,PRESENT,AGENT,ACTION-LINKING;TARGET-LANG=en",0.08808799 0.104491316 0.00096188975,0,False,False,4,en
10,a short dog kicks the ball .,a short dog kicks the ball .,True,1,0,False,False,None,det adj noun verb det noun .,det adj noun verb det noun .,True,True,"AGENT=indef,DOG;AGENT-MOD=SHORT;ACTION-LINKING=KICK;PATIENT=def,BALL;EVENT-SEM=SIMPLE,PRESENT,AGENT,AGENT-MOD,ACTION-LINKING,PATIENT;TARGET-LANG=en",0.0016367333 0.10060888 0.10661055 0.07778448 0.0034413738 0.024632895 0.00010319505,0,False,False,4,en
10,she has swum .,she has swum .,True,1,0,False,False,None,pron aux participle .,pron aux participle .,True,True,"AGENT=pron,GRANDMOTHER;ACTION-LINKING=SWIM;EVENT-SEM=PRESENT,PERFECT,AGENT,ACTION-LINKING;TARGET-LANG=en",0.07822028 0.0007833609 0.6524906 0.0043510366,0,False,False,4,en
10,the aunt is tired .,the aunt is tired .,True,1,0,False,False,None,det noun verb adverb .,det noun verb adverb .,True,True,"AGENT=def,AUNT;ACTION-LINKING=BE;ATTR=TIRED;EVENT-SEM=SIMPLE,PRESENT,AGENT,ACTION-LINKING,ATTR;TARGET-LANG=en",0.009499092 0.11451133 0.0012939837 0.11942399 6.0327926e-05,0,False,False,4,en
```

- `performance.csv` contains the same information, but aggregated per epoch and network, and coded so that it can be plotted in `<simulations_num>_performance.png`. The current `performance.csv` headers are:

```csv
epoch,network_num,meaning,code_switched,intersentential,ambiguous,alternational,insertional,is_grammatical,strict_grammatical,total_sentences,l2_epoch,meaning_percentage,grammaticality_percentage,strict_grammaticality_percentage,code_switched_percentage,insertional_percentage,alternational_percentage,ambiguous_percentage,intersentential_percentage
```

- `commandline_args.txt` contains the arguments given to the model (see section below).

- the `input` folder 


<img width="156" alt="folder_structure" src="https://user-images.githubusercontent.com/3914528/196377836-0576e427-0de7-4c10-99ad-21a95f2ecaac.png">

The `lexicon.csv` and `structures.csv` are the files you provided as `--lexicon` and `--structures`. Based on those, the `*.in` files are generated, and they contain the values of the respective layers. For instance, `roles.in` contains:

```
AGENT
AGENT-MOD
ACTION-LINKING
PATIENT
ATTR
RECIPIENT
```

- simulation folders: each network (simulation) contains its own training and test set, and different intialization weights. The simulation folders (e.g., `1` for the first network) contain a `test.in` and `training.in` file with messages and target sentences; a `test.csv` with the results, which are then aggregated into `all_results.csv` mentioned above; and the actual weights, which are stored under the folder `weights` and are numbered per epoch (`w0.lz4` for epoch 0 [the random initialization], `w1.lz4` for the first epoch, `w10.lz4` for the 10th epoch etc.)


# Model parameters

To see all the model parameters:

```
python src/start_dual_path.py -h 
```

```
usage: start_dual_path.py [-h] [--hidden HIDDEN] [--compress COMPRESS]
                          [--epochs EPOCHS] [--l2-epoch L2_EPOCH]
                          [--l2-decimal-fraction L2_DECIMAL_FRACTION]
                          [--input INPUT] [--resdir RESDIR]
                          [--lexicon LEXICON] [--structures STRUCTURES]
                          [--trainingset TRAININGSET] [--testset TESTSET]
                          [--primingset PRIMINGSET]
                          [--languages [LANGUAGES [LANGUAGES ...]]]
                          [--target-lang [TARGET_LANG [TARGET_LANG ...]]]
                          [--lrate LRATE] [--final-lrate FINAL_LRATE]
                          [--momentum MOMENTUM] [--set-weights SET_WEIGHTS]
                          [--set-weights-epoch SET_WEIGHTS_EPOCH] [--fw FW]
                          [--fwi FWI]
                          [--cognate-decimal-fraction COGNATE_DECIMAL_FRACTION]
                          [--exclude-cognates EXCLUDE_COGNATES]
                          [--cognate-list COGNATE_LIST]
                          [--false-friends-lexicon FALSE_FRIENDS_LEXICON]
                          [--concepts-to-evaluate CONCEPTS_TO_EVALUATE]
                          [--messageless-decimal-fraction MESSAGELESS_DECIMAL_FRACTION]
                          [--generate-training-num GENERATE_TRAINING_NUM]
                          [--generate-test-num GENERATE_TEST_NUM]
                          [--training-files-path TRAINING_FILES_PATH]
                          [--title TITLE] [--sim SIM] [--sim-from SIM_FROM]
                          [--sim-to SIM_TO] [--threshold THRESHOLD]
                          [--config-file CONFIG_FILE]
                          [--generator-timeout GENERATOR_TIMEOUT]
                          [--hidden-dev HIDDEN_DEV]
                          [--compress-dev COMPRESS_DEV] [--fw-dev FW_DEV]
                          [--epoch-dev EPOCH_DEV]
                          [--l2-decimal-dev L2_DECIMAL_DEV]
                          [--num-cognate-models-for-test-set NUM_COGNATE_MODELS_FOR_TEST_SET]
                          [--L1-overt-pronouns L1_OVERT_PRONOUNS]
                          [--L2-overt-pronouns L2_OVERT_PRONOUNS] [--crole]
                          [--cinput] [--debug] [--cs] [--nodlr] [--gender]
                          [--noeval] [--eval-training] [--evaluate]
                          [--only-generate-test] [--continue-training]
                          [--allow-free-structure] [--emb] [--cognates]
                          [--false-friends] [--aux] [--priming] [--tener]
                          [--synonym] [--gender-error-experiment]
                          [--flex-eval] [--separate] [--norandomization]
                          [--defpro] [--srn-only]

optional arguments:
  -h, --help            show this help message and exit
  --hidden HIDDEN       Number of hidden layer units. (default: 80)
  --compress COMPRESS, -c COMPRESS
                        Number of compress layer units. The size should be
                        approximately 2/3 of the hidden one (default: None)
  --epochs EPOCHS       Number of total training set iterations during (full)
                        training. (default: 20)
  --l2-epoch L2_EPOCH   # of epoch when L2 input gets introduced (default:
                        None)
  --l2-decimal-fraction L2_DECIMAL_FRACTION
                        Decimal fraction of L2 input (0.0-1.0). 0 means no L2
                        input (monolingual only), 1 means only L2 input.
                        (default: 0.5)
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
  --languages [LANGUAGES [LANGUAGES ...]]
                        To generate a new set, specify the languages (e.g.,
                        en, es) (default: ['en', 'es'])
  --target-lang [TARGET_LANG [TARGET_LANG ...]]
                        Values for the target language node. It may differ
                        from the input languages (e.g., lang=en but
                        target_lang=en es) (default: None)
  --lrate LRATE         Learning rate (default: 0.1)
  --final-lrate FINAL_LRATE, --flrate FINAL_LRATE
                        Final learning rate after linear decrease. If not set,
                        rate does not decrease (default: 0.02)
  --momentum MOMENTUM   Amount of previous weight changes that are taken into
                        account (default: 0.9)
  --set-weights SET_WEIGHTS, --sw SET_WEIGHTS
                        Set a folder that contains pre-trained weights as
                        initial weights for simulations (default: None)
  --set-weights-epoch SET_WEIGHTS_EPOCH, --swe SET_WEIGHTS_EPOCH
                        In case of pre-trained weights we can also specify num
                        of epochs (stage of training) (default: None)
  --fw FW, --fixed-weights FW
                        Fixed weight value for concept-role connections
                        (default: 15)
  --fwi FWI, --fixed-weights-identif FWI
                        Fixed weight value for identif-role connections
                        (default: 10)
  --cognate-decimal-fraction COGNATE_DECIMAL_FRACTION
                        Amount of sentences with cognates in test/training
                        sets (default: 0.3)
  --exclude-cognates EXCLUDE_COGNATES
                        Filename with concepts; exclude from cognate selection
                        the concepts of this list (default: None)
  --cognate-list COGNATE_LIST
                        Filename with concepts; use these instead of ones in
                        lexicon.csv (default: None)
  --false-friends-lexicon FALSE_FRIENDS_LEXICON
                        Csv file with false friends lexicon; use these in
                        lexicon.csv (default: None)
  --concepts-to-evaluate CONCEPTS_TO_EVALUATE
                        Filename with concepts of words that will become the
                        focus around code-switched points (e.g., cognates of
                        all models) (default: None)
  --messageless-decimal-fraction MESSAGELESS_DECIMAL_FRACTION
                        Fraction of messageless sentences in training set
                        (default: 0)
  --generate-training-num GENERATE_TRAINING_NUM
                        Sum of test/training sentences to be generated (only
                        if no input was set) (default: 2000)
  --generate-test-num GENERATE_TEST_NUM
                        Total test sentences for experiments (default: 600)
  --training-files-path TRAINING_FILES_PATH
                        When generating test sentences, exclude the
                        training.in files under this path. (default: None)
  --title TITLE         Title for the plots (default: None)
  --sim SIM             training several simulations at once to take the
                        results' average (Monte Carlo approach) (default: 2)
  --sim-from SIM_FROM   To train several simulations with range other than (0,
                        number_of_simulations) you need to set the sim_from
                        and sim_to values (the simulations include sim_from
                        and sim_to) (default: None)
  --sim-to SIM_TO       See sim_from (the simulations include sim_to)
                        (default: None)
  --threshold THRESHOLD
                        Threshold for performance of simulations. Any
                        simulations that performs has a percentage of correct
                        sentences < threshold are discarded (default: 0)
  --config-file CONFIG_FILE
                        Read arguments from file (default: False)
  --generator-timeout GENERATOR_TIMEOUT
                        Number of seconds before the sentence generation
                        process times out (default: 120)
  --hidden-dev HIDDEN_DEV
                        Maximum deviation for the number of hidden layer units
                        when randomization is used. (default: 10)
  --compress-dev COMPRESS_DEV
                        Maximum deviation for the number of compress layer
                        units when randomization is used. (default: 10)
  --fw-dev FW_DEV       Maximum deviation for the fixed weight value for
                        concept-role connections when randomization is used.
                        (default: 5)
  --epoch-dev EPOCH_DEV
                        Maximum deviation for the starting epoch/l2_epoch
                        value. (default: 0)
  --l2-decimal-dev L2_DECIMAL_DEV
                        Standard deviation for the decimal fraction of L2
                        input when randomization is used. (default: 0.08)
  --num-cognate-models-for-test-set NUM_COGNATE_MODELS_FOR_TEST_SET
                        Number of cognate models to generate test sets for.
                        (default: 0)
  --L1-overt-pronouns L1_OVERT_PRONOUNS
                        Decimal fraction of overt L1 pronouns. By default it's
                        1.0, which indicates that it's a non pro-drop language
                        (default: 1.0)
  --L2-overt-pronouns L2_OVERT_PRONOUNS
                        Decimal fraction of overt L2 pronouns. By default it's
                        1.0, which indicates that it's a non pro-drop language
                        (default: 1.0)
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
  --eval-training       Evaluate training sets (default: False)
  --evaluate            Do not train, only evaluate test sets (default: False)
  --only-generate-test  Do not run simulations (default: False)
  --continue-training   Continue training for more epochs (default: False)
  --allow-free-structure, --af
                        The model is not given role information in the event
                        semantics and it is therefore allowed to use any
                        syntactic structure (which is important for testing,
                        e.g., priming) (default: False)
  --emb                 Represent semantics using word embeddings instead of
                        one-hot vectors. (default: False)
  --cognates            Run cognate experiment (default: False)
  --false-friends, --ff
                        Run false friends experiment (default: False)
  --aux                 Run auxiliary asymmetry experiment (default: False)
  --priming             Run priming experiment (default: False)
  --tener               Run auxiliary asymmetry experiment and replace all
                        instances of "haber" with "tener" (default: False)
  --synonym             Run auxiliary asymmetry experiment making haber and
                        tener perfect synonyms (default: False)
  --gender-error-experiment
                        Evaluate pronoun production (default: False)
  --flex-eval           Ignore mistakes on determiners (definiteness) and
                        tense (past, present) (default: False)
  --separate            Two hidden layers instead of one; separate hidden
                        layer of semantic and syntactic path (default: False)
  --norandomization     By default, we sample the free parameters (fixed
                        weight, hidden/compress size, l2 decimal) within a
                        certain standard deviation. Using this flag
                        deactivates this setting. (default: True)
  --defpro              Merge def/indef/pron into a single unit with different
                        activations (default: False)
  --srn-only            Run the SRN alone, without the semantic path (default:
                        False)
```

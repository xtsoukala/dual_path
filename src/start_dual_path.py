#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import json
import argparse
from numpy import around as round
from modules import (os, sys, logging, InputFormatter, DualPath, Plotter, copy_files, datetime,
                     Process, cpu_count, pd, create_dataframes_for_plots)


def create_input_for_simulation(results_directory, sets, training_num, num_test, l2_decimal, auxiliary_experiment,
                                simulation_number, randomize, l2_decimal_dev):
    sets.set_new_results_dir(f"{results_directory}/{simulation_number}")
    sets.random.seed(simulation_number)  # set new seed each time we run a new simulation
    if randomize and l2_decimal:
        l2_decimal = round(sets.random.normal(l2_decimal, l2_decimal_dev), decimals=2)
        print(f"Simulation {simulation_number}: L1 decimal fraction: {1. - l2_decimal:.2}, "
              f"L2 decimal fraction: {l2_decimal}")
    test_set, training_set = sets.generate_general(num_training=training_num, num_test=num_test, l2_decimal=l2_decimal)
    if auxiliary_experiment:
        sets.aux_experiment = True
        sets.generate_auxiliary_experiment_sentences(training_set=training_set, l2_decimal=l2_decimal)


def calculate_testset_size(num_training, test_set_decimal=0.2):
    """
    :param num_training: Number of training sentences
    :param test_set_decimal: default: 0.2 (20%) of sentences are set aside for testing. (80%: training)
    :return: Number of sentences for training and test sets
    """
    return int((num_training * 100 / 80) * test_set_decimal)


def check_given_input_path(input_path):
    if not os.path.isfile(os.path.join(input_path, "test.in")) and '/input' not in input_path:
        corrected_dir = os.path.join(input_path, "input")  # the user may have forgotten to add the 'input' dir
        if os.path.exists(corrected_dir):
            input_path = corrected_dir
        else:
            sys.exit(f'No input folder found in the path ({input_path})')
    logging.info(f"Predefined input folder ({input_path}), will use that instead of generating a new set")
    return input_path


if __name__ == "__main__":
    def positive_int(x):
        pos_int = int(x)
        if pos_int <= 0:
            raise argparse.ArgumentTypeError(f"{x} is invalid: only use positive int value")
        return pos_int


    def non_negative_int(x):  # includes zero
        non_neg_int = int(x)
        if non_neg_int < 0:
            raise argparse.ArgumentTypeError(f"{x} is invalid: only use non negative int value")
        return non_neg_int


    def decimal_fraction(x):
        x = float(x)
        if x > 1.0:
            raise argparse.ArgumentTypeError(f"{x} is not allowed: the range is between 0.0 and 1.0")
        return x

    """class LoadFromFile(argparse.Action):
        def __call__(self, parser, namespace, values, option_string=None):
            with values as f:
                parser.parse_args(f.read().split(), namespace)"""

    parser = argparse.ArgumentParser(formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument('--hidden', help='Number of hidden layer units.', type=positive_int, default=80)
    parser.add_argument('--compress', '-c', help='Number of compress layer units. The size should be approximately 2/3 '
                                                 'of the hidden one', type=positive_int)
    parser.add_argument('--epochs', type=positive_int, default=20,
                        help='Number of total training set iterations during (full) training.')
    parser.add_argument('--l2_epoch', help='# of epoch when L2 input gets introduced', type=positive_int)
    parser.add_argument('--l2_decimal_fraction', help='Decimal fraction of L2 input (0.0-1.0)', type=decimal_fraction,
                        default=0.5)
    parser.add_argument('--input', help='(Input) folder that contains all input files (lexicon, concepts etc)')
    """ input-related arguments. Some are redundant: all the user needs to specify is the input folder """
    parser.add_argument('--lexicon', help='CSV file that contains lexicon and concepts')
    parser.add_argument('--structures', help='CSV file that contains the structures')
    parser.add_argument('--trainingset', '--training', default="training.in",
                        help='File name that contains the message-sentence pair for training.')
    parser.add_argument('--testset', help='Test set file name')
    parser.add_argument('--languages', help='To generate a new set, specify the languages (e.g., en, es)', nargs='*',
                        default=['en', 'es'], type=str.lower)
    parser.add_argument('--target_lang', nargs='*', help='Values for the target language node. It may differ from the '
                                                         'input languages (e.g., lang=en but target_lang=en es)')
    parser.add_argument('--lrate', help='Learning rate', type=float, default=0.10)
    parser.add_argument('--final_lrate', '--flrate', type=float, default=0.02,
                        help='Final learning rate after linear decrease. If not set, rate does not decrease')
    parser.add_argument('--momentum', help='Amount of previous weight changes that are taken into account',
                        type=float, default=0.9)
    parser.add_argument('--set_weights', '--sw', default=None,
                        help='Set a folder that contains pre-trained weights as initial weights for simulations')
    parser.add_argument('--set_weights_epoch', '--swe', type=int,
                        help='In case of pre-trained weights we can also specify num of epochs (stage of training)')
    parser.add_argument('--fw', '--fixed_weights', type=int, default=15,
                        help='Fixed weight value for concept-role connections')
    parser.add_argument('--fwi', '--fixed_weights_identif', type=int, default=10,
                        help='Fixed weight value for identif-role connections')
    parser.add_argument('--cog_decimal_fraction', help='Amount of sentences with cognates in test/training sets',
                        type=float, default=0.3, dest='cognate_decimal_fraction')
    parser.add_argument('--exclude_cognates', help="Filename with concepts; exclude from cognate selection the "
                                                   "concepts of this list")
    parser.add_argument('--pron', dest='overt_pronouns', type=decimal_fraction, default=0,
                        help='Decimal_fraction of overt Spanish pronouns')
    parser.add_argument('--messageless_decimal_fraction', help='Fraction of messageless sentences in training set',
                        type=float, default=0)
    parser.add_argument('--generate_training_num', type=int, default=2000, help='Sum of test/training sentences to be '
                                                                                'generated (only if no input was set)')
    parser.add_argument('--title', help='Title for the plots')
    parser.add_argument('--sim', type=positive_int, default=2,
                        help="training several simulations at once to take the results' average (Monte Carlo approach)")
    parser.add_argument('--sim_from', type=positive_int, help='To train several simulations with range other than '
                                                              '(0, number_of_simulations) you need to set the '
                                                              'sim_from and sim_to values (the simulations include '
                                                              'sim_from and sim_to)')
    parser.add_argument('--sim_to', type=positive_int, help='See sim_from (the simulations include sim_to)')
    parser.add_argument('--threshold', type=int, default=0,
                        help='Threshold for performance of simulations. Any simulations that performs has a percentage '
                             'of correct sentences < threshold are discarded')
    parser.add_argument('--config_file', default=False, help='Read arguments from file')
    parser.add_argument('--generator_timeout', type=positive_int, default=60,
                        help="Number of seconds before the sentence generation process times out")
    parser.add_argument('--hidden_dev', type=non_negative_int, default=10,
                        help='Maximum deviation for the number of hidden layer units when randomization is used. '
                             'Defaults to 10.')
    parser.add_argument('--compress_dev', type=non_negative_int, default=10,
                        help='Maximum deviation for the number of compress layer units when randomization is used. '
                             'Defaults to 10.')
    parser.add_argument('--fw_dev', type=non_negative_int, default=5,
                        help='Maximum deviation for the fixed weight value for concept-role connections '
                             'when randomization is used. Defaults to 5.')
    parser.add_argument('--epoch_dev', type=non_negative_int, default=2,
                        help='Maximum deviation for the starting epoch/l2_epoch value. Defaults to 2.')
    parser.add_argument('--l2_decimal_dev', type=decimal_fraction, default=0.08,
                        help='Standard deviation for the decimal fraction of L2 input '
                             'when randomization is used. Defaults to 0.08.')
    """ !----------------------------------- boolean arguments -----------------------------------! """
    parser.add_argument('--prodrop', dest='prodrop', action='store_true', help='Indicates that it is a pro-drop lang')
    parser.set_defaults(prodrop=False)
    parser.add_argument('--crole', dest='crole', action='store_true',
                        help='If (role copy) is set, the produced role layer is copied back to the comprehension layer')
    parser.set_defaults(crole=False)
    parser.add_argument('--cinput', dest='cinput', action='store_true',
                        help='If (copy input) is set, the previous activation of the input layer is stored')
    parser.set_defaults(cinput=False)
    parser.add_argument('--debug', help='Debugging info for SRN layers and deltas', dest='debug', action='store_true')
    parser.set_defaults(debug=False)
    parser.add_argument('--cs', '--code-switching', dest='activate_both_lang', action='store_true',
                        help='Activate both languages during TESTing')
    parser.set_defaults(activate_both_lang=False)
    parser.add_argument('--nodlr', dest='decrease_lrate', action='store_false', help='Keep lrate stable (final_lrate)')
    parser.set_defaults(decrease_lrate=True)
    parser.add_argument('--gender', dest='gender', action='store_true', help='Include semantic gender for nouns')
    parser.set_defaults(gender=False)
    parser.add_argument('--noeval', dest='eval_test', action='store_false',
                        help='Do not evaluate test set')
    parser.set_defaults(eval_test=True)
    parser.add_argument('--eval_training', dest='eval_training', action='store_true',
                        help='Evaluate training sets')
    parser.set_defaults(eval_training=False)
    parser.add_argument('--evaluate', dest='only_evaluate', action='store_true',
                        help='Do not train, only evaluate test sets')
    parser.set_defaults(only_evaluate=False)
    parser.add_argument('--continue_training', '--continue', dest='continue_training', action='store_true',
                        help='Continue training for more epochs')
    parser.set_defaults(continue_training=False)
    parser.add_argument('--allow-free-structure', '--af', dest='free_pos', action='store_true',
                        help='The model is not given role information in the event semantics and it is therefore '
                             'allowed to use any syntactic structure (which is important for testing, e.g., priming)')
    parser.set_defaults(free_pos=False)
    parser.add_argument('--emb', dest='word_embeddings', action='store_true',
                        help='Represent semantics using word embeddings instead of one-hot vectors.')
    parser.set_defaults(word_embeddings=False)
    parser.add_argument('--cognates', dest='cognate_experiment', action='store_true',
                        help='Run cognate experiment')
    parser.set_defaults(cognate_experiment=False)
    parser.add_argument('--aux', dest='auxiliary_experiment', action='store_true',
                        help='Run auxiliary asymmetry experiment')
    parser.set_defaults(auxiliary_experiment=False)
    parser.add_argument('--tener', dest='replace_haber', action='store_true',
                        help='Run auxiliary asymmetry experiment and replace all instances of "haber" with "tener"')
    parser.set_defaults(replace_haber=False)
    parser.add_argument('--synonym', dest='test_haber_frequency', action='store_true',
                        help='Run auxiliary asymmetry experiment making haber and tener perfect synonyms')
    parser.set_defaults(test_haber_frequency=False)
    parser.add_argument('--gender_error_experiment', dest='pronoun_experiment', action='store_true',
                        help='Evaluate pronoun production')
    parser.set_defaults(pronoun_experiment=False)
    parser.add_argument('--flex_eval', dest='ignore_tense_and_det', action='store_true',
                        help='Ignore mistakes on determiners (definiteness) and tense (past, present)')
    parser.set_defaults(ignore_tense_and_det=False)
    parser.add_argument('--separate', dest='separate_hidden_layers', action='store_true',
                        help='Two hidden layers instead of one; separate hidden layer of semantic and syntactic path')
    parser.set_defaults(separate_hidden_layers=False)
    parser.add_argument('--norandomization', dest='randomize', action='store_false',
                        help='By default, we sample the free parameters (fixed weight, hidden/compress size, l2 decimal'
                             ') within a certain standard deviation. Using this flag deactivates this setting.')
    parser.set_defaults(randomize=True)
    args = parser.parse_args()

    if args.config_file:  # read params from file; I used the json format to make it readable
        with open(args.config_file, 'r') as f:
            args.__dict__ = json.load(f)

    root_folder = os.path.relpath(os.path.join(os.path.dirname(__file__), os.pardir))
    cognate_experiment = args.cognate_experiment
    training_num = args.generate_training_num
    l2_decimal = args.l2_decimal_fraction
    auxiliary_experiment = args.auxiliary_experiment
    if len(args.languages) == 1:  # monolingual case
        l2_decimal = 0

    simulation_range = range(args.sim_from if args.sim_from else 1, (args.sim_to if args.sim_to else args.sim) + 1)
    num_simulations = len(simulation_range)
    set_weights_epoch = args.set_weights_epoch
    if args.only_evaluate and not args.set_weights:
        sys.exit(f'No pre-trained weights found. Check the set-weights folder (set_weights: {args.set_weights})')

    if (args.only_evaluate or args.continue_training) and args.set_weights and not args.input:
        from copy import deepcopy

        # it is implied that the input and the weights are under the same simulation folder; copy the path
        args.input = deepcopy(args.set_weights)

    # create path to store results (simulations/date/datetime_num-simulations_num-hidden_num-compress)
    results_dir = (f"{root_folder}/simulations/{datetime.now().strftime('%Y-%m-%d')}/"
                   f"{datetime.now().strftime('%H.%M')}_{''.join(args.languages)}_sim{args.sim}_h{args.hidden}_"
                   f"c{args.compress}_fw{args.fw}_e{args.epochs}")
    if os.path.exists(results_dir):
        results_dir += datetime.now().strftime('%M.%S')
    os.makedirs(results_dir)

    if args.replace_haber or args.test_haber_frequency:
        args.auxiliary_experiment = True

    if args.auxiliary_experiment:
        args.cognate_decimal_fraction = 0
        args.activate_both_lang = True
        if not args.testset:
            args.testset = 'test_aux.in'
    elif cognate_experiment:
        args.activate_both_lang = True
    if not args.testset:
        args.testset = 'test.in'

    available_cpu = cpu_count()
    input_dir = f"{results_dir}/input"
    num_training = args.generate_training_num
    num_test = calculate_testset_size(num_training)
    if args.input:  # if "input" was set, copy existing files
        given_input_path = check_given_input_path(args.input)
        copy_files(given_input_path, input_dir)
        existing_input_path = given_input_path.replace("/input", "")  # remove "/input", the sets are in the sub folders
        for sim in simulation_range:
            copy_files(src=os.path.join(existing_input_path, str(sim)),
                       dest=f"{results_dir}/{sim}", ends_with=".in")
        num_training = sum(1 for line in open(f"{results_dir}/{sim}/{args.trainingset}"))

        if args.target_lang:  # replace with given target language
            with open(f'{given_input_path}/target_lang.in', 'w') as f:
                f.write(f"%s" % "\n".join(args.target_lang))

    else:  # generate a new set
        from modules import SetsGenerator

        experiment_dir = ("auxiliary_phrase/" if args.auxiliary_experiment else
                          "cognate/" if cognate_experiment else
                          "code-switching/" if args.activate_both_lang else "")
        if not args.lexicon:
            args.lexicon = f'{root_folder}/data/{experiment_dir}lexicon.csv'
        if not args.structures:
            args.structures = f'{root_folder}/data/{experiment_dir}structures.csv'
        logging.info(f"Generating input for {num_simulations} simulations using: {args.lexicon} (lexicon) "
                     f"and {args.structures} (structures)")

        input_sets = SetsGenerator(input_dir=input_dir, lang=args.languages, generator_timeout=args.generator_timeout,
                                   lexicon_csv=args.lexicon, structures_csv=args.structures,
                                   allow_free_structure_production=args.free_pos)
        if cognate_experiment:
            excluded_concepts = []
            if args.exclude_cognates:
                if not os.path.exists(args.exclude_cognates):
                    sys.exit(f"Wrong path for excluded cognates file: {args.exclude_cognates}")
                excluded_concepts = [line.rstrip('\n') for line in open(args.exclude_cognates)]
            input_sets.convert_nouns_to_cognates(args.cognate_decimal_fraction, excluded_concepts)

        parallel_jobs = []
        for sim in simulation_range:  # first create all input files
            parallel_jobs.append(Process(target=create_input_for_simulation,
                                         args=(results_dir, input_sets, training_num, num_test, l2_decimal,
                                               auxiliary_experiment, sim, args.randomize, args.l2_decimal_dev)))
            parallel_jobs[-1].start()
            # if number of simulations is larger than number of cores or it is the last simulation, start multiprocess
            if len(parallel_jobs) == available_cpu or sim == simulation_range[-1]:
                for p in parallel_jobs:
                    p.join()
                parallel_jobs = []

        del input_sets  # we no longer need it

        if not args.target_lang:
            args.target_lang = args.languages
        with open(f'{input_dir}/target_lang.in', 'w') as f:
            f.write("%s" % "\n".join(args.target_lang))

    if not args.decrease_lrate or args.continue_training:  # assumption: when training continues, lrate is NOT reduced
        logging.info(f"Learning rate will NOT be decreased, it is set to {args.final_lrate}")
        args.lrate = args.final_lrate  # assign the >lowest< learning rate.

    with open(f'{results_dir}/commandline_args.txt', 'w') as f:
        json.dump(args.__dict__, f, indent=2)

    formatted_input = InputFormatter(directory=input_dir, language=args.languages, use_semantic_gender=args.gender,
                                     overt_pronouns=args.overt_pronouns, test_haber_frequency=args.test_haber_frequency,
                                     num_training=num_training, training_set_name=args.trainingset,
                                     test_set_name=args.testset, fixed_weights=args.fw, fixed_weights_identif=args.fwi,
                                     use_word_embeddings=args.word_embeddings, replace_haber_tener=args.replace_haber,
                                     auxiliary_experiment=auxiliary_experiment, cognate_experiment=cognate_experiment,
                                     prodrop=args.prodrop,
                                     messageless_decimal_fraction=args.messageless_decimal_fraction)

    starting_epoch = 0 if not args.continue_training else args.set_weights_epoch
    dualp = DualPath(hidden_size=args.hidden, learn_rate=args.lrate, final_learn_rate=args.final_lrate,
                     role_copy=args.crole, input_copy=args.cinput, srn_debug=args.debug,
                     compress_size=args.compress, activate_both_lang=args.activate_both_lang,
                     cognate_experiment=args.cognate_experiment, momentum=args.momentum, randomize=args.randomize,
                     set_weights_folder=args.set_weights,  # formatted_input.directory if args.set_weights else None,
                     input_class=formatted_input, ignore_tense_and_det=args.ignore_tense_and_det,
                     set_weights_epoch=set_weights_epoch, pronoun_experiment=args.pronoun_experiment,
                     auxiliary_experiment=args.auxiliary_experiment, only_evaluate=args.only_evaluate,
                     continue_training=args.continue_training, separate_hidden_layers=args.separate_hidden_layers,
                     evaluate_test_set=args.eval_test, evaluate_training_set=args.eval_training,
                     hidden_deviation=args.hidden_dev, compress_deviation=args.compress_dev, fw_deviation=args.fw_dev,
                     epoch_deviation=args.epoch_dev, l2_epoch=args.l2_epoch,
                     starting_epoch=starting_epoch, epochs=args.epochs)

    del formatted_input

    parallel_jobs = []
    for sim in simulation_range:  # first create all input files
        parallel_jobs.append(Process(target=dualp.start_network, args=(sim, args.set_weights)))
        parallel_jobs[-1].start()
        # if number of simulations is larger than number of cores or if it's the last simulation, start multiprocessing
        if len(parallel_jobs) == available_cpu or sim == simulation_range[-1]:
            for p in parallel_jobs:
                p.join()
            parallel_jobs = []

    del dualp

    if args.eval_test:  # plot results
        create_dataframes_for_plots(results_dir, starting_epoch, args.epochs, simulation_range)
        df = pd.read_csv(f'{results_dir}/performance.csv')
        plot = Plotter(results_dir=results_dir)
        plot.performance(df)

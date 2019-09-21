#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import json
import argparse
from modules import (os, lz4, pickle, sys, logging, InputFormatter, compute_mean_and_std, DualPath,
                     Plotter, copy_files, datetime, training_is_successful, Process, cpu_count, round)


def create_input_for_simulation(results_directory, sets, cognate_experiment, training_num, num_test, l2_percentage,
                                auxiliary_experiment, simulation_number, randomize, messageless_fraction):
    sets.set_new_results_dir(f"{results_directory}/{simulation_number}")
    sets.random.seed(simulation_number)  # set new seed each time we run a new simulation
    if randomize:
        l2_percentage = round(sets.random.normal(l2_percentage, 0.09), decimals=2)
        print(f"L1 percentage: {1.-l2_percentage}, L2 percentage: {l2_percentage}")
    if cognate_experiment:
        sets.generate_for_cognate_experiment(num_training_sentences=training_num, percentage_l2=l2_percentage)
    else:
        test_set, training_set = sets.generate_general(num_training=training_num, num_test=num_test,
                                                       percentage_l2=l2_percentage)
        if auxiliary_experiment:
            sets.aux_experiment = True
            sets.generate_auxiliary_experiment_sentences(training_set=training_set, percentage_l2=l2_percentage)


def calculate_testset_size(num_training, percentage_test_set=0.2):
    """
    :param num_training: Number of training sentences
    :param percentage_test_set: default: 20% of sentences are set aside for testing. (80%: training)
    :return: Number of sentences for training and test sets
    """
    return int((num_training * 100 / 80) * percentage_test_set)


def check_given_input_path(input_path):
    if not os.path.isfile(os.path.join(input_path, "test.in")) and 'input' not in input_path:
        corrected_dir = os.path.join(input_path, "input")  # the user may have forgotten to add the 'input' dir
        if os.path.exists(corrected_dir):
            input_path = corrected_dir
        else:
            sys.exit(f'No input folder found in the path ({input_path})')
    logging.warning(f"Predefined input folder ({input_path}), will use that instead of generating a new set")
    return input_path


if __name__ == "__main__":
    def positive_int(x):
        pos_int = int(x)
        if pos_int <= 0:
            raise argparse.ArgumentTypeError(f"{x} is invalid: only use positive int value")
        return pos_int


    parser = argparse.ArgumentParser(formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument('--hidden', help='Number of hidden layer units.', type=positive_int, default=70)  # 110 100 80
    parser.add_argument('--compress', '-c', help='Number of compress layer units. The size should be approximately 2/3 '
                                                 'of the hidden one', type=positive_int, default=60)  # 70
    parser.add_argument('--epochs', '--total_epochs', help='Number of training set iterations during (total) training.',
                        type=positive_int, default=20)
    parser.add_argument('--l2_epochs', '--l2e', help='# of epoch when L2 input gets introduced', type=positive_int)
    parser.add_argument('--l2_percentage', '--l2_perc', help='%% of L2 input', type=float, default=0.5)
    parser.add_argument('--input', help='(Input) folder that contains all input files (lexicon, concepts etc)')
    """ input-related arguments; some are redundant as all the user needs to specify is the input folder """
    parser.add_argument('--lexicon', help='CSV file that contains lexicon and concepts')
    parser.add_argument('--structures', help='CSV file that contains the structures')
    parser.add_argument('--trainingset', '--training', help='File name that contains the message-sentence pair for '
                                                            'training.', default="training.in")
    parser.add_argument('--testset', '--test', help='Test set file name')
    parser.add_argument('--resdir', '-r', help='Prefix of results folder name; will be stored under folder '
                                               '"simulations" and a timestamp will be added')
    parser.add_argument('--lang', help='In case we want to generate a new set, we need to specify the language (en, es '
                                       'or any combination [enes, esen] for bilingual)', default='esen', type=str.lower)
    parser.add_argument('--lrate', help='Learning rate', type=float, default=0.10)
    parser.add_argument('--final_lrate', '--flrate', type=float, default=0.02,
                        help='Final learning rate after linear decrease. If not set, rate does not decrease')
    parser.add_argument('--momentum', help='Amount of previous weight changes that are taken into account',
                        type=float, default=0.9)
    parser.add_argument('--set_weights', '--sw', default=None,
                        help='Set a folder that contains pre-trained weights as initial weights for simulations')
    parser.add_argument('--set_weights_epoch', '--swe', type=int, default=0,
                        help='In case of pre-trained weights we can also specify num of epochs (stage of training)')
    parser.add_argument('--fw', '--fixed_weights', type=int, default=10,  # 20
                        help='Fixed weight value for concept-role connections')
    parser.add_argument('--fwi', '--fixed_weights_identif', type=int, default=10,
                        help='Fixed weight value for identif-role connections')
    parser.add_argument('--cognate_percentage', help='Amount of sentences with cognates in test/training sets',
                        type=float, default=0.35)
    parser.add_argument('--messageless_fraction', help='Fraction of messageless sentences in training set',
                        type=float, default=0)
    parser.add_argument('--generate_training_num', type=int, default=2000, help='Sum of test/training sentences to be '
                                                                                'generated (only if no input was set)')
    parser.add_argument('--title', help='Title for the plots')
    parser.add_argument('--sim', type=positive_int, default=2,
                        help="training several simulations at once to take the results' average (Monte Carlo approach)")
    parser.add_argument('--sim_from', type=positive_int, help='To train several simulations with range other than '
                                                              '(0, number_of_simulations) you need to set the '
                                                              'sim_from and sim_to values')
    parser.add_argument('--sim_to', type=positive_int, help='See sim_from (the simulations includes sim_to)')
    parser.add_argument('--pron', dest='overt_pronouns', type=int, default=0, help='Percentage of overt pronouns in es')
    parser.add_argument('--threshold', type=int, default=0,
                        help='Threshold for performance of simulations. Any simulations that performs has a percentage '
                             'of correct sentences < threshold are discarded')
    parser.add_argument('--config', default=False, help='Read arguments from file')
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
    parser.add_argument('--monolingual', dest='monolingual', action='store_true', help='Do not include L2 lexicon')
    parser.set_defaults(monolingual=False)
    parser.add_argument('--comb-sem', dest='simple_semantics', action='store_false',
                        help='Produce combined concepts instead of simple ones (e.g., PARENT+M instead of FATHER)')
    parser.set_defaults(simple_semantics=True)
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
    parser.add_argument('--priming', dest='priming', action='store_true', help='Priming experiment')
    parser.set_defaults(priming=False)
    parser.add_argument('--tener', dest='replace_haber', action='store_true',
                        help='Run auxiliary asymmetry experiment and replace all instances of "haber" with "tener"')
    parser.set_defaults(replace_haber=False)
    parser.add_argument('--haber_frequency', dest='test_haber_frequency', action='store_true',
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
                        help='By default, we sample the free parameters (fixed weight, hidden size, l2 percentage) '
                             'within a certain standard deviation. Using this flag deactivates this setting.')
    parser.set_defaults(randomize=True)
    args = parser.parse_args()

    if args.config:  # read params from file; I used the json format instead of pickle to make it readable
        with open(args.config, 'r') as f:
            args.__dict__ = json.load(f)

    root_folder = os.path.relpath(os.path.join(os.path.dirname(__file__), os.pardir))
    cognate_experiment = args.cognate_experiment
    training_num = args.generate_training_num
    l2_percentage = args.l2_percentage
    auxiliary_experiment = args.auxiliary_experiment

    simulation_range = range(args.sim_from if args.sim_from else 1, (args.sim_to if args.sim_to else args.sim)+1)
    num_simulations = len(simulation_range)
    set_weights_epoch = args.set_weights_epoch
    if args.only_evaluate and not args.set_weights:
        sys.exit(f'No pre-trained weights found. Check the set-weights folder (set_weights: {args.set_weights})')

    if (args.only_evaluate or args.continue_training) and args.set_weights and not args.input:
        from copy import deepcopy

        # it is implied that the input and the weights are under the same simulation folder; copy the path
        args.input = deepcopy(args.set_weights)

    # create path to store results (simulations/date/datetime_num-simulations_num-hidden_num-compress)
    results_dir = f"{root_folder}/simulations/{(args.resdir if args.resdir else '')}" \
                  f"{datetime.now().strftime('%Y-%m-%d')}/{datetime.now().strftime('%H.%M.%S')}_{args.lang}_" \
                  f"sim{args.sim}_h{args.hidden}_c{args.compress}_fw{args.fw}_e{args.epochs}"
    os.makedirs(results_dir)

    if args.replace_haber or args.test_haber_frequency:
        args.auxiliary_experiment = True

    if args.auxiliary_experiment:
        args.cognate_percentage = 0
        args.activate_both_lang = True
        args.threshold = 30
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
    else:  # generate a new set
        from modules import SetsGenerator

        experiment_dir = "auxiliary_phrase/" if args.auxiliary_experiment else ""
        if not args.lexicon:
            args.lexicon = f'{root_folder}/data/{experiment_dir}lexicon.csv'
        if not args.structures:
            args.structures = f'{root_folder}/data/{experiment_dir}structures.csv'
        logging.warning(f"Using {args.lexicon} (lexicon) and {args.structures} (structures)")
        input_sets = SetsGenerator(input_dir=input_dir, lang=args.lang, monolingual_only=args.monolingual,
                                   use_simple_semantics=args.simple_semantics,
                                   cognate_percentage=args.cognate_percentage, lexicon_csv=args.lexicon,
                                   structures_csv=args.structures, allow_free_structure_production=args.free_pos)
        # I had issues with joblib installation on Ubuntu 16.04.6 LTS
        # If prefer="threads", deepcopy input sets. -1 means that all CPUs will be used
        # Parallel(n_jobs=-1)(delayed(create_input_for_simulation)(sim) for sim in simulation_range)
        parallel_jobs = []
        for sim in simulation_range:  # first create all input files
            parallel_jobs.append(Process(target=create_input_for_simulation,
                                         args=(results_dir, input_sets, cognate_experiment, training_num,
                                               num_test, l2_percentage, auxiliary_experiment, sim, args.randomize,
                                               args.messageless_fraction)))
            parallel_jobs[-1].start()
            # if number of simulations is larger than number of cores or it is the last simulation, start multiproc.
            if len(parallel_jobs) == available_cpu or sim == simulation_range[-1]:
                for p in parallel_jobs:
                    p.join()
                parallel_jobs = []

        del input_sets  # we no longer need it

    if not args.decrease_lrate or args.continue_training:  # assumption: when training continues, lrate is NOT reduced
        logging.warning(f"Learning rate will NOT be decreased, it is set to {args.final_lrate}")
        args.lrate = args.final_lrate  # assign the >lowest< learning rate.

    with open(f'{results_dir}/commandline_args.txt', 'w') as f:
        json.dump(args.__dict__, f, indent=2)

    formatted_input = InputFormatter(directory=input_dir, language=args.lang, use_semantic_gender=args.gender,
                                     overt_pronouns=args.overt_pronouns, prodrop=args.prodrop,
                                     num_training=num_training, training_set_name=args.trainingset,
                                     test_set_name=args.testset, fixed_weights=args.fw, fixed_weights_identif=args.fwi,
                                     use_word_embeddings=args.word_embeddings, monolingual_only=args.monolingual,
                                     replace_haber_tener=args.replace_haber,
                                     test_haber_frequency=args.test_haber_frequency,
                                     messageless_fraction=args.messageless_fraction)

    dualp = DualPath(hidden_size=args.hidden, learn_rate=args.lrate, final_learn_rate=args.final_lrate,
                     epochs=args.epochs, role_copy=args.crole, input_copy=args.cinput, srn_debug=args.debug,
                     compress_size=args.compress, activate_both_lang=args.activate_both_lang,
                     cognate_experiment=args.cognate_experiment, momentum=args.momentum, randomize=args.randomize,
                     set_weights_folder=args.set_weights,  # formatted_input.directory if args.set_weights else None,
                     input_class=formatted_input, ignore_tense_and_det=args.ignore_tense_and_det,
                     set_weights_epoch=set_weights_epoch, pronoun_experiment=args.pronoun_experiment,
                     auxiliary_experiment=args.auxiliary_experiment, priming_experiment=args.priming,
                     only_evaluate=args.only_evaluate,
                     continue_training=args.continue_training, separate_hidden_layers=args.separate_hidden_layers,
                     evaluate_test_set=args.eval_test, evaluate_training_set=args.eval_training,
                     starting_epoch=0 if not args.continue_training else args.set_weights_epoch)

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

    dualp.inputs.update_sets(f"{dualp.inputs.root_directory}/{simulation_range[0]}")  # needed to update num_test
    num_test = dualp.inputs.num_test

    test_sentences_with_pronoun = dualp.inputs.test_sentences_with_pronoun
    lexicon_size = dualp.inputs.lexicon_size
    layers_with_softmax = ', '.join([layer.name for layer in dualp.srn.backpropagated_layers
                                     if layer.activation_function == 'softmax'])
    del dualp

    if args.eval_test:  # aggregate and plot results
        num_valid_simulations = 0
        simulations_with_pron_err = 0
        failed_sim_id = []
        valid_results = []
        for sim in simulation_range:  # read results from all simulations
            if os.path.isfile(f'{results_dir}/{sim}/results.pickled'):
                with lz4.open(f'{results_dir}/{sim}/results.pickled', 'rb') as f:
                    simulation = pickle.load(f)
                if training_is_successful(simulation['correct_meaning']['test'], args.threshold, num_test=num_test):
                    valid_results.append(simulation)
                    if not training_is_successful(simulation['correct_meaning']['test'], 80, num_test=num_test):
                        failed_sim_id.append(f"[{sim}]")  # flag it, even if it's included in the final analysis
                else:
                    failed_sim_id.append(str(sim))  # keep track of simulations that failed
            else:  # this would mean "missing data", we could raise a message
                logging.warning(f'Simulation #{sim} was problematic')

        num_valid_simulations = len(valid_results)  # some might have been discarded
        if num_valid_simulations:  # take the average of results and plot
            if not args.pronoun_experiment:
                simulations_with_pron_err = 0
            else:
                simulations_with_pron_err = len([simulation for simulation in valid_results
                                                 if sum(simulation['pronoun_errors_flex']['test']) > 0])
            eval_sets = set()
            if args.eval_test:
                eval_sets.add('test')
            if args.eval_training:
                eval_sets.add('training')
            results_mean_and_std = compute_mean_and_std(valid_results, evaluated_sets=eval_sets, epochs=args.epochs)

            with lz4.open(f"{results_dir}/summary_results.pickled", 'wb') as pckl:
                pickle.dump(results_mean_and_std, pckl, protocol=-1)

            plot = Plotter(results_dir=results_dir, summary_sim=num_valid_simulations, title=args.title,
                           epochs=args.epochs, num_training=num_training, num_test=num_test)
            plot.plot_results(results_mean_and_std, cognate_experiment=args.cognate_experiment,
                              test_sentences_with_pronoun=test_sentences_with_pronoun,
                              auxiliary_experiment=args.auxiliary_experiment, evaluated_datasets=eval_sets)
            if not isinstance(results_mean_and_std['correct_code_switches']['test'], int):
                with open(f"{results_dir}/results.log", 'w') as f:
                    f.write(f"Code-switched percentage (test set): "
                            f"{Plotter.percentage(results_mean_and_std['correct_code_switches']['test'], num_test)}")

    with open(f"{results_dir}/results.log", 'w') as f:
        f.write(f"Lexicon size:{lexicon_size}\nLayers with softmax activation function: "
                f"{layers_with_softmax}\nSimulations with pronoun errors:{simulations_with_pron_err}/"
                f"{num_simulations}\nSuccessful simulations: {num_valid_simulations}/{args.sim}\n"
                f"Indeces of (almost) failed simulations: {', '.join(failed_sim_id) if failed_sim_id else ''}")

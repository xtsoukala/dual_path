# -*- coding: utf-8 -*-
import shutil
import logging
import sys
import platform
import json
import argparse
from datetime import datetime
from modules.formatter import InputFormatter, compute_mean_and_std, os, pickle, torch
from modules.dual_path import DualPath
from modules.plotter import Plotter

if torch.cuda.is_available():
    torch.set_default_tensor_type('torch.cuda.FloatTensor')
torch.multiprocessing.set_start_method('spawn', force=True)
mp = torch.multiprocessing


def copy_dir(src, dst, symlinks=False, ignore=None):
    if not os.path.exists(dst):
        os.makedirs(dst)
    for item in os.listdir(src):
        s = os.path.join(src, item)
        d = os.path.join(dst, item)
        if os.path.isdir(s):
            shutil.copytree(s, d, symlinks, ignore)
        else:
            shutil.copy2(s, d)


def copy_files_endswith(src, dest, ends_with=".in"):
    for filename in os.listdir(src):
        if filename.endswith(ends_with):
            shutil.copyfile(os.path.join(src, filename), os.path.join(dest, filename))


def copy_specific_files(src, dest, filename_starts_with_list=('test', 'training')):
    for filename in os.listdir(src):
        for starts in filename_starts_with_list:
            if filename.startswith(starts):
                shutil.copyfile(os.path.join(src, filename), os.path.join(dest, filename))


def create_input_for_simulation(simulation_number, directory, sets, original_input, cognate_experiment,
                                generate_num, l2_percentage, auxiliary_experiment):
    rdir = "%s/%s" % (directory, simulation_number)
    os.makedirs(rdir)
    if sets:  # generate new test/training sets
        if simulation_number == 0:  # copy the .in files under the /input folder
            copy_specific_files(os.path.join("%s/input" % directory), rdir)
        else:
            sets.sets.results_dir = rdir
            sets.sets.seed = simulation_number  # set new seed for language generator
            if cognate_experiment:
                sets.generate_for_cognate_experiment(num_sentences=generate_num,
                                                     percentage_l2=l2_percentage,
                                                     save_files=False)
            else:
                tst, training = sets.sets.generate_general(num_sentences=generate_num, percentage_l2=l2_percentage,
                                                           save_files=False)
                if auxiliary_experiment:
                    sets.sets.aux_experiment = True
                    if len(args.lang) > 2:
                        sets.sets.generate_auxiliary_experiment_sentences(training_sentences=training,
                                                                          percentage_l2=l2_percentage)
    elif original_input:  # use existing test/training set (copy them first)
        copy_files_endswith(os.path.join(original_input, str(simulation_number)), rdir)


if __name__ == "__main__":
    def positive_int(x):
        pos_int = int(x)
        if pos_int <= 0:
            raise argparse.ArgumentTypeError("%s is invalid: only use positive int value" % x)
        return pos_int


    parser = argparse.ArgumentParser(formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument('-hidden', help='Number of hidden layer units.', type=positive_int, default=110)  # 110 80
    parser.add_argument('-compress', help='Number of compress layer units', type=positive_int, default=70)  # 70 40
    parser.add_argument('-epochs', '-total_epochs', help='Number of training set iterations during (total) training.',
                        type=positive_int, default=30)
    parser.add_argument('-l2_epochs', '-l2e', help='# of epoch when L2 input gets introduced', type=positive_int)
    parser.add_argument('-l2_percentage', '-l2_perc', help='%% of L2 input', type=float, default=0.5)
    parser.add_argument('-input', help='(Input) folder that contains all input files (lexicon, concepts etc)')
    """ input-related arguments; some are redundant as all the user needs to specify is the input folder """
    parser.add_argument('-lexicon', help='CSV file that contains lexicon and concepts')
    parser.add_argument('-structures', help='CSV file that contains the structures')
    parser.add_argument('-trainingset', '-training', help='File name that contains the message-sentence pair for '
                                                          'training.', default="training.in")
    parser.add_argument('-testset', '-test', help='Test set file name')
    parser.add_argument('-resdir', '-r', help='Prefix of results folder name; will be stored under folder "simulations"'
                                              'and a timestamp will be added')
    parser.add_argument('-lang', help='In case we want to generate a new set, we need to specify the language (en, es '
                                      'or any combination [enes, esen] for bilingual)', default='esen', type=str.lower)
    parser.add_argument('-lrate', help='Learning rate', type=float, default=0.10)
    parser.add_argument('-final_lrate', '-flrate', help='Final learning rate after linear decrease in the first 1 epoch'
                                                        "(2k sentences). If not set, rate doesn't decrease",
                        type=float, default=0.02)
    parser.add_argument('-momentum', help='Amount of previous weight changes that are taken into account',
                        type=float, default=0.9)
    parser.add_argument('-set_weights', '-sw',
                        help='Set a folder that contains pre-trained weights as initial weights for simulations')
    parser.add_argument('-set_weights_epoch', '-swe', type=int, default=0,
                        help='In case of pre-trained weights we can also specify num of epochs (stage of training)')
    parser.add_argument('-fw', '-fixed_weights', type=int, default=30,  # 20
                        help='Fixed weight value for concept-role connections')
    parser.add_argument('-fwi', '-fixed_weights_identif', type=int, default=10,
                        help='Fixed weight value for identif-role connections')
    parser.add_argument('-cognate_percentage', help='Amount of sentences with cognates in test/training sets',
                        type=float, default=0.35)
    parser.add_argument('-generate_num', type=int, default=3800, help='Sum of test/training sentences to be generated '
                                                                      '(only if no input was set)')  # 3500
    parser.add_argument('-title', help='Title for the plots')
    parser.add_argument('-sim', type=positive_int, default=2,
                        help="training several simulations at once to take the results' average (Monte Carlo approach)")
    parser.add_argument('-sim_from', type=positive_int, help='To train several simulations with range other than '
                                                             '(0, number_of_simulations) you need to set the '
                                                             'sim_from and sim_to values')
    parser.add_argument('-sim_to', type=positive_int, help='See sim_from')
    parser.add_argument('-pron', dest='overt_pronouns', type=int, default=0, help='Percentage of overt pronouns in es')
    parser.add_argument('-threshold', type=int, default=0,
                        help='Threshold for performance of simulations. Any simulations that performs has a percentage '
                             'of correct sentences < threshold are discarded')
    parser.add_argument('-config', default=False, help='Read arguments from file')
    """ !----------------------------------- boolean arguments -----------------------------------! """
    parser.add_argument('--prodrop', dest='prodrop', action='store_true', help='Indicates that it is a pro-drop lang')
    parser.set_defaults(prodrop=False)
    parser.add_argument('--convert', dest='convert_input', action='store_true',
                        help='In some cases we want to manipulate the given input')
    parser.set_defaults(convert_input=False)
    parser.add_argument('--crole', dest='crole', action='store_true',
                        help='If (role copy) is set, the produced role layer is copied back to the comprehension layer')
    parser.set_defaults(crole=False)
    parser.add_argument('--cinput', dest='cinput', action='store_true',
                        help='If (copy input) is set, the previous activation of the input layer is stored')
    parser.set_defaults(cinput=False)
    parser.add_argument('--debug', help='Debugging info for SRN layers and deltas', dest='debug', action='store_true')
    parser.set_defaults(debug=False)
    parser.add_argument('--cs', '--nolang', dest='activate_both_lang', action='store_true',
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
    parser.add_argument('--only_eval', dest='only_eval', action='store_true',
                        help='Do not train, only evaluate test sets')
    parser.set_defaults(only_eval=False)
    parser.add_argument('--continue_training', '--continue', dest='continue_training', action='store_true',
                        help='Continue training for more epochs')
    parser.set_defaults(continue_training=False)
    parser.add_argument('--morphemes', '--morph', dest='full_verb', action='store_false',
                        help='Use morphemes for verbs (i.e., splitting into lemma/suffix) instead of full lexeme')
    parser.set_defaults(full_verb=True)
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
    args = parser.parse_args()

    if args.config:  # read params from file
        with open(args.config, 'r') as f:
            args.__dict__ = json.load(f)

    simulation_range = range(args.sim_from if args.sim_from else 0, args.sim_to if args.sim_to else args.sim)
    set_weights_epoch = args.set_weights_epoch
    if args.only_eval and not args.set_weights:
        sys.exit('No pre-trained weights found. Check the set-weights folder (set_weights: %s)' % args.set_weights)

    if (args.only_eval or args.continue_training) and args.set_weights and not args.input:
        args.input = args.set_weights

    if not args.compress:  # compress layer should be approximately 1/3 of the hidden one
        args.compress = int(args.hidden * (2 / 3))

    # if not args.hidden: we could measure the lexicon size and compute the number of layers by dividing by 2
    # create path to store results (simulations/date/datetime_num-simulations_num-hidden_num-compress)
    results_dir = "simulations/%s%s/%s_%s_sim%s_h%s_c%s_fw%s_e%s" % ((args.resdir if args.resdir else ""),
                                                                     datetime.now().strftime("%Y-%m-%d"),
                                                                     datetime.now().strftime("%H.%M.%S"),
                                                                     args.lang, args.sim, args.hidden, args.compress,
                                                                     args.fw, args.epochs)
    os.makedirs(results_dir)

    if args.auxiliary_experiment:
        args.cognate_percentage = 0
        args.activate_both_lang = True
        args.full_verb = True
        args.threshold = 30
        if not args.testset:
            args.testset = 'test_aux.in'
    elif args.cognate_experiment:
        args.activate_both_lang = True

    original_input_path = None  # keep track of the original input in case it was copied
    input_sets = None
    if not args.testset:
        args.testset = 'test.in'
    if args.input:  # generate a new set (unless "input" was also set)
        if not os.path.isfile(os.path.join(args.input, "test.in")) and 'input' not in args.input:
            corrected_dir = os.path.join(args.input, "input")  # the user may have forgotten to add the 'input' dir
            if os.path.exists(corrected_dir):
                args.input = corrected_dir
            else:
                sys.exit('No input folder found in the path (%s)' % args.input)
        logging.warning("Predefined input folder (%s), will use that instead of generating a new set" % args.input)
        copy_dir(args.input, '%s/input' % results_dir)
        original_input_path = args.input.replace("/input", "")  # remove the "input" part, sets are in the sub folders
        args.input = '%s/input' % results_dir  # the specific simulation files will be copied later
    else:
        from modules.corpus_for_experiments import ExperimentSets, SetsGenerator

        experiment_dir = "code-switching/" if args.activate_both_lang else ""
        if not args.lexicon:
            args.lexicon = 'corpus/%slexicon.csv' % experiment_dir
        if not args.structures:
            args.structures = 'corpus/%sstructures.csv' % experiment_dir
        logging.warning("Using %s (lexicon) and %s (structures)" % (args.lexicon, args.structures))
        args.input = "%s/input/" % results_dir
        input_sets = ExperimentSets(
            sets_gen=SetsGenerator(results_dir=args.input, use_full_verb_form=args.full_verb, lang=args.lang,
                                   monolingual_only=args.monolingual, use_simple_semantics=args.simple_semantics,
                                   cognate_percentage=args.cognate_percentage, lexicon_csv=args.lexicon,
                                   structures_csv=args.structures, allow_free_structure_production=args.free_pos))
        if args.cognate_experiment:
            input_sets.generate_for_cognate_experiment(num_sentences=args.generate_num,
                                                       percentage_l2=args.l2_percentage)
        else:
            test, train = input_sets.sets.generate_general(num_sentences=args.generate_num,
                                                           percentage_l2=args.l2_percentage)
            if args.auxiliary_experiment:
                input_sets.sets.aux_experiment = True
                if len(args.lang) > 2:
                    input_sets.sets.generate_auxiliary_experiment_sentences(training_sentences=train,
                                                                            percentage_l2=args.l2_percentage)
    if not args.title:
        lang_code_to_title = {'en': 'English monolingual model', 'es': 'Spanish monolingual model',
                              'el': 'Greek monolingual model', 'enes': 'Bilingual en-es model',
                              'esen': 'Bilingual en-es model'}
        args.title = lang_code_to_title[args.lang]

    if not args.decrease_lrate or args.continue_training:  # assumption: when training continues, lrate is NOT reduced
        logging.warning("Learning rate will NOT be decreased, it is set to %s" % args.final_lrate)
        args.lrate = args.final_lrate  # assign the >lowest< learning rate.

    with open('%s/commandline_args.txt' % results_dir, 'w') as f:
        json.dump(args.__dict__, f, indent=2)

    inputs = InputFormatter(directory=args.input, language=args.lang, use_semantic_gender=args.gender,
                            overt_pronouns=args.overt_pronouns, prodrop=args.prodrop,
                            trainingset=args.trainingset, testset=args.testset, fixed_weights=args.fw,
                            fixed_weights_identif=args.fwi, use_word_embeddings=args.word_embeddings,
                            monolingual_only=args.monolingual, replace_haber_tener=args.replace_haber,
                            test_haber_frequency=args.test_haber_frequency, convert_input=args.convert_input)
    num_valid_simulations = None
    simulations_with_pron_err = 0
    failed_sim_id = []
    if args.sim > 1:
        input_files = []
        for sim_num in simulation_range:  # first create all input files
            process = mp.Process(target=create_input_for_simulation,
                                 args=(sim_num, results_dir, input_sets, original_input_path, args.cognate_experiment,
                                       args.generate_num, args.l2_percentage, args.auxiliary_experiment))
            process.start()
            input_files.append(process)

        for p in input_files:
            p.join()

        del input_sets, input_files  # we no longer need it

        os.environ["VECLIB_MAXIMUM_THREADS"] = "1"  # multiprocessing + numpy hang on Mac OS
        os.environ["MKL_NUM_THREADS"] = "1"
        os.environ["NUMEXPR_NUM_THREADS"] = "1"
        os.environ["OMP_NUM_THREADS"] = "1"
        os.environ["OPENBLAS_NUM_THREADS"] = "1"  # priorities: OPENBLAS_NUM_THREADS > OMP_NUM_THREADS
        if platform.system() == 'Linux':
            os.system("taskset -p 0xff %d" % os.getpid())  # change task affinity to correctly use multiprocessing

    processes = []
    starting_epoch = 0 if not args.continue_training else args.set_weights_epoch
    # run the simulations
    for sim in simulation_range:
        if args.sim > 1:
            inputs.update_sets(new_directory="%s/%s" % (results_dir, sim))
        if args.set_weights:
            destination_folder = '%s/weights' % inputs.directory
            src_folder = os.path.join(args.set_weights, "%s/weights" % sim)
            if args.only_eval or args.continue_training:  # copy all weights
                copy_dir(src_folder, destination_folder)
            else:  # only copy the epoch we wanted (such as epoch 0)
                os.makedirs(destination_folder)
                copy_files_endswith(src=src_folder, dest=destination_folder,
                                    ends_with="_%s" % args.set_weights_epoch)
                if args.set_weights_epoch != 0:  # rename them all to epoch 0. For Mac OS: brew install rename
                    os.system("rename s/_%s/_0/ %s/*" % (args.set_weights_epoch, '%s/weights' % inputs.directory))
                    args.set_weights_epoch = 0
        dualp = DualPath(hidden_size=args.hidden, learn_rate=args.lrate, final_learn_rate=args.final_lrate,
                         epochs=args.epochs, role_copy=args.crole, input_copy=args.cinput, srn_debug=args.debug,
                         compress_size=args.compress, activate_both_lang=args.activate_both_lang,
                         cognate_experiment=args.cognate_experiment, momentum=args.momentum,
                         set_weights_folder=inputs.directory if args.set_weights else None,
                         input_class=inputs, ignore_tense_and_det=args.ignore_tense_and_det, simulation_num=sim,
                         set_weights_epoch=set_weights_epoch, pronoun_experiment=args.pronoun_experiment,
                         auxiliary_experiment=args.auxiliary_experiment, only_evaluate=args.only_eval,
                         separate_hidden_layers=args.separate_hidden_layers)
        process = mp.Process(target=dualp.start_network, args=(args.eval_test, args.eval_training, starting_epoch))
        process.start()
        processes.append(process)

    for p in processes:
        p.join()

    layers_with_softmax_act_function = ""
    for layer in dualp.srn.backpropagated_layers:
        if layer.activation_function == 'softmax':
            layers_with_softmax_act_function += ", %s" % layer.name
    del dualp

    if args.sim > 1 and args.eval_test:  # aggregate and plot results
        valid_results = []
        for sim in simulation_range:  # read results from all simulations
            if os.path.isfile('%s/%s/results.pickled' % (results_dir, sim)):
                with open('%s/%s/results.pickled' % (results_dir, sim), 'rb') as f:
                    simulation = pickle.load(f)

                if inputs.training_is_successful(simulation['correct_meaning']['test'], threshold=args.threshold):
                    valid_results.append(simulation)
                    if not inputs.training_is_successful(simulation['correct_meaning']['test'], threshold=80):
                        failed_sim_id.append("[%s]" % sim)  # flag it, even if it's included in the final analysis
                else:
                    failed_sim_id.append(str(sim))  # keep track of simulations that failed

            else:  # this would mean "missing data", we could raise a message
                logging.warning('Simulation #%s was problematic' % sim)

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

            with open("%s/summary_results.pickled" % results_dir, 'wb') as pckl:
                pickle.dump(results_mean_and_std, pckl)

            plot = Plotter(results_dir=results_dir, summary_sim=num_valid_simulations, title=args.title,
                           epochs=args.epochs, num_training=inputs.num_train, num_test=inputs.num_test)
            plot.plot_results(results_mean_and_std, cognate_experiment=args.cognate_experiment,
                              test_sentences_with_pronoun=inputs.test_sentences_with_pronoun,
                              auxiliary_experiment=args.auxiliary_experiment,
                              evaluated_datasets=eval_sets)
            if not isinstance(results_mean_and_std['correct_code_switches']['test'], int):
                with open("%s/results.log" % results_dir, 'w') as f:
                    f.write("Code-switched percentage (test set): %s" %
                            Plotter.percentage(results_mean_and_std['correct_code_switches']['test'], inputs.num_test))

    with open("%s/results.log" % results_dir, 'w') as f:
        f.write("Lexicon size:%s\nLayers with softmax activation function: %s\nSimulations with pronoun errors:%s/%s\n"
                "%s%s" % (inputs.lexicon_size, layers_with_softmax_act_function, simulations_with_pron_err, args.sim,
                          "Successful simulations:%s/%s" % (num_valid_simulations, args.sim) if num_valid_simulations
                          else "", "\nIndeces of (almost) failed simulations: %s"
                                   % ", ".join(failed_sim_id) if failed_sim_id else ""))

#!/usr/bin/env python3
import argparse
import json
import os
import sys
from datetime import datetime

import pandas as pd
from joblib import Parallel, delayed

from modules import create_dataframes_for_plots, logging
from modules.dual_path import DualPath, copy_files
from modules.formatter import InputFormatter
from modules.plotter import Plotter


def check_given_input_path(input_path):
    if (
        not os.path.isfile(os.path.join(input_path, "test.in"))
        and "/input" not in input_path
    ):
        corrected_dir = os.path.join(
            input_path, "input"
        )  # the user may have forgotten to add the 'input' dir
        if os.path.exists(corrected_dir):
            input_path = corrected_dir
        else:
            sys.exit(f"No input folder found in the path ({input_path})")
    logging.info(
        f"Predefined input folder ({input_path}), will use that instead of generating a new set"
    )
    return input_path


def file_to_list(fname_path):
    if fname_path:
        if not os.path.exists(fname_path):
            sys.exit(f"Wrong path given: {fname_path}")
        with open(fname_path, encoding="utf-8") as f:
            return [line.rstrip("\n") for line in f]
    return []


if __name__ == "__main__":

    def positive_int(x):
        pos_int = int(x)
        if pos_int <= 0:
            raise argparse.ArgumentTypeError(
                f"{x} is invalid: only use positive int value"
            )
        return pos_int

    def non_negative_int(x):  # includes zero
        non_neg_int = int(x)
        if non_neg_int < 0:
            raise argparse.ArgumentTypeError(
                f"{x} is invalid: only use non negative int value"
            )
        return non_neg_int

    def decimal_fraction(x):
        x = float(x)
        if x > 1.0:
            raise argparse.ArgumentTypeError(
                f"{x} is not allowed: the range is between 0.0 and 1.0"
            )
        return x

    parser = argparse.ArgumentParser(
        formatter_class=argparse.ArgumentDefaultsHelpFormatter
    )
    parser.add_argument(
        "--hidden", help="Number of hidden layer units.", type=positive_int, default=80
    )
    parser.add_argument(
        "--compress",
        "-c",
        help="Number of compress layer units. The size should be approximately 2/3 "
        "of the hidden one",
        type=positive_int,
    )
    parser.add_argument(
        "--epochs",
        type=positive_int,
        default=20,
        help="Number of total training set iterations during (full) training.",
    )
    parser.add_argument(
        "--l2-epoch", help="# of epoch when L2 input gets introduced", type=positive_int
    )
    parser.add_argument(
        "--l2-decimal-fraction",
        help="Decimal fraction of L2 input (0.0-1.0). 0 means no L2 input (monolingual only), 1 means only L2 input.",
        type=decimal_fraction,
        default=0.5,
    )
    parser.add_argument(
        "--input",
        help="(Input) folder that contains all input files (lexicon, concepts etc)",
    )
    """input-related arguments. Some are redundant: all the user needs to specify is the input folder"""
    parser.add_argument(
        "--resdir", help="Name of results folder, where the simulations will be stored"
    )
    parser.add_argument("--lexicon", help="CSV file that contains lexicon and concepts")
    parser.add_argument("--structures", help="CSV file that contains the structures")
    parser.add_argument(
        "--trainingset",
        "--training",
        default="training.in",
        help="File name that contains the message-sentence pair for training.",
    )
    parser.add_argument("--testset", help="Test set file name")
    parser.add_argument(
        "--primingset",
        help="File name that contains the message-sentence pairs for the priming experiment.",
    )
    parser.add_argument(
        "--languages",
        help="To generate a new set, specify the languages (e.g., en, es)",
        nargs="*",
        default=["en", "es"],
        type=str.lower,
    )
    parser.add_argument(
        "--target-lang",
        nargs="*",
        help="Values for the target language node. It may differ from the "
        "input languages (e.g., lang=en but target_lang=en es)",
    )
    parser.add_argument("--lrate", help="Learning rate", type=float, default=0.10)
    parser.add_argument(
        "--final-lrate",
        "--flrate",
        type=float,
        default=0.02,
        help="Final learning rate after linear decrease. If not set, rate does not decrease",
    )
    parser.add_argument(
        "--momentum",
        help="Amount of previous weight changes that are taken into account",
        type=float,
        default=0.9,
    )
    parser.add_argument(
        "--set-weights",
        "--sw",
        default=None,
        help="Set a folder that contains pre-trained weights as initial weights for simulations",
    )
    parser.add_argument(
        "--set-weights-epoch",
        "--swe",
        type=int,
        help="In case of pre-trained weights we can also specify num of epochs (stage of training)",
    )
    parser.add_argument(
        "--fw",
        "--fixed-weights",
        type=int,
        default=15,
        help="Fixed weight value for concept-role connections",
    )
    parser.add_argument(
        "--fwi",
        "--fixed-weights-identif",
        type=int,
        default=10,
        help="Fixed weight value for identif-role connections",
    )
    parser.add_argument(
        "--cognate-decimal-fraction",
        help="Amount of sentences with cognates in test/training sets",
        type=float,
        default=0.3,
        dest="cognate_decimal_fraction",
    )
    parser.add_argument(
        "--exclude-cognates",
        help="Filename with concepts; exclude from cognate selection the "
        "concepts of this list",
    )
    parser.add_argument(
        "--cognate-list",
        help="Filename with concepts; use these instead of ones in lexicon.csv",
    )
    parser.add_argument(
        "--false-friends-lexicon",
        help="Csv file with false friends lexicon; use these in lexicon.csv",
    )
    parser.add_argument(
        "--concepts-to-evaluate",
        help="Filename with concepts of words that will become the focus "
        "around code-switched points (e.g., cognates of all models)",
    )
    parser.add_argument(
        "--messageless-decimal-fraction",
        help="Fraction of messageless sentences in training set",
        type=float,
        default=0,
    )
    parser.add_argument(
        "--generate-training-num",
        type=int,
        default=2000,
        help="Sum of test/training sentences to be "
        "generated (only if no input was set)",
    )
    parser.add_argument(
        "--generate-test-num",
        type=int,
        default=600,
        help="Total test sentences for experiments",
    )
    parser.add_argument(
        "--training-files-path",
        help="When generating test sentences, exclude the training.in files "
        "under this path.",
    )
    parser.add_argument("--title", help="Title for the plots")
    parser.add_argument(
        "--sim",
        type=positive_int,
        default=2,
        help="training several simulations at once to take the results' average (Monte Carlo approach)",
    )
    parser.add_argument(
        "--sim-from",
        type=positive_int,
        help="To train several simulations with range other than "
        "(0, number_of_simulations) you need to set the "
        "sim_from and sim_to values (the simulations include "
        "sim_from and sim_to)",
    )
    parser.add_argument(
        "--sim-to",
        type=positive_int,
        help="See sim_from (the simulations include sim_to)",
    )
    parser.add_argument(
        "--threshold",
        type=int,
        default=0,
        help="Threshold for performance of simulations. Any simulations that performs has a percentage "
        "of correct sentences < threshold are discarded",
    )
    parser.add_argument("--config-file", default=False, help="Read arguments from file")
    parser.add_argument(
        "--generator-timeout",
        type=positive_int,
        default=120,
        help="Number of seconds before the sentence generation process times out",
    )
    parser.add_argument(
        "--hidden-dev",
        type=non_negative_int,
        default=10,
        help="Maximum deviation for the number of hidden layer units when randomization is used.",
    )
    parser.add_argument(
        "--compress-dev",
        type=non_negative_int,
        default=10,
        help="Maximum deviation for the number of compress layer units when randomization is used.",
    )
    parser.add_argument(
        "--fw-dev",
        type=non_negative_int,
        default=5,
        help="Maximum deviation for the fixed weight value for concept-role connections "
        "when randomization is used.",
    )
    parser.add_argument(
        "--epoch-dev",
        type=non_negative_int,
        default=0,
        help="Maximum deviation for the starting epoch/l2_epoch value.",
    )
    parser.add_argument(
        "--l2-decimal-dev",
        type=decimal_fraction,
        default=0.08,
        help="Standard deviation for the decimal fraction of L2 input "
        "when randomization is used.",
    )
    parser.add_argument(
        "--num-cognate-models-for-test-set",
        type=non_negative_int,
        help="Number of cognate models to generate test sets for.",
        default=0,
    )
    parser.add_argument(
        "--L1-overt-pronouns",
        type=decimal_fraction,
        default=1.0,
        help="Decimal fraction of overt L1 pronouns. By default it's 1.0, "
        "which indicates that it's a non pro-drop language",
    )
    parser.add_argument(
        "--L2-overt-pronouns",
        type=decimal_fraction,
        default=1.0,
        help="Decimal fraction of overt L2 pronouns. By default it's 1.0, "
        "which indicates that it's a non pro-drop language",
    )
    """ !----------------------------------- boolean arguments -----------------------------------! """
    parser.add_argument(
        "--crole",
        action="store_true",
        default=False,
        help="If (role copy) is set, the produced role layer is copied back to the comprehension layer",
    )
    parser.add_argument(
        "--cinput",
        action="store_true",
        default=False,
        help="If (copy input) is set, the previous activation of the input layer is stored",
    )
    parser.add_argument(
        "--debug",
        help="Debugging info for SRN layers and deltas",
        default=False,
        action="store_true",
    )
    parser.add_argument(
        "--cs",
        "--code-switching",
        dest="activate_both_lang",
        action="store_true",
        help="Activate both languages during TESTing",
        default=False,
    )
    parser.add_argument(
        "--nodlr",
        dest="decrease_lrate",
        action="store_false",
        help="Keep lrate stable (final_lrate)",
        default=True,
    )
    parser.add_argument(
        "--gender",
        action="store_true",
        default=False,
        help="Include semantic gender for nouns",
    )
    parser.add_argument(
        "--noeval",
        dest="eval_test",
        action="store_false",
        default=True,
        help="Do not evaluate test set",
    )
    parser.add_argument(
        "--eval-training",
        action="store_true",
        default=False,
        help="Evaluate training sets",
    )
    parser.add_argument(
        "--evaluate",
        dest="only_evaluate",
        action="store_true",
        help="Do not train, only evaluate test sets",
        default=False,
    )
    parser.add_argument(
        "--only-generate-test",
        action="store_true",
        help="Do not run simulations",
        default=False,
    )
    parser.add_argument(
        "--continue-training",
        dest="continue_training",
        action="store_true",
        help="Continue training for more epochs",
        default=False,
    )
    parser.add_argument(
        "--allow-free-structure",
        "--af",
        dest="free_pos",
        action="store_true",
        default=False,
        help="The model is not given role information in the event semantics and it is therefore "
        "allowed to use any syntactic structure (which is important for testing, e.g., priming)",
    )
    parser.add_argument(
        "--emb",
        dest="word_embeddings",
        action="store_true",
        default=False,
        help="Represent semantics using word embeddings instead of one-hot vectors.",
    )
    parser.add_argument(
        "--cognates",
        dest="cognate_experiment",
        action="store_true",
        help="Run cognate experiment",
        default=False,
    )
    parser.add_argument(
        "--false-friends",
        "--ff",
        dest="false_friends",
        action="store_true",
        help="Run false friends experiment",
        default=False,
    )
    parser.add_argument(
        "--aux",
        dest="auxiliary_experiment",
        action="store_true",
        default=False,
        help="Run auxiliary asymmetry experiment",
    )
    parser.add_argument(
        "--priming",
        dest="priming_experiment",
        action="store_true",
        help="Run priming experiment",
    )
    parser.add_argument(
        "--tener",
        dest="replace_haber",
        action="store_true",
        default=False,
        help='Run auxiliary asymmetry experiment and replace all instances of "haber" with "tener"',
    )
    parser.add_argument(
        "--synonym",
        dest="test_haber_frequency",
        action="store_true",
        default=False,
        help="Run auxiliary asymmetry experiment making haber and tener perfect synonyms",
    )
    parser.add_argument(
        "--gender-error-experiment",
        dest="pronoun_experiment",
        action="store_true",
        help="Evaluate pronoun production",
        default=False,
    )
    parser.add_argument(
        "--flex-eval",
        dest="ignore_tense_and_det",
        action="store_true",
        default=False,
        help="Ignore mistakes on determiners (definiteness) and tense (past, present)",
    )
    parser.add_argument(
        "--separate",
        dest="separate_hidden_layers",
        action="store_true",
        default=False,
        help="Two hidden layers instead of one; separate hidden layer of semantic and syntactic path",
    )
    parser.add_argument(
        "--norandomization",
        dest="randomize",
        action="store_false",
        default=True,
        help="By default, we sample the free parameters (fixed weight, hidden/compress size, l2 decimal"
        ") within a certain standard deviation. Using this flag deactivates this setting.",
    )
    parser.add_argument(
        "--defpro",
        action="store_true",
        default=False,
        help="Merge def/indef/pron into a single unit with different activations",
    )
    parser.add_argument(
        "--srn-only",
        action="store_true",
        default=False,
        help="Run the SRN alone, without the semantic path",
    )
    args = parser.parse_args()

    if (
        args.config_file
    ):  # read params from file; I used the json format to make it readable
        with open(args.config_file, "r", encoding="utf-8") as f:
            args.__dict__ = json.load(f)

    root_folder = os.path.relpath(os.path.join(os.path.dirname(__file__), os.pardir))
    cognate_experiment = args.cognate_experiment
    training_num = args.generate_training_num
    l2_decimal = args.l2_decimal_fraction
    auxiliary_experiment = args.auxiliary_experiment
    if len(args.languages) == 1:  # monolingual case
        l2_decimal = 0

    simulation_range = range(
        args.sim_from if args.sim_from else 1,
        (args.sim_to if args.sim_to else args.sim) + 1,
    )
    num_simulations = len(simulation_range)
    set_weights_epoch = args.set_weights_epoch
    if args.only_evaluate and not args.set_weights:
        sys.exit(
            f"No pre-trained weights found. Check the set-weights folder (set_weights: {args.set_weights})"
        )

    if (
        (args.only_evaluate or args.continue_training)
        and args.set_weights
        and not args.input
    ):
        from copy import deepcopy

        # it is implied that the input and the weights are under the same simulation folder; copy the path
        args.input = deepcopy(args.set_weights)

    # create path to store results (simulations/date/datetime_num-simulations_num-hidden_num-compress)
    if args.resdir:
        results_dir = f"{root_folder}/simulations/{args.resdir}"
    else:
        results_dir = (
            f"{root_folder}/simulations/{datetime.now().strftime('%Y-%m-%d')}/"
            f"{datetime.now().strftime('%H.%M')}_{''.join(args.languages)}_sim{args.sim}_h{args.hidden}_"
            f"c{args.compress}_fw{args.fw}_e{args.epochs}"
        )
    if os.path.exists(results_dir):
        sys.exit(
            f"\nThe results path ({results_dir}) already exists, please select a different folder name."
        )
    os.makedirs(results_dir)

    if args.replace_haber or args.test_haber_frequency:
        auxiliary_experiment = True

    if auxiliary_experiment or cognate_experiment or args.false_friends:
        args.activate_both_lang = True

    if args.priming_experiment:
        args.eval_test = False
        args.only_evaluate = True

    cognate_list = []
    if args.cognate_list:
        cognate_list = file_to_list(args.cognate_list)

    concepts_to_evaluate = []
    if args.only_evaluate and (cognate_list or args.false_friends):
        args.activate_both_lang = True
        cognate_experiment = True
        if args.concepts_to_evaluate:
            concepts_to_evaluate = file_to_list(args.concepts_to_evaluate)
        if not args.testset:
            args.testset = "test_cog.in"

    if not args.testset:
        args.testset = "test_aux.in" if auxiliary_experiment else "test.in"

    input_dir = f"{results_dir}/input"
    num_training = args.generate_training_num
    if args.input:  # if "input" was set, copy existing files
        given_input_path = check_given_input_path(args.input)
        copy_files(given_input_path, input_dir)
        if given_input_path.endswith("/input/") or given_input_path.endswith("/input"):
            existing_input_path = given_input_path[
                : -len("/input")
            ]  # remove "/input", the sets are in the sub folders
        else:
            existing_input_path = given_input_path
        for sim in simulation_range:
            copy_files(
                src=os.path.join(existing_input_path, str(sim)),
                dest=f"{results_dir}/{sim}",
                ends_with=".in",
            )

        if os.path.exists(f"{results_dir}/{sim}/{args.trainingset}"):
            num_training = sum(
                1
                for line in open(
                    f"{results_dir}/{sim}/{args.trainingset}", encoding="utf-8"
                )
            )
        else:
            num_training = args.generate_training_num

        if args.target_lang:  # replace with given target language
            with open(f"{given_input_path}/target_lang.in", "w", encoding="utf-8") as f:
                f.write(f"%s" % "\n".join(args.target_lang))

    if not args.input or (args.input and args.num_cognate_models_for_test_set > 0):
        from modules.corpus_generator import SetsGenerator  # generate a set

        experiment_dir = (
            "auxiliary_phrase/"
            if auxiliary_experiment
            else "cognate/"
            if (
                cognate_experiment
                or args.false_friends
                or args.num_cognate_models_for_test_set > 0
            )
            else "code-switching/"
            if args.activate_both_lang
            else ""
        )
        if not args.lexicon:
            args.lexicon = f"{root_folder}/data/{experiment_dir}lexicon.csv"
        if not args.structures:
            args.structures = f"{root_folder}/data/{experiment_dir}structures.csv"
        logging.info(
            f"Generating input for {num_simulations} simulations using: {args.lexicon} (lexicon) "
            f"and {args.structures} (structures)"
        )
        input_sets = SetsGenerator(
            input_dir=input_dir,
            root_simulations_path=results_dir,
            lang=args.languages,
            generator_timeout=args.generator_timeout,
            lexicon_csv=args.lexicon,
            structures_csv=args.structures,
            allow_free_structure_production=args.free_pos,
            num_training=num_training,
            randomize=args.randomize,
            l2_decimal=l2_decimal,
            l2_decimal_dev=args.l2_decimal_dev,
            cognate_experiment=cognate_experiment,
            auxiliary_experiment=auxiliary_experiment,
            l1_overt_pronouns=args.L1_overt_pronouns,
            l2_overt_pronouns=args.L2_overt_pronouns,
        )

        excluded_concepts = set(
            file_to_list(args.exclude_cognates) if args.exclude_cognates else []
        )
        logging.debug(excluded_concepts)
        input_sets.excluded_concepts = excluded_concepts

        if args.num_cognate_models_for_test_set > 0:
            input_sets.generate_cognate_experiment_test_sets(
                simulation_range,
                cognate_decimal_fraction=args.cognate_decimal_fraction,
                num_models=args.num_cognate_models_for_test_set,
                cognate_list=cognate_list,
                num_test_sentences=args.generate_test_num,
                excluded_concepts=excluded_concepts,
            )
            quit()

        if not args.target_lang:
            args.target_lang = args.languages
        with open(f"{input_dir}/target_lang.in", "w", encoding="utf-8") as f:
            f.write("%s" % "\n".join(args.target_lang))

        if args.only_generate_test:
            Parallel(n_jobs=-1)(
                delayed(input_sets.generate_test_set)(
                    sim, args.generate_test_num, args.training_files_path
                )
                for sim in simulation_range
            )
            quit()

        if cognate_experiment:
            input_sets.convert_nouns_to_cognates(
                args.cognate_decimal_fraction, excluded_concepts
            )
        elif args.false_friends:
            input_sets.convert_nouns_to_false_friends(
                args.cognate_decimal_fraction, excluded_concepts
            )

        Parallel(n_jobs=-1)(
            delayed(input_sets.create_input_for_simulation)(
                sim,
            )
            for sim in simulation_range
        )

    if (
        not args.decrease_lrate or args.continue_training
    ):  # assumption: when training continues, lrate is NOT reduced
        logging.info(
            f"Learning rate will NOT be decreased, it is set to {args.final_lrate}"
        )
        args.lrate = args.final_lrate  # assign the >lowest< learning rate.

    with open(f"{results_dir}/commandline_args.txt", "w", encoding="utf-8") as f:
        json.dump(args.__dict__, f, indent=2)

    if args.false_friends and not args.false_friends_lexicon:
        args.false_friends_lexicon = f"{input_dir}/false_friends_lexicon.csv"

    formatted_input = InputFormatter(
        directory=input_dir,
        language=args.languages,
        use_semantic_gender=args.gender,
        test_haber_frequency=args.test_haber_frequency,
        num_training=num_training,
        training_set_name=args.trainingset,
        test_set_name=args.testset,
        fixed_weights=args.fw,
        fixed_weights_identif=args.fwi,
        use_word_embeddings=args.word_embeddings,
        replace_haber_tener=args.replace_haber,
        auxiliary_experiment=auxiliary_experiment,
        cognate_list=cognate_list,
        false_friends_lexicon=args.false_friends_lexicon,
        determinerpronoun=args.defpro,
        concepts_to_evaluate=concepts_to_evaluate,
        messageless_decimal_fraction=args.messageless_decimal_fraction,
        priming_experiment=args.priming_experiment,
        priming_set=args.primingset,
    )

    starting_epoch = 0 if not args.continue_training else args.set_weights_epoch
    dualp = DualPath(
        hidden_size=args.hidden,
        learn_rate=args.lrate,
        final_learn_rate=args.final_lrate,
        role_copy=args.crole,
        input_copy=args.cinput,
        srn_debug=args.debug,
        compress_size=args.compress,
        activate_both_lang=args.activate_both_lang,
        momentum=args.momentum,
        randomize=args.randomize,
        input_class=formatted_input,
        starting_epoch=starting_epoch,
        epochs=args.epochs,
        set_weights_folder=args.set_weights,
        set_weights_epoch=set_weights_epoch,
        l2_epoch=args.l2_epoch,
        ignore_tense_and_det=args.ignore_tense_and_det,
        pronoun_experiment=args.pronoun_experiment,
        auxiliary_experiment=auxiliary_experiment,
        only_evaluate=args.only_evaluate,
        continue_training=args.continue_training,
        separate_hidden_layers=args.separate_hidden_layers,
        evaluate_test_set=args.eval_test,
        evaluate_training_set=args.eval_training,
        hidden_deviation=args.hidden_dev,
        compress_deviation=args.compress_dev,
        fw_deviation=args.fw_dev,
        epoch_deviation=args.epoch_dev,
        srn_only=args.srn_only,
        priming_experiment=args.priming_experiment,
    )

    Parallel(n_jobs=-1)(
        delayed(dualp.start_network)(
            sim,
        )
        for sim in simulation_range
    )

    if args.eval_test:  # plot results
        create_dataframes_for_plots(
            results_dir,
            starting_epoch,
            args.epochs,
            simulation_range,
            l2_decimal,
            auxiliary_experiment,
        )
        df = pd.read_csv(f"{results_dir}/performance.csv")
        plot = Plotter(results_dir=results_dir)
        plot.performance(
            df, include_code_switches=args.activate_both_lang, threshold=args.threshold
        )
        if auxiliary_experiment:
            plot.lineplot_auxiliary_phrase_experiment(ci=95, ylim=20)

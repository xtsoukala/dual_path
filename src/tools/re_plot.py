#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys

sys.path.append('..')

from modules import Plotter, plt, compute_mean_and_std, lz4, pd, os, pickle, training_is_successful, subprocess


def re_plot(results_directory='2019-11-18/enes_sim60_h80_cNone_fw10_e30', num_sim=60, epochs=30,
            performance_threshold=50, title=None, test_name='test.in', training_name='training.in'):
    results_dir = '../../simulations/' + results_directory
    simulation_range = range(1, num_sim + 1)
    num_test_set = int(subprocess.check_output(f"wc -l {results_dir}/{simulation_range[0]}/{test_name}",
                                               shell=True).split()[0])
    num_train = int(subprocess.check_output(f"wc -l {results_dir}/{simulation_range[0]}/{training_name}",
                                            shell=True).split()[0])
    evaluated_sets = ('test',)
    # tener + haber + synonyms
    excluded_list = []
    num_excluded = len(excluded_list)
    edited_dir = (f'{results_dir}/edited_t{performance_threshold}_e{epochs}_sim{num_sim}'
                  f'{f"_excluded{num_excluded}" if excluded_list else ""}')
    os.makedirs(edited_dir, exist_ok=True)

    cognate_experiment = False
    test_sentences_with_pronoun = pronoun_experiment = False
    auxiliary_experiment = False if 'aux' not in test_name else True

    all_results = []
    for sim in simulation_range:  # read results from all simulations
        if os.path.isfile(f'{results_dir}/{sim}/results.pickled'):
            with lz4.open(f'{results_dir}/{sim}/results.pickled', 'rb') as f:
                all_results.append(pickle.load(f))
        else:
            print(f"No results file found for {sim}")

    if all_results:
        valid_results = []
        failed_simulations = []
        for i, simulation in enumerate(all_results):
            if i not in excluded_list and training_is_successful(simulation['correct_meaning']['test'],
                                                                 threshold=performance_threshold,
                                                                 num_test=num_test_set):
                valid_results.append(simulation)
                if not training_is_successful(simulation['correct_meaning']['test'], threshold=80,
                                              num_test=num_test_set):
                    failed_simulations.append(f"[{i+1}]")  # flag it, even if it's included in the final analysis
            else:
                failed_simulations.append(str(i+1))

        if failed_simulations:
            print("Failed simulations: ", ' '.join(failed_simulations))

        num_valid_simulations = len(valid_results)  # some might have been discarded

        if num_valid_simulations:  # take the average of results and plot
            results_mean_and_std = compute_mean_and_std(valid_results, evaluated_sets=evaluated_sets, epochs=epochs)
            with open(f"{edited_dir}/summary_edited_results.pickled", 'wb') as pckl:
                pickle.dump(results_mean_and_std, pckl)
            # print(results_mean_and_std)
            plot = Plotter(results_dir=edited_dir, summary_sim=num_valid_simulations, title=title, epochs=epochs,
                           num_training=num_train, num_test=num_test_set)
            test_df = pd.read_csv(os.path.join(results_dir, f"{simulation_range[0]}/{test_name}"),
                                  names=['target_sentence', 'message'], sep='## ', engine='python')

            plot.plot_results(results_mean_and_std, cognate_experiment=cognate_experiment,
                              test_sentences_with_pronoun=test_sentences_with_pronoun,
                              auxiliary_experiment=auxiliary_experiment, evaluated_datasets=evaluated_sets)


if __name__ == "__main__":
    re_plot()

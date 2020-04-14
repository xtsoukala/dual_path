#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys

sys.path.append('..')

from modules import Plotter, pd, create_dataframes_for_plots

if __name__ == "__main__":
    results_dir = '../../../results/'
    plot_code_switches = True
    num_sim = 40

    # Uncomment to re-create the csv files
    """for m in ['early', 'esen', 'enes']:
        create_dataframes_for_plots(results_dir=f'{results_dir}/{m}', epoch_from=0, epoch_to=40,
                                    simulation_range=range(1, num_sim + 1))"""

    plt = Plotter(results_dir=results_dir)
    if plot_code_switches:
        plt.l1_performance_all_models()
        plt.l2_performance_all_models()
        #plt.print_switches_per_model(models=('early', 'esen', 'enes'))
        plt.plot_code_switch_types_per_model()
        #plt.plot_code_switche_types_per_pos_for_all_models()

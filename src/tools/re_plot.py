#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys

sys.path.append('..')

from modules import Plotter, pd, create_dataframes_for_plots

if __name__ == "__main__":
    results_dir = '../../simulations/2020-02-29'
    #for m in ['esen', 'enes', 'esen']:
    #    create_dataframes_for_plots(results_dir=f'{results_dir}/{m}', num_sim=40, epoch_from=0, epoch_to=40)

    #df = pd.read_csv(f'{results_dir}/performance.csv')
    plt = Plotter(results_dir=results_dir)
    """plt.lineplot_code_switches(df)
    plt.l1_performance_all_models()
    plt.plot_code_switche_types_per_pos_for_all_models()
    plt.plot_code_switch_types_per_model()
    plt.l2_performance_all_models()"""
    plt.print_switches_per_model(models=('early', 'esen'), switch_type=('alternational', 'insertional'))

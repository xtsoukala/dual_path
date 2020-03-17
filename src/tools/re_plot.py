#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys

sys.path.append('..')

from modules import Plotter, pd, create_dataframes_for_plots

if __name__ == "__main__":
    results_dir = '../../simulations/'
    num_sim = 2
    epoch_from = 0
    epoch_to = 40
    simulation_range = range(1, num_sim + 1)
    create_dataframes_for_plots(results_dir=results_dir, epoch_from=epoch_from, epoch_to=epoch_to,
                                simulation_range=simulation_range)

    df = pd.read_csv(f'{results_dir}/performance.csv')
    plt = Plotter(results_dir=results_dir)
    plt.performance(df)

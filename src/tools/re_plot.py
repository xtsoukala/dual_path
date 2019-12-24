#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys

sys.path.append('..')

from modules import Plotter, plt, pd, os, str2bool

# early_enes_sim40_h80_cNone_fw10_e30
# late_enes_sim40_h80_cNone_fw10_e30
# late_esen_sim40_h80_cNone_fw10_e30


def re_plot(results_directory='patterns/rerun/late_enes_sim40_h80_cNone_fw10_e30', num_sim=40, epochs=30,
            performance_threshold=50, title=None):
    results_dir = '../../simulations/' + results_directory
    excluded_list = []
    num_excluded = len(excluded_list)
    edited_dir = (f'{results_dir}/edited_t{performance_threshold}_e{epochs}_sim{num_sim}'
                  f'{f"_excluded{num_excluded}" if excluded_list else ""}')
    os.makedirs(edited_dir, exist_ok=True)

    if os.path.exists(f'{edited_dir}/performance.csv'):
        df_meaning_grammaticality_cs = pd.read_csv(f'{edited_dir}/performance.csv', index_col=None,
                                                   header=0, skipinitialspace=True)
        df = pd.read_csv(f'{edited_dir}/all_results.csv', index_col=None, header=0, skipinitialspace=True)
    else:
        all_dfs = []
        for network_num in range(1, num_sim+1):
            temp_df = pd.read_csv(f'{results_dir}/{network_num}/test.csv', index_col=None, header=0,
                                  skipinitialspace=True, dtype={'is_code_switched': str, 'meaning': str})
            temp_df['network_num'] = network_num
            all_dfs.append(temp_df)
        df = pd.concat(all_dfs, axis=0, ignore_index=True)
        df.to_csv(f'{edited_dir}/all_results.csv', index=False)

        df.meaning = df.meaning.apply(lambda x: str2bool(x))
        df.is_code_switched = df.is_code_switched.apply(lambda x: str2bool(x))
        df_meaning_grammaticality_cs = df.groupby(['epoch', 'network_num']).apply(lambda dft: pd.Series(
            {'meaning': dft.meaning.sum(),
             'code_switched': dft[dft.meaning == 1].is_code_switched.sum(),
             'intersentential': len(dft[dft.switched_type == 'inter-sentential']),
             'alternational': len(dft[dft.switched_type == 'alternational']),
             'insertional': len(dft[dft.switched_type == 'insertional']),
             'is_grammatical': dft.is_grammatical.sum()
             }))
        df_meaning_grammaticality_cs.to_csv(f'{edited_dir}/performance.csv')
        df_meaning_grammaticality_cs = pd.read_csv(f'{edited_dir}/performance.csv')

        df['switch_from'] = df.message.str[-2:]
        gb = df[(df.epoch == 30) & (df.switched_type != 'False')].groupby(
            ['switched_type', 'pos_of_switch_point', 'switch_from']).apply(
            lambda dft: pd.Series({'code_switched': dft.is_code_switched.sum()}))
        gb.to_csv(f'{edited_dir}/group_switches.csv')

    group_switches = pd.read_csv(f'{edited_dir}/group_switches.csv')
    plot = Plotter(results_dir=edited_dir)
    plot.plot_performance(df_meaning_grammaticality_cs, num_sentences=500)
    plot.plot_code_switches(df_meaning_grammaticality_cs)
    plot.barplot_code_switches(df, group_switches)


if __name__ == "__main__":
    re_plot()

#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys

sys.path.append('..')

from modules import Plotter, plt, pd, os, str2bool


def re_plot(results_dir, num_sim=40, epoch_from=0, epoch_to=40, performance_threshold=50):
    if not os.path.exists(results_dir):
        sys.exit(f"{results_dir} is not an existing path.")
    excluded_list = []
    num_excluded = len(excluded_list)
    epochs = len(range(epoch_from, epoch_to))
    edited_dir = (f'{results_dir}/edited_t{performance_threshold}_e{epochs}_sim{num_sim}'
                  f'{f"_excluded{num_excluded}" if excluded_list else ""}')
    os.makedirs(edited_dir, exist_ok=True)

    if os.path.exists(f'{edited_dir}/performance.csv') and os.path.exists(f'{edited_dir}/all_results.csv'):
        df_meaning_grammaticality_cs = pd.read_csv(f'{edited_dir}/performance.csv', index_col=None,
                                                   header=0, skipinitialspace=True)
        df = pd.read_csv(f'{edited_dir}/all_results.csv', index_col=None, header=0, skipinitialspace=True)
    else:
        all_dfs = []
        for network_num in range(1, num_sim + 1):
            temp_df = pd.read_csv(f'{results_dir}/{network_num}/test.csv', index_col=None, header=0,
                                  skipinitialspace=True, dtype={'is_code_switched': str, 'meaning': str})
            temp_df['network_num'] = network_num
            all_dfs.append(temp_df)
        df = pd.concat(all_dfs, axis=0, ignore_index=True)
        df.to_csv(f'{edited_dir}/all_results.csv', index=False)

        df.meaning = df.meaning.apply(lambda x: str2bool(x))
        df.is_code_switched = df.is_code_switched.apply(lambda x: str2bool(x))
        df_meaning_grammaticality_cs = df.groupby(['epoch', 'network_num']).apply(lambda dft: pd.Series(
            {'meaning_count': dft.meaning.sum(),
             'code_switched_count': dft[dft.meaning == 1].is_code_switched.sum(),
             'intersentential_count': len(dft[dft.switched_type == 'inter-sentential']),
             'ambiguous_count': len(dft[dft.switched_type == 'ambiguous']),
             'alternational_count': len(dft[dft.switched_type == 'alternational']),
             'insertional_count': len(dft[dft.switched_type == 'insertional']),
             'grammaticality_count': dft.is_grammatical.sum(),
             'meaning': dft.meaning.sum() * 100 / dft.target_pos.sum(),
             'code_switched': dft[dft.meaning == 1].is_code_switched.sum() * 100 / dft.meaning.sum(),
             'grammaticality': dft.is_grammatical.sum() * 100 / dft.target_pos.sum()
             }))
        df_meaning_grammaticality_cs.to_csv(f'{edited_dir}/performance.csv')


        df_meaning_grammaticality_cs = pd.read_csv(f'{edited_dir}/performance.csv')

        df['switch_from'] = df.message.str[-2:]
        gb = df[(df.epoch == epoch_to) & (df.switched_type != 'False')].groupby(
            ['switched_type', 'pos_of_switch_point', 'switch_from']).apply(
            lambda dft: pd.Series({'code_switched': dft.is_code_switched.sum()}))
        gb.to_csv(f'{edited_dir}/code_switch_types.csv')

    if epoch_to < df.epoch.max() or epoch_from > df.epoch.min():
        df = df[(df.epoch >= epoch_from) & (df.epoch <= epoch_to)]
        df_meaning_grammaticality_cs = df_meaning_grammaticality_cs[(df_meaning_grammaticality_cs.epoch >= epoch_from)
                                                                    & (df_meaning_grammaticality_cs.epoch <= epoch_to)]
    group_switches = pd.read_csv(f'{edited_dir}/code_switch_types.csv')
    plot = Plotter(results_dir=edited_dir)
    plot.plot_performance(df_meaning_grammaticality_cs, num_sentences=500)
    plot.plot_code_switches(df_meaning_grammaticality_cs)
    plot.barplot_code_switches(df, group_switches)


def calculate_switches_per_model(results_dir):
    models = ['early', 'enes', 'esen']
    for m in models:
        print(m)
        df = pd.read_csv(f'{results_dir}/{m}_sim40_h80_cNone_fw10_e30/all_results.csv',
                         index_col=None, header=0, skipinitialspace=True, dtype={'epoch': int})
        df = df[df.epoch == (15 if m == 'early' else 30)]
        #for stype in ['alternational', 'insertional', 'ambiguous']:
        #    print(stype, round(df[df.switched_type == stype].is_code_switched.sum() * 100 / df.meaning.sum(), 1))

        for lang in ['en', 'es']:
            ll = df[df.switch_from == lang]
            print(lang)
            for stype in ['alternational', 'insertional', 'ambiguous']:
                print(stype, round(ll[ll.switched_type == stype].is_code_switched.sum() * 100 / df.meaning.sum(), 1))


if __name__ == "__main__":
    #re_plot(results_dir='../../simulations/2020-02-21/enes_sim40_h80_cNone_fw10_e40')
    #calculate_switches_per_model('../../simulations/2020-02-05')
    plot = Plotter(results_dir='../../simulations/2020-02-24')
    plot.l1_performance_sns()
    plot.l1_performance()
   # plot.plot_performance()
    #plot.plot_code_switches_per_model()
    #plot.plot_code_switch_types_per_model()
    #plot.l1_performance()
    #plot.l2_performance()
    #import seaborn as sns

    #sns.set(style="whitegrid")


#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys
import os

sys.path.append('..')

from modules import Plotter, pd, create_dataframes_for_plots


def create_cognate_or_false_friend_model_csv_files(results_dir, models=('cog1', 'cog2'), false_friends=False,
                                                   remove_eos_poi=False, include_baseline=False,
                                                   cognate_list_fname='all_cognates.in'):
    if cognate_list_fname:
        with open(f'{results_dir}/{cognate_list_fname}') as f:
            cognate_list = [line.rstrip('\n').lower() for line in f]

    for model_pair in [models, list(reversed(models))]:
        if include_baseline:
            model_pair += ('zero_cognates',)
        print(model_pair)

        target_concepts = None
        if cognate_list:
            with open(f'{results_dir}/{model_pair[0]}/input/cognates.in') as f:
                cognates_in_simulation = [line.rstrip('\n').lower() for line in f]
            target_concepts = '|'.join(set(cognate_list).intersection(cognates_in_simulation))

        if cognate_list and not target_concepts:
            break

        print('target concepts:', target_concepts)

        cog_or_ff_df = pd.read_csv(f'{results_dir}/{model_pair[0]}/all_results.csv')
        cog_or_ff_df.loc[:, 'model'] = 'false_friend' if false_friends else 'cognate'

        no_cog_or_ff_df = pd.read_csv(f'{results_dir}/{model_pair[1]}/all_results.csv')
        no_cog_or_ff_df.loc[:, 'model'] = 'non_false_friend' if false_friends else 'non_cognate'

        if include_baseline:
            zero_cognates_df = pd.read_csv(f'{results_dir}/{model_pair[2]}/all_results.csv')
            zero_cognates_df.loc[:, 'model'] = 'zero_cognates'

        if false_friends:
            sentences_with = cog_or_ff_df.loc[cog_or_ff_df.target_has_false_friend == True].copy()
        else:
            sentences_with = cog_or_ff_df.loc[cog_or_ff_df.target_has_cognate == True].copy()

        if target_concepts:
            sentences_with = sentences_with.loc[sentences_with.target_sentence.str.contains(target_concepts)]

        sentences_without = no_cog_or_ff_df.loc[no_cog_or_ff_df.index.isin(sentences_with.index)].copy()
        if include_baseline:
            zero_cognates_sentences = zero_cognates_df.loc[zero_cognates_df.index.isin(sentences_with.index)].copy()

        sentences_with.reset_index(drop=True, inplace=True)

        sentences_with.loc[:, 'sentence_idx'] = sentences_with.index
        sentences_without.loc[:, 'sentence_idx'] = sentences_with.index
        if include_baseline:
            zero_cognates_sentences.loc[:, 'sentence_idx'] = sentences_with.index
        # Remove sentences with incorrect meaning or those in which the word of interest was produced at the end.
        sentences_with.drop(sentences_with.loc[sentences_with.meaning == 0].index, inplace=True)
        if remove_eos_poi:
            sentences_with.drop(sentences_with.loc[sentences_with.point_of_interest_produced_last == True].index,
                                inplace=True)

        sentences_without.drop(sentences_without.loc[sentences_without.meaning == 0].index, inplace=True)
        if remove_eos_poi:
            sentences_without.drop(sentences_without.loc[sentences_without.point_of_interest_produced_last == True
                                                         ].index, inplace=True)
        if include_baseline:
            zero_cognates_sentences.drop(zero_cognates_sentences.loc[zero_cognates_sentences.meaning == 0].index,
                                         inplace=True)
            if remove_eos_poi:
                zero_cognates_sentences.drop(zero_cognates_sentences.loc[
                                                 zero_cognates_sentences.point_of_interest_produced_last == True].index,
                                             inplace=True)
        if include_baseline:
            sentences_to_test = pd.concat([sentences_with, sentences_without, zero_cognates_sentences], sort=False)
        else:
            sentences_to_test = pd.concat([sentences_with, sentences_without], sort=False)
        count_correct = sentences_to_test.groupby('sentence_idx').count()
        sentences_to_test = sentences_to_test.loc[sentences_to_test['sentence_idx'].isin(
            count_correct[count_correct['model'] == len(model_pair)].index)]

        # sentences that are correctly produced among all 3 models
        fname = (f'all_epochs_{"_".join(model_pair).replace("/", "_")}'
                 f'{"_remove_last" if remove_eos_poi else ""}.csv')

        sentences_to_test.to_csv(f'{results_dir}/{fname}')

        group_models(results_dir, fname)


def group_models(results_dir, fname, make_exclusive=False):
    df = pd.read_csv(f'{results_dir}/{fname}', dtype={'switched_before': int, 'switched_at': int,
                                                      'switched_right_after': int, 'switched_one_after': int,
                                                      'switched_after_anywhere': int})

    if make_exclusive:
        df['switched_after_anywhere'] = df.apply(lambda x: (0 if ((x['switched_right_after'] == 1) or
                                                                  (x['switched_one_after'] == 1) or
                                                                  (x['switched_at'] == 1) or
                                                                  (x['switched_before'] == 1)) else
                                                            x['switched_after_anywhere']), axis=1)

        df['switched_one_after'] = df.apply(lambda x: (0 if ((x['switched_right_after'] == 1) or
                                                             (x['switched_at'] == 1) or
                                                             (x['switched_before'] == 1)) else
                                                       x['switched_one_after']), axis=1)
        df['switched_right_after'] = df.apply(
            lambda x: (0 if (x['switched_at'] == 1) or (x['switched_before'] == 1)
                       else x['switched_right_after']), axis=1)
        df['switched_at'] = df.apply(lambda x: 0 if x['switched_before'] == 1 else x['switched_at'], axis=1)
    df.to_csv(f'{results_dir}/{"exclusive_" if make_exclusive else ""}{fname}')
    gb = df.groupby(['epoch', 'network_num', 'model']).apply(lambda dft: pd.Series(
        {'code_switched': dft.is_code_switched.sum(),
         'total_sentences': len(dft.meaning),
         'switched_before': dft.switched_before.sum(),
         'switched_at': dft.switched_at.sum(),
         'switched_right_after': dft.switched_right_after.sum(),
         'switched_second_after': dft.switched_one_after.sum(),
         'switched_after_anywhere': dft.switched_after_anywhere.sum(),
         'code_switched_percentage': dft.is_code_switched.sum() * 100 / len(dft.meaning),
         'switched_before_percentage': dft.switched_before.sum() * 100 / len(dft.meaning),
         'switched_at_percentage': dft.switched_at.sum() * 100 / len(dft.meaning),
         'switched_right_after_percentage': dft.switched_right_after.sum() * 100 / len(dft.meaning),
         'switched_second_after_percentage': dft.switched_one_after.sum() * 100 / len(dft.meaning),
         'switched_after_anywhere_percentage': dft.switched_after_anywhere.sum() * 100 / len(dft.meaning)
         }))
    gb.to_csv(f'{results_dir}/{"exclusive_" if make_exclusive else ""}count_{fname}')


def create_all_model_csv_files(results_dir, remove_eos_poi, create_csv=True, models=('ff',), only_last_epoch=False):
    if create_csv:
        for m in models:
            create_cognate_or_false_friend_model_csv_files(results_dir, models=(f'{m}1', f'{m}2'),
                                                           false_friends=True if 'ff' in m else False,
                                                           remove_eos_poi=remove_eos_poi)

    for m in models:
        fname_suffix = "_remove_last" if remove_eos_poi else ""
        m = m.replace("/", "_")
        fnames = [f'{results_dir}/all_epochs_{m}1_{m}2{fname_suffix}.csv',
                  f'{results_dir}/all_epochs_{m}2_{m}1{fname_suffix}.csv']
        all_df = []
        for fname in fnames:
            if os.path.isfile(fname):
                df = pd.read_csv(fname)
                if only_last_epoch:
                    df = df[df.epoch == df.epoch.max()]
                all_df.append(df)

        pd.concat(all_df).to_csv(f'{results_dir}/{m}_models_merged{"_remove_last" if remove_eos_poi else ""}'
                                 f'.csv', index=False,
                                 columns=['epoch', 'network_num', 'sentence_idx', 'model', 'meaning',
                                          'is_code_switched', 'switched_type', 'switched_before', 'switched_at',
                                          'switched_right_after', 'switched_one_after', 'switched_after_anywhere'])
        group_models(results_dir, f'{m}_models_merged{fname_suffix}.csv')


def cognate_simulations():
    results_dir = '../../simulations/cognates/cognate_cross_model'

    remove_point_of_interest_at_eos = False
    create_files = True
    if create_files:
        models = ('10cog', '20cog', '30cog', '40cog')
        create_all_model_csv_files(results_dir, remove_eos_poi=remove_point_of_interest_at_eos, models=models,
                                   create_csv=True)

    plt = Plotter(results_dir=results_dir)
    # plt.performance_all_models(models=('10cog1', '10cog1', '20cog1', '20cog2', 'zero_cognates'))
    # plt.plot_cognate_effect_over_time(df_name=f'count_{fname}', ci=68)
    for i in range(10, 41, 10):
        plt.plot_cognate_effect_over_time(df_name=f'count_{i}cog_models_merged.csv', ci=68, ignore_baseline=True,
                                          info_to_plot=('code_switched',))
    # plt.print_switches_around_switch_point(df_name='count_cog_models_merged.csv')


def code_switching_patterns_model_comparison():
    results_dir = '../../simulations/patterns'
    plot_code_switches = True
    create_csv_files = False

    if create_csv_files:
        num_sim = 40
        for m in ['early', 'esen', 'enes']:
            create_dataframes_for_plots(results_dir=f'{results_dir}/{m}', epoch_from=0, epoch_to=40,
                                        simulation_range=range(1, num_sim + 1))

    plt = Plotter(results_dir=results_dir)
    if plot_code_switches:
        # plt.l1_performance_all_models()
        # plt.l2_performance_all_models()
        plt.plot_code_switches_from_all_models()
        # plt.print_switches_per_model(models=('early', 'esen', 'enes'))
        # plt.plot_code_switch_types_per_model()
        # plt.plot_code_switche_types_per_pos_for_all_models()


if __name__ == "__main__":
    cognate_simulations()

#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys
import os
import hashlib

sys.path.append('..')

from modules import Plotter, pd, create_dataframes_for_plots


def create_cognate_or_false_friend_model_csv_files(results_dir, models=('cog1', 'cog2'), false_friends=False,
                                                   remove_eos_poi=False, include_baseline=False,
                                                   cognate_list_fname='all_cognates.in'):
    cognate_list = None
    if cognate_list_fname:
        with open(f'{results_dir}/{cognate_list_fname}') as f:
            cognate_list = [line.rstrip('\n').lower() for line in f]

    only_compare_with_sentences_not_containing_any_cognates = True

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

        # assign sentence_idx:
        sentences_with['sentence_idx'] = sentences_with.apply(lambda x:
                                                              hash_string(f'{x.message}{x.epoch}{x.network_num}'),
                                                              axis=1)
        sentences_without['sentence_idx'] = sentences_without.apply(lambda x:
                                                                    hash_string(f'{x.message}{x.epoch}{x.network_num}'),
                                                                    axis=1)
        if include_baseline:
            zero_cognates_sentences['sentence_idx'] = zero_cognates_sentences.apply(
                lambda x: hash_string(f'{x.message}{x.epoch}{x.network_num}'), axis=1)

        #sentences_with.reset_index(drop=True, inplace=True)
        #sentences_with.loc[:, 'sentence_idx'] = sentences_with.index
        #sentences_without.loc[:, 'sentence_idx'] = sentences_with.index
        #if include_baseline:
        #    zero_cognates_sentences.loc[:, 'sentence_idx'] = sentences_with.index
        # Remove sentences with incorrect meaning or those in which the word of interest was produced at the end.
        sentences_with.drop(sentences_with.loc[sentences_with.meaning == 0].index, inplace=True)
        if remove_eos_poi:
            sentences_with.drop(sentences_with.loc[sentences_with.point_of_interest_produced_last == True].index,
                                inplace=True)

        print(len(sentences_without))
        sentences_without.drop(sentences_without.loc[sentences_without.meaning == 0].index, inplace=True)
        print(len(sentences_without))
        if only_compare_with_sentences_not_containing_any_cognates:
            sentences_without.drop(sentences_without.loc[sentences_without.target_has_cognate == True].index,
                                   inplace=True)
            print(len(sentences_without))
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

        sentences_to_test.loc[sentences_to_test.concept_position == 'None', 'concept_position'] = -1
        sentences_to_test.loc[sentences_to_test.first_switch_position == 'None', 'first_switch_position'] = -1

        only_allow_identical_sentences = False
        if only_allow_identical_sentences:
            count_correct = sentences_to_test.groupby('sentence_idx').count()
            sentences_to_test = sentences_to_test.loc[sentences_to_test['sentence_idx'].isin(
                count_correct[count_correct['model'] == len(model_pair)].index)]

        # -1 because indexing of other columns starts from 0, not 1
        sentences_to_test['produced_sentence_length'] = sentences_to_test.apply(lambda x:
                                                                                x.produced_sentence.count(' ') - 1,
                                                                                axis=1)

        # sentences that are correctly produced among all 3 models
        fname = (f'all_epochs_{"_".join(model_pair).replace("/", "_")}'
                 f'{"_remove_last" if remove_eos_poi else ""}.csv')

        sentences_to_test.to_csv(f'{results_dir}/{fname}')

        group_models(results_dir, fname)


def group_models(results_dir, fname, make_exclusive=False):
    print(f'{results_dir}/{fname}')
    df = pd.read_csv(f'{results_dir}/{fname}', dtype={'switched_before': int, 'switched_at': int,
                                                      'switched_right_after': int, 'switched_second_after': int,
                                                      'switched_after_anywhere': int, 'concept_position': int,
                                                      'produced_sentence_length': int, 'first_switch_position': int})

    if make_exclusive:
        df['switched_after_anywhere'] = df.apply(lambda x: (0 if ((x['switched_right_after'] == 1) or
                                                                  (x['switched_second_after'] == 1) or
                                                                  (x['switched_at'] == 1) or
                                                                  (x['switched_before'] == 1)) else
                                                            x['switched_after_anywhere']), axis=1)

        df['switched_second_after'] = df.apply(lambda x: (0 if ((x['switched_right_after'] == 1) or
                                                                (x['switched_at'] == 1) or
                                                                (x['switched_before'] == 1)) else
                                                          x['switched_second_after']), axis=1)
        df['switched_right_after'] = df.apply(
            lambda x: (0 if (x['switched_at'] == 1) or (x['switched_before'] == 1)
                       else x['switched_right_after']), axis=1)
        df['switched_at'] = df.apply(lambda x: 0 if x['switched_before'] == 1 else x['switched_at'], axis=1)
    df.to_csv(f'{results_dir}/{"exclusive_" if make_exclusive else ""}{fname}')
    groups = ['epoch', 'network_num', 'model']
    if 'model_name' in df:
        groups.append('model_name')
    gb = df.groupby(groups).apply(lambda dft: pd.Series(
        {'code_switched': dft.is_code_switched.sum(),
         'total_sentences': len(dft.meaning),
         'switched_before': dft.switched_before.sum(),
         'switched_at': dft.switched_at.sum(),
         'switched_right_after': dft.switched_right_after.sum(),
         'switched_second_after': dft.switched_second_after.sum(),
         'switched_after_anywhere': dft.switched_after_anywhere.sum(),
         'code_switched_percentage': dft.is_code_switched.sum() * 100 / len(dft.meaning),
         'switched_before_percentage': (dft.switched_before.sum() * 100 /
                                        len(dft[dft.concept_position > 1].meaning)),
         'switched_at_percentage': dft.switched_at.sum() * 100 / len(dft.meaning),
         'switched_right_after_percentage': (dft.switched_right_after.sum() * 100 /
                                             len(dft[dft.concept_position < dft.produced_sentence_length].meaning)),
         'switched_second_after_percentage': (dft.switched_second_after.sum() * 100 /
                                              len(dft[dft.concept_position < dft.produced_sentence_length].meaning)),
         'switched_after_anywhere_percentage': (dft.switched_after_anywhere.sum() * 100 /
                                                len(dft[dft.concept_position < dft.produced_sentence_length].meaning))
         }))
    """'switch_position': (dft[dft.first_switch_position > 0].concept_position -
                 dft[dft.first_switch_position > 0].first_switch_position),
    'switch_position_distance': ((dft[dft.first_switch_position > 0].concept_position -
                           dft[dft.first_switch_position > 0].first_switch_position) * 100 /
                          dft[dft.first_switch_position > 0].produced_sentence_length)"""

    gb.to_csv(f'{results_dir}/{"exclusive_" if make_exclusive else ""}count_{fname}')


def hash_string(message):
    return hashlib.md5(message.encode()).hexdigest()


def create_all_model_csv_files(results_dir, remove_eos_poi, create_csv=True, models=('ff',), only_last_epoch=True,
                               create_group=False):
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
                                          'switched_right_after', 'switched_second_after', 'switched_after_anywhere',
                                          'first_switch_position', 'concept_position', 'produced_sentence_length'])
        if create_group:
            group_models(results_dir, f'{m}_models_merged{fname_suffix}.csv')


def compare_last_epoch_cognate_csv(results_dir, models=('10cog', '20cog', '30cog'), only_last_epoch=True):
    all_df = []
    for m in models:
        df = pd.read_csv(f'{results_dir}/{m}_models_merged.csv')
        if only_last_epoch:
            df = df[df.epoch == df.epoch.max()]
        df['model_name'] = m
        all_df.append(df)
    sentences_to_test = pd.concat(all_df)
    if False:
        count_correct = sentences_to_test.groupby('sentence_idx').count()
        num_per_unique_sentence = len(models) * 2  # models * (cognate + non_cognate sentences)
        sentences_to_test = sentences_to_test.loc[sentences_to_test['sentence_idx'].isin(
            count_correct[count_correct['model_name'] ==num_per_unique_sentence].index)]

    fname = 'all_models_merged.csv'
    sentences_to_test.to_csv(f'{results_dir}/{fname}')

    group_models(results_dir, fname)


def cognate_simulations():
    results_dir = '../../simulations/cognate_cross_model_max_data/cognate_cross_model'
    #results_dir = '../../simulations/cognates/within_model_cog30'
    #results_dir = '../../simulations/cognates/within_model'
    models = ('10cog', '20cog', '30cog')

    remove_point_of_interest_at_eos = False
    create_files = True
    if create_files:
        create_all_model_csv_files(results_dir, remove_eos_poi=remove_point_of_interest_at_eos, models=models,
                                   create_csv=True, create_group=False)

    compare_last_epoch_cognate_csv(results_dir)

    plot_items = True
    if plot_items:
        plt = Plotter(results_dir=results_dir)
        plt.plot_cognate_last_epoch()
        #plt.performance_all_models(models=('10cog1', '20cog1', '30cog1', '10cog2', '20cog2', '30cog2'))
        # plt.plot_cognate_effect_over_time(df_name=f'count_{fname}', ci=68)
        #for i in range(10, 31, 10):
        #    plt.plot_cognate_effect_over_time(df_name=f'count_{i}cog_models_merged.csv', ci=68, ignore_baseline=True,
        #                                      info_to_plot=('code_switched',))
        #    plt.print_switches_around_switch_point(df_name=f'count_{i}cog_models_merged.csv')
        #i = 40
        #plt.plot_cognate_effect_over_time(df_name=f'count_{i}cog_models_merged.csv', ci=68, ignore_baseline=True,
        #                                  )
        #plt.print_switches_around_switch_point(df_name=f'count_{i}cog_models_merged.csv')


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

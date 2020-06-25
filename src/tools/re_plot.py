#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys
import os
import hashlib

sys.path.append('..')

from modules import Plotter, pd, create_dataframes_for_plots


def create_cognate_or_false_friend_model_csv_files(results_dir, poi_at_end_only, models=('cog1', 'cog2'),
                                                   false_friends=False, include_baseline=False,
                                                   only_compare_with_sentences_not_containing_any_cognates=True):
    cognate_list = None

    print('Cognate list file name:', cognate_list_fname)
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
            print('target concepts:', target_concepts)

        if cognate_list and not target_concepts:
            break

        model_name = 'false_friend' if false_friends else 'cognate'
        cog_or_ff_df = pd.read_csv(f'{results_dir}/{model_pair[0]}/all_results.csv')
        cog_or_ff_df.loc[:, 'model'] = model_name

        no_cog_or_ff_df = pd.read_csv(f'{results_dir}/{model_pair[1]}/all_results.csv')
        no_cog_or_ff_df.loc[:, 'model'] = f'non_{model_name}'

        if false_friends:
            sentences_with = cog_or_ff_df.loc[cog_or_ff_df.target_has_false_friend == True].copy()
        else:
            sentences_with = cog_or_ff_df.loc[cog_or_ff_df.target_has_cognate == True].copy()

        if target_concepts:
            sentences_with = sentences_with.loc[sentences_with.target_sentence.str.contains(target_concepts)]

        # assign sentence_idx:
        sentences_with['sentence_idx'] = sentences_with.apply(lambda x:
                                                              hash_string(f'{x.message}{x.epoch}{x.network_num}'),
                                                              axis=1)
        no_cog_or_ff_df['sentence_idx'] = no_cog_or_ff_df.apply(lambda x:
                                                                hash_string(f'{x.message}{x.epoch}{x.network_num}'),
                                                                axis=1)
        #KEEP SAME SENTENCES:sentences_without = no_cog_or_ff_df.loc[no_cog_or_ff_df.sentence_idx.isin(sentences_with.sentence_idx)].copy()
        sentences_without = no_cog_or_ff_df.copy()
        # Remove sentences with incorrect meaning or those in which the word of interest was produced at the end.
        sentences_with.drop(sentences_with.loc[sentences_with.meaning == 0].index, inplace=True)

        print(len(sentences_without))
        sentences_without.drop(sentences_without.loc[sentences_without.meaning == 0].index, inplace=True)
        print(len(sentences_without))

        if poi_at_end_only:  # drop sentences in which the concept was not produced at the end
            sentences_with.drop(sentences_with.loc[sentences_with.point_of_interest_produced_last == False].index,
                                inplace=True)
            sentences_without.drop(sentences_without.loc[sentences_without.point_of_interest_produced_last == False
                                                         ].index, inplace=True)
            print('POI at end only:', len(sentences_without))

        if only_compare_with_sentences_not_containing_any_cognates:
            sentences_without.drop(sentences_without.loc[sentences_without.target_has_cognate == True].index,
                                   inplace=True)
            print('not containing any cognates', len(sentences_without), '---')

        if include_baseline:
            zero_cognates_df = pd.read_csv(f'{results_dir}/{model_pair[2]}/all_results.csv')
            zero_cognates_df.loc[:, 'model'] = 'zero_cognates'
            zero_cognates_df['sentence_idx'] = zero_cognates_df.apply(
                lambda x: hash_string(f'{x.message}{x.epoch}{x.network_num}'), axis=1)
            zero_cognates_sentences = zero_cognates_df.loc[zero_cognates_df.sentence_idx.isin(
                sentences_with.sentence_idx)].copy()
            zero_cognates_sentences.drop(zero_cognates_sentences.loc[zero_cognates_sentences.meaning == 0].index,
                                         inplace=True)
            sentences_to_test = pd.concat([sentences_with, sentences_without, zero_cognates_sentences], sort=False)
        else:
            sentences_to_test = pd.concat([sentences_with, sentences_without], sort=False)

        sentences_to_test.loc[sentences_to_test.concept_position == 'None', 'concept_position'] = -1
        sentences_to_test.loc[sentences_to_test.first_switch_position == 'None', 'first_switch_position'] = -1

        # sentences that are correctly produced among all 3 models
        fname = f'all_epochs_{"_".join(model_pair).replace("/", "_")}.csv'

        only_allow_identical_sentences = False
        if only_allow_identical_sentences:
            groupby = ['sentence_idx', 'concept_position'] if False else 'sentence_idx'
            count_correct = sentences_to_test.groupby(groupby).count()
            # count_correct_non_unique = sentences_to_test.groupby(groupby).count()
            # count_correct_num = count_correct_non_unique.nunique()
            # print(count_correct_num)
            # count_correct = count_correct_non_unique.loc[count_correct_non_unique['sentence_idx'].isin(
            #    count_correct_num['sentence_idx'] == 1)]
            sentences_to_test = sentences_to_test.loc[sentences_to_test['sentence_idx'].isin(
                count_correct[count_correct['model'] == len(model_pair)].index)]
            print('final sentences to test:', len(sentences_to_test))
        # -1 because indexing of other columns starts from 0, not 1
        sentences_to_test['produced_sentence_length'] = sentences_to_test.apply(lambda x:
                                                                                x.produced_sentence.count(' ') - 1,
                                                                                axis=1)
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

    groups = ['epoch', 'network_num', 'model', 'switch_from']
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
                                        len(dft.meaning)),
         'switched_at_percentage': dft.switched_at.sum() * 100 / len(dft.meaning),
         'switched_right_after_percentage': (dft.switched_right_after.sum() * 100 /
                                             len(dft.meaning)),
         'switched_second_after_percentage': (dft.switched_second_after.sum() * 100 /
                                              len(dft.meaning)),
         'switched_after_anywhere_percentage': (dft.switched_after_anywhere.sum() * 100 / len(dft.meaning))
         }))

    gb.to_csv(f'{results_dir}/{"exclusive_" if make_exclusive else ""}count_{fname}')


def hash_string(message):
    return hashlib.md5(message.encode()).hexdigest()


def cross_model_non_pairwise_csv(results_dir, models, create_files=True, only_common_sentences=False,
                                 fname='non_pairwise_models'):
    if create_files:
        all_dfs = []
        for m in models:
            print(f'{results_dir}/{m}/all_results.csv')
            df = pd.read_csv(f'{results_dir}/{m}/all_results.csv')
            if m != '0cog':
                assert len(df) == len(df[df.target_has_cognate == True])
            df['model_name'] = m
            df['sentence_idx'] = df.apply(lambda x: hash_string(f'{x.message}{x.epoch}{x.network_num}'), axis=1)
            df.drop(df.loc[df.meaning == 0].index, inplace=True)
            all_dfs.append(df)
        non_pairwise_merged = pd.concat(all_dfs, sort=False)

        if only_common_sentences:
            count_correct = non_pairwise_merged.groupby('sentence_idx').count()
            num_per_unique_sentence = len(models)
            non_pairwise_merged = non_pairwise_merged.loc[non_pairwise_merged['sentence_idx'].isin(
                count_correct[count_correct['model_name'] == num_per_unique_sentence].index)]

        non_pairwise_merged.to_csv(f'{results_dir}/{fname}.csv', index=False,
                                   columns=['epoch', 'network_num', 'sentence_idx', 'model_name', 'meaning',
                                            'is_code_switched', 'switched_type', 'switched_before', 'switched_at',
                                            'switched_right_after', 'switched_second_after', 'switched_after_anywhere',
                                            'first_switch_position', 'concept_position', 'produced_sentence_length'])
    else:
        non_pairwise_merged = pd.read_csv(f'{results_dir}/{fname}.csv')

    gb = non_pairwise_merged.groupby(['epoch', 'network_num', 'model_name']).apply(lambda dft: pd.Series(
        {'code_switched': dft.is_code_switched.sum(),
         'total_sentences': len(dft.meaning),
         'switched_before': dft.switched_before.sum(),
         'switched_at': dft.switched_at.sum(),
         'switched_right_after': dft.switched_right_after.sum(),
         'switched_second_after': dft.switched_second_after.sum(),
         'switched_after_anywhere': dft.switched_after_anywhere.sum(),
         'code_switched_percentage': dft.is_code_switched.sum() * 100 / len(dft.meaning),
         'switched_before_percentage': (dft.switched_before.sum() * 100 /
                                        len(dft.meaning)),
         'switched_at_percentage': dft.switched_at.sum() * 100 / len(dft.meaning),
         'switched_right_after_percentage': (dft.switched_right_after.sum() * 100 /
                                             len(dft.meaning)),
         'switched_second_after_percentage': (dft.switched_second_after.sum() * 100 /
                                              len(dft.meaning)),
         'switched_after_anywhere_percentage': (dft.switched_after_anywhere.sum() * 100 /
                                                len(dft.meaning))
         }))
    gb.to_csv(f'{results_dir}/{fname}_grouped.csv')


def create_all_model_csv_files(results_dir, create_csv=True, models=('ff',), only_last_epoch=True,
                               create_group=True, poi_at_end_only=False):
    if create_csv:
        for m in models:
            print(results_dir, m)
            create_cognate_or_false_friend_model_csv_files(results_dir, poi_at_end_only, models=(f'{m}1', f'{m}2'),
                                                           false_friends=True if 'ff' in m else False)

    for m in models:
        m = m.replace("/", "_")
        fnames = [f'{results_dir}/all_epochs_{m}1_{m}2.csv',
                  f'{results_dir}/all_epochs_{m}2_{m}1.csv']
        all_df = []
        for fname in fnames:
            if os.path.isfile(fname):
                df = pd.read_csv(fname)
                if only_last_epoch:
                    df = df[df.epoch == df.epoch.max()]
                all_df.append(df)
        pd.concat(all_df, sort=False).to_csv(f'{results_dir}/{m}_models_merged.csv', index=False,
                                             columns=['epoch', 'network_num', 'sentence_idx', 'model', 'meaning',
                                                      'switch_from', 'is_code_switched', 'switched_type',
                                                      'switched_before', 'switched_at', 'switched_right_after',
                                                      'switched_second_after', 'switched_after_anywhere',
                                                      'first_switch_position', 'concept_position',
                                                      'produced_sentence_length'])
        if create_group:
            group_models(results_dir, f'{m}_models_merged.csv')


def pairwise_cross_model_comparison(results_dir, models=('10cog', '20cog', '30cog'), only_last_epoch=True,
                                    only_common_sentences=False, create_files=False):
    if create_files:
        create_all_model_csv_files(results_dir, models=models, poi_at_end_only=True if 'eos' in results_dir else False,
                                   create_csv=False, create_group=True, only_last_epoch=only_last_epoch)

    all_df = []
    for m in models:
        df = pd.read_csv(f'{results_dir}/{m}_models_merged.csv')
        if only_last_epoch:
            df = df[df.epoch == df.epoch.max()]
        df['model_name'] = m
        all_df.append(df)
    sentences_to_test = pd.concat(all_df, sort=False)
    if only_common_sentences:
        count_correct = sentences_to_test.groupby('sentence_idx').count()
        num_per_unique_sentence = len(models) * 2  # models * (cognate + non_cognate sentences)
        sentences_to_test = sentences_to_test.loc[sentences_to_test['sentence_idx'].isin(
            count_correct[count_correct['model_name'] == num_per_unique_sentence].index)]

    fname = 'cog_models_merged.csv'
    sentences_to_test.to_csv(f'{results_dir}/{fname}')

    group_models(results_dir, fname)

    plt = Plotter(results_dir=results_dir)
    plt.plot_cognate_last_epoch(df_name=f'count_all_models_merged.csv', ci=68,
                                info_to_plot=('code_switched',), lineplot=True)


def non_pairwise_cross_model_comparison(results_dir, create_files=True):
    if create_files:
        models = []
        for i in range(0, 71, 10):
            models.append(f'{i}cog')
        cross_model_non_pairwise_csv(results_dir, models, only_common_sentences=False)

    plt = Plotter(results_dir=results_dir)
    plt.plot_cognate_last_epoch(df_name='non_pairwise_models_grouped_same_sentences.csv', hue=None, epoch=20,
                                include_annotations=False, lineplot=True, ci=68)


def cognate_simulations(results_dir, models, create_files=True, plot_items=True, only_last_epoch=False):
    if create_files:
        create_all_model_csv_files(results_dir, models=models, poi_at_end_only=True if 'eos' in results_dir else False,
                                   create_csv=True, create_group=True, only_last_epoch=only_last_epoch)

    if plot_items:
        plt = Plotter(results_dir=results_dir)
        # plt.plot_cognate_last_epoch()
        all_models = []
        for m in models:
            all_models.extend([f'{m}1', f'{m}2'])

        #plt.performance_all_models(models=all_models)

        # plt.plot_cognate_effect_over_time(df_name=f'count_{fname}', ci=68)
        #for i in range(10, 31, 10):
        #    plt.plot_cognate_effect_over_time(df_name=f'count_{i}cog_models_merged.csv', ci=68, ignore_baseline=True,
        #                                      info_to_plot=('code_switched',))
        #    plt.print_switches_around_switch_point(df_name=f'count_{i}cog_models_merged.csv')
        for i in models:
            i = i.replace("/", "_")
            info_to_plot = (('code_switched', 'switched_before', 'switched_at', 'switched_right_after',
                            'switched_second_after', 'switched_after_anywhere') if ('eos' in results_dir or
                                                                                    'bos' in results_dir) else
                            ('code_switched',))
            plt.plot_cognate_last_epoch(df_name=f'count_{i}_models_merged.csv', ci=68,
                                        info_to_plot=info_to_plot, lineplot=False)
            #plt.plot_cognate_last_epoch(df_name=f'count_{i}_models_merged.csv', ci=68, xrow='model', hue=None,
            #                            info_to_plot=('code_switched',) + info_to_plot, epoch=30)
            #plt.print_switches_around_switch_point(df_name=f'count_{i}_models_merged.csv')


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

def plot_l1_with_code_switches(results_dir = '../../simulations/messageless/messageless_balanced',
                               languages=['en', 'es']):
    df = pd.read_csv(f'{results_dir}/performance_per_lang.csv',
                     index_col=None, header=0, skipinitialspace=True, dtype={'epoch': int})
    plt = Plotter(results_dir=results_dir)
    for l in languages:
        plt.performance(df[df.switch_from == l], fname=f'l1_performance_{l}', include_code_switches=True, max_epochs=40)


cognate_list_fname = None  # 'all_cognates.in'

if __name__ == "__main__":
    #plot_l1_with_code_switches()
    plt = Plotter(results_dir='../../simulations/messageless/')
    plt.plot_code_switch_types_per_model(models=('messageless_balanced',))
    plt.plot_code_switche_types_per_pos_for_all_models(models=('messageless_balanced',), ylim=3)
    #cognate_simulations(create_files=True,
    #                    results_dir='../../simulations/cognates_paper/within_model/balanced_results/generic_test',
    #                    models=('cog',))
    #non_pairwise_cross_model_comparison(create_files=False,
    #                                    results_dir='../../simulations/cognates_paper/cross_model_non_pairwise/')

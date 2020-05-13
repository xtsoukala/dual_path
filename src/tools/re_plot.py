#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys

sys.path.append('..')

from modules import Plotter, pd, create_dataframes_for_plots


def create_cognate_or_false_friend_model_csv_files(results_dir, models=('cog1', 'cog2'), false_friends=False,
                                                   remove_eos_poi=False):
    for model_pair in [models, list(reversed(models))]:
        model_pair += ('zero_cognates',)  # also compare with zero_cognates
        print(model_pair)
        cog_or_ff_df = pd.read_csv(f'{results_dir}/{model_pair[0]}/all_results.csv')
        if false_friends:
            cog_or_ff_df.loc[:, 'model'] = 'false_friend'
        else:
            cog_or_ff_df.loc[:, 'model'] = 'cognate'

        no_cog_or_ff_df = pd.read_csv(f'{results_dir}/{model_pair[1]}/all_results.csv')
        if false_friends:
            no_cog_or_ff_df.loc[:, 'model'] = 'non_false_friend'
        else:
            no_cog_or_ff_df.loc[:, 'model'] = 'non_cognate'

        zero_cognates_df = pd.read_csv(f'{results_dir}/{model_pair[2]}/all_results.csv')
        zero_cognates_df.loc[:, 'model'] = 'zero_cognates'

        if false_friends:
            sentences_with = cog_or_ff_df.loc[cog_or_ff_df.target_has_false_friend == True]
        else:
            sentences_with = cog_or_ff_df.loc[cog_or_ff_df.target_has_cognate == True]
            """concepts_of_interest_ff = '|'.join(['dog', 'host', 'brother', 'waiter',
                                                'sister', 'boy', 'woman', 'waitress'])
            sentences_with = cog_or_ff_df.loc[(cog_or_ff_df.target_has_cognate == True) &
                                              (cog_or_ff_df.target_sentence.str.contains(concepts_of_interest_ff))]"""

        sentences_without = no_cog_or_ff_df.loc[no_cog_or_ff_df.index.isin(sentences_with.index)]
        zero_cognates_sentences = zero_cognates_df.loc[zero_cognates_df.index.isin(sentences_with.index)]

        sentences_with.reset_index(drop=True, inplace=True)

        sentences_with.loc[:, 'sentence_idx'] = sentences_with.index
        sentences_without.loc[:, 'sentence_idx'] = sentences_with.index
        zero_cognates_sentences.loc[:, 'sentence_idx'] = sentences_with.index

        # Remove sentences with incorrect meaning or those in which the word of interest was produced at the end.
        sentences_with.drop(sentences_with.loc[sentences_with.meaning == 0].index, inplace=True)
        # sentences_with = sentences_with.loc[sentences_with.meaning == 1]
        if remove_eos_poi:
            sentences_with.drop(sentences_with.loc[sentences_with.point_of_interest_produced_last == True].index,
                                inplace=True)

        sentences_without.drop(sentences_without.loc[sentences_without.meaning == 0].index, inplace=True)
        if remove_eos_poi:
            sentences_without.drop(sentences_without.loc[sentences_without.point_of_interest_produced_last == True
                                                         ].index, inplace=True)

        zero_cognates_sentences.drop(zero_cognates_sentences.loc[zero_cognates_sentences.meaning == 0].index,
                                     inplace=True)
        if remove_eos_poi:
            zero_cognates_sentences.drop(zero_cognates_sentences.loc[
                                             zero_cognates_sentences.point_of_interest_produced_last == True].index,
                                         inplace=True)

        sentences_to_test = pd.concat([sentences_with, sentences_without, zero_cognates_sentences], sort=False)
        print('sent before:', sentences_to_test.size)
        count_correct = sentences_to_test.groupby('sentence_idx').count()
        sentences_to_test = sentences_to_test.loc[sentences_to_test['sentence_idx'].isin(
            count_correct[count_correct['model'] == len(model_pair)].index)]
        print('sent after:', sentences_to_test.size)

        # sentences that are correctly produced among all 3 models
        fname = (f'all_epochs_{"_".join(model_pair)}'
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
         'switched_one_after': dft.switched_one_after.sum(),
         'switched_after_anywhere': dft.switched_after_anywhere.sum(),
         'code_switched_percentage': dft.is_code_switched.sum() * 100 / len(dft.meaning),
         'switched_before_percentage': dft.switched_before.sum() * 100 / len(dft.meaning),
         'switched_at_percentage': dft.switched_at.sum() * 100 / len(dft.meaning),
         'switched_right_after_percentage': dft.switched_right_after.sum() * 100 / len(dft.meaning),
         'switched_one_after_percentage': dft.switched_one_after.sum() * 100 / len(dft.meaning),
         'switched_after_anywhere_percentage': dft.switched_after_anywhere.sum() * 100 / len(dft.meaning)
         }))
    gb.to_csv(f'{results_dir}/{"exclusive_" if make_exclusive else ""}count_{fname}')


def create_all_model_csv_files(results_dir, remove_eos_poi, create_csv=True, models=('ff',)):
    if create_csv:
        for m in models:
            create_cognate_or_false_friend_model_csv_files(results_dir, models=(f'{m}1', f'{m}2'),
                                                           false_friends=True if 'ff' in m else False,
                                                           remove_eos_poi=remove_eos_poi)

    for m in models:
        fname_suffix = "_remove_last" if remove_eos_poi else ""
        df1 = pd.read_csv(f'{results_dir}/all_epochs_{m}1_{m}2_zero_cognates{fname_suffix}.csv')
        df2 = pd.read_csv(f'{results_dir}/all_epochs_{m}2_{m}1_zero_cognates{fname_suffix}.csv')
        #df1 = df1[df1.epoch == df1.epoch.max()]
        #df2 = df2[df2.epoch == df2.epoch.max()]
        pd.concat([df1, df2]).to_csv(f'{results_dir}/{m}_models_merged{"_remove_last" if remove_eos_poi else ""}'
                                     f'.csv', index=False,
                                     columns=['epoch', 'network_num', 'sentence_idx', 'model', 'meaning',
                                              'is_code_switched', 'switched_type', 'switched_before', 'switched_at',
                                              'switched_right_after', 'switched_one_after', 'switched_after_anywhere'])
        group_models(results_dir, f'{m}_models_merged{fname_suffix}.csv')


if __name__ == "__main__":
    results_dir = '../../simulations/cognates'

    remove_point_of_interest_at_eos = True
    #create_all_model_csv_files(results_dir, remove_eos_poi=remove_point_of_interest_at_eos, models=('cognate',),
    #                           create_csv=True)

    plt = Plotter(results_dir=results_dir)
    # plt.performance_all_models(models=('cog1', 'cog2', 'ff1', 'ff2', 'zero_cognates'))
    #plt.plot_cognate_effect_over_time(df_name=f'count_{fname}', ci=68)
    plt.plot_cognate_effect_over_time(df_name='count_cognate_models_merged.csv', ci=68, ignore_baseline=True)
    #plt.print_switches_around_switch_point(df_name='count_cog_models_merged.csv')

#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys

sys.path.append('..')

from modules import Plotter, pd, create_dataframes_for_plots


def create_cognate_model_csv_files(results_dir, models=('cog1', 'cog2')):
    for model_pair in [models, list(reversed(models))]:
        model_pair += ('baseline',)  # also compare with baseline
        print(model_pair)
        cog_df = pd.read_csv(f'{results_dir}/{model_pair[0]}/all_results.csv')
        #cog_df = cog_df[cog_df.epoch == cog_df.epoch.max()]  # only keep the last epoch
        cog_df.loc[:, 'model'] = 'cognate_model'

        no_cog_df = pd.read_csv(f'{results_dir}/{model_pair[1]}/all_results.csv')
        #no_cog_df = no_cog_df[no_cog_df.epoch == no_cog_df.epoch.max()]  # only keep the last epoch
        no_cog_df.loc[:, 'model'] = 'non_cognate_model'

        baseline_df = pd.read_csv(f'{results_dir}/{model_pair[2]}/all_results.csv')
        #baseline_df = baseline_df[baseline_df.epoch == baseline_df.epoch.max()]  # only keep the last epoch
        baseline_df.loc[:, 'model'] = 'baseline_model'

        """cognate_concept_string = '|'.join([line.rstrip('\n') for line in
                                           open(f'{results_dir}/{model_pair[0]}/input/cognates.in')])
        cognate_words = cognate_concept_string.lower().split('|')
        print(cognate_words)"""

        cognate_sentences = cog_df[cog_df.target_has_cognate == True]
        print(len(cognate_sentences), "sentences with cognates")  # 12326

        no_cognate_sentences = no_cog_df[no_cog_df.index.isin(cognate_sentences.index)]
        baseline_sentences = baseline_df[baseline_df.index.isin(cognate_sentences.index)]

        cognate_sentences.reset_index(drop=True, inplace=True)

        cognate_sentences.loc[:, 'sentence_idx'] = cognate_sentences.index
        no_cognate_sentences.loc[:, 'sentence_idx'] = cognate_sentences.index
        baseline_sentences.loc[:, 'sentence_idx'] = cognate_sentences.index

        cognate_sentences = cognate_sentences[cognate_sentences.meaning == 1]
        len(cognate_sentences)
        no_cognate_sentences = no_cognate_sentences[no_cognate_sentences.meaning == 1]
        len(no_cognate_sentences)
        baseline_sentences = baseline_sentences[baseline_sentences.meaning == 1]
        len(baseline_sentences)

        sentences_to_test = pd.concat([cognate_sentences, no_cognate_sentences, baseline_sentences])
        print('sent before:', sentences_to_test.size)
        count_correct = sentences_to_test.groupby('sentence_idx').count()
        sentences_to_test = sentences_to_test.loc[sentences_to_test['sentence_idx'].isin(
            count_correct[count_correct['model'] == len(model_pair)].index)]
        print('sent after:', sentences_to_test.size)

        # sentences that are correctly produced among all 3 models
        sentences_to_test.to_csv(f'{results_dir}/all_epochs_test_{"_".join(model_pair)}.csv')
        """"sentences_to_test = pd.concat([cognate_sentences.produced_sentence, cognate_sentences.meaning,
                                       cognate_sentences[cognate_sentences.meaning == 1].is_code_switched,
                                       no_cognate_sentences.produced_sentence, no_cognate_sentences.meaning,
                                       no_cognate_sentences[no_cognate_sentences.meaning == 1
                                                            ].is_code_switched,
                                       no_cognate_sentences.target_sentence, cognate_sentences.message,
                                       cognate_sentences.cognate_expressed, cognate_sentences.num_cognates], axis=1)
        sentences_to_test.columns = ['cog_sentence', 'cog_correct_meaning', 'cog_correct_cs', 'no_cog_sentence',
                                     'no_cog_correct_meaning', 'no_cog_correct_cs', 'target_sentence', 'message',
                                     'cognate_expressed', 'num_cognates']
        """
        """sentences_to_test.to_csv(f'test_{"_".join(model_pair)}')
        print("CS with cog:", sentences_to_test.cog_correct_cs.sum(),
              "CS no cog:", sentences_to_test.no_cog_correct_cs.sum())

        print("Only with expressed cognate:", "CS with cog:",
              sentences_to_test[sentences_to_test.cognate_expressed == True].cog_correct_cs.sum(),
              "CS no cog:", sentences_to_test[sentences_to_test.cognate_expressed == True].no_cog_correct_cs.sum())

        print("Correctly produced in both models:")
        sentences_to_test = sentences_to_test[(sentences_to_test.cog_correct_meaning == 1) &
                                              (sentences_to_test.no_cog_correct_meaning == 1)]
        print("CS with cog:", sentences_to_test.cog_correct_cs.sum(),
              "CS no cog:", sentences_to_test.no_cog_correct_cs.sum())

        print("Only with expressed cognate:", "CS with cog:",
              sentences_to_test[sentences_to_test.cognate_expressed == True].cog_correct_cs.sum(),
              "CS no cog:", sentences_to_test[sentences_to_test.cognate_expressed == True].no_cog_correct_cs.sum())
        """


def compare_cognate_models(results_dir, fname):
    df = pd.read_csv(f'{results_dir}/{fname}', dtype={'switched_before': int, 'switched_right_after': int,
                                                      'switched_one_after': int, 'switched_after_anywhere': int,
                                                      'switched_before_es_en': int, 'switched_right_after_es_en': int,
                                                      'switched_one_after_es_en': int,
                                                      'switched_after_anywhere_es_en': int})
    gb = df.groupby(['epoch', 'network_num', 'model']).apply(lambda dft: pd.Series(
        {'code_switched': dft.is_code_switched.sum(),
         'total_sentences': len(dft.meaning),
         'switched_before': dft.switched_before.sum(),
         'switched_right_after': dft.switched_right_after.sum(),
         'switched_one_after': dft.switched_one_after.sum(),
         'switched_after_anywhere': dft.switched_after_anywhere.sum()
         }))
    """'switched_before_es_en': dft.switched_before_es_en.sum(),
    'switched_right_after_es_en': dft.switched_right_after_es_en.sum(),
    'switched_one_after_es_en': dft.switched_one_after_es_en.sum(),
    'switched_after_anywhere_es_en': dft.switched_after_anywhere_es_en.sum(),
    'ambiguous': len(dft[dft.switched_type == 'ambiguous']),
    'alternational': len(dft[dft.switched_type == 'alternational']),
    'insertional': len(dft[dft.switched_type == 'insertional']),"""
    gb.to_csv(f'{results_dir}/count_network_all_epochs{fname}')


if __name__ == "__main__":
    results_dir = '../../simulations/cognates/'
    #create_cognate_model_csv_files(results_dir)

    """compare_cognate_models(results_dir, 'all_epochs_test_cog1_cog2_baseline.csv')
    compare_cognate_models(results_dir, 'all_epochs_test_cog2_cog1_baseline.csv')
    df1 = pd.read_csv(f'{results_dir}/all_epochs_test_cog1_cog2_baseline.csv')
    df2 = pd.read_csv(f'{results_dir}/all_epochs_test_cog2_cog1_baseline.csv')
    merged_models = pd.concat([df1, df2])
    merged_models.to_csv(f'{results_dir}/all_epochs_test_merged.csv')
    compare_cognate_models(results_dir, 'all_epochs_test_merged.csv')"""

    """compare_cognate_models(results_dir, 'test_cog1_cog2_baseline.csv')
    compare_cognate_models(results_dir, 'test_cog2_cog1_baseline.csv')

    df1 = pd.read_csv(f'{results_dir}/test_cog1_cog2_baseline.csv')
    df2 = pd.read_csv(f'{results_dir}/test_cog2_cog1_baseline.csv')
    merged_models = pd.concat([df1, df2])
    merged_models.to_csv(f'{results_dir}/test_merged.csv')
    compare_cognate_models(results_dir, 'test_merged.csv')"""
    """plot_code_switches = True
    num_sim = 40
    epochs = 20
    # Uncomment to re-create the csv files
    for m in ['cog1', 'cog2']:
        create_dataframes_for_plots(results_dir=f'{results_dir}/{m}', epoch_from=0, epoch_to=epochs,
                                    simulation_range=range(1, num_sim + 1))

    plt = Plotter(results_dir=results_dir)
    if plot_code_switches:
        #plt.l1_performance_all_models()
        #plt.l2_performance_all_models()
        plt.performance_all_models(models=('cog1', 'cog2'))
        # plt.print_switches_per_model(models=('early', 'esen', 'enes'))
        plt.plot_code_switch_types_per_model()
        # plt.plot_code_switche_types_per_pos_for_all_models()"""

    plt = Plotter(results_dir=results_dir)
    plt.plot_cognate_effect_over_time(df_name='count_network_all_epochs_test_merged.csv')

#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys

sys.path.append('..')

from modules import Plotter, pd, create_dataframes_for_plots


def compare_cognate_models(results_dir='../../simulations/cognate', models=('cog1', 'cog2')):
    for model_pair in [models, list(reversed(models))]:
        print(model_pair)
        cog_df = pd.read_csv(f'{results_dir}/{model_pair[0]}/all_results.csv')
        cog_df = cog_df[cog_df.epoch == cog_df.epoch.max()]  # only keep the last epoch
    
        no_cog_df = pd.read_csv(f'{results_dir}/{model_pair[1]}/all_results.csv')
        no_cog_df = no_cog_df[no_cog_df.epoch == no_cog_df.epoch.max()]  # only keep the last epoch
    
        cognate_concept_string = '|'.join([line.rstrip('\n') for line in
                                           open(f'{results_dir}/{model_pair[0]}/input/cognates.in')])
        cognate_words = cognate_concept_string.lower().split('|')
        cognate_sentences = cog_df[cog_df.message.str.contains(cognate_concept_string)]
        cognate_sentences['cognate_expressed'] = cognate_sentences.produced_sentence.apply(
            lambda x: any(i in x for i in cognate_words))
        cognate_sentences['num_cognates'] = cognate_sentences.message.apply(
            lambda x: x.count(',COG'))
        print(len(cognate_sentences), "sentences with cognates")   # 12326
    
        no_cognate_sentences = no_cog_df[no_cog_df.index.isin(cognate_sentences.index)]
        sentences_to_test = pd.concat([cognate_sentences.produced_sentence, cognate_sentences.meaning,
                                       cognate_sentences[cognate_sentences.meaning == 1].is_code_switched,
                                       no_cognate_sentences.produced_sentence, no_cognate_sentences.meaning,
                                       no_cognate_sentences[no_cognate_sentences.meaning == 1
                                                            ].is_code_switched,
                                       no_cognate_sentences.target_sentence, cognate_sentences.message,
                                       cognate_sentences.cognate_expressed, cognate_sentences.num_cognates], axis=1)
        sentences_to_test.columns = ['cog_sentence', 'cog_correct_meaning', 'cog_correct_cs', 'no_cog_sentence',
                                     'no_cog_correct_meaning', 'no_cog_correct_cs', 'target_sentence', 'message',
                                     'cognate_expressed', 'num_cognates']

        sentences_to_test.to_csv(f'test_{"_".join(model_pair)}')
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


if __name__ == "__main__":
    results_dir = '../../simulations/cognate'
    compare_cognate_models()
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

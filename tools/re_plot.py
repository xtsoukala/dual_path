import pickle
import os
import subprocess
from src.plotter import Plotter
from src.formatter import compute_mean_and_std
import numpy as np
import pandas as pd


def training_is_successful(x, threshold, num_test):
    if x:
        return np.true_divide(x[-1] * 100, num_test) >= threshold
    print("Training did not pass the threshold: %s / %s" % (x, threshold))
    return False


main_dir = '../simulations/'
results_dir = main_dir + 'cmcl_2019-03-01/code_switching_patterns'
results_dir = main_dir + '2019-07-10/09.49.32_esen_sim4_h110_c70_fw30_e6'
num_sim = 4
epochs = 6
performance_threshold = 5
test_name = 'test.in'
training_name = 'training.in'
num_test_set = int(subprocess.check_output("wc -l %s/input/%s" % (results_dir, test_name), shell=True).split()[0])
num_train = int(subprocess.check_output("wc -l %s/input/%s" % (results_dir, training_name), shell=True).split()[0])
evaluated_sets = ('test',)

# tener + haber + synonyms
excluded_list = []  # [12, 21, 31, 32, 36, 42, 43, 57] + [1, 2, 5, 11, 54] + [2, 17, 20, 24, 31, 36, 43, 51, 54, 56]
num_excluded = len(excluded_list)
edited_dir = results_dir + '/edited_t%s_e%s_sim%s%s' % (performance_threshold, epochs, num_sim,
                                                        "_excluded%s" % num_excluded if excluded_list else "")
os.makedirs(edited_dir, exist_ok=True)

title = ''

cognate_experiment = False
test_sentences_with_pronoun = pronoun_experiment = False
auxiliary_experiment = False if 'aux' not in test_name else True

all_results = []
for sim in range(num_sim):  # read results from all simulations
    if os.path.isfile('%s/%s/results.pickled' % (results_dir, sim)):
        with open('%s/%s/results.pickled' % (results_dir, sim), 'rb') as f:
            all_results.append(pickle.load(f))

if all_results:
    valid_results = []
    failed_simulations = []
    for i, simulation in enumerate(all_results):
        if i not in excluded_list and training_is_successful(simulation['correct_meaning']['test'],
                                                             threshold=performance_threshold, num_test=num_test_set):
            valid_results.append(simulation)
            if not training_is_successful(simulation['correct_meaning']['test'], threshold=80, num_test=num_test_set):
                failed_simulations.append("[%s]" % i)  # flag it, even if it's included in the final analysis
        else:
            failed_simulations.append(str(i))

    if failed_simulations:
        print("Failed simulations: %s" % ' '.join(failed_simulations))

    num_valid_simulations = len(valid_results)  # some might have been discarded

    if num_valid_simulations:  # take the average of results and plot
        results_mean_and_std = compute_mean_and_std(valid_results, evaluated_sets=evaluated_sets, epochs=epochs)
        with open("%s/summary_edited_results.pickled" % edited_dir, 'wb') as pckl:
            pickle.dump(results_mean_and_std, pckl)
        # print(results_mean_and_std)
        plot = Plotter(results_dir=edited_dir, summary_sim=num_valid_simulations, title=title, epochs=epochs,
                       num_training=num_train, num_test=num_test_set)
        test_df = pd.read_csv(os.path.join(results_dir, "input/%s" % test_name), names=['target_sentence', 'message'],
                              sep='## ', engine='python')

        plot.plot_results(results_mean_and_std, cognate_experiment=cognate_experiment,
                          test_sentences_with_pronoun=test_sentences_with_pronoun,
                          auxiliary_experiment=auxiliary_experiment, evaluated_datasets=evaluated_sets)

        import sys; sys.exit()
        all_haber_tener = [(np.array([-1.49166815e-154, 3.25084910e+000, 3.36241213e+000,
                                      3.03479381e+000, 2.62734276e+000, 2.83575566e+000,
                                      2.67708053e+000, 2.17425722e+000, 2.03773192e+000,
                                      2.56580290e+000, 2.81668619e+000, 3.02333895e+000,
                                      2.99315558e+000, 2.83167813e+000, 2.80468631e+000,
                                      2.75903736e+000, 3.03683287e+000, 3.04713299e+000,
                                      3.03968056e+000, 2.99919888e+000, 2.84800640e+000,
                                      3.03197354e+000, 3.03347802e+000, 3.12531005e+000,
                                      3.01709190e+000, 3.00034600e+000, 3.06157721e+000,
                                      3.13561408e+000, 2.94594993e+000, 2.91333925e+000]),
                            np.array([-1.49166815e-154, 5.66854253e-001, 5.70775984e-001,
                                      5.70767874e-001, 5.18294339e-001, 5.43757048e-001,
                                      6.60266646e-001, 3.67539165e-001, 3.39762643e-001,
                                      4.63765604e-001, 5.46745590e-001, 5.64578292e-001,
                                      5.11586399e-001, 5.00940867e-001, 4.58999695e-001,
                                      3.99066351e-001, 4.99181088e-001, 4.33602347e-001,
                                      4.15203523e-001, 4.89227039e-001, 3.86098533e-001,
                                      4.41447903e-001, 4.34175948e-001, 4.54051474e-001,
                                      4.30982232e-001, 4.14958924e-001, 4.25510072e-001,
                                      4.33446346e-001, 3.90020229e-001, 3.67157004e-001])),
                           (np.array([-1.49166815e-154, 4.58459390e+000, 2.86069652e+000,
                                      3.15789474e+000, 2.83265624e+000, 3.08606579e+000,
                                      2.87810384e+000, 2.52755030e+000, 2.41717546e+000,
                                      2.29369112e+000, 2.30735098e+000, 2.46010967e+000,
                                      2.73707218e+000, 2.72394700e+000, 2.64831561e+000,
                                      2.62325857e+000, 2.64005151e+000, 2.57447228e+000,
                                      2.52896229e+000, 2.59011227e+000, 2.61157188e+000,
                                      2.61738657e+000, 2.61079854e+000, 2.70801592e+000,
                                      2.64503441e+000, 2.64900662e+000, 2.63299828e+000,
                                      2.70481398e+000, 2.70349691e+000, 2.63003232e+000]),
                            np.array([-1.49166815e-154, 7.29747301e-001, 5.84124308e-001,
                                      5.92718884e-001, 5.55473408e-001, 5.04911693e-001,
                                      4.74680060e-001, 4.01454278e-001, 3.31259017e-001,
                                      3.64299170e-001, 3.43135824e-001, 3.64867521e-001,
                                      3.87697823e-001, 4.25136130e-001, 3.92009528e-001,
                                      3.57401505e-001, 3.70945933e-001, 3.90977693e-001,
                                      3.72503275e-001, 4.07109177e-001, 4.08263530e-001,
                                      3.92436901e-001, 4.12299020e-001, 3.98832770e-001,
                                      3.89162491e-001, 3.92376272e-001, 4.03238226e-001,
                                      4.11099403e-001, 4.21394442e-001, 3.81371391e-001])),
                           (np.array([1.72723371e-77, 2.36589365e+00, 2.79696427e+00, 2.22406322e+00,
                                      2.12599306e+00, 2.01385532e+00, 2.17118998e+00, 2.50414766e+00,
                                      2.23403158e+00, 2.44698206e+00, 2.59028267e+00, 2.96646387e+00,
                                      3.14560370e+00, 3.41635220e+00, 3.30915684e+00, 3.31870681e+00,
                                      3.57431749e+00, 3.82414020e+00, 3.92770598e+00, 3.90463201e+00,
                                      3.88462316e+00, 3.86776692e+00, 3.88061204e+00, 3.91457286e+00,
                                      3.98057280e+00, 3.97039704e+00, 4.11082216e+00, 4.14774145e+00,
                                      4.05627900e+00, 4.15960945e+00]),
                            np.array([1.72723371e-77, 5.05646463e-01, 4.89930456e-01, 4.89224223e-01,
                                      3.39561146e-01, 4.02268764e-01, 4.45255457e-01, 4.82510710e-01,
                                      3.82837507e-01, 3.97041753e-01, 4.74176334e-01, 5.49897821e-01,
                                      5.61572325e-01, 5.60540564e-01, 5.59398355e-01, 5.14153223e-01,
                                      5.19177477e-01, 5.51532053e-01, 5.74940561e-01, 5.58927509e-01,
                                      5.57978696e-01, 5.55008904e-01, 5.67869360e-01, 5.76412562e-01,
                                      5.91667983e-01, 5.88796259e-01, 6.07240561e-01, 5.72500799e-01,
                                      5.89237791e-01, 5.77097541e-01])),
                           (np.array([1.72723371e-77, 3.48341232e+00, 2.17711573e+00, 1.75514761e+00,
                                      1.77209634e+00, 1.84187117e+00, 1.87346437e+00, 2.10937902e+00,
                                      1.90582960e+00, 1.92582754e+00, 1.97009497e+00, 1.94174757e+00,
                                      1.92900066e+00, 2.07097617e+00, 2.00835556e+00, 2.02445380e+00,
                                      2.17709016e+00, 2.05963418e+00, 2.12489376e+00, 2.04112187e+00,
                                      2.16103172e+00, 2.17747136e+00, 2.07701863e+00, 2.16334226e+00,
                                      2.06934288e+00, 1.99355319e+00, 2.06313081e+00, 2.09271261e+00,
                                      2.08550057e+00, 2.18383959e+00]),
                            np.array([1.72723371e-77, 9.08925801e-01, 3.79025379e-01, 5.22252228e-01,
                                      4.63045229e-01, 4.20881812e-01, 4.99436083e-01, 5.08255889e-01,
                                      4.36276611e-01, 4.33723462e-01, 3.72302224e-01, 3.64623978e-01,
                                      3.47487941e-01, 3.44991153e-01, 3.31665157e-01, 3.23563165e-01,
                                      3.60646551e-01, 3.73026634e-01, 3.57610240e-01, 3.70302819e-01,
                                      3.44634268e-01, 3.65855393e-01, 3.63666563e-01, 3.94436244e-01,
                                      3.59739565e-01, 3.56627601e-01, 3.54820623e-01, 3.91619600e-01,
                                      3.74974990e-01, 3.82811174e-01]))]

        plot.plot_cs_type_over_time(label=None, ylim=5, legend_loc='lower right',
                                    legend=['progressive_tener', 'perfect_tener',
                                            'progressive', 'perfect'],
                                    fname='haber_tener', results=all_haber_tener)
        plot.plot_bar_chart_original(indeces=['progressive_tener', 'perfect_tener', 'progressive', 'perfect'],
                                     items_to_plot=all_haber_tener, legend=None, only_last_epoch=True, fname="testin")
        plot.plot_bar_chart_original(indeces=['progressive_tener', 'perfect_tener',
                                              'progressive', 'perfect'], label=None, items_to_plot=all_haber_tener,
                                     legend=['progressive_tener', 'perfect_tener',
                                             'progressive', 'perfect'], fname="direct_comparison", only_last_epoch=True)

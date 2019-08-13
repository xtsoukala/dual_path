from src.modules import Plotter, compute_mean_and_std, lz4, pd, os, pickle, training_is_successful, subprocess

main_dir = '../../simulations/'
results_dir = main_dir + '1-40/'
results_dir = main_dir + '2019-08-13/aux_sim20_h70_c60_fw30_e15'
num_sim = 39
epochs = 15
simulation_range = range(num_sim)
performance_threshold = 5
test_name = 'test_aux.in'
training_name = 'training.in'
num_test_set = int(subprocess.check_output(f"wc -l {results_dir}/{simulation_range[0]}/{test_name}",
                                           shell=True).split()[0])
num_train = int(subprocess.check_output(f"wc -l {results_dir}/{simulation_range[0]}/{training_name}",
                                        shell=True).split()[0])
evaluated_sets = ('test',)

# tener + haber + synonyms
excluded_list = []  # [12, 21, 31, 32, 36, 42, 43, 57] + [1, 2, 5, 11, 54] + [2, 17, 20, 24, 31, 36, 43, 51, 54, 56]
num_excluded = len(excluded_list)
edited_dir = (f'{results_dir}/edited_t{performance_threshold}_e{epochs}_sim{num_sim}'
              f'{"_excluded{num_excluded}" if excluded_list else ""}')
os.makedirs(edited_dir, exist_ok=True)

title = ''

cognate_experiment = False
test_sentences_with_pronoun = pronoun_experiment = False
auxiliary_experiment = False if 'aux' not in test_name else True

all_results = []
for sim in simulation_range:  # read results from all simulations
    if os.path.isfile('%s/%s/results.pickled' % (results_dir, sim)):
        with lz4.open('%s/%s/results.pickled' % (results_dir, sim), 'rb') as f:
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
        print("Failed simulations: ", ' '.join(failed_simulations))

    num_valid_simulations = len(valid_results)  # some might have been discarded

    if num_valid_simulations:  # take the average of results and plot
        results_mean_and_std = compute_mean_and_std(valid_results, evaluated_sets=evaluated_sets, epochs=epochs)
        with open(f"{edited_dir}/summary_edited_results.pickled", 'wb') as pckl:
            pickle.dump(results_mean_and_std, pckl)
        # print(results_mean_and_std)
        plot = Plotter(results_dir=edited_dir, summary_sim=num_valid_simulations, title=title, epochs=epochs,
                       num_training=num_train, num_test=num_test_set)
        test_df = pd.read_csv(os.path.join(results_dir, f"{simulation_range[0]}/{test_name}"),
                              names=['target_sentence', 'message'], sep='## ', engine='python')

        plot.plot_results(results_mean_and_std, cognate_experiment=cognate_experiment,
                          test_sentences_with_pronoun=test_sentences_with_pronoun,
                          auxiliary_experiment=auxiliary_experiment, evaluated_datasets=evaluated_sets)

        all_haber_tener = []
        if all_haber_tener:
            plot.plot_cs_type_over_time(label=None, ylim=5, legend_loc='lower right',
                                        legend=['progressive_tener', 'perfect_tener',
                                                'progressive', 'perfect'],
                                        fname='haber_tener', results=all_haber_tener)
            plot.plot_bar_chart_original(indeces=['progressive_tener', 'perfect_tener', 'progressive', 'perfect'],
                                         items_to_plot=all_haber_tener, legend=None, only_last_epoch=True,
                                         fname="testin")
            plot.plot_bar_chart_original(indeces=['progressive_tener', 'perfect_tener',
                                                  'progressive', 'perfect'], label=None, items_to_plot=all_haber_tener,
                                         legend=['progressive_tener', 'perfect_tener',
                                                 'progressive', 'perfect'], fname="direct_comparison",
                                         only_last_epoch=True)

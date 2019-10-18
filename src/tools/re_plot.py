#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys

sys.path.append('..')

from modules import Plotter, plt, compute_mean_and_std, lz4, pd, os, pickle, training_is_successful, subprocess


def re_plot(results_directory='2019-10-18/tener_sim70_e30', num_sim=60, epochs=30, performance_threshold=0, title=None,
            test_name='test_aux.in', training_name='training.in'):
    results_dir = '../../simulations/' + results_directory
    simulation_range = range(1, num_sim + 1)
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

    cognate_experiment = False
    test_sentences_with_pronoun = pronoun_experiment = False
    auxiliary_experiment = False if 'aux' not in test_name else True

    all_results = []
    for sim in simulation_range:  # read results from all simulations
        if os.path.isfile(f'{results_dir}/{sim}/results.pickled'):
            with lz4.open(f'{results_dir}/{sim}/results.pickled', 'rb') as f:
                all_results.append(pickle.load(f))
        else:
            print(f"No results file found for {sim}")

    if all_results:
        valid_results = []
        failed_simulations = []
        for i, simulation in enumerate(all_results):
            if i not in excluded_list and training_is_successful(simulation['correct_meaning']['test'],
                                                                 threshold=performance_threshold,
                                                                 num_test=num_test_set):
                valid_results.append(simulation)
                if not training_is_successful(simulation['correct_meaning']['test'], threshold=80,
                                              num_test=num_test_set):
                    failed_simulations.append(f"[{i}]")  # flag it, even if it's included in the final analysis
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


def plot_over_time(epoch_range=range(0, 30), fname='60_aux_participle_switch', ylim=7):
    results = [([0., 5.65490575, 2.57620452, 2.0754513, 2.72952854, 2.90610166, 2.95031056, 2.96813619, 3.47107438,
                 3.10307985, 3.30768876, 4.13325961, 3.64624096, 3.88193037, 4.34221444, 4.74980363, 4.25197578,
                 4.27429416, 4.53489453, 4.96204407, 5.20678783, 5.5596704, 5.32448241, 6.21869783, 6.15606533,
                 5.54472903, 6.11590972, 6.37673053, 6.17031177, 6.81997677],
                [0., 1.93139708, 1.07119021, 0.67051157, 0.61116672, 0.86192542, 0.65338463, 0.47700888, 0.6051732,
                 0.54429568, 0.63797123, 0.80910908, 0.69765413, 0.70596055, 0.81226055, 0.76074438, 0.67130014,
                 0.69817156, 0.75050259, 0.72411717, 0.74959697, 0.94225545, 0.79172121, 0.97476847, 0.94210093,
                 0.84692051, 0.87681957, 0.95767375, 0.96593701, 0.94459791],
                'progressive auxiliary verb', '#0173b2', '--'),
               ([0.0, 4.784920251329145, 1.6715830875122912, 1.135012431088531, 0.9341701941322434, 0.9725599166377215,
                 1.2267080745341614, 0.8584315437218101, 0.9822904368358916, 0.9151298369489477, 0.9351821992905515,
                 1.1427518201087459, 1.0957138253303256, 1.08675630871247, 1.023324421499032, 1.2105530656563321,
                 1.2155104681795075, 1.3354281225451687, 1.23594461481275, 1.3423440103684503, 1.5764094955489616,
                 1.6850291639662995, 1.6711540246959429, 1.785383045817103, 1.6658135963891862, 1.8420564216778024,
                 1.8575276307235074, 1.7247005080874471, 1.7077710563052584, 1.914053426248548],
                [0.0, 1.3512810159795223, 0.5387763218493418, 0.3667719722694529, 0.20290233985108702,
                 0.2677770663761954,
                 0.35885843837961645, 0.171116115665031, 0.24001212356981824, 0.2318099910657447, 0.23769452250474488,
                 0.30913738650928774, 0.3166937503620249, 0.26619878099314426, 0.22967500775232594, 0.2547502215104403,
                 0.26526309817155286, 0.288830767484637, 0.2817399538702604, 0.3323811022876972, 0.3159403216808298,
                 0.3939918745506917, 0.38144347942018636, 0.42275274010023484, 0.3779613028543155, 0.42216278068530694,
                 0.3653400026995374, 0.43837372766006155, 0.3628456507668908, 0.40348461030450716],
                'progressive participle', '#0173b2', None),
               ([0.0, 2.6917900403768504, 0.6641640196361537, 1.972926267281106, 2.6770618072515497, 2.7713957495692134,
                 2.4169365479189158, 2.386022386022386, 2.6094535014867217, 2.1991537931713077, 2.308544990120006,
                 2.984424881493663, 2.7526902382782477, 3.1649831649831652, 2.85700566599443, 3.5950849572813666,
                 3.173007896625987, 3.486370157819225, 3.4157606081016074, 3.8461538461538467, 3.98067078130233,
                 4.290096826766368, 3.966317401081288, 4.949877691975634, 4.432053069268856, 4.40923018000766,
                 4.892629967956382, 5.231941363680201, 4.737522132363497, 5.317208945196277],
                [0.0, 1.1446703294906309, 0.17370079053635296, 0.4711068070180587, 0.6059341675014728,
                 0.6845587107955302, 0.5534554952936757, 0.440138193869909, 0.44895279235507096, 0.3963682554740432,
                 0.3776780878749042, 0.4533422374251526, 0.4200916084606065, 0.5496455727225885, 0.43562163846666885,
                 0.5899123187939409, 0.41266128859565004, 0.5054807576058185, 0.47422045164042503, 0.5675554666966123,
                 0.49824893383936514, 0.5826418553432222, 0.5724778586842674, 0.6454954416333396, 0.5984266488974624,
                 0.5703614797522512, 0.66330174421803, 0.7353386798207096, 0.7512430522546046, 0.726667759627487],
                'perfect auxiliary verb', '#de8f05', '--'),
               ([0.0, 0.7402422611036339, 0.837424198671672, 0.40322580645161293, 0.30997557768175843,
                 0.5313038483630098, 0.15593139018831717, 0.3603603603603604, 0.2973444068491746, 0.2853488143264784,
                 0.3180876186804184, 0.3289155460965464, 0.39873174481168333, 0.3703703703703704, 0.4081436665706329,
                 0.32158970912930784, 0.4259392199090692, 0.46389287422285985, 0.38968536514961993, 0.45559178975637826,
                 0.39232572604181615, 0.41223276771162876, 0.4114635663365389, 0.5276032423617439, 0.4662789020814306,
                 0.4165070854078897, 0.5021760964178105, 0.46291831420580576, 0.3828300713021008, 0.47029465399750464],
                [0.0, 0.36228917386155735, 0.31498550887877325, 0.12631285827948757, 0.10744851103667122,
                 0.1554440708716981, 0.04596238195876558, 0.12680855334243948, 0.08638532482739034, 0.06744503543270032,
                 0.07457013036711725, 0.08474176710276038, 0.11019737889485662, 0.09812684890528511,
                 0.09800428877205682, 0.08005581691340526, 0.09168130681632025, 0.12138099950527682,
                 0.09855364488864982, 0.09717464032896886, 0.08821243515691381, 0.08664445626497454, 0.0955375734372369,
                 0.11003863851228518, 0.11130910380243754, 0.10799360294835202, 0.11570108951554779,
                 0.11147214409721198, 0.09681766700479186, 0.10403083684681076],
                'perfect participle', '#de8f05', None)]

    for r in results:
        res, std, label, color, linestyle = r
        lower_bound = [x - y for x, y in zip(res, std)]
        upper_bound = [x + y for x, y in zip(res, std)]
        plt.plot(epoch_range, res, label=label, color=color, linestyle=linestyle)
        plt.fill_between(epoch_range, lower_bound, upper_bound, color=color, alpha=0.3)

    plt.xlabel('epochs')
    plt.ylim([0, ylim])
    plt.xlim(1, max(epoch_range))
    plt.legend(ncol=2, fancybox=True, shadow=True)
    plt.savefig(fname)
    plt.close()


if __name__ == "__main__":
    re_plot()

import matplotlib
from modules.formatter import is_not_empty, get_np_mean_and_std_err, np, strip_language_info

matplotlib.use('Agg')  # needed for the server only
import matplotlib.pyplot as plt


class Plotter:
    def __init__(self, results_dir, summary_sim, title, epochs=0):
        self.results_dir = results_dir
        self.num_epochs = epochs
        self.epoch_range = range(epochs)
        self.bar_width = 0.35
        self.cs_results = {}
        self.results = []
        self.title = title
        self.summary_sim = summary_sim
        self.plot_detailed_cs = False
        # blue, orange, green, brown, purple, grey, red, yellowgreen
        self.cblind_friendly = ['#377eb8', '#ff7f00', '#4daf4a', '#a65628', '#984ea3', '#999999', '#e41a1c', '#dede00']
        self.colors = [('#4daf4a', '#dede00'), ('#984ea3', '#999999')]
        self.color_bars = ['#4daf4a', '#984ea3', '#dede00', '#999999', '#e41a1c', '#377eb8', '#ff7f00', '#4daf4a',
                           '#a65628', '#984ea3', '#999999', '#e41a1c', '#dede00'] * 9

    def plot_changes_over_time(self, items_to_plot, test_percentage, training_percentage, label, ylim, fname,
                               legend_loc='upper right'):
        for item_idx, item_to_plot in enumerate(items_to_plot):
            test_value = self.percentage(self.results[item_to_plot]['test'], test_percentage)
            plt.plot(self.epoch_range, test_value, color=self.colors[item_idx][0], label=item_to_plot)
            if 'test-std_error' in self.results[item_to_plot]:
                test_std_error = self.results[item_to_plot]['test-std_error']
                lower_bound = self.percentage(self.results[item_to_plot]['test'] - test_std_error, test_percentage)
                upper_bound = self.percentage(self.results[item_to_plot]['test'] + test_std_error, test_percentage)
                plt.fill_between(self.epoch_range, lower_bound, upper_bound, facecolor=self.colors[item_idx][0],
                                 alpha=0.3)

            if is_not_empty(self.results[item_to_plot]['training']):
                if is_not_empty(training_percentage):
                    training_value = self.percentage(self.results[item_to_plot]['training'], training_percentage)
                else:
                    training_value = self.results[item_to_plot]['training']
                plt.plot(self.epoch_range, training_value, color=self.colors[item_idx][1],
                         label="%s (Training)" % item_to_plot, linestyle='--')
        plt.xlabel('epochs')
        plt.ylabel(label)
        plt.ylim([0, ylim])
        plt.xlim(0 if fname == "performance" else 1, max(self.epoch_range))  # only start from epoch 0 for "performance"
        plt.legend(loc=legend_loc, ncol=2, fancybox=True, shadow=True)
        plt.savefig(self.get_plot_path(fname))
        plt.close()

    def plot_cs_type_over_time(self, label, results, legend, fname, ylim, legend_loc='upper right'):
        for i, result in enumerate(results):
            if self.is_nd_array_or_list(result):
                plt.plot(self.epoch_range, result, color=self.color_bars[i], label=legend[i])
            else:
                plt.plot(self.epoch_range, result[0], color=self.color_bars[i], label=legend[i])
                if result[1] is not None and not (isinstance(result[1], int)):
                    lower_bound = [x - y for x, y in zip(result[0], result[1])]
                    upper_bound = [x + y for x, y in zip(result[0], result[1])]
                    plt.fill_between(self.epoch_range, lower_bound, upper_bound, facecolor=self.color_bars[i],
                                     alpha=0.3)
        plt.xlabel('epochs')
        plt.ylabel(label)
        plt.ylim([0, ylim])
        plt.xlim(1, max(self.epoch_range))  # only start from epoch 0 for performance.png
        if legend:
            plt.legend(loc=legend_loc, ncol=2, fancybox=True, shadow=True)
        plt.savefig(self.get_plot_path(fname))
        plt.close()

    def get_plot_path(self, fname):
        return "%s/%s%s.pdf" % (self.results_dir, "%s" % (('summary_%s_' % self.summary_sim)
                                                          if self.summary_sim else ''), fname)

    @staticmethod
    def adjust_y_axis(result):
        if max(result) + 5 <= 100:
            return max(result) + 5
        return max(result)

    def plot_bar_chart(self, label, items_to_plot, legend, fname):
        cs_indeces = self.numpy_arange_len(self.results['all_cs_types'])
        fig, ax = plt.subplots()
        rects = []
        for i, item in enumerate(items_to_plot):
            rects.append(
                ax.bar(cs_indeces + (self.bar_width * i), [x[0] for x in self.cs_results[item]], self.bar_width,
                       color=self.color_bars[i], yerr=[x[1] for x in self.cs_results[item]]))
        ax.set_ylabel(label)
        if self.title:
            ax.set_title(self.title)
        ax.set_xticks(cs_indeces + self.bar_width / len(items_to_plot))
        ax.set_ylim(bottom=0)
        ax.legend(([x[0] for x in rects]), legend)
        ax.set_xticklabels(self.results['all_cs_types'], rotation=55)  # rotate labels to fit better
        plt.tight_layout()  # make room for labels
        fname = '%s/%s%s_cs.pdf' % \
                (self.results_dir, "%s" % (("summary_%s_" % self.summary_sim) if self.summary_sim else ""),
                 fname)
        plt.savefig(fname)
        plt.close()

    def plot_results(self, results, num_train, num_test, test_df, test_sentences_with_pronoun,
                     cognate_experiment, auxiliary_experiment, plot_mse=True):
        correct_test = results['correct_meaning']['test']

        type_code_switches_test = results['type_code_switches']['test']
        results['all_cs_types'] = self.extract_cs_keys(results['type_code_switches'])
        self.results = results

        self.plot_changes_over_time(items_to_plot=['correct_meaning', 'correct_pos'], label='Percentage correct (%)',
                                    test_percentage=num_test, training_percentage=num_train, ylim=100,
                                    fname="performance", legend_loc='lower right')
        # !------------  CODE-SWITCHES ------------!
        correct_code_switches = results['correct_code_switches']['test']
        if not isinstance(correct_code_switches, int) and sum(correct_code_switches):
            self.plot_changes_over_time(items_to_plot=['correct_code_switches', 'all_code_switches'],
                                        test_percentage=num_test, training_percentage=num_train, ylim=30,
                                        label='%% CS among %s set' % 'test',
                                        fname='code_switches_%s_set' % 'test')
            # !------------  same as above but plot percentage among CORRECTLY produced sentences only ------------!
            self.plot_changes_over_time(ylim=30, items_to_plot=['correct_code_switches'],
                                        test_percentage=correct_test,
                                        training_percentage=results['correct_meaning']['training'],
                                        fname="code_switches_correct_%s_set" % 'test',
                                        label='%% CS among correctly produced %s set' % 'test')

            # !------------  code-switching ------------!
            self.cs_results = {'type_correct_test_en': [], 'type_correct_test_es': [],
                               'type_correct_test_last_epoch_en': [], 'type_correct_test_last_epoch_es': []}
            for cs_type in results['all_cs_types']:
                for lang in ['es', 'en']:  # FIXME: needs refactoring
                    cs_type_per_lang = "%s-%s" % (lang, cs_type)
                    if cs_type_per_lang in type_code_switches_test:  # if we include training set we need to edit this
                        cs_percentage_correct = self.percentage(type_code_switches_test[cs_type_per_lang], correct_test)
                        if "%s-std_error" % cs_type_per_lang in type_code_switches_test:
                            std_err = self.percentage(type_code_switches_test["%s-std_error" % cs_type_per_lang],
                                                      correct_test)
                        else:
                            std_err = [0] * len(correct_test)
                        self.cs_results['type_correct_test_%s' % lang].append((cs_percentage_correct, std_err))
                        # LAST epoch only
                        self.cs_results['type_correct_test_last_epoch_%s' % lang].append((cs_percentage_correct[-1],
                                                                                          std_err[-1]))
                    else:
                        self.cs_results['type_correct_test_%s' % lang].append(([0] * self.num_epochs,
                                                                               [0] * self.num_epochs))
                        self.cs_results['type_correct_test_last_epoch_%s' % lang].append((0, 0))

            # make sure there is still something to be plotted after the manipulations
            if self.cs_results['type_correct_test_last_epoch_es'] or self.cs_results['type_correct_last_epoch_test_en']:
                self.plot_bar_chart(label='CS types (%% of correctly produced %s set - last epoch)' % 'test',
                                    items_to_plot=['type_correct_test_last_epoch_es', 'type_correct_test_last_epoch_es']
                                    , legend=('es', 'en'), fname='code_switches_correct_test_set_last_epoch')
                # !------------ Now plot all CS types per epoch  ------------#
                if self.plot_detailed_cs:
                    for i, cs_type in enumerate(results['all_cs_types']):
                        self.plot_cs_type_over_time(label=('%s (%% of correct %s set)' % (cs_type, 'test')),
                                                    ylim=15, legend=('en', 'es'), fname='code_switches_correct_test_'
                                                                                        'set_%s' % cs_type,
                                                    results=[self.cs_results['type_correct_test_en'][i],
                                                             self.cs_results['type_correct_test_es'][i]])

                # Code-switches per message
                per_message = sorted([k for k in results.keys() if k[0].isupper()])
                with open("%s/per_message.csv" % self.results_dir, "w") as f:
                    f.writelines("%s,N,message\n" % ','.join(map(str, self.epoch_range)))
                    for key in per_message:
                        f.writelines('%s,%s,"%s"\n' % (','.join(["%s (%s)" % (str(x), str(y))
                                                                 for x, y in zip(results[key]['test'],
                                                                                 results[key]['test-std_error'])]
                                                                if 'test-std_error' in results[key]
                                                                   and results[key]['test-std_error'] is not None and
                                                                   not isinstance(results[key]['test-std_error'], int)
                                                                else map(str, results[key]['test'])) if
                                                       not isinstance(results[key]['test'], int)
                                                       else "," * self.num_epochs,
                                                       sum(test_df.message.str.count(key)), key))
                if auxiliary_experiment:
                    all_correct = {'has': [], 'is': []}
                    for aux in ['is', 'has']:
                        for lang in ['en', 'es']:
                            key = 'correct_%s_%s' % (aux, lang)
                            if key in self.results:
                                all_correct[aux] = ([x + y for x, y in zip(all_correct[aux], self.results[key]['test'])]
                                                    if all_correct[aux] != [] else self.results[key]['test'])

                    res_aux_all_set = []
                    res_aux_all_raw = []
                    res_aux_participle_all_set = []
                    res_aux_participle_per_tense = []
                    res_aux_per_correct_tense = []
                    res_aux_no_after_per_tense = []
                    legend = []
                    print(self.results['has_aux'])
                    for aux in ['is', 'has']:
                        for point in ['aux', 'participle', 'after']:
                            index = '%s_%s' % (aux, point)
                            if index in self.results:
                                legend.append(index)
                                # normalize using correct_code_switches
                                if 'test-std_error' in self.results[index]:
                                    res_aux_all_set.append((self.percentage(self.results[index]['test'],
                                                                            correct_test),
                                                            self.percentage(self.results[index]['test-std_error'],
                                                                            correct_test)))
                                    res_aux_all_raw.append((self.results[index]['test'],
                                                            self.results[index]['test-std_error']))
                                    res_aux_per_correct_tense.append((self.percentage(self.results[index]['test'],
                                                                                      all_correct[aux]),
                                                                      self.percentage(
                                                                          self.results[index]['test-std_error'],
                                                                          all_correct[aux])))
                                else:
                                    res_aux_all_set.append(
                                        self.percentage(self.results[index]['test'], correct_test))
                                    res_aux_all_raw.append(self.results[index]['test'])
                                    res_aux_per_correct_tense.append(self.percentage(self.results[index]['test'],
                                                                                     all_correct[aux]))

                                if not index.endswith('after'):
                                    res_aux_no_after_per_tense.append(res_aux_per_correct_tense[-1])
                                if index.endswith('participle'):
                                    res_aux_participle_all_set.append(res_aux_all_set[-1])
                                    res_aux_participle_per_tense.append(res_aux_per_correct_tense[-1])

                    if res_aux_all_set:
                        self.plot_cs_type_over_time(label='auxiliary switches (% of correctly produced test set)',
                                                    legend=legend, ylim=15,
                                                    fname='auxiliary_all_set', results=res_aux_all_set)

                        self.plot_cs_type_over_time(label='auxiliary switches in test set',
                                                    legend=legend, ylim=75,
                                                    fname='auxiliary_all_raw', results=res_aux_all_raw)
                        # same for res_percentage:
                        self.plot_cs_type_over_time(label='auxiliary switches (% of correctly produced set per tense)',
                                                    legend=legend, ylim=15,
                                                    fname='auxiliary_per_correct_tense',
                                                    results=res_aux_per_correct_tense)

                        self.plot_cs_type_over_time(label='participle switches (% of correctly produced sentences)',
                                                    legend=['is_participle', 'has_participle'], ylim=3,
                                                    fname='participle_all_set',
                                                    results=res_aux_participle_all_set)

                        self.plot_cs_type_over_time(label='participle switches (% of correctly produced set per tense)',
                                                    legend=['is_participle', 'has_participle'], ylim=3,
                                                    fname='participle_per_tense',
                                                    results=res_aux_participle_per_tense)

                        self.plot_cs_type_over_time(label='auxiliary switches (% of correctly produced set per tense)',
                                                    legend=[x for x in legend if not x.endswith('after')], ylim=15,
                                                    fname='auxiliary_no_after_per_tense',
                                                    results=res_aux_no_after_per_tense)


            ############################################################################################################
            if cognate_experiment:
                # for dataset_type in ['test']:  # ['training', 'test']:
                include_ff = False
                self.cs_results.update({'type_correct_test': [], 'type_correct_test-cog': [],
                                        'type_correct_test-ff': [],
                                        'type_correct_test_last_epoch': [],
                                        'type_correct_test_last_epoch-cog': [], 'type_correct_test_last_epoch-ff': []})
                for cs_type in results['all_cs_types']:
                    for key in ['', '-cog', '-ff']:
                        cs_type_per_key = "%s%s" % (cs_type, key)
                        if cs_type_per_key in type_code_switches_test:
                            # all epochs
                            cs_percentage_correct = self.percentage(type_code_switches_test[cs_type_per_key],
                                                                    correct_test)
                            if self.summary_sim and "%s-std_error" % cs_type_per_key in type_code_switches_test:
                                std_err = self.percentage(type_code_switches_test["%s-std_error" % cs_type_per_key],
                                                          correct_test)
                            else:
                                std_err = [0] * len(correct_test)
                            self.cs_results['type_correct_test%s' % key].append((cs_percentage_correct, std_err))
                            # LAST epoch only
                            self.cs_results['type_correct_test_last_epoch%s' % key].append((cs_percentage_correct[-1],
                                                                                            std_err[-1]))
                            if key == '-ff':
                                include_ff = True
                        else:
                            self.cs_results['type_correct_test%s' % key].append(([0] * self.num_epochs,
                                                                                 [0] * self.num_epochs))
                            self.cs_results['type_correct_test_last_epoch%s' % key].append((0, 0))

                # make sure there is still something to be plotted after the manipulations
                if self.cs_results['type_correct_test'] or self.cs_results['type_correct_test-cog']:
                    # LAST EPOCH only
                    items_to_plot = ['type_correct_test_last_epoch', 'type_correct_test_last_epoch-cog']
                    legend = ['NON-COG', 'COG']
                    if include_ff:
                        items_to_plot.append('type_correct_test_last_epoch-ff')
                        legend.append('FF')
                    self.plot_bar_chart(label='CS types (%% of %s set - last epoch)' % 'test', legend=legend,
                                        items_to_plot=items_to_plot, fname='type_cs_cognate_experiment_last_epoch')
                    # !------------ Now plot all CS types per epoch for COGNATE EXPERIMENT  ------------#
                    for i, cs_type in enumerate(results['all_cs_types']):
                        results_lst = [self.cs_results['type_correct_test'][i],
                                       self.cs_results['type_correct_test-cog'][i]]
                        if include_ff:
                            results_lst.append(self.cs_results['type_correct_test-ff'][i])
                        self.plot_cs_type_over_time(label=('%s (%% of correct %s set)' % (cs_type, 'test')),
                                                    fname='cognate_experiment_%s' % cs_type, ylim=15,
                                                    results=results_lst, legend=legend)
        # !------------ Pronoun errors - only plot if there's something to be plotted ------------!
        if 'pronoun_errors' in results:
            print("pronoun", type(results['pronoun_errors']['test']))
            self.plot_changes_over_time(items_to_plot=['pronoun_errors', 'pronoun_errors_flex'],
                                        label='Sum of subject pronoun errors', fname='pronoun_errors')
            # same using percentages
            if test_sentences_with_pronoun:  # in es case there are no sentences with 'he' and 'she'
                self.plot_changes_over_time(items_to_plot=['pronoun_errors', 'pronoun_errors_flex'],
                                            label='Percentage (%) of subject pronoun errors in test set',
                                            fname='pronoun_errors_percentage',
                                            test_percentage=test_sentences_with_pronoun, ylim=15)

        if plot_mse and not self.summary_sim and results['mse']:  # no need to plot an average of all the simulations
            mse_list = [get_np_mean_and_std_err(results['mse'][epoch], summary_sim=None)[0] for epoch in
                        self.epoch_range]
            plt.plot(self.epoch_range, mse_list, color='darkslateblue', label='MSE')
            plt.xlabel('epochs')
            plt.ylabel('Mean Square Error')
            plt.ylim([0, 0.007])
            plt.savefig('%s/all_mse_err.pdf' % self.results_dir)
            plt.close()

    def plot_layer_stats(self, stats):
        """
        :param stats: dict of lists that contain means, std and labels
        :return:
        """
        layers = self.numpy_arange_len(stats['labels'])
        fig, ax = plt.subplots()
        ax.bar(layers, stats['means'], color='r', yerr=stats['std'])
        ax.set_xticklabels(stats['labels'])
        plt.savefig('%s/weights/summary_weights.pdf' % self.results_dir)
        plt.close()

    def plot_connection_weights(self, incoming_weights, incoming_labels, layer_labels, layer_name):
        """
        :return: plots incoming connection weights of a layer
        """
        import numpy as np
        fig, ax1 = plt.subplots(1, 1)
        data = np.random.randint(0, 100, size=(10, 10))
        ax1.imshow(incoming_weights, cmap='jet', interpolation='nearest')
        ax1.set_xticklabels(layer_labels)
        ax1.set_yticklabels(incoming_labels)
        # plt.imshow(incoming_weights)
        # plt.colorbar(orientation='vertical', interpolation='nearest')
        ax1.grid(True)
        plt.savefig('%s/%s_connection_weights.pdf' % (self.results_dir, layer_name))
        plt.close()

    @staticmethod
    def percentage(x, total):
        if isinstance(total, int) and total == 0:
            return float('NaN')
        if isinstance(x, list):
            x = np.array(x)
        with np.errstate(divide='raise'):
            try:
                return np.true_divide(x * 100, total)
            except:
                print(x)
                return np.true_divide(x * 100, total, where=x != 0)  # avoid division by 0

    @staticmethod
    def extract_cs_keys(type_code_switches):
        cs_keys = []
        for set_type in ['test', 'training']:
            if type_code_switches[set_type]:
                cs_keys += type_code_switches[set_type].keys()
        return strip_language_info(cs_keys)

    @staticmethod
    def numpy_arange_len(x):
        return np.arange(len(x))

    @staticmethod
    def is_nd_array_or_list(x):
        if isinstance(x, (list, np.ndarray)):
            return True
        return False

import matplotlib
from modules.formatter import is_not_empty, get_np_mean_and_std_err, np, torch, extract_cs_keys, defaultdict

matplotlib.use('Agg')  # needed for the server only
import matplotlib.pyplot as plt


class Plotter:
    def __init__(self, results_dir, summary_sim, title, epochs=0):
        self.results_dir = results_dir
        self.num_epochs = epochs
        self.epoch_range = range(epochs)
        self.bar_width = 0.35
        self.cs_results = {}
        self.results = {}
        self.title = title
        self.summary_sim = summary_sim
        self.plot_detailed_cs = False
        # green:4daf4a, orange:ff7f00, purple:984ea3, grey: 999999, brown:a65628, red:e41a1c, blue:377eb8, yellow:dede00
        self.cblind_friendly = ['#4daf4a', '#a65628', '#ff7f00', '#999999', '#984ea3', '#377eb8', '#e41a1c', '#dede00']
        self.colors = [('#4daf4a', '#dede00'), ('#984ea3', '#999999')]
        self.color_bars = ['#4daf4a', '#984ea3', '#dede00', '#999999', '#e41a1c', '#377eb8', '#ff7f00', '#4daf4a',
                           '#a65628', '#984ea3', '#999999', '#e41a1c', '#dede00'] * 9
        line_styles = ['-', '--', '-.', ':'] * 10
        markers = ['.', ',', '+', '^', '*', 'x', '<', '>'] * 10
        self.assigned_colors = defaultdict()
        self.assigned_linestyle = defaultdict()
        self.assigned_markers = defaultdict()
        c = 0
        for i in ['is', 'has']:
            for p in ['participle', 'aux', 'right_after', 'after']:
                self.assigned_colors["%s_%s" % (i, p)] = self.cblind_friendly[c]
                self.assigned_colors["%s_%s_es_en" % (i, p)] = self.cblind_friendly[c]
                self.assigned_linestyle["%s_%s" % (i, p)] = line_styles[c]
                self.assigned_linestyle["%s_%s_es_en" % (i, p)] = line_styles[c]

                self.assigned_markers["%s_%s" % (i, p)] = markers[c]
                self.assigned_markers["%s_%s_es_en" % (i, p)] = markers[c]
                c += 1

    def plot_changes_over_time(self, items_to_plot, test_percentage, training_percentage, ylabel, ylim, fname,
                               legend_loc='upper right'):
        for item_idx, item in enumerate(items_to_plot):
            test_value = self.percentage(self.results[item]['test'], test_percentage)
            plt.plot(self.epoch_range, test_value, color=self.colors[item_idx][0], label=item)
            if 'test-std_error' in self.results[item]:
                test_std_error = self.results[item]['test-std_error']
                lower_bound = self.percentage(self.results[item]['test'] - test_std_error, test_percentage)
                upper_bound = self.percentage(self.results[item]['test'] + test_std_error, test_percentage)
                plt.fill_between(self.epoch_range, lower_bound, upper_bound, facecolor=self.colors[item_idx][0],
                                 alpha=0.2)

            if 'training' in self.results[item]:
                if is_not_empty(training_percentage):
                    training_value = self.percentage(self.results[item]['training'], training_percentage)
                else:
                    training_value = self.results[item]['training']
                plt.plot(self.epoch_range, training_value, color=self.colors[item_idx][1],
                         label="%s (Training)" % item, linestyle='--')
        plt.xlabel('epochs')
        plt.ylabel(ylabel)
        plt.ylim([0, ylim])
        plt.xlim(0 if fname == "performance" else 1, max(self.epoch_range))  # only start from epoch 0 for "performance"
        plt.legend(loc=legend_loc, ncol=2, fancybox=True, shadow=True)
        plt.savefig(self.get_plot_path(fname))
        plt.close()

    def plot_cs_type_over_time(self, label, results, legend, fname, ylim, legend_loc='upper right'):
        for i, result in enumerate(results):
            legend_label = legend[i]
            color = self.assigned_colors[legend_label] if legend_label in self.assigned_colors else self.color_bars[i]
            marker = self.assigned_markers[legend_label] if legend_label in self.assigned_markers else None
            res, std = result
            plt.plot(self.epoch_range, res, color=color, label=legend_label, marker=marker)
            if std is not None:
                lower_bound = [x - y for x, y in zip(res, std)]
                upper_bound = [x + y for x, y in zip(res, std)]
                plt.fill_between(self.epoch_range, lower_bound, upper_bound, facecolor=color, alpha=0.2)
        plt.xlabel('epochs')
        plt.ylabel(label)
        plt.ylim([0, ylim])
        plt.xlim(1, max(self.epoch_range))
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

    def plot_bar_chart(self, indeces, label, items_to_plot, legend, fname):
        index_size = torch.arange(len(indeces))
        fig, ax = plt.subplots()
        rects = []
        for i, item in enumerate(items_to_plot):
            rects.append(ax.bar(index_size + (self.bar_width * i), [x[0] for x in self.cs_results[item]],
                                self.bar_width, color=self.color_bars[i], yerr=[x[1] for x in self.cs_results[item]]))
        ax.set_ylabel(label)
        if self.title:
            ax.set_title(self.title)
        ax.set_xticks(index_size + self.bar_width / len(items_to_plot))
        ax.set_ylim(bottom=0)
        ax.legend(([x[0] for x in rects]), legend)
        ax.set_xticklabels(indeces, rotation=55)  # rotate labels to fit better
        plt.tight_layout()  # make room for labels
        fname = '%s/%s%s_cs.pdf' % (self.results_dir, "%s" % (("summary_%s_" % self.summary_sim)
                                                              if self.summary_sim else ""), fname)
        plt.savefig(fname)
        plt.close()

    def plot_results(self, results, num_train, num_test, test_df, test_sentences_with_pronoun,
                     cognate_experiment, auxiliary_experiment, evaluated_datasets, plot_mse=True):
        correct_test = results['correct_meaning']['test']
        self.results = results
        if 'all_cs_types' in self.results:
            all_cs_types = self.results['all_cs_types']
        else:
            all_cs_types = extract_cs_keys([self.results], set_names=evaluated_datasets)

        self.plot_changes_over_time(items_to_plot=['correct_meaning', 'correct_pos'], ylabel='Percentage correct (%)',
                                    test_percentage=num_test, training_percentage=num_train, ylim=100,
                                    fname="performance", legend_loc='lower right')
        # !------------  CODE-SWITCHES ------------!
        correct_code_switches = results['correct_code_switches']['test']
        if not isinstance(correct_code_switches, int) and sum(correct_code_switches):
            self.plot_changes_over_time(items_to_plot=['correct_code_switches', 'all_code_switches'],
                                        test_percentage=num_test, training_percentage=num_train, ylim=40,
                                        ylabel='%% CS among %s set' % 'test',
                                        fname='code_switches_%s_set' % 'test')
            # !------------  same as above but plot percentage among CORRECTLY produced sentences only ------------!
            self.plot_changes_over_time(ylim=40, items_to_plot=['correct_code_switches'],
                                        test_percentage=correct_test,
                                        training_percentage=(0 if 'training' not in results['correct_meaning'] else
                                                             results['correct_meaning']['training']),
                                        fname="code_switches_correct_%s_set" % 'test',
                                        ylabel='%% CS among correctly produced %s set' % 'test')

            # !------------  code-switching ------------!
            self.cs_results = {'type_correct_test_en': [], 'type_correct_test_es': [],
                               'type_correct_test_last_epoch_en': [], 'type_correct_test_last_epoch_es': []}
            for cs_type in all_cs_types:
                for lang in ['es', 'en']:  # FIXME: needs refactoring
                    cs_type_per_lang = "%s-%s" % (lang, cs_type)
                    if cs_type_per_lang in self.results:
                        cs_percentage_correct = self.percentage(self.results[cs_type_per_lang]['test'],
                                                                # if we include training set we need to edit this
                                                                correct_test)
                        if "test-std_error" in self.results[cs_type_per_lang]:
                            std_err = self.percentage(self.results[cs_type_per_lang]["test-std_error"],
                                                      correct_test)
                        else:
                            std_err = [0] * self.num_epochs

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
                self.plot_bar_chart(label='CS types (%% of correctly produced %s set)' % 'test',
                                    indeces=all_cs_types, legend=('es', 'en'),
                                    fname='code_switches_correct_test_set_last_epoch',
                                    items_to_plot=['type_correct_test_last_epoch_es',
                                                   'type_correct_test_last_epoch_en'])
                # !------------ Now plot all CS types per epoch  ------------#
                if self.plot_detailed_cs:
                    for i, cs_type in enumerate(all_cs_types):
                        self.plot_cs_type_over_time(label=('%s (%% of correct %s set)' % (cs_type, 'test')),
                                                    ylim=15, legend=('es', 'en'), fname='code_switches_correct_test_'
                                                                                        'set_%s' % cs_type,
                                                    results=[self.cs_results['type_correct_test_es'][i],
                                                             self.cs_results['type_correct_test_en'][i]])

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

                    for cs_direction in ['', '_es_en']:
                        res_aux_all_set = []
                        res_aux_all_raw = []
                        res_aux_participle_all_set = []
                        res_aux_participle_per_tense = []
                        res_aux_per_correct_tense = []
                        res_aux_no_after_per_tense = []
                        legend = []
                        for aux in ['is', 'has']:
                            for point in ['aux', 'participle', 'right_after', 'after']:
                                index = '%s_%s%s' % (aux, point, cs_direction)
                                if index in self.results and self.results[index]['test'] != []:
                                    legend.append(index)
                                    # normalize using the number of correctly produced test sentences (correct_test)
                                    res_aux_all_set.append((self.percentage(self.results[index]['test'],
                                                                            correct_test),
                                                            self.percentage(self.results[index]['test-std_error'],
                                                                            correct_test)
                                                            if 'test-std_error' in self.results[index] else None))
                                    res_aux_all_raw.append((self.results[index]['test'],
                                                            self.results[index]['test-std_error']
                                                            if 'test-std_error' in self.results[index] else None))
                                    res_aux_per_correct_tense.append((self.percentage(self.results[index]['test'],
                                                                                      all_correct[aux]),
                                                                      self.percentage(
                                                                          self.results[index]['test-std_error'],
                                                                          all_correct[aux])
                                                                      if 'test-std_error' in self.results[index]
                                                                      else None))

                                    if 'after' not in index:
                                        res_aux_no_after_per_tense.append(res_aux_per_correct_tense[-1])
                                    if 'participle' in index:
                                        res_aux_participle_all_set.append(res_aux_all_set[-1])
                                        res_aux_participle_per_tense.append(res_aux_per_correct_tense[-1])

                        if res_aux_all_set:
                            self.plot_cs_type_over_time(label='auxiliary switches (% of correctly produced test set)',
                                                        legend=legend, ylim=7, results=res_aux_all_set,
                                                        fname='auxiliary_all_set%s' % cs_direction)

                            self.plot_cs_type_over_time(label='auxiliary switches in test set',
                                                        legend=legend, ylim=60, results=res_aux_all_raw,
                                                        fname='auxiliary_all_raw%s' % cs_direction)
                            # same for res_percentage:
                            self.plot_cs_type_over_time(label='auxiliary switches (% of correctly produced per tense)',
                                                        legend=legend, ylim=14,
                                                        fname='auxiliary_per_correct_tense%s' % cs_direction,
                                                        results=res_aux_per_correct_tense)

                            self.plot_cs_type_over_time(label='participle switches (% of correctly produced sentences)',
                                                        legend=['is_participle%s' % cs_direction,
                                                                'has_participle%s' % cs_direction], ylim=3,
                                                        fname='participle_all_set%s' % cs_direction,
                                                        results=res_aux_participle_all_set)

                            self.plot_cs_type_over_time(label='participle switches (% of correctly produced per tense)',
                                                        legend=['is_participle%s' % cs_direction,
                                                                'has_participle%s' % cs_direction], ylim=3,
                                                        fname='participle_per_tense%s' % cs_direction,
                                                        results=res_aux_participle_per_tense)

                            self.plot_cs_type_over_time(label='auxiliary switches (% of correctly produced per tense)',
                                                        legend=[x for x in legend if 'after' not in x], ylim=3,
                                                        fname='auxiliary_no_after_per_tense%s' % cs_direction,
                                                        results=res_aux_no_after_per_tense)
            ############################################################################################################
            if cognate_experiment:
                include_ff = False
                for dataset_type in evaluated_datasets:
                    for position in ["", "_last_epoch"]:
                        for key in ['', '-cog', '-ff']:
                            self.cs_results.update({'type_correct_%s%s%s' % (dataset_type, key, position): []})

                    for cs_type in all_cs_types:
                        for key in ['', '-cog', '-ff']:
                            cs_type_per_key = "%s%s" % (cs_type, key)
                            label = 'type_correct_%s%s' % (dataset_type, key)
                            label_last_epoch = label + '_last_epoch'
                            if cs_type_per_key in self.results:
                                cs_percentage_correct = self.percentage(self.results[cs_type_per_key][dataset_type],
                                                                        correct_test)
                                if "%s-std_error" % dataset_type in self.results:
                                    std_err = self.percentage(self.results[cs_type_per_key]["%s-std_error"
                                                                                            % dataset_type],
                                                              correct_test)
                                else:
                                    std_err = [0] * len(correct_test)
                                self.cs_results[label].append((cs_percentage_correct, std_err))  # all epochs
                                # LAST epoch only
                                self.cs_results[label_last_epoch].append((cs_percentage_correct[-1], std_err[-1]))
                                if key == '-ff':
                                    include_ff = True
                            else:
                                self.cs_results[label].append(([0] * self.num_epochs, [0] * self.num_epochs))
                                self.cs_results[label_last_epoch].append((0, 0))

                    # make sure there is still something to be plotted after the manipulations
                    if self.cs_results['type_correct_%s-cog_last_epoch' % dataset_type]:
                        # LAST EPOCH only
                        items_to_plot = ['type_correct_%s_last_epoch' % dataset_type,
                                         'type_correct_%s-cog_last_epoch' % dataset_type]
                        legend = ['NON-COG', 'COG']
                        if include_ff:
                            items_to_plot.append('type_correct_%s-ff_last_epoch' % dataset_type)
                            legend.append('FF')
                        self.plot_bar_chart(label='CS types (%% of %s set - last epoch)' % dataset_type, legend=legend,
                                            items_to_plot=items_to_plot, indeces=all_cs_types,
                                            fname='type_cs_cognate_experiment_last_epoch_%sset' % dataset_type)
                        # !------------ Now plot all CS types per epoch for COGNATE EXPERIMENT  ------------#
                        for i, cs_type in enumerate(all_cs_types):
                            results_lst = [self.cs_results['type_correct_%s' % dataset_type][i],
                                           self.cs_results['type_correct_%s-cog' % dataset_type][i]]
                            if include_ff:
                                results_lst.append(self.cs_results['type_correct_%s-ff' % dataset_type][i])
                            self.plot_cs_type_over_time(label=('%s (%% of correct %s set)' % (cs_type, dataset_type)),
                                                        fname='cognate_experiment_%s_%s' % (cs_type, dataset_type),
                                                        ylim=15, results=results_lst, legend=legend)
        # !------------ Pronoun errors - only plot if there's something to be plotted ------------!
        if 'pronoun_errors' in results:
            print("pronoun", type(results['pronoun_errors']['test']))
            self.plot_changes_over_time(items_to_plot=['pronoun_errors', 'pronoun_errors_flex'],
                                        ylabel='Sum of subject pronoun errors', fname='pronoun_errors')
            # same using percentages
            if test_sentences_with_pronoun:  # in es case there are no sentences with 'he' and 'she'
                self.plot_changes_over_time(items_to_plot=['pronoun_errors', 'pronoun_errors_flex'],
                                            ylabel='Percentage (%) of subject pronoun errors in test set',
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
        fig, ax = plt.subplots()
        ax.bar(torch.arange(len(stats['labels'])), stats['means'], color='r', yerr=stats['std'])
        ax.set_xticklabels(stats['labels'])
        plt.savefig('%s/weights/summary_weights.pdf' % self.results_dir)
        plt.close()

    @staticmethod
    def percentage(x, total):
        if isinstance(total, int) and total == 0:
            return float('NaN')
        if isinstance(x, list):
            x = torch.tensor(x)
        return np.true_divide(x * 100, total, where=x != 0)  # avoid division by 0

    @staticmethod
    def is_nd_array_or_list(x):
        type(x)
        sys.exit()
        if isinstance(x, (list, np.ndarray)):
            return True
        return False

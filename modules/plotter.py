from modules.formatter import np, extract_cs_keys
import torch
import seaborn as sns
import matplotlib.pyplot as plt

# import matplotlib
# matplotlib.use('Agg')  # needed for the server only


sns.set(palette="colorblind")
sns.set_style("white")  # whitegrid


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

    def plot_changes_over_time(self, items_to_plot, test_percentage, training_percentage, ylabel, ylim, fname,
                               legend_loc='upper right'):
        for item_idx, item in enumerate(items_to_plot):
            test_value = self.percentage(self.results[item]['test'], test_percentage).numpy()
            plt.plot(self.epoch_range, test_value, label=item)
            if 'test-std_error' in self.results[item]:
                test_std_error = self.results[item]['test-std_error']
                lower_bound = self.percentage(self.results[item]['test'] - test_std_error, test_percentage)
                upper_bound = self.percentage(self.results[item]['test'] + test_std_error, test_percentage)
                plt.fill_between(self.epoch_range, lower_bound, upper_bound, alpha=0.2)

            if 'training' in self.results[item]:
                training_value = self.percentage(self.results[item]['training'], training_percentage)
                plt.plot(self.epoch_range, training_value, label="%s (Training)" % item, linestyle='--')
        plt.xlabel('epochs')
        if ylabel:
            plt.ylabel(ylabel)
        plt.ylim([0, ylim])
        plt.xlim(0 if fname == "performance" else 1, max(self.epoch_range))  # only start from epoch 0 for "performance"
        plt.legend(loc=legend_loc, ncol=2, fancybox=True, shadow=True)
        plt.savefig(self.get_plot_path(fname))
        plt.close()

    def plot_multiple_changes_over_time(self, items_to_plot, test_percentage_lst, training_percentage, ylabel, ylim,
                                        fname, legend_loc='upper right'):
        for item_idx, item in enumerate(items_to_plot):
            test_value = self.percentage(self.results[item]['test'].numpy(), test_percentage_lst[item_idx])  # .numpy()
            plt.plot(self.epoch_range, test_value,
                     label=item.replace('_', ' ').replace('code switches', 'code-switches'))
            if 'test-std_error' in self.results[item]:
                test_std_error = self.results[item]['test-std_error']
                lower_bound = self.percentage(self.results[item]['test'] - test_std_error,
                                              test_percentage_lst[item_idx])
                upper_bound = self.percentage(self.results[item]['test'] + test_std_error,
                                              test_percentage_lst[item_idx])
                plt.fill_between(self.epoch_range, lower_bound, upper_bound, alpha=0.2)

            if 'training' in self.results[item]:
                if is_not_empty(training_percentage):
                    training_value = self.percentage(self.results[item]['training'], training_percentage)
                else:
                    training_value = self.results[item]['training']
                plt.plot(self.epoch_range, training_value, label="%s (Training)" % item, linestyle='--')
        plt.xlabel('epochs')
        if ylabel:
            plt.ylabel(ylabel)
        plt.ylim([0, ylim])
        plt.xlim(0 if fname == "performance" else 1, max(self.epoch_range))  # only start from epoch 0 for "performance"
        plt.xticks(np.arange(1, max(self.epoch_range), 2))
        plt.legend(loc=legend_loc, ncol=2, fancybox=True, shadow=True)
        plt.savefig(self.get_plot_path(fname))
        plt.close()

    def plot_cs_type_over_time(self, label, results, legend, fname, ylim, legend_loc='lower right'):
        for i, result in enumerate(results):
            legend_label = legend[i]
            res, std = result
            plt.plot(self.epoch_range, res, label=legend_label)
            if std is not None:
                lower_bound = [x - y for x, y in zip(res, std)]
                upper_bound = [x + y for x, y in zip(res, std)]
                plt.fill_between(self.epoch_range, lower_bound, upper_bound, alpha=0.3)
        plt.xlabel('epochs')
        plt.ylabel(label)
        plt.ylim([0, ylim])
        plt.xlim(1, max(self.epoch_range))
        if legend:
            plt.legend(loc=legend_loc, ncol=2, fancybox=True, shadow=True)
        plt.savefig(self.get_plot_path(fname))
        plt.close()

    def get_plot_path(self, fname):
        return "%s/%s_%s.pdf" % (self.results_dir, self.summary_sim, fname)

    @staticmethod
    def adjust_y_axis(result):
        if max(result) + 5 <= 100:
            return max(result) + 5
        return max(result)

    def plot_bar_chart_original(self, indeces, items_to_plot, legend, fname, label=None, only_last_epoch=False):
        index_size = torch.arange(len(indeces))
        fig, ax = plt.subplots()
        rects = []
        for i, item in enumerate(items_to_plot):
            if not only_last_epoch:
                rects.append(ax.bar(index_size + (self.bar_width * i), [x[0] for x in self.cs_results[item]],
                                    self.bar_width,  # color=self.color_bars[i],
                                    yerr=[x[1] for x in self.cs_results[item]]))
            else:
                rects.append(ax.bar(index_size + (self.bar_width * i), item[0][-1],  # self.cs_results[item][-1][0],
                                    self.bar_width, yerr=item[1][-1]))

        if label:
            ax.set_ylabel(label)
        if self.title:
            ax.set_title(self.title)
        ax.set_xticks(index_size + self.bar_width / len(items_to_plot))
        ax.set_ylim(bottom=0)
        if legend:
            ax.legend(legend)

        ax.set_xticklabels(indeces, rotation=55)  # rotate labels to fit better
        plt.tight_layout()  # make room for labels
        fname = '%s/%s_%s_cs.pdf' % (self.results_dir, self.summary_sim, fname)
        plt.savefig(fname)
        plt.close()

    @staticmethod
    def rename_label(x):
        new_label = x
        if 'adj' in x:
            new_label = 'adjective'
        elif 'aux' in x:
            new_label = 'auxiliary'
        elif 'det' in x:
            new_label = 'determiner'
        elif 'noun' in x:
            new_label = 'noun'
        elif 'participle' in x:
            new_label = 'participle'
        elif 'prep' in x:
            new_label = 'preposition'
        elif 'verb' in x:
            new_label = 'verb'
        return new_label

    def plot_bar_chart(self, indeces, label, items_to_plot, legend, fname):
        original_idx = list(indeces)
        print('original:', original_idx)
        insertions = [x for x in indeces if not x.startswith('alt') and x != 'inter-sentential']
        alternations = [x for x in indeces if x.startswith('alt')]
        labels = ['adjective', 'auxiliary', 'determiner', 'noun', 'participle', 'preposition', 'verb']
        index_size = np.arange(len(labels))
        fname = ['insertional.pdf', 'alternational.pdf']
        for type, indeces in enumerate([insertions, alternations]):
            fig, ax = plt.subplots()
            rects = []
            for i, item in enumerate(items_to_plot):
                sorted_by_label = sorted(list(zip([self.rename_label(x) for x in indeces],
                                                  [x for ind, x in enumerate(self.cs_results[item])
                                                   if original_idx[ind] in indeces])))
                rects.append(ax.bar(index_size + (self.bar_width * i), [x[1][0] for x in sorted_by_label],
                                    self.bar_width, yerr=[x[1][1] for x in sorted_by_label]))
            if self.title:
                ax.set_title(self.title)
            ax.set_xticks(index_size + self.bar_width / len(items_to_plot))
            ax.set_ylim(bottom=0)
            ax.legend(([x[0] for x in rects]), legend, loc='upper left')
            ax.set_title(fname[type].replace('.pdf', ''), fontsize=16)
            ax.set_ylabel('% of correct sentences')
            ax.set_xticklabels(labels, rotation=55)  # rotate labels to fit better
            ax.tick_params(axis='both', labelsize=14)
            plt.tight_layout()  # make room for labels
            filename = '%s/%s' % (self.results_dir, fname[type])
            plt.savefig(filename)
            plt.close()

    def simple_bar_plot(self, fname="all_switch_points"):
        # prog, perfect
        means_prog = (3.34761383e+000, 4.15960945e+000)
        std_prog = (4.47782572e-001, 5.77097541e-001)

        means_perfect = (4.08477268e+000, 2.18383959e+000)
        std_perfect = (5.29089072e-001, 3.82811174e-001)

        n_groups = len(means_prog)

        fig, ax = plt.subplots()

        index = np.arange(n_groups)
        bar_width = 0.3
        opacity = 0.7

        error_config = {'ecolor': '0.3'}

        ax.bar(index, means_prog, bar_width, alpha=opacity,
               # color='#4daf4a',
               yerr=std_prog, error_kw=error_config, label='auxiliary')

        ax.bar(index + bar_width, means_perfect, bar_width, alpha=opacity,
               yerr=std_perfect, error_kw=error_config, label='participle')

        ax.set_xticks(index + bar_width / 2)
        ax.set_xticklabels(('progressive', 'perfect'))
        ax.legend()

        fig.tight_layout()  # make room for labels
        filename = '%s/%s.pdf' % (self.results_dir, fname)
        plt.savefig(filename)
        plt.close()

    def plot_results(self, results, num_train, num_test, test_df, test_sentences_with_pronoun,
                     cognate_experiment, auxiliary_experiment, evaluated_datasets):
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

            self.plot_multiple_changes_over_time(items_to_plot=['correct_code_switches', 'correct_meaning'],
                                                 legend_loc='lower right',
                                                 test_percentage_lst=[correct_test, num_test],
                                                 training_percentage=None, ylim=90, ylabel=None,
                                                 fname='performance_and_code_switches')
            # !------------  same as above but plot percentage among CORRECTLY produced sentences only ------------!
            self.plot_changes_over_time(ylim=40, items_to_plot=['correct_code_switches'],
                                        test_percentage=correct_test,
                                        training_percentage=(0 if 'training' not in results['correct_meaning'] else
                                                             results['correct_meaning']['training']),
                                        fname="code_switches_correct_%s_set" % 'test',
                                        ylabel='')  # '#%% CS among correctly produced %s set' % 'test')

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
                if False:
                    self.plot_bar_chart(label='CS types (%% of correctly produced %s set)' % 'test',
                                        indeces=all_cs_types, legend=('target lang: Spanish', 'target lang: English'),
                                        fname='code_switches_correct_test_set_last_epoch',
                                        items_to_plot=['type_correct_test_last_epoch_es',
                                                       'type_correct_test_last_epoch_en'])
                    # !------------ Now plot all CS types per epoch  ------------#
                    if self.plot_detailed_cs:
                        for i, cs_type in enumerate(all_cs_types):
                            self.plot_cs_type_over_time(label=('%s (%% of correct %s set)' % (cs_type, 'test')),
                                                        ylim=15,
                                                        legend=('target lang: Spanish', 'target lang: English'),
                                                        fname='code_switches_correct_test_%s' % cs_type,
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
                                                                       and results[key][
                                                                           'test-std_error'] is not None and
                                                                       not isinstance(results[key]['test-std_error'],
                                                                                      int)
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
                        l = []
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
                                        l.append(index)
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
                                                                'has_participle%s' % cs_direction], ylim=5,
                                                        fname='participle_all_set%s' % cs_direction,
                                                        results=res_aux_participle_all_set)

                            self.plot_cs_type_over_time(label='participle switches (% of correctly produced per aspect)'
                                                        , legend=['progressive_participle%s' % cs_direction,
                                                                  'perfect_participle%s' % cs_direction], ylim=5,
                                                        fname='participle_per_aspect%s' % cs_direction,
                                                        results=res_aux_participle_per_tense)
                            # for paper:
                            self.plot_cs_type_over_time(label=''
                                                        , legend=['progressive', 'perfect'], ylim=5,
                                                        fname='tener%s' % cs_direction,
                                                        results=res_aux_participle_per_tense)
                            plot_label = ''  # auxiliary switches (% of correctly produced per aspect)'
                            plot_legend = [x.replace('is', 'progressive').replace('has', 'perfect')
                                           for x in legend if 'after' not in x]
                            self.plot_cs_type_over_time(label=plot_label,
                                                        legend_loc='lower right',
                                                        legend=plot_legend, ylim=5,
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
        return x * 100 / total  # avoid division by 0

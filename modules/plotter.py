from modules.formatter import get_np_mean_and_std_err, percentage, numpy_arange_len, is_not_empty, is_nd_array_or_list
import matplotlib

matplotlib.use('Agg')  # needed for the server only
import matplotlib.pyplot as plt


class Plotter:
    def __init__(self, results_dir, summary_sim, title):
        self.results_dir = results_dir
        self.epochs = []
        self.num_epochs = 0
        self.bar_width = 0.35
        self.cs_results = {}
        self.results = []
        self.title = title
        self.summary_sim = summary_sim
        self.plot_detailed_cs = False
        # blue, orange, green, brown, purple, grey, red, yellowgreen
        self.cblind_friendly = ['#377eb8', '#ff7f00', '#4daf4a', '#a65628', '#984ea3', '#999999', '#e41a1c', '#dede00']
        self.colors = [('#4daf4a', '#dede00'), ('#984ea3', '#999999')]
        self.color_bars = ['#4daf4a', '#984ea3', '#dede00', '#999999', '#e41a1c','#377eb8', '#ff7f00', '#4daf4a',
                           '#a65628', '#984ea3', '#999999', '#e41a1c', '#dede00']

    def plot_changes_over_time(self, items_to_plot, test_percentage, training_percentage, label, ylim, fname,
                               legend_loc='upper right'):
        for item_idx, item_to_plot in enumerate(items_to_plot):
            test_value = percentage(self.results[item_to_plot]['test'], test_percentage)
            plt.plot(self.epochs, test_value, color=self.colors[item_idx][0], label=item_to_plot)
            if 'test-std_error' in self.results[item_to_plot]:
                test_std_error = self.results[item_to_plot]['test-std_error']
                lower_bound = percentage(self.results[item_to_plot]['test'] - test_std_error, test_percentage)
                upper_bound = percentage(self.results[item_to_plot]['test'] + test_std_error, test_percentage)
                plt.fill_between(self.epochs, lower_bound, upper_bound, facecolor=self.colors[item_idx][0], alpha=0.1)

            if is_not_empty(self.results[item_to_plot]['training']):
                if training_percentage:
                    training_value = percentage(self.results[item_to_plot]['training'], training_percentage)
                else:
                    training_value = self.results[item_to_plot]['training']
                plt.plot(self.epochs, training_value, color=self.colors[item_idx][1],
                         label="%s (Training)" % item_to_plot, linestyle='--')
        plt.xlabel('epochs')
        plt.ylabel(label)
        plt.ylim([0, ylim])
        plt.xlim(0 if fname == "performance" else 1, max(self.epochs))  # only start from epoch 0 for performance.png
        plt.legend(loc=legend_loc, ncol=2, fancybox=True, shadow=True)
        plt.savefig("%s/%s%s.pdf" % (self.results_dir,
                                     "%s" % (("summary_%s_" % self.summary_sim) if self.summary_sim else ""), fname))
        plt.close()

    def plot_cs_type_over_time(self, label, results, legend, fname, ylim, legend_loc='upper right'):
        for i, result in enumerate(results):
            if is_nd_array_or_list(result):
                if max(result) > ylim:
                    ylim = max(result)
                plt.plot(self.epochs, result, color=self.color_bars[i], label=legend[i])
            else:
                if max(result[0]) > ylim:
                    ylim = self.adjust_y_axis(result[0])
                plt.plot(self.epochs, result[0], color=self.color_bars[i], label=legend[i])
                lower_bound = [x - y for x, y in zip(result[0], result[1])]
                upper_bound = [x + y for x, y in zip(result[0], result[1])]
                plt.fill_between(self.epochs, lower_bound, upper_bound, facecolor=self.color_bars[i], alpha=0.1)
        plt.xlabel('epochs')
        plt.ylabel(label)
        plt.ylim([0, ylim])
        plt.xlim(1, max(self.epochs))  # only start from epoch 0 for performance.png
        plt.legend(loc=legend_loc, ncol=2, fancybox=True, shadow=True)
        plt.savefig("%s/%s%s.pdf" % (self.results_dir,
                                     "%s" % (("summary_%s_" % self.summary_sim) if self.summary_sim else ""), fname))
        plt.close()

    @staticmethod
    def adjust_y_axis(result):
        if max(result) + 5 <= 100:
            return max(result) + 5
        return max(result)

    def plot_bar_chart(self, label, items_to_plot, legend, fname):
        cs_indeces = numpy_arange_len(self.results['all_cs_types'])
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

    def plot_results(self, results, num_train, num_test, test_sentences_with_pronoun, simulation_logger,
                     cognate_experiment, auxiliary_experiment, plot_mse=True):
        correct_test = results['correct_meaning']['test']
        type_code_switches_test = results['type_code_switches']['test']
        if not self.epochs:
            self.epochs = range(len(correct_test))
            self.num_epochs = len(self.epochs)
        self.results = results

        self.plot_changes_over_time(items_to_plot=['correct_meaning', 'correct_pos'], label='Percentage correct (%)',
                                    test_percentage=num_test, training_percentage=num_train, ylim=100,
                                    fname="performance", legend_loc='lower right')
        # !------------  CODE-SWITCHES ------------!
        correct_code_switches = results['correct_code_switches']['test']
        if not isinstance(correct_code_switches, int) and sum(correct_code_switches):
            self.plot_changes_over_time(items_to_plot=['correct_code_switches', 'all_code_switches'],
                                        test_percentage=num_test, training_percentage=num_train, ylim=60,
                                        label='%% CS among %s set' % 'test',
                                        fname='code_switches_%s_set' % 'test')
            # !------------  same as above but plot percentage among CORRECTLY produced sentences only ------------!
            self.plot_changes_over_time(ylim=60, items_to_plot=['correct_code_switches'],
                                        test_percentage=correct_test,
                                        training_percentage=results['correct_meaning']['training'],
                                        fname="code_switches_correct_%s_set" % 'test',
                                        label='%% CS among correctly produced %s set' % 'test')

            # !------------  code-switching ------------!
            self.cs_results = {'type_correct_test_EN': [], 'type_correct_test_ES': [],
                               'type_correct_test_last_epoch_EN': [], 'type_correct_test_last_epoch_ES': []}
            for cs_type in results['all_cs_types']:
                for lang in ['ES', 'EN']:
                    cs_type_per_lang = "%s-%s" % (lang, cs_type)
                    if cs_type_per_lang in type_code_switches_test:  # if we include training set we need to edit this
                        cs_percentage_correct = percentage(type_code_switches_test[cs_type_per_lang], correct_test)
                        if self.summary_sim and "%s-std_error" % cs_type_per_lang in type_code_switches_test:
                            std_err = percentage(type_code_switches_test["%s-std_error" % cs_type_per_lang],
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
            if self.cs_results['type_correct_test_last_epoch_ES'] or self.cs_results['type_correct_last_epoch_test_EN']:
                self.plot_bar_chart(label='CS types (%% of correctly produced %s set - last epoch)' % 'test',
                                    items_to_plot=['type_correct_test_last_epoch_ES', 'type_correct_test_last_epoch_ES']
                                    , legend=('ES', 'EN'), fname='type_correct_test_last_epoch')
                if self.summary_sim:
                    simulation_logger.info("type_correct_last_epoch_test_ES: %s\ntype_correct_test_last_epoch_EN: %s" %
                                           (self.cs_results['type_correct_test_last_epoch_ES'],
                                            self.cs_results['type_correct_test_last_epoch_EN']))
                # !------------ Now plot all CS types per epoch  ------------#
                if self.plot_detailed_cs:
                    for i, cs_type in enumerate(results['all_cs_types']):
                        self.plot_cs_type_over_time(label=('%s (%% of correct %s set)' % (cs_type, 'test')),
                                                    ylim=15, legend=('EN', 'ES'), fname='cs_type_%s' % cs_type,
                                                    results=[self.cs_results['type_correct_test_EN'][i],
                                                             self.cs_results['type_correct_test_ES'][i]])

                if auxiliary_experiment:
                    #print(self.results)
                    res = []
                    legend = []
                    for aux in ['is', 'has']:
                        for point in ['participle', 'aux', 'after']:
                            index = '%s_%s' % (aux, point)
                            if index in self.results:
                                legend.append(index)
                                # normalize using correct_code_switches
                                if 'test-std_error' in self.results[index]:
                                    res.append((percentage(self.results[index]['test'], correct_code_switches),
                                                percentage(self.results[index]['test-std_error'], correct_code_switches)
                                                ))
                                else:
                                    res.append(percentage(self.results[index]['test'], correct_code_switches))

                    if res:
                        self.plot_cs_type_over_time(label='auxiliary switches (% of correctly produced test set)',
                                                    legend=legend, ylim=15,
                                                    fname='auxiliary_test', results=res)
                        # now exclude the _after categories:
                        for keyword in ['has_after', 'is_after']:
                            idx = legend.index(keyword)
                            if idx:
                                del legend[idx]
                                del res[idx]
                        self.plot_cs_type_over_time(label='auxiliary switches (% of correctly produced test set)',
                                                    legend=legend, ylim=15,
                                                    fname='auxiliary_test_no_after', results=res)

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
                            cs_percentage_correct = percentage(type_code_switches_test[cs_type_per_key], correct_test)
                            if self.summary_sim and "%s-std_error" % cs_type_per_key in type_code_switches_test:
                                std_err = percentage(type_code_switches_test["%s-std_error" % cs_type_per_key],
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
                    if self.summary_sim:
                        simulation_logger.info("type_test_ENES: %s\ntype_test_ff: %s\ntype_test_cog: %s" %
                                               (self.cs_results['type_correct_test_last_epoch'],
                                                self.cs_results['type_correct_test_last_epoch-ff'],
                                                self.cs_results['type_correct_test_last_epoch-cog']))

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
        if (is_nd_array_or_list(results['pronoun_errors']['test']) and (sum(results['pronoun_errors_flex']['test']) or
                                                                        sum(results['pronoun_errors']['test']))):
            print("pronoun", type(results['pronoun_errors']['test']))
            self.plot_changes_over_time(items_to_plot=['pronoun_errors', 'pronoun_errors_flex'],
                                        label='Sum of subject pronoun errors', fname='pronoun_errors')
            # same using percentages
            if test_sentences_with_pronoun:  # in ES case there are no sentences with 'he' and 'she'
                self.plot_changes_over_time(items_to_plot=['pronoun_errors', 'pronoun_errors_flex'],
                                            label='Percentage (%) of subject pronoun errors in test set',
                                            fname='pronoun_errors_percentage',
                                            test_percentage=test_sentences_with_pronoun, ylim=15)

        if plot_mse and not self.summary_sim and results['mse']:  # no need to plot an average of all the simulations
            mse_list = [get_np_mean_and_std_err(results['mse'][epoch])[0] for epoch in self.epochs]
            plt.plot(self.epochs, mse_list, color='darkslateblue', label='MSE')
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
        layers = numpy_arange_len(stats['labels'])
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


def plot_layers(srn, fig, plot_weights=False):
    """
    Not used (plotting slows down the simulations), will refactor later
    :param plot_weights: by default it only plots activations. Set to True if you want the weights as well.
    """
    import numpy as np
    if fig is None:  # init fig
        fig = plt.figure(figsize=(14, 8.2))  # (width, height)
        cax = fig.add_axes([0.5, 0.8, 1.95, 0.85])  # [r l w h]
        cax.get_xaxis().set_visible(False)
        cax.get_yaxis().set_visible(False)
        cax.patch.set_alpha(0)
        cax.set_frame_on(False)  # removes borders around plot
        for idx, layer in enumerate(srn.get_layers_for_backpropagation()):
            ax = fig.add_subplot("24%s" % idx)
            ax.set_title(layer.name)
            if plot_weights:
                plt.imshow(layer.in_weights)
                plt.colorbar(orientation='vertical')
            else:
                if layer.name == "output":
                    continue
                if idx > 9:
                    ax = fig.add_subplot("34%s" % (idx if idx < 10 else int(idx / 2)))
                else:
                    ax = fig.add_subplot("34%s" % (idx if idx < 10 else int(idx / 2)))
                ax.set_title(layer.name)
                ax.get_yaxis().set_visible(False)
                # plt.step(-1, 1)
                plt.imshow(np.atleast_2d(layer.activation))
                if idx == 0:
                    plt.colorbar(orientation='vertical')  # show colorbar
        plt.show(block=False)  # doesn't work for all Python versions. If plot doesn't show, set block to True
    else:
        if plot_weights:
            # 8 layers, plot 4 + 4
            for idx, layer in enumerate(srn.get_layers_for_backpropagation()):
                ax = fig.add_subplot("24%s" % idx)
                ax.set_title(layer.name)
                plt.imshow(layer.in_weights)
        else:
            for idx, layer in enumerate(srn.layers):
                if idx > 9:
                    ax = fig.add_subplot("34%s" % (idx if idx < 10 else int(idx / 2)))
                else:
                    ax = fig.add_subplot("34%s" % (idx if idx < 10 else int(idx / 2)))
                ax.clear()  # otherwise it shows previous activations
                ax.set_title(layer.name)
                plt.imshow(np.atleast_2d(layer.activation))
    plt.draw()
    return fig

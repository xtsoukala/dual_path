from formatter import get_np_mean_and_std_err, percentage, numpy_arange_len, is_not_empty, is_nd_array
import matplotlib
import re

matplotlib.use('Agg')  # needed for the server only
import matplotlib.pyplot as plt


class Plotter:
    def __init__(self, results_dir, summary_sim):
        self.results_dir = results_dir
        self.epochs = []
        self.results = []
        self.summary_sim = summary_sim
        self.colors = [('darkslateblue', 'olivedrab'), ('deepskyblue', 'yellowgreen')]

    def plot_individual_switch_types(self, switch_types, type_code_switches, test_percentage):
        plot_individual = False
        for switch_type, color in switch_types:
            if switch_type in type_code_switches:
                plt.plot(self.epochs, [percentage(value, test_percentage[i])
                                       for i, value in enumerate(type_code_switches[switch_type])],
                         color=color, label=switch_type)
                plot_individual = True
                if '%s-std_error' % switch_type in type_code_switches:
                    test_std_error = type_code_switches['%s-std_error' % switch_type]
                    lower_bound = type_code_switches[switch_type] - test_std_error
                    upper_bound = type_code_switches[switch_type] + test_std_error
                    if isinstance(test_percentage, int):
                        lower_bound = [percentage(x, test_percentage)
                                       for x in lower_bound]
                        upper_bound = [percentage(x, test_percentage)
                                       for x in upper_bound]
                    elif is_nd_array(test_percentage):
                        lower_bound = [percentage(x, test_percentage[i])
                                       for i, x in enumerate(lower_bound)]
                        upper_bound = [percentage(x, test_percentage[i])
                                       for i, x in enumerate(upper_bound)]

                    plt.fill_between(self.epochs, lower_bound, upper_bound, facecolor=color, alpha=0.1)
        if plot_individual:
            plt.xlabel('epochs')
            plt.ylabel('% among correctly produced sentences')
            plt.ylim([0, 30])
            plt.xlim([1, max(self.epochs)])  # no correct sentences in epoch 0
            plt.legend(loc='upper right', ncol=2, fancybox=True, shadow=True)
            fname = '%s/%snoun_alternational_percentage.pdf' % (self.results_dir,
                                                                "summary_%s_" % self.summary_sim if self.summary_sim
                                                                else "")
            plt.savefig(fname)
            plt.close()

    def plot_changes_over_time(self, items_to_plot, test_percentage, training_percentage, label, ylim, fname,
                               legend_loc='upper right'):
        for item_idx, item_to_plot in enumerate(items_to_plot):
            if isinstance(test_percentage, int):
                test_value = [percentage(val, test_percentage)
                              for val in self.results[item_to_plot]['test']]
            elif is_nd_array(test_percentage):
                test_value = [percentage(val, test_percentage[i])
                              for i, val in enumerate(self.results[item_to_plot]['test'])]
            else:
                test_value = self.results[item_to_plot]['test']
            plt.plot(self.epochs, test_value, color=self.colors[item_idx][0], label=item_to_plot)
            if 'test-std_error' in self.results[item_to_plot]:
                test_std_error = self.results[item_to_plot]['test-std_error']
                lower_bound = self.results[item_to_plot]['test'] - test_std_error
                upper_bound = self.results[item_to_plot]['test'] + test_std_error
                if isinstance(test_percentage, int):
                    lower_bound = [percentage(x, test_percentage)
                                   for x in lower_bound]
                    upper_bound = [percentage(x, test_percentage)
                                   for x in upper_bound]
                elif is_nd_array(test_percentage):
                    lower_bound = [percentage(x, test_percentage[i])
                                   for i, x in enumerate(lower_bound)]
                    upper_bound = [percentage(x, test_percentage[i])
                                   for i, x in enumerate(upper_bound)]

                plt.fill_between(self.epochs, lower_bound, upper_bound, facecolor=self.colors[item_idx][0], alpha=0.1)

            if is_not_empty(self.results[item_to_plot]['training']):
                if training_percentage:
                    training_value = [percentage(val, training_percentage[i])
                                      for i, val in enumerate(self.results[item_to_plot]['training'])]
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

    def plot_results(self, results, title, num_train, num_test, test_sentences_with_pronoun, simulation_logger,
                     cognate_experiment):
        if not self.epochs:
            self.epochs = range(len(results['correct_meaning']['test']))
        self.results = results
        self.plot_changes_over_time(items_to_plot=['correct_meaning', 'correct_pos'], label='Percentage correct (%)',
                                    test_percentage=num_test, training_percentage=num_train, ylim=100,
                                    fname="performance", legend_loc='lower right')
        # !------------  CODE-SWITCHES ------------!
        correct_code_switches = results['correct_code_switches']['test']
        if not isinstance(correct_code_switches, int) and sum(correct_code_switches):
            self.plot_changes_over_time(items_to_plot=['correct_code_switches', 'all_code_switches'],
                                        test_percentage=num_test, training_percentage=num_train, ylim=80,
                                        label='%% CS among %s set' % 'test',
                                        fname='code_switches_%s_set' % 'test')
            # !------------  same as above but plot percentage among CORRECTLY produced sentences only ------------!
            self.plot_changes_over_time(ylim=80, items_to_plot=['correct_code_switches'],
                                        test_percentage=results['correct_meaning']['test'],
                                        training_percentage=results['correct_meaning']['training'],
                                        fname="code_switches_correct_%s_set" % 'test',
                                        label='%% CS among correctly produced %s set' % 'test')

            # !------------  PLOT ONLY NOUNS AND ALTERNATIONAL CS ------------!
            self.plot_individual_switch_types(switch_types=[('en-noun', 'darkslateblue'), ('es-noun', 'deepskyblue'),
                                                            ('es-alternational', 'olivedrab'),
                                                            ('en-alternational', 'yellowgreen')],
                                              type_code_switches=results['type_code_switches']['test'],
                                              test_percentage=results['correct_meaning']['test'])

            # !------------  plot each code-switch type individually ------------!
            # first get all keywords (all CS types)
            type_code_switches_test = results['type_code_switches']['test']
            cs_results = {'type_test_en': [], 'type_test_es': [],
                          'type_correct_test_en': [], 'type_correct_test_es': [],
                          'type_test_last_epoch_en': [], 'type_test_last_epoch_es': [],
                          'type_correct_test_last_epoch_en': [], 'type_correct_test_last_epoch_es': []}
            correct_test = results['correct_meaning']['test']
            print results['all_cs_types']
            print correct_test
            print num_test
            for cs_type in results['all_cs_types']:
                for lang in ['es', 'en']:
                    cs_type_per_lang = "%s-%s" % (lang, cs_type)
                    if cs_type_per_lang in type_code_switches_test:  # if we include training set we need to edit this
                        cs_type_per_lang_percentage = [percentage(x, num_test)
                                                       for x in type_code_switches_test[cs_type_per_lang]]
                        cs_results['type_test_%s' % lang].append(get_np_mean_and_std_err(cs_type_per_lang_percentage,
                                                                                         summary_sim=self.summary_sim))

                        cs_percentage_correct = [percentage(x, correct_test[i])
                                                 for i, x in enumerate(type_code_switches_test[cs_type_per_lang])]
                        mean, std_err = get_np_mean_and_std_err(cs_percentage_correct, summary_sim=self.summary_sim)
                        cs_results['type_correct_test_%s' % lang].append((mean, std_err))
                        # LAST epoch only
                        cs_result_last_epoch = type_code_switches_test[cs_type_per_lang][-1]
                        if "%s-std_error" % cs_type_per_lang in type_code_switches_test:
                            cs_std_error = type_code_switches_test["%s-std_error" % cs_type_per_lang][-1]
                        else:
                            cs_std_error = 0
                        cs_results['type_test_last_epoch_%s' % lang].append((percentage(cs_result_last_epoch, num_test),
                                                                             percentage(cs_std_error, num_test)))
                        cs_results['type_correct_test_last_epoch_%s' % lang].append((percentage(cs_result_last_epoch,
                                                                                                correct_test[-1]),
                                                                                     percentage(cs_std_error,
                                                                                                correct_test[-1])))
                    else:
                        cs_results['type_test_%s' % lang].append((0, 0))
                        cs_results['type_correct_test_%s' % lang].append((0, 0))

                        cs_results['type_test_last_epoch_%s' % lang].append((0, 0))
                        cs_results['type_correct_test_last_epoch_%s' % lang].append((0, 0))

            # make sure there is still something to be plotted after the manipulations
            if cs_results['type_test_es'] or cs_results['type_test_en']:
                cs_indeces = numpy_arange_len(results['all_cs_types'])
                bar_width = 0.35

                for c in ["", "_correct"]:
                    fig, ax = plt.subplots()
                    if self.summary_sim:
                        yerr_en = [x[1] for x in cs_results['type%s_test_en' % c]]
                        yerr_es = [x[1] for x in cs_results['type%s_test_es' % c]]
                    else:
                        yerr_en = [0] * len(cs_results['type%s_test_en' % c])
                        yerr_es = yerr_en
                    rects_en = ax.bar(cs_indeces, [x[0] for x in cs_results['type%s_test_en' % c]], bar_width,
                                      color='r', yerr=yerr_en)
                    rects_es = ax.bar(cs_indeces + bar_width, [x[0] for x in cs_results['type%s_test_es' % c]],
                                      bar_width, color='y', yerr=yerr_es)

                    label = 'CS types (%% of %s%s set)' % ('correctly produced ' if c else c, 'test')
                    ax.set_ylabel(label)
                    if title:
                        ax.set_title(title)
                    ax.set_xticks(cs_indeces + bar_width / 2)
                    ax.set_ylim(bottom=0)
                    ax.legend((rects_en[0], rects_es[0]), ('EN', 'ES'))
                    ax.set_xticklabels(results['all_cs_types'], rotation=55)  # rotate labels to fit better
                    plt.tight_layout()  # make room for labels
                    if self.summary_sim:
                        simulation_logger.info("type%s_test_es: %s\ntype%s_test_en: %s" %
                                               (c, c, cs_results['type%s_test_es' % c], cs_results['type%s_test_en' % c]))
                    fname = '%s/%stype%s_test_cs.pdf' % (self.results_dir,
                                                         "%s" % (("summary_%s_" % self.summary_sim)
                                                                 if self.summary_sim else ""), c)
                    plt.savefig(fname)
                    plt.close()

                    # also plot LAST EPOCH only
                    fig, ax = plt.subplots()
                    if self.summary_sim:
                        yerr_en = [x[1] for x in cs_results['type%s_test_last_epoch_en' % c]]
                        yerr_es = [x[1] for x in cs_results['type%s_test_last_epoch_es' % c]]
                    else:
                        yerr_en = [0] * len(cs_results['type%s_test_last_epoch_en' % c])
                        yerr_es = yerr_en
                    rects_en = ax.bar(cs_indeces, [x[0] for x in cs_results['type%s_test_last_epoch_en' % c]],
                                      bar_width, color='r', yerr=yerr_en)
                    rects_es = ax.bar(cs_indeces + bar_width,
                                      [x[0] for x in cs_results['type%s_test_last_epoch_es' % c]], bar_width,
                                      color='y', yerr=yerr_es)
                    # add some text for labels, title and axes ticks
                    label = 'CS types (%% of %s %s set - last epoch)' % ("correct" if c else "", 'test')
                    ax.set_ylabel(label)
                    if title:
                        ax.set_title(title)
                    ax.set_xticks(cs_indeces + bar_width / 2)
                    ax.set_ylim(bottom=0)
                    ax.legend((rects_en[0], rects_es[0]), ('EN', 'ES'))
                    ax.set_xticklabels(results['all_cs_types'], rotation=55)  # rotate labels to fit better
                    plt.tight_layout()  # make room for labels
                    if self.summary_sim:
                        simulation_logger.info("type%s_test_last_epoch_es: %s\ntype%s_test_last_epoch_en: %s" %
                                               (c, c, cs_results['type%s_test_last_epoch_es' % c],
                                                cs_results['type%s_test_last_epoch_en' % c]))
                    fname = '%s/%stype%s_test_cs_last_epoch.pdf' % (self.results_dir,
                                                                    ("summary_%s_" % self.summary_sim
                                                                     if self.summary_sim else ""), c)
                    plt.savefig(fname)
                    plt.close()

            # NOW THE SAME FOR THE COG EXPERIMENT
            if cognate_experiment:
                for dataset_type in ['test']:  # ['training', 'test']:
                    type_test_enes = []
                    type_test_cog = []
                    type_test_ff = []
                    inlcude_ff = False
                    for cs_type in results['all_cs_types']:  # cs types calculated above
                        cog_type = "%s-COG" % cs_type
                        if cog_type in results['type_code_switches'][dataset_type]:
                            # take the percentage of sum in test set
                            values_percentage_testset = [percentage(x, num_test)
                                                         for x in results['type_code_switches'][dataset_type][cog_type]]
                            type_test_cog.append(get_np_mean_and_std_err(values_percentage_testset,
                                                                         summary_sim=self.summary_sim))
                        else:
                            type_test_cog.append((0, 0))
                        # same for FF
                        ff_type = "%s-FF" % cs_type
                        if ff_type in results['type_code_switches'][dataset_type]:
                            # take the percentage of sum in test set
                            values_percentage_testset = [percentage(x, num_test)
                                                         for x in results['type_code_switches'][dataset_type][ff_type]]
                            type_test_ff.append(get_np_mean_and_std_err(values_percentage_testset,
                                                                        summary_sim=self.summary_sim))
                            inlcude_ff = True
                        else:
                            type_test_ff.append((0, 0))
                        # same for non cognates-false friends
                        if cs_type in results['type_code_switches'][dataset_type]:
                            # take the percentage of sum in test set
                            values_percentage_testset = [percentage(x, num_test)
                                                         for x in results['type_code_switches'][dataset_type][cs_type]]
                            type_test_enes.append(get_np_mean_and_std_err(values_percentage_testset,
                                                                          summary_sim=self.summary_sim))
                        else:
                            type_test_enes.append((0, 0))

                # make sure there is still something to be plotted after the manipulations
                if type_test_enes or type_test_ff or type_test_cog:
                    fig, ax = plt.subplots()
                    err_non_cog = [x[1] for x in type_test_enes] if self.summary_sim else len(type_test_enes)
                    err_cog = [x[1] for x in type_test_cog] if self.summary_sim else len(type_test_cog)
                    rects = ax.bar(cs_indeces, [x[0] for x in type_test_enes], bar_width, color='yellowgreen',
                                   yerr=err_non_cog)
                    rects_cog = ax.bar(cs_indeces + bar_width, [x[0] for x in type_test_cog], bar_width, color='g',
                                       yerr=err_cog)
                    if inlcude_ff:
                        err_ff = [x[1] for x in type_test_ff] if self.summary_sim else len(type_test_ff)
                        rects_ff = ax.bar(cs_indeces + bar_width * 2, [x[0] for x in type_test_ff], bar_width,
                                          color='greenyellow', yerr=err_ff)

                    # add some text for labels, title and axes ticks
                    label = 'CS types (%% of %s set)' % dataset_type
                    ax.set_ylabel(label)
                    # ax.set_title('Early bilingual group')
                    if inlcude_ff:
                        ax.set_xticks(cs_indeces + (bar_width * 2) / 2)
                        ax.legend((rects[0], rects_cog[0], rects_ff[0]), ('NON-COG', 'COG', 'FF'))
                        file_name = "type_code_switches_cog_ff"
                    else:
                        ax.set_xticks(cs_indeces + bar_width / 2)
                        ax.legend((rects[0], rects_cog[0]), ('NON-COG', 'COG'))
                        file_name = "type_code_switches_cog"
                    ax.set_ylim(bottom=0)
                    ax.set_xticklabels(results['all_cs_types'], rotation=55)  # rotate labels to fit better
                    plt.tight_layout()  # make room for labels
                    if self.summary_sim:
                        simulation_logger.info("type_test_enes: %s\ntype_test_ff: %s\ntype_test_cog: %s" %
                                               (type_test_enes, type_test_ff, type_test_cog))
                    fname = '%s/%s%s_%s.pdf' % (self.results_dir, "summary_%s_" % (self.summary_sim
                                                                                   if self.summary_sim else ""),
                                                file_name, dataset_type)
                    plt.savefig(fname)
                    plt.close()

        # !------------ Pronoun errors - only plot if there's something to be plotted ------------!
        if ((isinstance(results['pronoun_errors']['test'], list) or is_nd_array(results['pronoun_errors']['test'])) and
                (sum(results['pronoun_errors_flex']['test']) or sum(results['pronoun_errors']['test']))):
            print "pronoun", type(results['pronoun_errors']['test'])
            self.plot_changes_over_time(items_to_plot=['pronoun_errors', 'pronoun_errors_flex'],
                                        label='Sum of subject pronoun errors', fname='pronoun_errors')
            # same using percentages
            if test_sentences_with_pronoun:  # in ES case there are no sentences with 'he' and 'she'
                self.plot_changes_over_time(items_to_plot=['pronoun_errors', 'pronoun_errors_flex'],
                                            label='Percentage (%) of subject pronoun errors in test set',
                                            fname='pronoun_errors_percentage',
                                            test_percentage=test_sentences_with_pronoun, ylim=15)

        if not self.summary_sim and results['mse']:  # no need to plot an average of all the simulations
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

    @staticmethod
    def is_not_empty(x):
        if not x:
            return False
        if sum(s[0] for s in x):
            return True
        return False


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

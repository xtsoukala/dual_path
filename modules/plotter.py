from formatter import get_numpy_mean_and_std, percentage, numpy_arange_len
import matplotlib
import re

matplotlib.use('Agg')  # needed for the server only
import matplotlib.pyplot as plt


class Plotter:
    def __init__(self, results_dir):
        self.results_dir = results_dir

    def plot_results(self, results, title, num_train, num_test, test_sentences_with_pronoun, cognate_experiment=True,
                     summary_sim=None):
        correct_test_sentences = results['correct_meaning']['test']
        correct_test_pos = results['correct_pos']['test']
        epochs = range(len(correct_test_sentences))
        if results['correct_meaning']['training'] != []:
            correct_training_sentences = results['correct_meaning']['training']
            plt.plot(epochs, [percentage(x, num_train) for x in correct_training_sentences], linestyle='--',
                     color='olivedrab', label='training')
            plt.plot(epochs, [percentage(x, num_train) for x in results['correct_pos']['training']], linestyle='--',
                     color='yellowgreen', label='training POS')
        # test sentences
        plt.plot(epochs, [percentage(x, num_test) for x in correct_test_sentences],
                 color='darkslateblue', label='test')
        plt.plot(epochs, [percentage(x, num_test) for x in correct_test_pos],
                 color='deepskyblue', label='test POS')
        if 'test-std' in results['correct_meaning']:
            correct_test_std = results['correct_meaning']['test-std']
            lower_bound = [percentage(x, num_test) for x in correct_test_sentences - correct_test_std]
            upper_bound = [percentage(x, num_test) for x in correct_test_sentences + correct_test_std]
            plt.fill_between(epochs, lower_bound, upper_bound, facecolor='darkslateblue', alpha=0.1)
            correct_test_pos_std = results['correct_pos']['test-std']
            lower_bound = [percentage(x, num_test) for x in correct_test_pos - correct_test_pos_std]
            upper_bound = [percentage(x, num_test) for x in correct_test_pos + correct_test_pos_std]
            plt.fill_between(epochs, lower_bound, upper_bound, facecolor='deepskyblue', alpha=0.1)
        plt.ylim([0, 100])
        plt.xlim(min(epochs), max(epochs))
        plt.xlabel('Epochs')
        plt.ylabel('Percentage correct (%)')
        if title:
            plt.title(title)
        plt.legend(loc='lower right', ncol=2, fancybox=True, shadow=True)
        if summary_sim:
            fname = '%s/performance_%s_simulations.pdf' % (self.results_dir, summary_sim)
        else:
            fname = '%s/performance.pdf' % self.results_dir
        plt.savefig(fname)
        plt.close()

        # !------------  CODE-SWITCHES ------------!
        correct_code_switches = results['correct_code_switches']['test']
        if not isinstance(correct_code_switches, int) and sum(correct_code_switches):
            code_switches = results['all_code_switches']['test']
            plt.plot(epochs, [percentage(x, num_test) for x in code_switches], color='olivedrab',
                     label="All CS")
            plt.plot(epochs, [percentage(x, num_test) for x in correct_code_switches],
                     color='darkslateblue', label="Code-switches")
            if results['all_code_switches']['training'] != []:
                plt.plot(epochs, [percentage(x, num_train) for x in results['all_code_switches']['training']],
                         linestyle='--', color='yellowgreen', label="All CS (training)")
                plt.plot(epochs, [percentage(x, num_train) for x in results['correct_code_switches']['training']],
                         linestyle='--', color='deepskyblue', label="Code-switches (training)")
            if 'test-std' in results['correct_code_switches']:
                correct_code_switches_std = results['correct_code_switches']['test-std']
                lower_bound = [percentage(x, num_test) for x in correct_code_switches - correct_code_switches_std]
                upper_bound = [percentage(x, num_test) for x in correct_code_switches + correct_code_switches_std]
                plt.fill_between(epochs, lower_bound, upper_bound, facecolor='darkslateblue', alpha=0.1)
                code_switches_std = results['all_code_switches']['test-std']
                lower_bound = [percentage(x, num_test) for x in code_switches - code_switches_std]
                upper_bound = [percentage(x, num_test) for x in code_switches + code_switches_std]
                plt.fill_between(epochs, lower_bound, upper_bound, facecolor='olivedrab', alpha=0.1)
            plt.xlabel('Epochs')
            plt.ylabel('Percentage of code-switches among all sentences')
            plt.ylim([0, 60])

            plt.xlim(min(epochs), max(epochs))
            plt.legend(loc='upper right', ncol=2, fancybox=True, shadow=True)
            if summary_sim:
                fname = '%s/summary_%s_code_switches_percentage.pdf' % (self.results_dir, summary_sim)
                with open("%s/simulation.info" % self.results_dir, 'a') as f:  # Append information
                    f.write("\nCode-switched percentage (test set): %s" % [percentage(x, num_test) for x
                                                                           in results['correct_code_switches']['test']])
            else:
                fname = '%s/code_switches_percentage.pdf' % self.results_dir
            plt.savefig(fname)
            plt.close()

            # !------------  same as above but plot PERCENTAGE among correctly produced sentences only ------------!
            plt.plot(epochs, [percentage(value, correct_test_sentences[i])
                              for i, value in enumerate(results['correct_code_switches']['test'])],
                     color='darkslateblue', label="Test set")
            if results['correct_code_switches']['training'] != []:
                plt.plot(epochs, [percentage(value, correct_training_sentences[i])
                                  for i, value in enumerate(results['correct_code_switches']['training'])],
                         color='deepskyblue', label="Training set")
            plt.xlabel('Epochs')
            plt.ylabel('% code-switches among correctly produced sentences')
            plt.ylim([0, 60])
            plt.xlim(min(epochs), max(epochs))
            plt.legend(loc='upper right', ncol=2, fancybox=True, shadow=True)
            if summary_sim:
                fname = '%s/summary_%s_code_switches_correct_percentage.pdf' % (self.results_dir, summary_sim)
                with open("%s/simulation.info" % self.results_dir, 'a') as f:  # Append information
                    f.write("\nCode-switched percentage (test set): %s" % [percentage(x, num_test) for x
                                                                           in results['correct_code_switches']['test']])
            else:
                fname = '%s/code_switches_correct_percentage.pdf' % self.results_dir
            plt.savefig(fname)
            plt.close()

            # !------------  PLOT ONLY NOUNS AND ALTERNATIONAL CS ------------!
            type_code_switches_test = results['type_code_switches']['test']
            plot_individual = False
            if 'en-noun' in type_code_switches_test:
                plt.plot(epochs, [percentage(value, correct_test_sentences[i])
                                  for i, value in enumerate(type_code_switches_test['en-noun'])],
                         color='darkslateblue', label="Noun (EN)")
                plot_individual = True
            if 'es-noun' in type_code_switches_test:
                plt.plot(epochs, [percentage(value, correct_test_sentences[i])
                                  for i, value in enumerate(type_code_switches_test['es-noun'])],
                         color='deepskyblue', label="Noun (ES)")
                plot_individual = True
            if 'es-alternational' in type_code_switches_test:
                plt.plot(epochs, [percentage(value, correct_test_sentences[i])
                                  for i, value in enumerate(type_code_switches_test['es-alternational'])],
                         color='olivedrab', label="Alternational CS (ES)")
                plot_individual = True
            if 'en-alternational' in type_code_switches_test:
                plt.plot(epochs, [percentage(value, correct_test_sentences[i])
                                  for i, value in enumerate(type_code_switches_test['en-alternational'])],
                         color='yellowgreen', label="Alternational CS (EN)")
                plot_individual = True

            if plot_individual:
                plt.xlabel('Epochs')
                plt.ylabel('% noun/alternational code-switches among correctly produced sentences')
                plt.ylim([0, 30])
                plt.xlim(min(epochs), max(epochs))
                plt.legend(loc='upper right', ncol=2, fancybox=True, shadow=True)
                if summary_sim:
                    fname = '%s/summary_%s_noun_alternational_percentage.pdf' % (self.results_dir, summary_sim)
                else:
                    fname = '%s/noun_alternational_percentage.pdf' % self.results_dir
                plt.savefig(fname)
                plt.close()

            # !------------  plot each code-switch type individually ------------!
            # first get all keywords (all CS types)
            all_cs_types = set([re.sub("es-|en-|-COG|-FF", "", x)
                                for x in type_code_switches_test.keys()])
            if results['type_code_switches']['training']:
                all_cs_types.update([re.sub("es-|en-|-COG|-FF", "", x)
                                     for x in results['type_code_switches']['training'].keys()])
            type_test_en = []
            type_test_es = []
            type_test_correct_en = []
            type_test_correct_es = []
            for cs_type in all_cs_types:
                es_type = "es-%s" % cs_type
                if es_type in type_code_switches_test:
                    cs_result = type_code_switches_test[es_type]
                    values_percentage_testset = [percentage(x, num_test)
                                                 for x in cs_result]
                    type_test_es.append(get_numpy_mean_and_std(values_percentage_testset))
                    values_percentage_correct_testset = [percentage(x, correct_test_sentences[i])
                                                         for i, x in enumerate(cs_result)]
                    type_test_correct_es.append(get_numpy_mean_and_std(values_percentage_correct_testset))
                else:
                    type_test_es.append((0, 0))
                    type_test_correct_es.append((0, 0))

                # same for EN
                en_type = "en-%s" % cs_type
                if en_type in type_code_switches_test:
                    # take the percentage of sum in test set
                    cs_result = type_code_switches_test[en_type]
                    values_percentage_testset = [percentage(x, num_test)
                                                 for x in cs_result]
                    values_percentage_correct_testset = [percentage(x, correct_test_sentences[i])
                                                         for i, x in enumerate(cs_result)]
                    type_test_en.append(get_numpy_mean_and_std(values_percentage_testset))
                    type_test_correct_en.append(get_numpy_mean_and_std(values_percentage_correct_testset))
                else:
                    type_test_en.append((0, 0))
                    type_test_correct_en.append((0, 0))

            # make sure there is still something to be plotted after the manipulations
            if type_test_es or type_test_en:
                ind = numpy_arange_len(all_cs_types)  # the x locations for the groups
                width = 0.35  # the width of the bars
                fig, ax = plt.subplots()
                rects_en = ax.bar(ind, [x[0] for x in type_test_en], width, color='r',
                                  yerr=[x[1] for x in type_test_en])
                rects_es = ax.bar(ind + width, [x[0] for x in type_test_es], width, color='y',
                                  yerr=[x[1] for x in type_test_es])

                # add some text for labels, title and axes ticks
                label = 'Types of code-switches (%% of %s set)' % 'test'
                ax.set_ylabel(label)
                if title:
                    ax.set_title(title)
                ax.set_xticks(ind + width / 2)
                ax.set_ylim(bottom=0)
                ax.legend((rects_en[0], rects_es[0]), ('EN', 'ES'))
                ax.set_xticklabels(all_cs_types, rotation=55)  # rotate labels to fit better
                plt.tight_layout()  # make room for labels

                if summary_sim:
                    fname = '%s/summary_%s_type_code_switches_%s.pdf' % (self.results_dir, summary_sim,
                                                                         'test')
                    # also save type_test_es and type_test_en
                    with open("%s/simulation.info" % self.results_dir, 'a') as f:  # Append information
                        f.write("\nType code-switch ES (test set): %s\nType code-switch EN (test set): %s\n"
                                "All CS labels:%s" % (type_test_es, type_test_en, all_cs_types))

                else:
                    fname = '%s/type_code_switches_%s.pdf' % (self.results_dir, 'test')
                plt.savefig(fname)
                plt.close()
            # !------------ same for percentage of correct sentences ------------!
            # make sure there is still something to be plotted after the manipulations
            if self.is_not_empty(type_test_correct_es) or self.is_not_empty(type_test_correct_en):
                ind = numpy_arange_len(all_cs_types)  # the x locations for the groups
                width = 0.35  # the width of the bars

                fig, ax = plt.subplots()
                rects_en = ax.bar(ind, [x[0] for x in type_test_correct_en], width, color='r',
                                  yerr=[x[1] for x in type_test_correct_en])
                rects_es = ax.bar(ind + width, [x[0] for x in type_test_correct_es], width, color='y',
                                  yerr=[x[1] for x in type_test_correct_es])

                # add some text for labels, title and axes ticks
                label = 'CS types (%% of correctly produced %s sentences)' % 'test'
                ax.set_ylabel(label)
                ax.set_ylim(bottom=0)
                if title:
                    ax.set_title(title)
                ax.set_xticks(ind + width / 2)
                ax.legend((rects_en[0], rects_es[0]), ('EN', 'ES'))
                ax.set_xticklabels(all_cs_types, rotation=55)  # rotate labels to fit better
                plt.tight_layout()  # make room for labels

                if summary_sim:
                    fname = '%s/summary_%s_correct_type_code_switches_%s.pdf' % (self.results_dir, summary_sim,
                                                                                 'test')
                    # also save type_test_es and type_test_en
                    with open("%s/simulation.info" % self.results_dir, 'a') as f:  # Append information
                        f.write("\nType code-switch ES (test set): %s\nType code-switch EN (test set): %s\n"
                                "All CS labels:%s" % (type_test_es, type_test_en, all_cs_types))

                else:
                    fname = '%s/correct_type_code_switches_%s.pdf' % (self.results_dir, 'test')
                plt.savefig(fname)
                plt.close()

            # NOW THE SAME FOR THE COG EXPERIMENT
            if cognate_experiment:
                for dataset_type in ['test']:  # ['training', 'test']:
                    type_test_enes = []
                    type_test_COG = []
                    type_test_FF = []
                    inlcude_ff = False
                    for cs_type in all_cs_types:  # cs types calculated above
                        cog_type = "%s-COG" % cs_type
                        if cog_type in results['type_code_switches'][dataset_type]:
                            # take the percentage of sum in test set
                            values_percentage_testset = [percentage(x, num_test)
                                                         for x in results['type_code_switches'][dataset_type][cog_type]]
                            type_test_COG.append(get_numpy_mean_and_std(values_percentage_testset))
                        else:
                            type_test_COG.append((0, 0))
                        # same for FF
                        ff_type = "%s-FF" % cs_type
                        if ff_type in results['type_code_switches'][dataset_type]:
                            # take the percentage of sum in test set
                            values_percentage_testset = [percentage(x, num_test)
                                                         for x in results['type_code_switches'][dataset_type][ff_type]]
                            type_test_FF.append(get_numpy_mean_and_std(values_percentage_testset))
                            inlcude_ff = True
                        else:
                            type_test_FF.append((0, 0))
                        # same for non cognates-false friends
                        if cs_type in results['type_code_switches'][dataset_type]:
                            # take the percentage of sum in test set
                            values_percentage_testset = [percentage(x, num_test)
                                                         for x in results['type_code_switches'][dataset_type][cs_type]]
                            type_test_enes.append(get_numpy_mean_and_std(values_percentage_testset))
                        else:
                            type_test_enes.append((0, 0))

                # make sure there is still something to be plotted after the manipulations
                if type_test_enes or type_test_FF or type_test_COG:
                    ind = numpy_arange_len(all_cs_types)  # the x locations for the groups
                    width = 0.3  # the width of the bars

                    fig, ax = plt.subplots()
                    rects = ax.bar(ind, [x[0] for x in type_test_enes], width, color='yellowgreen',
                                   yerr=[x[1] for x in type_test_enes])
                    rects_COG = ax.bar(ind + width, [x[0] for x in type_test_COG], width, color='g',
                                       yerr=[x[1] for x in type_test_COG])
                    if inlcude_ff:
                        rects_FF = ax.bar(ind + width * 2, [x[0] for x in type_test_FF], width, color='greenyellow',
                                          yerr=[x[1] for x in type_test_FF])

                    # add some text for labels, title and axes ticks
                    label = 'Types of code-switches (%% of %s set)' % dataset_type
                    ax.set_ylabel(label)
                    # ax.set_title('Early bilingual group')
                    if inlcude_ff:
                        ax.set_xticks(ind + (width * 2) / 2)
                        ax.legend((rects[0], rects_COG[0], rects_FF[0]), ('ESEN', 'COG', 'FF'))
                        file_name = "type_code_switches_COG_FF"
                    else:
                        ax.set_xticks(ind + (width) / 2)
                        ax.legend((rects[0], rects_COG[0]), ('ESEN', 'COG'))
                        file_name = "type_code_switches_COG"
                    ax.set_ylim(bottom=0)
                    ax.set_xticklabels(all_cs_types, rotation=55)  # rotate labels to fit better
                    plt.tight_layout()  # make room for labels

                    if summary_sim:
                        fname = '%s/summary_%s_%s_%s.pdf' % (self.results_dir, summary_sim, file_name, dataset_type)
                        # also save type_test_es and type_test_en
                        with open("%s/simulation.info" % self.results_dir, 'a') as f:  # Append information
                            f.write("\nType code-switch non-cognates (test set): %s\nType code-switch FF (test set): %s"
                                    "\nType code-switch COG (test set): %s" %
                                    (type_test_enes, type_test_FF, type_test_COG))

                    else:
                        fname = '%s/%s_%s.pdf' % (self.results_dir, file_name, dataset_type)
                    plt.savefig(fname)
                    plt.close()

        # !------------ Pronoun errors - only plot if there's something to be plotted ------------!
        if isinstance(results['pronoun_errors']['test'], list) and (sum(results['pronoun_errors_flex']['test']) or
                                                                    sum(results['pronoun_errors']['test'])):
            plt.plot(epochs, results['pronoun_errors']['test'], label='Subject pronoun errors')
            plt.plot(epochs, results['pronoun_errors_flex']['test'], linestyle='--')
            plt.xlim(min(epochs), max(epochs))
            plt.xlabel('Epochs')
            plt.ylabel('Sum of subject pronoun errors')
            if summary_sim:
                fname = '%s/summary_%s_pronoun_errors.pdf' % (self.results_dir, summary_sim)
            else:
                fname = '%s/pronoun_errors.pdf' % self.results_dir
            plt.savefig(fname)
            plt.close()

            # same using percentages
            if test_sentences_with_pronoun:  # in ES case there are no sentences with 'he' and 'she'
                percentage_pronoun_errors = [percentage(x, test_sentences_with_pronoun)
                                             for x in results['pronoun_errors']['test']]
                percentage_pronoun_errors_flex = [percentage(x, test_sentences_with_pronoun)
                                                  for x in results['pronoun_errors_flex']['test']]
            else:
                percentage_pronoun_errors = results['pronoun_errors']['test']
                percentage_pronoun_errors_flex = results['pronoun_errors_flex']['test']
            plt.plot(epochs, percentage_pronoun_errors)
            plt.plot(epochs, percentage_pronoun_errors_flex, linestyle='--')
            plt.xlim(min(epochs), max(epochs))
            plt.xlabel('Epochs')
            plt.ylabel('Percentage (%) of subject pronoun errors in test set')
            plt.ylim([0, 15])
            if summary_sim:
                fname = '%s/summary_%s_pronoun_errors_percentage.pdf' % (self.results_dir, summary_sim)
            else:
                fname = '%s/pronoun_errors_percentage.pdf' % self.results_dir
            plt.savefig(fname)
            plt.close()

        if not summary_sim and results['mse']:  # no need to plot an average of all the simulations
            mse_list = [get_numpy_mean_and_std(results['mse'][epoch])[0] for epoch in epochs]
            plt.plot(epochs, mse_list, color='darkslateblue', label='MSE')
            plt.xlabel('Epochs')
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
        fname = '%s/%s_connection_weights.pdf' % (self.results_dir, layer_name)
        plt.savefig(fname)
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
        # fig2 = plt.figure(figsize=(9, 8.2))  # (width, height)
        # cax = fig2.add_axes([1.5, 0.8, 1.95, 0.85])  # [r l w h]
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

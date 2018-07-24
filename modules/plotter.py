from elman_network import np  # or import it from numpy directly?
import matplotlib
import re

matplotlib.use('Agg')  # needed for the server only
import matplotlib.pyplot as plt


class Plotter:
    def __init__(self, results_dir):
        self.results_dir = results_dir

    def plot_results(self, results, title, num_train, num_test, test_sentences_with_pronoun, summary_sim=None):
        correct_training_sentences = results['correct_sentences']['training']
        correct_test_sentences = results['correct_sentences']['test']
        correct_test_pos = results['correct_pos']['test']
        epochs = range(len(correct_training_sentences))
        plt.plot(epochs, [percentage(x, num_train) for x in correct_training_sentences], linestyle='--',
                 color='olivedrab', label='training')
        plt.plot(epochs, [percentage(x, num_train) for x in results['correct_pos']['training']], linestyle='--',
                 color='yellowgreen', label='training POS')
        # now add test sentences
        plt.plot(epochs, [percentage(x, num_test) for x in correct_test_sentences],
                 color='darkslateblue', label='test')
        plt.plot(epochs, [percentage(x, num_test) for x in correct_test_pos],
                 color='deepskyblue', label='test POS')
        if 'test-std' in results['correct_sentences']:
            correct_test_std = results['correct_sentences']['test-std']
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

        if not summary_sim and results['mse']:  # no need to plot an average of all the simulations
            mse_list = [np.mean(results['mse'][epoch], axis=0) for epoch in epochs]
            plt.plot(epochs, mse_list, color='darkslateblue', label='MSE')
            plt.xlabel('Epochs')
            plt.ylabel('Mean Square Error')
            plt.ylim([0, 0.007])
            plt.savefig('%s/all_mse_err.pdf' % self.results_dir)
            plt.close()

        ################### CODE-SWITCHES ###################
        correct_code_switches = results['correct_code_switches']['test']
        if sum(correct_code_switches) > 0:
            code_switches = results['code_switches']['test']
            plt.plot(epochs, [percentage(x, num_test) for x in code_switches], color='olivedrab',
                     label="All CS")
            plt.plot(epochs, [percentage(x, num_train) for x in results['code_switches']['training']], linestyle='--',
                     color='yellowgreen', label="All CS (training)")
            plt.plot(epochs, [percentage(x, num_test) for x in correct_code_switches],
                     color='darkslateblue', label="Code-switches")
            plt.plot(epochs, [percentage(x, num_train) for x in results['correct_code_switches']['training']],
                     linestyle='--', color='deepskyblue', label="Code-switches (training)")
            if 'test-std' in results['correct_code_switches']:
                correct_code_switches_std = results['correct_code_switches']['test-std']
                lower_bound = [percentage(x, num_test) for x in correct_code_switches - correct_code_switches_std]
                upper_bound = [percentage(x, num_test) for x in correct_code_switches + correct_code_switches_std]
                plt.fill_between(epochs, lower_bound, upper_bound, facecolor='darkslateblue', alpha=0.1)
                code_switches_std = results['code_switches']['test-std']
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

            # same as above but plot PERCENTAGE among correctly produced sentences only
            plt.plot(epochs, [percentage(value, correct_test_sentences[i])
                              for i, value in enumerate(results['correct_code_switches']['test'])],
                     color='darkslateblue', label="Test set")
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

            # PLOT ONLY NOUNS AND ALTERNATIONAL CS
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

            # plot each code-switch type individually

            # first get all keywords (all CS types)
            all_cs_types = set([re.sub("es-|en-|-COG|-FF|-ENES", "", x)
                                for x in type_code_switches_test.keys()
                                if '-COG' not in x and '-FF' not in x] +
                               [re.sub("es-|en-|-COG|-FF|-ENES", "", x)
                                for x in results['type_code_switches']['training'].keys()
                                if '-COG' not in x and '-FF' not in x])

            for dataset_type in ['training', 'test']:
                type_test_EN = []
                type_test_ES = []
                type_test_correct_EN = []
                type_test_correct_ES = []
                for cs_type in all_cs_types:
                    es_type = "es-%s" % cs_type
                    if es_type in results['type_code_switches'][dataset_type]:
                        cs_result = results['type_code_switches'][dataset_type][es_type]
                        values_percentage_testset = [percentage(x, num_test)
                                                     for x in cs_result]
                        values_percentage_correct_testset = [percentage(x, results['correct_sentences'][dataset_type][i])
                                                             for i, x in enumerate(cs_result)]

                        type_test_ES.append((np.mean(values_percentage_testset),
                                             np.std(values_percentage_testset)))
                        type_test_correct_ES.append((np.mean(values_percentage_correct_testset),
                                                     np.std(values_percentage_correct_testset)))
                    else:
                        type_test_ES.append((0, 0))
                        type_test_correct_ES.append((0, 0))

                    # same for EN
                    en_type = "en-%s" % cs_type
                    if en_type in results['type_code_switches'][dataset_type]:
                        # take the percentage of sum in test set
                        cs_result = results['type_code_switches'][dataset_type][en_type]
                        values_percentage_testset = [percentage(x, num_test)
                                                     for x in cs_result]
                        values_percentage_correct_testset = [percentage(x, correct_test_sentences[i])
                                                             for i, x in enumerate(cs_result)]
                        type_test_EN.append((np.mean(values_percentage_testset),
                                             np.std(values_percentage_testset)))
                        type_test_correct_EN.append((np.mean(values_percentage_correct_testset),
                                                     np.std(values_percentage_correct_testset)))
                    else:
                        type_test_EN.append((0, 0))
                        type_test_correct_EN.append((0, 0))

            # make sure there is still something to be plotted after the manipulations
            if type_test_ES or type_test_EN:
                ind = np.arange(len(all_cs_types))  # the x locations for the groups
                width = 0.35  # the width of the bars

                fig, ax = plt.subplots()
                rects_EN = ax.bar(ind, [x[0] for x in type_test_EN], width, color='r',
                                  yerr=[x[1] for x in type_test_EN])
                rects_ES = ax.bar(ind + width, [x[0] for x in type_test_ES], width, color='y',
                                  yerr=[x[1] for x in type_test_ES])

                # add some text for labels, title and axes ticks
                label = 'Types of code-switches (%% of %s set)' % dataset_type
                ax.set_ylabel(label)
                if title:
                    ax.set_title(title)
                ax.set_xticks(ind + width / 2)
                ax.set_ylim(bottom=0)
                ax.legend((rects_EN[0], rects_ES[0]), ('EN', 'ES'))
                ax.set_xticklabels(all_cs_types, rotation=55)  # rotate labels to fit better
                plt.tight_layout()  # make room for labels

                if summary_sim:
                    fname = '%s/summary_%s_type_code_switches_%s.pdf' % (self.results_dir, summary_sim,
                                                                         dataset_type)
                    # also save type_test_ES and type_test_EN
                    with open("%s/simulation.info" % self.results_dir, 'a') as f:  # Append information
                        f.write("\nType code-switch ES (test set): %s\nType code-switch EN (test set): %s\n"
                                "All CS labels:%s" % (type_test_ES, type_test_EN, all_cs_types))

                else:
                    fname = '%s/type_code_switches_%s.pdf' % (self.results_dir, dataset_type)
                plt.savefig(fname)
                plt.close()

            # same for percentage of correct sentences
            # make sure there is still something to be plotted after the manipulations
            if is_not_empty(type_test_correct_ES) or is_not_empty(type_test_correct_EN):
                ind = np.arange(len(all_cs_types))  # the x locations for the groups
                width = 0.35  # the width of the bars

                fig, ax = plt.subplots()
                rects_EN = ax.bar(ind, [x[0] for x in type_test_correct_EN], width, color='r',
                                  yerr=[x[1] for x in type_test_correct_EN])
                rects_ES = ax.bar(ind + width, [x[0] for x in type_test_correct_ES], width, color='y',
                                  yerr=[x[1] for x in type_test_correct_ES])

                # add some text for labels, title and axes ticks
                label = 'CS types (%% of correctly produced %s sentences)' % dataset_type
                ax.set_ylabel(label)
                ax.set_ylim(bottom=0)
                if title:
                    ax.set_title(title)
                ax.set_xticks(ind + width / 2)
                ax.legend((rects_EN[0], rects_ES[0]), ('EN', 'ES'))
                ax.set_xticklabels(all_cs_types, rotation=55)  # rotate labels to fit better
                plt.tight_layout()  # make room for labels

                if summary_sim:
                    fname = '%s/summary_%s_correct_type_code_switches_%s.pdf' % (self.results_dir, summary_sim,
                                                                                 dataset_type)
                    # also save type_test_ES and type_test_EN
                    with open("%s/simulation.info" % self.results_dir, 'a') as f:  # Append information
                        f.write("\nType code-switch ES (test set): %s\nType code-switch EN (test set): %s\n"
                                "All CS labels:%s" % (type_test_ES, type_test_EN, all_cs_types))

                else:
                    fname = '%s/correct_type_code_switches_%s.pdf' % (self.results_dir, dataset_type)
                plt.savefig(fname)
                plt.close()

            # NOW THE SAME FOR THE COG EXPERIMENT
            for dataset_type in ['test']:  # ['training', 'test']:
                type_test_ENES = []
                type_test_COG = []
                type_test_FF = []
                for cs_type in all_cs_types:  # cs types calculated above
                    """es_type = "es-%s" % cs_type
                    en_type = "en-%s" % cs_type
                    v = []
                    if es_type in results['type_code_switches'][dataset_type]:  # exclude first 2 epochs
                        v.append(results['type_code_switches'][dataset_type][es_type][2:])
                    if en_type in results['type_code_switches'][dataset_type]:  # exclude first 2 epochs
                        v.append(results['type_code_switches'][dataset_type][en_type][2:])

                    if v:
                        values_percentage_testset = [percentage(x, num_test)
                                                     for x in [sum(i) for i in zip(*v)]]
                        type_test.append((np.mean(values_percentage_testset),
                                          np.std(values_percentage_testset)))
                    else:
                        type_test.append((0, 0))"""

                    # same for COG
                    cog_type = "%s-COG" % cs_type
                    if cog_type in results['type_code_switches'][dataset_type]:
                        # take the percentage of sum in test set
                        values_percentage_testset = [percentage(x, num_test)
                                                     for x in results['type_code_switches'][dataset_type][cog_type]]
                        type_test_COG.append((np.mean(values_percentage_testset),
                                              np.std(values_percentage_testset)))
                    else:
                        type_test_COG.append((0, 0))
                    # same for FF
                    ff_type = "%s-FF" % cs_type
                    if ff_type in results['type_code_switches'][dataset_type]:
                        # take the percentage of sum in test set
                        values_percentage_testset = [percentage(x, num_test)
                                                     for x in results['type_code_switches'][dataset_type][ff_type]]
                        type_test_FF.append((np.mean(values_percentage_testset),
                                             np.std(values_percentage_testset)))
                    else:
                        type_test_FF.append((0, 0))
                    # same for non cognates-false friends
                    if cs_type in results['type_code_switches'][dataset_type]:
                        # take the percentage of sum in test set
                        values_percentage_testset = [percentage(x, num_test)
                                                     for x in results['type_code_switches'][dataset_type][cs_type]]
                        type_test_ENES.append((np.mean(values_percentage_testset),
                                               np.std(values_percentage_testset)))
                    else:
                        type_test_ENES.append((0, 0))

            # make sure there is still something to be plotted after the manipulations
            if type_test_ENES or type_test_FF or type_test_COG:
                ind = np.arange(len(all_cs_types))  # the x locations for the groups
                width = 0.3  # the width of the bars

                fig, ax = plt.subplots()
                rects = ax.bar(ind, [x[0] for x in type_test_ENES], width, color='yellowgreen',
                               yerr=[x[1] for x in type_test_ENES])
                rects_COG = ax.bar(ind + width, [x[0] for x in type_test_COG], width, color='g',
                                  yerr=[x[1] for x in type_test_COG])
                rects_FF = ax.bar(ind + width * 2, [x[0] for x in type_test_FF], width, color='greenyellow',
                                  yerr=[x[1] for x in type_test_FF])

                # add some text for labels, title and axes ticks
                label = 'Types of code-switches (%% of %s set)' % dataset_type
                ax.set_ylabel(label)
                # ax.set_title('Early bilingual group')
                #ax.set_xticks(ind + (width * 2) / 2)
                ax.set_xticks(ind + (width) / 2)
                #ax.legend((rects[0], rects_COG[0], rects_FF[0]), ('ESEN', 'COG', 'FF'))
                ax.legend((rects[0], rects_COG[0]), ('ESEN', 'COG'))
                ax.set_ylim(bottom=0)
                ax.set_xticklabels(all_cs_types, rotation=55)  # rotate labels to fit better
                plt.tight_layout()  # make room for labels

                if summary_sim:
                    fname = '%s/summary_%s_type_code_switches_COG_FF_%s.pdf' % (self.results_dir, summary_sim,
                                                                                dataset_type)
                    # also save type_test_ES and type_test_EN
                    with open("%s/simulation.info" % self.results_dir, 'a') as f:  # Append information
                        f.write("\nType code-switch non-cognates (test set): %s\nType code-switch FF (test set): %s"
                                "\nType code-switch COG (test set): %s" %
                                (type_test_ENES, type_test_FF, type_test_COG))

                else:
                    fname = '%s/type_code_switches_COG_FF_%s.pdf' % (self.results_dir, dataset_type)
                plt.savefig(fname)
                plt.close()

        # Pronoun errors - only plot if there's something to be plotted!
        if sum(results['pronoun_errors_flex']['test']) > 0 or sum(results['pronoun_errors']['test']) > 0:
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
                percentage_pronoun_errors = [np.true_divide(x * 100, test_sentences_with_pronoun)
                                             for x in results['pronoun_errors']['test']]
                percentage_pronoun_errors_flex = [np.true_divide(x * 100, test_sentences_with_pronoun)
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

    def plot_layer_stats(self, labels, means, std):
        layers = np.arange(len(labels))
        fig, ax = plt.subplots()
        ax.bar(layers, means, color='r', yerr=std)
        ax.set_xticklabels(labels)
        plt.savefig('%s/weights/summary_weights.pdf' % self.results_dir)
        plt.close()

    def plot_connection_weights(self, incoming_weights, incoming_labels, layer_labels, layer_name):
        """
        :return: plots incoming connection weights of a layer
        """
        fig, ax1 = plt.subplots(1, 1)
        data = np.random.randint(0, 100, size=(10, 10))
        ax1.imshow(incoming_weights, cmap='jet', interpolation='nearest')
        ax1.set_xticklabels(layer_labels)
        ax1.set_yticklabels(incoming_labels)
        #plt.imshow(incoming_weights)
        #plt.colorbar(orientation='vertical', interpolation='nearest')
        ax1.grid(True)
        fname = '%s/%s_connection_weights.pdf' % (self.results_dir, layer_name)
        plt.savefig(fname)
        plt.close()


def is_not_empty(x):
    if x and sum([pair[0]+pair[1] for pair in x]):
        return True
    return False


def percentage(x, total):
    if total == 0:
        return float('NaN')
    return np.true_divide(x * 100, total)


def plot_layers(srn, fig, plot_weights=False):
    """
    Not used (plotting slows down the simulations), will refactor later
    :param plot_weights: by default it only plots activations. Set to True if you want the weights as well.
    """
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


def create_plot_for_poster(epochs=range(30)):
    cs_early = [0.0, 4.246666666666667, 13.533333333333333, 14.386666666666668, 14.84, 16.106666666666666,
                17.646666666666668, 18.226666666666667, 19.260000000000002, 19.32, 19.68, 19.573333333333331,
                19.780000000000001, 19.813333333333333, 19.84, 20.199999999999999, 20.306666666666668,
                20.379999999999999, 20.666666666666664, 20.453333333333333, 20.826666666666668, 20.953333333333333,
                21.193333333333332, 21.313333333333333, 21.453333333333333, 21.393333333333331, 21.553333333333331,
                21.366666666666664, 21.886666666666667, 21.706666666666667]
    cs_late = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.3133333333333332,
               1.2666666666666666, 1.3400000000000001, 1.52, 1.6399999999999997, 1.7, 1.6000000000000001,
               1.6533333333333335, 1.8533333333333335, 1.8066666666666666, 2.1733333333333333, 2.2066666666666666,
               2.1933333333333334, 2.3066666666666666]

    plt.plot(epochs, cs_early, color='olivedrab', linewidth=2,
             label="Early bilinguals")
    plt.plot(epochs, cs_late, linewidth=2,
             color='darkslateblue', label="Late bilinguals")
    plt.xlabel('Epochs')
    plt.ylabel('Percentage of code-switches')
    plt.ylim([0, 25])
    plt.xlim(0, max(epochs))
    plt.legend(loc='upper right', ncol=2, fancybox=True, shadow=True)
    fname = 'code_switches_percentage.pdf'
    plt.savefig(fname)
    plt.close()

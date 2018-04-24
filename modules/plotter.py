from elman_network import np  # or import it from numpy directly?
import matplotlib
import re

matplotlib.use('Agg')  # needed for the server only
import matplotlib.pyplot as plt


class Plotter:
    def __init__(self, results_dir):
        self.results_dir = results_dir

    def plot_results(self, results, title, num_train, num_test, test_sentences_with_pronoun, summary_sim=None):
        epochs = range(len(results['correct_sentences']['training']))
        plt.plot(epochs, [percentage(x, num_train) for x in results['correct_sentences']['training']], linestyle='--',
                 color='olivedrab', label='training')
        plt.plot(epochs, [percentage(x, num_train) for x in results['correct_pos']['training']], linestyle='--',
                 color='yellowgreen', label='training POS')
        # now add test sentences
        plt.plot(epochs, [percentage(x, num_test) for x in results['correct_sentences']['test']],
                 color='darkslateblue', label='test')
        plt.plot(epochs, [percentage(x, num_test) for x in results['correct_pos']['test']],
                 color='deepskyblue', label='test POS')
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

        if sum(results['code_switches']['test']) > 0:
            plt.plot(epochs, [percentage(x, num_test) for x in results['code_switches']['test']], color='olivedrab',
                     label="All CS")
            plt.plot(epochs, [percentage(x, num_train) for x in results['code_switches']['training']], linestyle='--',
                     color='yellowgreen', label="All CS (training)")
            plt.plot(epochs, [percentage(x, num_test) for x in results['correct_code_switches']['test']],
                     color='darkslateblue', label="Code-switches")
            plt.plot(epochs, [percentage(x, num_train) for x in results['correct_code_switches']['training']],
                     linestyle='--', color='deepskyblue', label="Code-switches (training)")
            plt.xlabel('Epochs')
            plt.ylabel('Percentage of code-switches')
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

            # plot each code-switch type individually

            # first get all keywords (all CS types)
            all_cs_types = set([re.sub("ES-|EN-|-COG|-FF|-ENES", "", x)
                                for x in results['type_code_switches']['test'].keys()
                                if '-COG' not in x and '-FF' not in x] +
                               [re.sub("ES-|EN-|-COG|-FF|-ENES", "", x)
                                for x in results['type_code_switches']['training'].keys()
                                if '-COG' not in x and '-FF' not in x])

            for dataset_type in ['training', 'test']:
                type_test_EN = []
                type_test_ES = []
                for cs_type in all_cs_types:
                    es_type = "ES-%s" % cs_type
                    if es_type in results['type_code_switches'][dataset_type]:  # exclude first 2 epochs
                        values_percentage_testset = [percentage(x, num_test)
                                                     for x in results['type_code_switches'][dataset_type][es_type][2:]]
                        type_test_ES.append((np.mean(values_percentage_testset),
                                             np.std(values_percentage_testset)))
                    else:
                        type_test_ES.append((0, 0))

                    # same for EN
                    en_type = "EN-%s" % cs_type
                    if en_type in results['type_code_switches'][dataset_type]:  # exclude first 2 epochs
                        # take the percentage of sum in test set
                        values_percentage_testset = [percentage(x, num_test)
                                                     for x in results['type_code_switches'][dataset_type][en_type][2:]]
                        type_test_EN.append((np.mean(values_percentage_testset),
                                             np.std(values_percentage_testset)))
                    else:
                        type_test_EN.append((0, 0))

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
                #ax.set_title('Early bilingual group')
                ax.set_xticks(ind + width / 2)
                ax.legend((rects_EN[0], rects_ES[0]), ('EN', 'ES'))
                ax.set_xticklabels(all_cs_types, rotation=55)  # rotate labels to fit better
                plt.tight_layout()  # make room for labels

            if summary_sim:
                fname = '%s/summary_%s_type_code_switches_%s.pdf' % (self.results_dir, summary_sim,
                                                                     dataset_type)
                # also save type_test_ES and type_test_EN
                with open("%s/simulation.info" % self.results_dir, 'a') as f:  # Append information
                    f.write("\nType code-switch ES (test set): %s\nType code-switch EN (test set): %s" %
                            (type_test_ES, type_test_EN))

            else:
                fname = '%s/type_code_switches_%s.pdf' % (self.results_dir, dataset_type)
            plt.savefig(fname)
            plt.close()

            # NOW THE SAME FOR THE COG EXPERIMENT
            for dataset_type in ['test']: #['training', 'test']:
                type_test_ENES = []
                type_test_COG = []
                type_test_FF = []
                for cs_type in all_cs_types:  # cs types calculated above
                    """es_type = "ES-%s" % cs_type
                    en_type = "EN-%s" % cs_type
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
                    if cog_type in results['type_code_switches'][dataset_type]:  # exclude first 2 epochs
                        # take the percentage of sum in test set
                        values_percentage_testset = [percentage(x, num_test)
                                                     for x in results['type_code_switches'][dataset_type][cog_type][2:]]
                        type_test_COG.append((np.mean(values_percentage_testset),
                                              np.std(values_percentage_testset)))
                    else:
                        type_test_COG.append((0, 0))
                    # same for FF
                    ff_type = "%s-FF" % cs_type
                    if ff_type in results['type_code_switches'][dataset_type]:  # exclude first 2 epochs
                        # take the percentage of sum in test set
                        values_percentage_testset = [percentage(x, num_test)
                                                     for x in results['type_code_switches'][dataset_type][ff_type][2:]]
                        type_test_FF.append((np.mean(values_percentage_testset),
                                             np.std(values_percentage_testset)))
                    else:
                        type_test_FF.append((0, 0))
                    # same for non cognates-false friends
                    ff_type = "%s-ENES" % cs_type
                    if ff_type in results['type_code_switches'][dataset_type]:  # exclude first 2 epochs
                        # take the percentage of sum in test set
                        values_percentage_testset = [percentage(x, num_test)
                                                     for x in results['type_code_switches'][dataset_type][ff_type][2:]]
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
                rects_COG = ax.bar(ind + width * 2, [x[0] for x in type_test_COG], width, color='g',
                                  yerr=[x[1] for x in type_test_COG])
                rects_FF = ax.bar(ind + width, [x[0] for x in type_test_FF], width, color='greenyellow',
                                  yerr=[x[1] for x in type_test_FF])

                # add some text for labels, title and axes ticks
                label = 'Types of code-switches (%% of %s set)' % dataset_type
                ax.set_ylabel(label)
                # ax.set_title('Early bilingual group')
                ax.set_xticks(ind + (width * 2) / 2)
                ax.legend((rects[0], rects_COG[0], rects_FF[0]), ('ESEN', 'COG', 'FF'))
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
            plt.plot(epochs[1:], results['pronoun_errors']['test'][1:], label='Subject pronoun errors')
            plt.plot(epochs[1:], results['pronoun_errors_flex']['test'][1:], linestyle='--')
            plt.xlim(min(epochs[1:]), max(epochs))
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
            plt.plot(epochs[1:], percentage_pronoun_errors[1:])
            plt.plot(epochs[1:], percentage_pronoun_errors_flex[1:], linestyle='--')
            plt.xlim(min(epochs[1:]), max(epochs))
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


def percentage(x, total):
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

from elman_network import np  # or import it from numpy directly?
import matplotlib

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
            # plt.plot(epochs, [percentage(x, num_test) for x in results['code_switches']['test']], color='olivedrab',
            #         label="All CS")
            # plt.plot(epochs, [percentage(x, num_train) for x in results['code_switches']['training']], linestyle='--',
            #         color='yellowgreen', label="All CS (training)")
            plt.plot(epochs, [percentage(x, num_test) for x in results['correct_code_switches']['test']],
                     color='darkslateblue', label="Test set")
            # plt.plot(epochs, [percentage(x, num_train) for x in results['correct_code_switches']['training']],
            #         linestyle='--', color='deepskyblue', label="Training set")
            plt.xlabel('Epochs')
            plt.ylabel('Percentage of code-switches')
            plt.ylim([0, 80])
            # plt.xlim(min(epochs), max(epochs))
            plt.legend(loc='upper right', ncol=2, fancybox=True, shadow=True)
            if summary_sim:
                fname = '%s/summary_%s_code_switches_percentage.pdf' % (self.results_dir, summary_sim)
            else:
                fname = '%s/code_switches_percentage.pdf' % self.results_dir
            plt.savefig(fname)
            plt.close()

        # only plot if there's something to be plotted!
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

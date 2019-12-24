from . import np, pd
import seaborn as sns
import matplotlib.pyplot as plt
from operator import truediv

sns.set(palette="colorblind")
sns.set_style("whitegrid")


class Plotter:
    def __init__(self, results_dir):
        self.results_dir = results_dir
        self.bar_width = 0.3
        self.rename_label = {'adj': 'adjective', 'aux': 'auxiliary', 'det': 'determiner',
                             'prep': 'preposition', 'pron': 'pronoun'}

    def plot_performance(self, df, num_sentences, ylim=100, legend_loc='upper center'):
        epoch_range = range(df['epoch'].min(), df['epoch'].max() + 1)
        for sim in range(1, df['network_num'].max() + 1):
            value = df[df['network_num'] == sim].is_grammatical * 100 / num_sentences
            plt.scatter(epoch_range, value, alpha=0.4, s=5, color='#0173b2')

            correct_sentences = df[df['network_num'] == sim].meaning
            value = df[df['network_num'] == sim].meaning * 100 / num_sentences
            plt.scatter(epoch_range, value, alpha=0.4, s=5, color='#de8f05')

            value = df[df['network_num'] == sim].code_switched * 100 / correct_sentences
            plt.scatter(epoch_range, value, alpha=0.4, s=5, color='#029E73')

        df_per_epoch = df.groupby(['epoch']).apply(lambda dft: pd.Series(
            {'meaning': self.percentage(dft.meaning.sum(), num_sentences, df.network_num.max()),
             'code_switched': self.percentage(dft.code_switched.sum(), dft.meaning.sum() / df.network_num.max(),
                                              df.network_num.max()),
             'is_grammatical': self.percentage(dft.is_grammatical.sum(), num_sentences, df.network_num.max()),
             }))
        plt.plot(epoch_range, df_per_epoch['is_grammatical'], label='grammaticality', color='#0173b2')
        plt.plot(epoch_range, df_per_epoch['meaning'], label='meaning', color='#de8f05')
        plt.plot(epoch_range, df_per_epoch['code_switched'], label='code-switches', color='#029E73')

        plt.xlabel('epochs')
        plt.ylim([0, ylim])
        plt.yticks(np.arange(0, ylim+1, step=10))
        plt.xlim(df.epoch.min(), df.epoch.max())  # only start from epoch 0 for "performance"
        plt.xticks(np.arange(df.epoch.min(), df.epoch.max()+1, step=5))
        plt.legend(loc=legend_loc, fancybox=True, ncol=3, shadow=True, bbox_to_anchor=(0.5, 1.1))
        plt.savefig(self.get_plot_path(df.network_num.max(), 'performance'))
        plt.close()

    def plot_code_switches(self, df, ylim=52, legend_loc='upper center'):
        epoch_range = range(df['epoch'].min(), df['epoch'].max() + 1)
        for sim in range(1, df['network_num'].max() + 1):
            correct_sentences = df[df['network_num'] == sim].meaning

            value = df[df['network_num'] == sim].alternational * 100 / correct_sentences
            plt.scatter(epoch_range, value, alpha=0.4, s=5, color='#0173b2')

            value = df[df['network_num'] == sim].insertional * 100 / correct_sentences
            plt.scatter(epoch_range, value, alpha=0.4, s=5, color='#de8f05')

            value = df[df['network_num'] == sim].intersentential * 100 / correct_sentences
            plt.scatter(epoch_range, value, alpha=0.4, s=5, color='#029E73')

        df_per_epoch = df.groupby(['epoch']).apply(lambda dft: pd.Series(
            {'alternational': self.percentage(dft.alternational.sum(), dft.meaning.sum() / df.network_num.max(),
                                              df.network_num.max()),
             'insertional': self.percentage(dft.insertional.sum(), dft.meaning.sum() / df.network_num.max(),
                                            df.network_num.max()),
             'intersentential': self.percentage(dft.intersentential.sum(), dft.meaning.sum() / df.network_num.max(),
                                                df.network_num.max())
             }))

        plt.plot(epoch_range, df_per_epoch['alternational'], label='alternational', color='#0173b2')
        plt.plot(epoch_range, df_per_epoch['insertional'], label='insertional', color='#de8f05')
        plt.plot(epoch_range, df_per_epoch['intersentential'], label='inter-sentential', color='#029E73')

        plt.xlabel('epochs')
        plt.ylabel('')
        plt.ylim([0, ylim])
        plt.yticks(np.arange(0, ylim, step=5))
        plt.xlim(df.epoch.min(), df.epoch.max())
        plt.legend(loc=legend_loc, fancybox=True, ncol=3, shadow=True, bbox_to_anchor=(0.5, 1.1))
        plt.savefig(self.get_plot_path(df.network_num.max(), 'code_switches'))
        plt.close()

    def barplot_code_switches(self, df, grouped):
        all_labels = grouped.pos_of_switch_point.unique().tolist()
        index_size = np.arange(len(all_labels))
        correct_sentences = []
        for switch_point in all_labels:
            correct_sentences.append(df[(df.epoch == 30)
                                        & df.meaning == 1].target_pos.str.contains(switch_point).sum() /
                                     df.network_num.max())

        for switch_type in ['insertional', 'alternational']:  # one plot per switch_type
            fig, ax = plt.subplots()
            rects = []
            for i, lang in enumerate(grouped.switch_from.unique().tolist()):
                v = []
                for switch_point in all_labels:
                    v.append(grouped[(grouped.switched_type == switch_type) &
                                     (grouped.pos_of_switch_point == switch_point) &
                                     (grouped.switch_from == lang)].code_switched.sum())
                v = list(map(truediv, v * 100, correct_sentences))
                rects.append(ax.bar(index_size + (self.bar_width * i), v, self.bar_width))

            ax.set_xticks(index_size + self.bar_width / len(all_labels))
            ax.set_ylim(bottom=0)
            ax.legend(['Switch into Spanish', 'Switch into English'], loc='upper left')
            ax.set_xticklabels([self.rename_label.get(x, x) for x in all_labels], rotation=55)  # rotate labels to fit
            plt.tight_layout()  # make room for labels
            plt.savefig(self.get_plot_path(df.network_num.max(), f'{switch_type}_barplot'))
            plt.close()

    @staticmethod
    def percentage(x, num_sentences, num_networks):
        if not num_sentences:
            return float('NaN')
        elif not (num_networks and x):
            return 0
        return (x * 100) / (num_sentences * num_networks)

    def get_plot_path(self, num_simulations, fname):
        return f"{self.results_dir}/{num_simulations}_{fname}.png"

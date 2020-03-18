from . import pd
from operator import truediv
import seaborn as sns
import matplotlib.pyplot as plt

sns.set(palette="colorblind")
sns.set_style("whitegrid")


class Plotter:
    def __init__(self, results_dir):
        self.results_dir = results_dir
        self.fname_suffix = ''
        self.bar_width = 0.3
        self.languages = ['en', 'es']
        self.rename_label = {'adj': 'adjective', 'aux': 'auxiliary', 'det': 'determiner',
                             'prep': 'preposition', 'pron': 'pronoun', 'adverb': 'pred. adjective'}

    def lineplot_code_switches(self, df, fname='code_switches_over_time', ylim=50, legend_loc='upper center'):
        sns.lineplot(x='epoch', y='alternational_percentage', data=df, ci=None, color='#0173b2',
                     label='alternational')
        sns.lineplot(x='epoch', y='insertional_percentage', data=df, ci=None, label='insertional', color='#de8f05')
        sns.lineplot(x='epoch', y='ambiguous_percentage', data=df, ci=None, label='ambiguous', color='#029E73')
        sns.lineplot(x='epoch', y='intersentential_percentage', data=df, ci=None, label='intersentential')

        sns.swarmplot(x='epoch', y='alternational_percentage', data=df, size=2, alpha=.4, color='#0173b2')
        sns.swarmplot(x='epoch', y='insertional_percentage', data=df, size=2, alpha=.4, color='#de8f05')
        sns.swarmplot(x='epoch', y='ambiguous_percentage', data=df, size=2, alpha=.4, color='#029E73')
        sns.swarmplot(x='epoch', y='intersentential_percentage', data=df, size=2, alpha=.4)

        plt.xlabel('epochs')
        plt.ylabel('')
        plt.ylim([0, ylim])
        plt.yticks(pd.np.arange(0, ylim + 1, step=10))

        xticks = pd.np.arange(df.epoch.min(), df.epoch.max() + 1, step=2)
        plt.xticks(xticks, xticks)

        plt.xlim([df.epoch.min(), df.epoch.max()])
        plt.legend(loc=legend_loc, fancybox=True, ncol=4, shadow=True, bbox_to_anchor=(0.5, 1.11))
        plt.tight_layout()  # make room for labels
        plt.savefig(self.get_plot_path((df.network_num.max() - df.network_num.min() + 1), fname))
        plt.close()

    def barplot_code_switches(self, df, grouped):
        all_labels = grouped.pos_of_switch_point.unique().tolist()
        index_size = pd.np.arange(len(all_labels))

        correct_sentences = []
        for switch_point in all_labels:
            correct_sentences.append(df[(df.epoch == df.epoch.max())
                                        & df.meaning == 1].produced_pos.str.contains(switch_point).sum() /
                                     df.network_num.max())

        for switch_type in ['insertional', 'alternational', 'ambiguous']:  # one plot per switch_type
            fig, ax = plt.subplots()
            rects = []
            annotate_labels = []
            for i, lang in enumerate(grouped.switch_from.unique().tolist()):
                val = []
                for switch_point in all_labels:
                    val.append(grouped[(grouped.switched_type == switch_type) &
                                       (grouped.pos_of_switch_point == switch_point) &
                                       (grouped.switch_from == lang)].code_switched.sum())
                rects.append(ax.bar(index_size + (self.bar_width * i),
                                    list(map(truediv, val * 100, correct_sentences)), self.bar_width))
                annotate_labels.extend(val)

            self.autolabels(ax, annotate_labels)

            ax.set_xticks(index_size + self.bar_width / len(all_labels))
            ax.set_ylim(bottom=0)
            ax.legend(['Switch into Spanish', 'Switch into English'], loc='upper left')
            ax.set_xticklabels([self.rename_label.get(x, x) for x in all_labels], rotation=55)  # rotate labels to fit

            plt.tight_layout()  # make room for labels
            plt.savefig(self.get_plot_path(df.network_num.max(), f'{switch_type}_barplot'))
            plt.close()

    def plot_code_switche_types_per_pos_for_all_models(self, models=('early', 'enes', 'esen'), l2_epoch=25, ylim=7):
        code_switch_types = ['insertional', 'alternational', 'ambiguous']
        labels = {'insertional': ['adj', 'aux', 'det', 'noun', 'participle', 'prep', 'verb'],
                  'alternational': ['adj', 'aux', 'det', 'noun', 'participle', 'prep', 'verb'],
                  'ambiguous': ['noun', 'participle', 'verb', 'adverb']}
        legend = {'early': 'Early', 'enes': 'L1 English', 'esen': 'L1 Spanish'}
        correct_sentences = {}
        code_switches = {}
        for m in models:
            df = pd.read_csv(f'{self.results_dir}/{m}{self.fname_suffix}/all_results.csv',
                             index_col=None, header=0, skipinitialspace=True, dtype={'epoch': int})
            epoch = l2_epoch if m == 'early' else df.epoch.max()
            df = df[(df.epoch == epoch) & (df.meaning == 1)]
            code_switches[m] = {}
            correct_sentences[m] = {}
            for switch_type in code_switch_types:
                correct_sentences[m][switch_type] = []
                for switch_point in labels[switch_type]:
                    pos = f"{switch_point} ." if switch_type == 'ambiguous' else switch_point
                    correct_sentences[m][switch_type].append(df.produced_pos.str.contains(pos).sum())

                code_switches[m][switch_type] = {}
                for lang in self.languages:
                    code_switches[m][switch_type][lang] = {}
                    for switch_point in labels[switch_type]:
                        code_switches[m][switch_type][lang][switch_point] = df[(df.switched_type == switch_type) &
                                                                               (df.pos_of_switch_point == switch_point)
                                                                               & (df.switch_from == lang)
                                                                               ].is_code_switched.sum()

        for switch_type in code_switch_types:  # one plot per switch_type and lang
            index_size = pd.np.arange(len(labels[switch_type]))
            bar_width = 0.15 if switch_type == 'ambiguous' else self.bar_width
            for lang in self.languages:
                fig, ax = plt.subplots()
                rects = []
                annotate_labels = []
                for idx, model in enumerate(models):
                    val = []
                    for switch_point in labels[switch_type]:
                        r = code_switches[model][switch_type][lang][switch_point]
                        val.append(truediv(r * 100, (correct_sentences[model][switch_type][
                            labels[switch_type].index(switch_point)])))
                        annotate_labels.append(r)
                    rects.append(ax.bar(index_size + (bar_width * idx), val, bar_width, align='center'))
                self.autolabels(ax, annotate_labels)

                ax.set_xticks(index_size + bar_width)
                ax.set_ylim(bottom=0, top=ylim)
                ax.legend([legend[model] for model in models], loc='upper center', fancybox=True, ncol=3,
                          shadow=True, bbox_to_anchor=(0.5, 1.12))
                ax.set_xticklabels([self.rename_label.get(x, x) for x in labels[switch_type]],
                                   rotation=(0 if switch_type == 'ambiguous' else 90))
                plt.tight_layout()  # make room for labels
                plt.savefig(self.get_plot_path(df.network_num.max(), f'{switch_type}_{lang}'))
                plt.close()

    @staticmethod
    def autolabels(ax, val):
        """Attach a text label above each bar in *rects*, displaying its height."""
        for rect, v in zip(ax.patches, val):
            height = rect.get_height()
            ax.annotate(v if v else None, xy=(rect.get_x() + rect.get_width() / 2, height), xytext=(0, 0),
                        size=9, textcoords="offset points", ha='center', va='bottom')

    def plot_code_switch_types_per_model(self, models=('early', 'enes', 'esen'), bar_width=0.25, l2_epoch=25):
        code_switch_types = ['alternational', 'insertional', 'ambiguous']
        legend = {'early': 'Early', 'enes': 'L1 English', 'esen': 'L1 Spanish'}
        correct_sentences = {}
        code_switches = {}
        for m in models:
            df = pd.read_csv(f'{self.results_dir}/{m}{self.fname_suffix}/all_results.csv',
                             index_col=None, header=0, skipinitialspace=True, dtype={'epoch': int})
            epoch = l2_epoch if m == 'early' else df.epoch.max()
            df = df[(df.epoch == epoch) & (df.meaning == 1)]
            code_switches[m] = {}
            correct_sentences[m] = {}
            for lang in self.languages:
                correct_sentences[m][lang] = df[df.switch_from == lang].meaning.sum()

            for switch_type in code_switch_types:
                code_switches[m][switch_type] = {}
                for lang in self.languages:
                    code_switches[m][switch_type][lang] = df[(df.switched_type == switch_type) &
                                                             (df.switch_from == lang)].is_code_switched.sum()
        index_size = pd.np.arange(len(code_switch_types))
        for lang in self.languages:
            annotate_labels = []
            fig, ax = plt.subplots()
            rects = []
            for idx, model in enumerate(models):
                val = []
                for switch_type in code_switch_types:
                    r = code_switches[model][switch_type][lang]
                    annotate_labels.append(r)
                    val.append(truediv(r * 100, correct_sentences[model][lang]))
                rects.append(ax.bar(index_size + (bar_width * idx), val, bar_width, align='center'))

            self.autolabels(ax, annotate_labels)
            ax.set_xticks(index_size + bar_width)
            ax.set_ylim(bottom=0, top=20)
            ax.legend([legend[model] for model in models], loc='upper center', fancybox=True, ncol=3,
                      shadow=True, bbox_to_anchor=(0.5, 1.12))
            ax.set_xticklabels(code_switch_types)

            plt.tight_layout()  # make room for labels
            plt.savefig(self.get_plot_path(df.network_num.max(), f'switch_types_{lang}'))
            plt.close()

    def l1_performance_all_models(self, models=('enes', 'esen', 'early')):
        for m in models:
            df = pd.read_csv(f'{self.results_dir}/{m}{self.fname_suffix}/performance_per_lang.csv',
                             index_col=None, header=0, skipinitialspace=True, dtype={'epoch': int})
            langs = [m[:2]] if m != 'early' else self.languages
            for l1_lang in langs:
                self.performance(df[df.switch_from == l1_lang], fname=f'l1_performance_{m}_{l1_lang}')

    def performance(self, df, fname='performance', ylim=100, legend_loc='upper center'):
        sns.lineplot(x='epoch', y='grammaticality_percentage', data=df, color='#0173b2', ci=None,
                     label='grammaticality')
        sns.lineplot(x='epoch', y='meaning_percentage', data=df, color='#de8f05', ci=None, label='meaning')
        sns.swarmplot(x='epoch', y='grammaticality_percentage', data=df, color='#0173b2', size=2, alpha=.5)
        sns.swarmplot(x='epoch', y='meaning_percentage', data=df, color='#de8f05', size=2, alpha=.5)
        if df.code_switched_percentage.sum() > 0:
            sns.lineplot(x='epoch', y='code_switched_percentage', data=df, color='#029E73', ci=None,
                         label='code-switching')
            sns.swarmplot(x='epoch', y='code_switched_percentage', data=df, color='#029E73', size=2, alpha=.5)

        plt.xlabel('epochs')
        plt.ylabel('')
        plt.ylim([0, ylim])
        plt.yticks(pd.np.arange(0, ylim + 1, step=10))

        xticks = pd.np.arange(df.epoch.min(), df.epoch.max() + 1, step=2)
        plt.xticks(xticks, xticks)

        plt.xlim([df.epoch.min(), df.epoch.max()])
        plt.legend(loc=legend_loc, fancybox=True, ncol=3, shadow=True, bbox_to_anchor=(0.5, 1.11))
        plt.tight_layout()  # make room for labels
        plt.savefig(self.get_plot_path((df.network_num.max() - df.network_num.min() + 1), fname))
        plt.close()

    def l2_performance_all_models(self, models=('enes', 'esen')):
        for m in models:
            df = pd.read_csv(f'{self.results_dir}/{m}{self.fname_suffix}/performance_per_lang.csv',
                             index_col=None, header=0, skipinitialspace=True, dtype={'epoch': int, 'l2_epoch': int})
            l2_lang = m[2:]
            self.l2_performance(df, l2_lang=l2_lang, fname=f'l2_performance_{m}_{l2_lang}')

    def l2_performance(self, df, l2_lang, fname, ylim=100):
        df = df[df.switch_from == l2_lang]
        df = df[df.epoch > df.l2_epoch]
        epoch_range = range(df.epoch.min(), df.epoch.max())

        ax = sns.swarmplot(x='epoch', y='grammaticality_percentage', data=df, color='#0173b2', size=2, alpha=.7)
        sns.swarmplot(x='epoch', y='meaning_percentage', data=df, color='#de8f05', size=2, alpha=.7)

        xaxis = ax.get_xticks()[1:]
        plt.plot(xaxis, [df[df.epoch == ep].grammaticality_percentage.mean() for ep in epoch_range],
                 label='grammaticality', color='#0173b2')
        plt.plot(xaxis, [df[df.epoch == ep].meaning_percentage.mean() for ep in epoch_range],
                 label='meaning', color='#de8f05')

        if df.code_switched_percentage.sum() > 0:
            sns.swarmplot(x='epoch', y='code_switched_percentage', data=df, color='#029E73', size=2, alpha=.7)
            plt.plot(xaxis, [df[df.epoch == ep].code_switched_percentage.mean() for ep in epoch_range],
                     label='code-switching', color='#029E73')

        plt.xlabel('epochs')
        plt.ylabel('')
        plt.ylim([0, ylim])
        plt.yticks(pd.np.arange(0, ylim + 1, step=10))
        plt.xlim([ax.get_xticks()[0], ax.get_xticks()[-1]])
        plt.legend(loc='upper center', fancybox=True, ncol=3, shadow=True, bbox_to_anchor=(0.5, 1.11))
        plt.tight_layout()  # make room for labels
        plt.savefig(self.get_plot_path((df.network_num.max() - df.network_num.min() + 1), fname))
        plt.close()

    def get_plot_path(self, num_simulations, fname):
        return f"{self.results_dir}/{num_simulations}_{fname}.png"

    def print_switches_per_model(self, models=('early', 'enes', 'esen'), l2_epoch=25, print_total=False,
                                 switch_type=('alternational', 'insertional', 'ambiguous')):
        lang_sum = {}
        for m in models:
            lang_sum[m] = {'en': [], 'es': []}
            df = pd.read_csv(f'{self.results_dir}/{m}{self.fname_suffix}/all_results.csv',
                             index_col=None, header=0, skipinitialspace=True, dtype={'epoch': int})
            print('----------------------\n', m)
            df = df[df.epoch == (l2_epoch if m == 'early' else df.epoch.max())]
            correct_sentences = df.meaning.sum()
            if print_total:
                sm = []
                for stype in switch_type:
                    print(stype, round(df[df.switched_type == stype].is_code_switched.sum() * 100 / correct_sentences, 1))
                    sm.append(round(df[df.switched_type == stype].is_code_switched.sum() * 100 / correct_sentences, 1))
                print('Total:', round(sum(sm), 1))

            for lang in self.languages:
                ll = df[df.switch_from == lang]
                print(lang, '->')
                for stype in switch_type:
                    percentage = round(ll[ll.switched_type == stype].is_code_switched.sum() * 100 / correct_sentences,
                                       1)
                    for pos in ll[ll.switched_type == stype].pos_of_switch_point.unique():
                        print(stype, pos,
                              ll[(ll.switched_type == stype) & (ll.pos_of_switch_point == pos)].is_code_switched.sum(),
                              round(ll[(ll.switched_type == stype) &
                                       (ll.pos_of_switch_point == pos)].is_code_switched.sum() * 100 /
                                    df[df.switch_from == lang].meaning.sum(), 1))
                    lang_sum[m][lang].append(percentage)
                    print(stype, percentage)

        print(lang_sum)
        for m in models:
            for lang in self.languages:
                print(m, lang, round(sum(lang_sum[m][lang]), 1))

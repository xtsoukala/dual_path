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
                             'prep': 'preposition', 'pron': 'pronoun', 'adv': 'adverb'}

    def plot_performance(self, df, num_sentences, ylim=100, legend_loc='upper center'):
        networks = range(df['network_num'].min(), df['network_num'].max() + 1)
        epoch_range = range(df['epoch'].min(), df['epoch'].max() + 1)
        for sim in networks:
            value = df[df['network_num'] == sim].is_grammatical * 100 / num_sentences  # [sim-1]
            plt.scatter(epoch_range, value, alpha=0.4, s=5, color='#0173b2')

            correct_sentences = df[df['network_num'] == sim].meaning
            value = df[df['network_num'] == sim].meaning * 100 / num_sentences  # [sim-1]
            plt.scatter(epoch_range, value, alpha=0.4, s=5, color='#de8f05')

            value = df[df['network_num'] == sim].code_switched * 100 / correct_sentences  # [sim-1]
            plt.scatter(epoch_range, value, alpha=0.4, s=5, color='#029E73')

        df_per_epoch = df.groupby(['epoch']).apply(lambda dft: pd.Series(
            {'meaning': self.percentage(dft.meaning.sum(), num_sentences, df.network_num.max()),
             'code_switched': self.percentage(dft.code_switched.sum(), dft.meaning.sum() / df.network_num.max(),
                                              df.network_num.max()),
             'is_grammatical': self.percentage(dft.is_grammatical.sum(), num_sentences, df.network_num.max()),
             }))
        plt.plot(epoch_range, df_per_epoch.is_grammatical, label='grammaticality', color='#0173b2')
        plt.plot(epoch_range, df_per_epoch['meaning'], label='meaning', color='#de8f05')
        plt.plot(epoch_range, df_per_epoch['code_switched'], label='code-switches', color='#029E73')

        plt.xlabel('epochs')
        plt.ylim([0, ylim])
        plt.yticks(np.arange(0, ylim + 1, step=10))

        plt.xlim(df.epoch.min(), df.epoch.max())
        plt.xticks(np.arange(df.epoch.min(), df.epoch.max() + 1, step=5))
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

            value = df[df['network_num'] == sim].ambiguous * 100 / correct_sentences
            plt.scatter(epoch_range, value, alpha=0.4, s=5, color='#029E73')

        df_per_epoch = df.groupby(['epoch']).apply(lambda dft: pd.Series(
            {'alternational': self.percentage(dft.alternational.sum(), dft.meaning.sum() / df.network_num.max(),
                                              df.network_num.max()),
             'insertional': self.percentage(dft.insertional.sum(), dft.meaning.sum() / df.network_num.max(),
                                            df.network_num.max()),
             'ambiguous': self.percentage(dft.ambiguous.sum(), dft.meaning.sum() / df.network_num.max(),
                                          df.network_num.max())
             }))

        plt.plot(epoch_range, df_per_epoch['alternational'], label='alternational', color='#0173b2')
        plt.plot(epoch_range, df_per_epoch['insertional'], label='insertional', color='#de8f05')
        plt.plot(epoch_range, df_per_epoch['ambiguous'], label='ambiguous', color='#029E73')

        plt.xlabel('epochs')
        plt.ylabel('')
        plt.ylim([0, ylim])
        plt.yticks(np.arange(0, ylim, step=5))
        plt.xlim(df.epoch.min() + 1, df.epoch.max())
        plt.legend(loc=legend_loc, fancybox=True, ncol=3, shadow=True, bbox_to_anchor=(0.5, 1.1))
        plt.savefig(self.get_plot_path(df.network_num.max(), 'code_switches'))
        plt.close()

    def barplot_code_switches(self, df, grouped):
        all_labels = grouped.pos_of_switch_point.unique().tolist()
        index_size = np.arange(len(all_labels))

        correct_sentences = []
        for switch_point in all_labels:
            correct_sentences.append(df[(df.epoch == df.epoch.max())
                                        & df.meaning == 1].target_pos.str.contains(switch_point).sum() /
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

    def plot_code_switches_per_model(self, models=('early', 'enes', 'esen')):
        code_switch_types = ['insertional', 'alternational', 'ambiguous']
        labels = {'insertional': ['adj', 'aux', 'det', 'noun', 'participle', 'prep', 'verb'],
                  'alternational': ['adj', 'aux', 'det', 'noun', 'participle', 'prep', 'verb'],
                  'ambiguous': ['noun', 'participle', 'verb', 'adverb']}
        legend = {'early': 'Early', 'enes': 'L1 English', 'esen': 'L1 Spanish'}
        languages = ['en', 'es']
        correct_sentences = {}
        code_switches = {}
        for m in models:
            df = pd.read_csv(f'{self.results_dir}/{m}_sim40_h80_cNone_fw10_e30/all_results.csv',
                             index_col=None, header=0, skipinitialspace=True, dtype={'epoch': int})
            # df.meaning = df.meaning.apply(lambda x: str2bool(x))
            df.is_code_switched = df.is_code_switched.apply(lambda x: str2bool(x))
            epoch = 15 if m == 'early' else 30
            df = df[(df.epoch == epoch) & (df.meaning == 1)]
            df['switch_from'] = df.message.str[-2:]
            code_switches[m] = {}
            correct_sentences[m] = {}
            for switch_type in code_switch_types:
                correct_sentences[m][switch_type] = []
                for switch_point in labels[switch_type]:
                    pos = f"{switch_point} ." if switch_type == 'ambiguous' else switch_point
                    correct_sentences[m][switch_type].append(df.target_pos.str.contains(pos).sum())

                code_switches[m][switch_type] = {}
                for lang in languages:
                    code_switches[m][switch_type][lang] = {}
                    for switch_point in labels[switch_type]:
                        code_switches[m][switch_type][lang][switch_point] = df[(df.switched_type == switch_type) &
                                                                               (df.pos_of_switch_point == switch_point)
                                                                               & (df.switch_from == lang)
                                                                               ].is_code_switched.sum()

        for switch_type in code_switch_types:  # one plot per switch_type and lang
            index_size = np.arange(len(labels[switch_type]))
            bar_width = 0.15 if switch_type == 'ambiguous' else 0.3
            for lang in languages:
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
                ax.set_ylim(bottom=0, top=7.6)
                ax.legend([legend[model] for model in models], loc='upper center', fancybox=True, ncol=3,
                          shadow=True, bbox_to_anchor=(0.5, 1.12 if switch_type == 'ambiguous' else 1.13))
                ax.set_xticklabels([self.rename_label.get(x, x) for x in labels[switch_type]], rotation=90)  # 270

                plt.tight_layout()  # make room for labels
                plt.savefig(self.get_plot_path(df.network_num.max(), f'{switch_type}_{lang}'))
                plt.close()

    @staticmethod
    def autolabels(ax, val):
        """Attach a text label above each bar in *rects*, displaying its height."""
        for rect, v in zip(ax.patches, val):
            height = rect.get_height()
            ax.annotate(v if v else None, xy=(rect.get_x() + rect.get_width() / 2, height - 0.1), xytext=(0, 0),
                        size=9, textcoords="offset points", ha='center', va='bottom')

    def plot_code_switch_types_per_model(self, models=('early', 'enes', 'esen'), bar_width=0.25):
        code_switch_types = ['alternational', 'insertional', 'ambiguous']
        legend = {'early': 'Early', 'enes': 'L1 English', 'esen': 'L1 Spanish'}
        languages = ['en', 'es']
        correct_sentences = {}
        code_switches = {}
        for m in models:
            df = pd.read_csv(f'{self.results_dir}/{m}_sim40_h80_cNone_fw10_e30/all_results.csv',
                             index_col=None, header=0, skipinitialspace=True, dtype={'epoch': int})
            df.is_code_switched = df.is_code_switched.apply(lambda x: str2bool(x))
            df['switch_from'] = df.message.str[-2:]
            epoch = 15 if m == 'early' else 30
            df = df[(df.epoch == epoch) & (df.meaning == 1)]
            code_switches[m] = {}
            correct_sentences[m] = {}
            for lang in languages:
                correct_sentences[m][lang] = df[df.switch_from == lang].meaning.sum()

            for switch_type in code_switch_types:
                code_switches[m][switch_type] = {}
                for lang in languages:
                    code_switches[m][switch_type][lang] = df[(df.switched_type == switch_type) &
                                                             (df.switch_from == lang)].is_code_switched.sum()
        index_size = np.arange(len(code_switch_types))
        for lang in languages:
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
            ax.set_ylim(bottom=0, top=14)
            ax.legend([legend[model] for model in models], loc='upper center', fancybox=True, ncol=3,
                      shadow=True, bbox_to_anchor=(0.5, 1.11))
            ax.set_xticklabels(code_switch_types)

            plt.tight_layout()  # make room for labels
            plt.savefig(self.get_plot_path(df.network_num.max(), f'switch_types_{lang}'))
            plt.close()

    def l1_performance(self, ylim=100, legend_loc='upper center', plot_cs=True):
        models = ['enes', 'esen', 'early']
        for m in models:
            df = pd.read_csv(f'{self.results_dir}/{m}_sim40_h80_cNone_fw10_e40/all_results.csv',
                             index_col=None, header=0, skipinitialspace=True, dtype={'epoch': int})
            langs = [m[:2]] if m != 'early' else ['en', 'es']
            for l1_lang in langs:
                df.is_code_switched = df.is_code_switched.apply(lambda x: str2bool(x))
                num_l1_sentences_per_network = df[df.switch_from == l1_lang].groupby(['network_num']).apply(
                    lambda dft: pd.Series({'num_l1': dft.target_pos.count() / dft.epoch.max()})).num_l1.to_list()
                num_l1_per_network = [np.around(x) for x in num_l1_sentences_per_network]
                num_l1_per_network.insert(0, 0)  # indexing of networks starts from 1, not 0

                l1 = df[df.switch_from == l1_lang]

                networks = range(l1['network_num'].min(), l1['network_num'].max() + 1)
                epoch_range = range(l1['epoch'].min(), l1['epoch'].max() + 1)

                res = {'meaning': [], 'grammaticality': [], 'code_switch': []}
                for sim in networks:
                    value = [(l1[(l1['network_num'] == sim) & (l1.epoch == ep)].is_grammatical.sum() * 100 /
                              num_l1_per_network[sim]) for ep in epoch_range]
                    res['grammaticality'].append(value)
                    #plt.scatter(epoch_range, value, alpha=0.4, s=5, color='#0173b2')
                    jitter(plt, epoch_range, value, alpha=0.4, s=5, color='#0173b2')

                    correct_sentences_per_epoch = [l1[(l1['network_num'] == sim) & (l1.epoch == ep) &
                                                      (l1.switched_type != 'inter-sentential')].meaning.sum()
                                                   for ep in epoch_range]
                    value = [(l1[(l1['network_num'] == sim) & (l1.epoch == ep) &
                                 (l1.switched_type != 'inter-sentential')].meaning.sum() * 100 /
                              num_l1_per_network[sim]) for ep in epoch_range]
                    res['meaning'].append(value)
                    #plt.scatter(epoch_range, value, alpha=0.4, s=5, color='#de8f05')
                    jitter(plt, epoch_range, value, alpha=0.4, s=5, color='#de8f05')

                    if plot_cs:
                        value = [divide(l1[(l1['network_num'] == sim) & (l1.epoch == ep) & (l1.meaning == 1) &
                                           (l1.switched_type != 'inter-sentential') &
                                           (l1.switched_type != 'False')].is_code_switched.sum(),
                                        correct_sentences_per_epoch[ep]) for ep in epoch_range]
                        res['code_switch'].append(value)
                        jitter(plt, epoch_range, value, alpha=0.4, s=5, color='#029E73')
                        """if np.nansum(value) > 0:
                            print("CS")
                            #plt.scatter(epoch_range, value, alpha=0.4, s=5, color='#029E73')
                            jitter(plt, epoch_range, value, alpha=0.4, s=5, color='#029E73')"""

                plt.plot(epoch_range, [np.nanmean(i) for i in zip(*res['grammaticality'])], label='grammaticality',
                         color='#0173b2')
                plt.plot(epoch_range, [np.nanmean(i) for i in zip(*res['meaning'])], label='meaning', color='#de8f05')
                if plot_cs:
                    cs = [np.nanmean(i) for i in zip(*res['code_switch'])]
                    if cs:
                        plt.plot(epoch_range, cs, label='code-switches', color='#029E73')
                plt.xlabel('epochs')
                plt.ylim([0, ylim])
                plt.yticks(np.arange(0, ylim + 1, step=10))
                plt.xlim(l1.epoch.min(), l1.epoch.max())
                plt.xticks(np.arange(l1.epoch.min(), l1.epoch.max() + 1, step=5))
                plt.legend(loc=legend_loc, fancybox=True, ncol=3, shadow=True, bbox_to_anchor=(0.5, 1.1))
                suffix = "_with_cs" if plot_cs else ""
                plt.savefig(self.get_plot_path(l1.network_num.max(), f'performance_l1_{l1_lang}_{m}{suffix}'))
                plt.close()

    def l1_performance_sns(self, ylim=100, legend_loc='upper center', plot_cs=True):
        models = ['enes']#, 'esen', 'early']
        for m in models:
            df = pd.read_csv(f'{self.results_dir}/{m}_sim40_h80_cNone_fw10_e40/all_results.csv',
                             index_col=None, header=0, skipinitialspace=True, dtype={'epoch': int})
            langs = [m[:2]] if m != 'early' else ['en', 'es']
            for l1_lang in langs:
                df.is_code_switched = df.is_code_switched.apply(lambda x: str2bool(x))
                num_l1_sentences_per_network = df[df.switch_from == l1_lang].groupby(['network_num']).apply(
                    lambda dft: pd.Series({'num_l1': dft.target_pos.count() / dft.epoch.max()})).num_l1.to_list()
                num_l1_per_network = [np.around(x) for x in num_l1_sentences_per_network]
                num_l1_per_network.insert(0, 0)  # indexing of networks starts from 1, not 0

                l1 = df[df.switch_from == l1_lang]
                networks = range(l1['network_num'].min(), l1['network_num'].max() + 1)
                epoch_range = range(l1['epoch'].min(), l1['epoch'].max() + 1)

                res = {'meaning': [], 'grammaticality': [], 'code_switch': []}
                for sim in networks:
                    value = [(l1[(l1['network_num'] == sim) & (l1.epoch == ep)].is_grammatical.sum() * 100 /
                              num_l1_per_network[sim]) for ep in epoch_range]
                    res['grammaticality'].append(value)
                    ddd = pd.DataFrame({'epochs': epoch_range, 'grammaticality': value})
                    #plt.scatter(epoch_range, value, alpha=0.4, s=5, color='#0173b2')
                    sns.swarmplot(x='epochs', y='grammaticality', data=ddd, color='#0173b2', size=2)
                    #jitter(plt, epoch_range, value, alpha=0.4, s=5, color='#0173b2')

                    correct_sentences_per_epoch = [l1[(l1['network_num'] == sim) & (l1.epoch == ep) &
                                                      (l1.switched_type != 'inter-sentential')].meaning.sum()
                                                   for ep in epoch_range]
                    value = [(l1[(l1['network_num'] == sim) & (l1.epoch == ep) &
                                 (l1.switched_type != 'inter-sentential')].meaning.sum() * 100 /
                              num_l1_per_network[sim]) for ep in epoch_range]
                    res['meaning'].append(value)
                    ddd['meaning'] = value
                    #plt.scatter(epoch_range, value, alpha=0.4, s=5, color='#de8f05')
                    #jitter(plt, epoch_range, value, alpha=0.4, s=5, color='#de8f05')
                    sns.swarmplot(x='epochs', y='meaning', data=ddd, color='#de8f05', size=2)

                    if plot_cs:
                        value = [divide(l1[(l1['network_num'] == sim) & (l1.epoch == ep) & (l1.meaning == 1) &
                                           (l1.switched_type != 'inter-sentential') &
                                           (l1.switched_type != 'False')].is_code_switched.sum(),
                                        correct_sentences_per_epoch[ep]) for ep in epoch_range]
                        res['code_switch'].append(value)
                        ddd['cs'] = value
                        sns.swarmplot(x='epochs', y='cs', data=ddd, color='#029E73', size=2)
                        #jitter(plt, epoch_range, value, alpha=0.4, s=5, color='#029E73')
                        #if np.nansum(value) > 0:
                        #    print("CS")
                            #plt.scatter(epoch_range, value, alpha=0.4, s=5, color='#029E73')
                            #jitter(plt, epoch_range, value, alpha=0.4, s=5, color='#029E73')
                            #sns.swarmplot(x=epoch_range, y=value, color='#029E73')

                plt.plot(epoch_range, [np.nanmean(i) for i in zip(*res['grammaticality'])], label='grammaticality',
                         color='#0173b2')
                plt.plot(epoch_range, [np.nanmean(i) for i in zip(*res['meaning'])], label='meaning', color='#de8f05')
                if plot_cs:
                    cs = [np.nanmean(i) for i in zip(*res['code_switch'])]
                    if cs:
                        plt.plot(epoch_range, cs, label='code-switches', color='#029E73')
                #sns_plot = sns.swarmplot(x='epoch', y='meaning', data=l1)
                #sns_plot = sns.swarmplot(x='epoch', y='is_grammatical', data=l1)
                #sns_plot.despine()
                #sns_plot.savefig("output")

                plt.xlabel('epochs')
                plt.ylim([0, ylim])
                plt.yticks(np.arange(0, ylim + 1, step=10))
                plt.xlim(l1.epoch.min(), l1.epoch.max())
                plt.xticks(np.arange(l1.epoch.min(), l1.epoch.max() + 1, step=5))
                plt.legend(loc=legend_loc, fancybox=True, ncol=3, shadow=True, bbox_to_anchor=(0.5, 1.1))
                suffix = "_with_cs" if plot_cs else ""
                plt.savefig(self.get_plot_path(l1.network_num.max(), f'performance_sns_l1_{l1_lang}_{m}{suffix}'))
                plt.close()

    def l2_performance(self, ylim=100, legend_loc='upper center', plot_cs=True):
        l2_epoch = {13: [2, 15, 25, 33],
                    14: [1, 10, 11, 16, 19, 21, 22, 26, 28, 29, 30, 34, 35, 36, 38, 39],
                    15: [3, 4, 6, 9, 13, 18, 24, 31, 40],
                    16: [5, 7, 8, 12, 14, 17, 20, 23, 27, 32, 37]}
        models = ['enes', 'esen']
        #epoch_range = range(0, 16)
        for m in models:
            # print(f'{self.results_dir}/{m}_sim40_h80_cNone_fw10_e30/all_results.csv')
            df = pd.read_csv(f'{self.results_dir}/{m}_sim40_h80_cNone_fw10_e30/all_results.csv',
                             index_col=None, header=0, skipinitialspace=True, dtype={'epoch': int})
            l2_lang = m[2:]
            df.is_code_switched = df.is_code_switched.apply(lambda x: str2bool(x))
            num_l2_sentences_per_network = df[df.switch_from == l2_lang].groupby(['network_num']).apply(
                lambda dft: pd.Series({'num_l2': dft.target_pos.count() / dft.epoch.max()})).num_l2.to_list()
            num_l2_per_network = [np.around(x) for x in num_l2_sentences_per_network]
            num_l2_per_network.insert(0, 0)  # because indexing starts from 0, not 1

            l2 = df[((df.epoch > 14) & (df.network_num.isin(l2_epoch[13]))) |
                    ((df.epoch > 15) & (df.network_num.isin(l2_epoch[14]))) |
                    ((df.epoch > 16) & (df.network_num.isin(l2_epoch[15]))) |
                    ((df.epoch > 17) & (df.network_num.isin(l2_epoch[16])))]
            l2 = l2[l2.switch_from == l2_lang]

            networks = range(l2['network_num'].min(), l2['network_num'].max() + 1)
            epoch_range = range(l2['epoch'].min(), l2['epoch'].max() + 1)
            res = {'meaning': [], 'grammaticality': [], 'code_switch': []}
            for sim in networks:
                epochs_sim = range(l2[l2['network_num'] == sim].epoch.min(),
                                   l2[l2['network_num'] == sim].epoch.max() + 1)
                value = [(l2[(l2['network_num'] == sim) & (l2.epoch == ep) &
                             (l2.switched_type != 'inter-sentential')].is_grammatical.sum() * 100 /
                          num_l2_per_network[sim]) for ep in epochs_sim]
                res['grammaticality'].append(value)
                plt.scatter(epochs_sim, value, alpha=0.4, s=5, color='#0173b2')

                correct_sentences_per_epoch = [l2[(l2['network_num'] == sim) & (l2.epoch == ep) &
                                                  (l2.switched_type != 'inter-sentential')].meaning.sum()
                                               for ep in epochs_sim]
                value = (correct_sentences_per_epoch / num_l2_per_network[sim]) * 100
                # print(correct_sentences_per_epoch, value)
                res['meaning'].append(value)
                plt.scatter(epochs_sim, value, alpha=0.4, s=5, color='#de8f05')

                if plot_cs:
                    # print("sim->", sim, correct_sentences_per_epoch)
                    """print(sim, 'cs->', [l2[(l2['network_num'] == sim) & (l2.epoch == ep) & (l2.meaning == 1) &
                                           (l2.switched_type != 'inter-sentential') & (l2.switched_type != 'False')
                                           ].is_code_switched.sum() for ep in epochs_sim])
                    print('correct sentences per epoch:', correct_sentences_per_epoch,
                          'out of:', num_l2_per_network[sim])"""
                    value = [divide(l2[(l2['network_num'] == sim) & (l2.epoch == ep) & (l2.meaning == 1) &
                                       (l2.switched_type != 'inter-sentential') &
                                       (l2.switched_type != 'False')].is_code_switched.sum(),
                                    correct_sentences_per_epoch[i]) for i, ep in enumerate(epochs_sim)]
                    res['code_switch'].append(value)
                    if np.nansum(value) > 0:
                        plt.scatter(epochs_sim, value, alpha=0.4, s=5, color='#029E73')

            plt.plot(epoch_range, list(reversed([np.nanmean(i) for i in self.reversed_zip(*res['grammaticality'])])),
                     label='grammaticality', color='#0173b2')
            plt.plot(epoch_range, list(reversed([np.nanmean(i) for i in self.reversed_zip(*res['meaning'])])),
                     label='meaning', color='#de8f05')
            if plot_cs and res['code_switch'] is not None:
                #print(res['code_switch'])
                cs = list(reversed([np.nanmean(i) for i in self.reversed_zip(*res['code_switch'])]))
                if cs:
                    plt.plot(epoch_range, cs, label='code-switches', color='#029E73')
            plt.xlabel('L2 epochs')
            plt.ylim([0, ylim])
            plt.yticks(np.arange(0, ylim + 1, step=10))
            plt.xlim(l2.epoch.min(), l2.epoch.max())  # only start from epoch 0 for "performance"
            plt.xticks(np.arange(l2.epoch.min(), l2.epoch.max() + 1, step=5), labels=np.arange(0, 16, step=5))
            #plt.set_xticklabels(np.arange(0, 16))
            plt.legend(loc=legend_loc, fancybox=True, ncol=3, shadow=True, bbox_to_anchor=(0.5, 1.1))
            suffix = "_with_cs" if plot_cs else ""
            plt.savefig(self.get_plot_path(l2.network_num.max(), f'performance_l2_{l2_lang}_{m}{suffix}'))
            plt.close()

    @staticmethod
    def reversed_zip(*l):
        i = max(len(l) for l in l)
        i, j, k = (1, i + 1, 1)

        while i != j:
            yield tuple(x[-i] for x in l if len(x) >= i)
            i += k

    @staticmethod
    def percentage(x, num_sentences, num_networks):
        if not num_sentences:
            return float('NaN')
        elif not (num_networks and x):
            return 0
        return (x * 100) / (num_sentences * num_networks)

    def get_plot_path(self, num_simulations, fname):
        return f"{self.results_dir}/{num_simulations}_{fname}.png"


def rand_jitter(arr):
    stdev = .005*(max(arr)-min(arr))
    return arr + np.random.randn(len(arr)) * stdev


def jitter(plt, x, y, s, color, alpha):
    return plt.scatter(rand_jitter(x), rand_jitter(y), alpha=alpha, s=s, c=color, cmap=None, norm=None, vmin=None,
                       vmax=None, linewidths=None, verts=None)


def divide(x, y):
    if not x:
        return np.nan
    return truediv(x * 100, y)


def str2bool(v):
    if isinstance(v, bool):
        return v
    return int(v.lower() in ("yes", "true", "t", "1", "flex-true", "flex-false"))

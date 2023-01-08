from operator import truediv

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import scikits.bootstrap as boot
import seaborn as sns

sns.set(palette="colorblind")
sns.set_style("whitegrid")


class Plotter:
    def __init__(self, results_dir):
        self.results_dir = results_dir
        self.fname_suffix = ""
        self.bar_width = 0.3
        self.languages = ["en", "es"]
        self.rename_label = {
            "adj": "adjective",
            "aux": "auxiliary",
            "det": "determiner",
            "prep": "preposition",
            "pron": "pronoun",
            "adverb": "pred. adjective",
            "switched_participle_perfect": "perfect participle",
            "switched_participle_prog": "progressive participle",
            "switched_aux_prog": "progressive auxiliary",
            "switched_aux_perfect": "perfect auxiliary",
        }

    # specific to auxiliary phrase asymmetry experiment
    def lineplot_participle_switches_all_models(
        self, ci, n_boot, ylim=5, models=("haber", "tener", "synonym")
    ):
        for m in models:
            df = pd.read_csv(
                f"{self.results_dir}/{m}{self.fname_suffix}/performance.csv",
                index_col=None,
                header=0,
                skipinitialspace=True,
                dtype={"epoch": int},
            )
            self.lineplot_items(
                df,
                fname=f"participle_switches_{m}_{ci}",
                ylim=ylim,
                errorbar=("ci", ci),
                n_boot=n_boot,
                items=["switched_participle_prog", "switched_participle_perfect"],
            )

    def lineplot_auxiliary_phrase_experiment(
        self,
        ci,
        n_boot=1000,
        ylim=17.5,
        fname="auxiliary_participle_switches",
        items=[
            "switched_aux_prog",
            "switched_aux_perfect",
            "switched_participle_prog",
            "switched_participle_perfect",
        ],
    ):
        df = pd.read_csv(
            f"{self.results_dir}/performance.csv",
            index_col=None,
            header=0,
            skipinitialspace=True,
            dtype={"epoch": int},
        )
        for i, item in enumerate(items):
            ax = sns.lineplot(
                x="epoch",
                y=item,
                data=df,
                errorbar=("ci", ci),
                n_boot=n_boot,
                label=self.rename_label[item],
                color=("#de8f05" if "perfect" in item else "#0173b2"),
            )
            if "aux" in item:
                ax.lines[i].set_linestyle("--")
        plt.xlabel("epochs")
        plt.ylabel("")
        plt.ylim([0, ylim])
        plt.yticks(np.arange(0, ylim, step=1))
        xticks = np.arange(df.epoch.min(), df.epoch.max() + 1, step=4)
        plt.xticks(xticks, xticks)

        plt.xlim([df.epoch.min(), df.epoch.max()])
        plt.legend(
            loc="upper center",
            fancybox=True,
            ncol=2,
            shadow=True,
            bbox_to_anchor=(0.5, 1.11),
        )
        plt.tight_layout()  # make room for labels
        plt.savefig(self.get_plot_path(len(df.network_num.unique()), fname))
        plt.close()

    def plot_merged_cognate_csv(self, df_name, ylim):
        df = pd.read_csv(f"{self.results_dir}/{df_name}.csv")
        if "_L1" in df_name:
            sns.set_style("white")
        groups = ["epoch", "network_num", "model", "simulation"]
        if "_L" in df_name:  # L1 or L2
            groups.append("switch_from")
        print(
            "enes:",
            len(df[df.simulation == "enes"]),
            ", esen",
            len(df[df.simulation == "esen"]),
            ", balanced:",
            len(df[df.simulation == "balanced"]),
        )
        # print('cognate enes:', len(df[(df.simulation == 'enes')&(df.model=='cognate')]), ', esen',
        #      len((df[df.simulation == 'esen'])&(df.model=='cognate'))))

        gb = df.groupby(groups).apply(
            lambda dft: pd.Series(
                {
                    "code_switched": dft.is_code_switched.sum(),
                    "total_sentences": len(dft.meaning),
                    "switched_at": dft.switched_at.sum(),
                    "code_switched_percentage": dft.is_code_switched.sum()
                    * 100
                    / len(dft.meaning),
                    "switched_at_percentage": dft.switched_at.sum()
                    * 100
                    / len(dft.meaning),
                }
            )
        )

        gb.to_csv(f"{self.results_dir}/count_{df_name}.csv")
        df = pd.read_csv(f"{self.results_dir}/count_{df_name}.csv")

        ax = sns.barplot(
            x="simulation",
            y="code_switched_percentage",
            hue="model",
            data=df,
            errorbar=("ci", 68),
            n_boot=1000,
        )

        labels = (
            ["L1 English", "L1 Spanish"]
            if "_L" in df_name
            else ["Balanced", "L1 English", "L1 Spanish"]
        )
        ax.set_xticklabels(labels)

        # statistical annotation
        x1, x2 = -0.19, 0.2  # first two columns, center of both: 0
        x3, x4 = 0.8, 1.18  #
        y = df["code_switched_percentage"].mean() + (
            1.7 if "_L1" in df_name else 13 if "_L2" in df_name else 12
        )
        h = 0.1 if "_L1" in df_name else 0.5
        col = "k"
        plt.plot([x1, x1, x2, x2], [y, y + h, y + h, y], lw=1.5, c=col)  # lw: linewidth
        plt.text(
            (x1 + x2) * 0.5,
            y + (0.1 if "_L1" in df_name else 0.5),
            "***" if len(labels) == 2 else "n.s.",
            ha="center",
            va="bottom",
            color=col,
        )

        y -= 16 if "_L2" in df_name else 2.2 if "_L1" in df_name else 9
        plt.plot([x3, x3, x4, x4], [y, y + h, y + h, y], lw=1.5, c=col)
        plt.text(
            (x3 + x4) * 0.5,
            y + (0.1 if "_L1" in df_name else 0.7),
            "n.s.",
            ha="center",
            va="bottom",
            color=col,
        )

        if len(labels) == 3:
            x5, x6 = 1.8, 2.18
            y -= 9
            plt.plot([x5, x5, x6, x6], [y, y + h, y + h, y], lw=1.5, c=col)
            plt.text(
                (x5 + x6) * 0.5, y + 0.7, "n.s.", ha="center", va="bottom", color=col
            )

        handles, labels = ax.get_legend_handles_labels()
        caption = {"non_cognate": "non-cognate"}
        plt.legend(
            loc="upper center",
            fancybox=True,
            ncol=2,
            shadow=True,
            bbox_to_anchor=(0.5, 1.11),
            handles=handles,
            labels=[caption.get(i, i) for i in labels],
        )
        plt.xlabel("Bilingual simulations")
        plt.ylabel(
            f"code-switched percentage "
            f'{f"(L1 sentences)" if "L1" in df_name else "(L2 sentences)" if "L2" in df_name else ""}'
        )
        plt.ylim([0, ylim])
        plt.savefig(f"{self.results_dir}/test_{df_name}")
        plt.close()

    def plot_cognate_last_epoch(
        self,
        df_name="count_all_models_merged.csv",
        xrow="model_name",
        hue="model",
        include_annotations=False,
        xaxis_step=10,
        info_to_plot=("code_switched",),
        ci=95,
        ylim=None,
        lineplot=False,
        bbox_to_anchor=(0.5, 1.1),
        plot_percentage=True,
    ):
        print("plot_cognate_last_epoch:", df_name, f"{self.results_dir}/{df_name}")
        df = pd.read_csv(f"{self.results_dir}/{df_name}")
        df = df[df.epoch == df.epoch.max()]
        for label in info_to_plot:
            if lineplot:
                if plot_percentage:
                    ax = sns.lineplot(
                        x=xrow,
                        y=f"{label}_percentage",
                        hue=hue,
                        errorbar=("ci", ci),
                        n_boot=1000,
                        data=df,
                        palette=["#de8f05", "#0173b2"],
                    )
                    plt.ylim([0, 35])
                    plt.ylabel("code-switched percentage (incl. incorrect)")
                else:
                    ax = sns.lineplot(
                        x=xrow,
                        y=f"{label}",
                        hue=hue,
                        errorbar=("ci", ci),
                        n_boot=1000,
                        data=df,
                        palette=["#de8f05", "#0173b2"],
                    )
                    plt.ylabel("mean number of code-switched sentences")
                    plt.ylim([20, 90])
                plt.xlim(df[xrow].min(), df[xrow].max())
                plt.xticks(
                    np.arange(df[xrow].min(), df[xrow].max() + 1, step=xaxis_step)
                )
                bbox_to_anchor = (0.5, 1.05)
                plt.xlabel("percentage of cognates")
            else:
                xrow = "model" if xrow not in list(df) else xrow
                if xrow == "model":
                    hue = "switch_from" if "switch_from" in list(df) else None
                if hue:
                    ax = sns.barplot(
                        x=xrow,
                        y=f"{label}_percentage",
                        hue=hue,
                        errorbar=("ci", ci),
                        n_boot=1000,
                        data=df,
                        errcolor="gray",
                        errwidth=1.5,
                    )
                else:
                    ax = sns.barplot(
                        x=xrow,
                        y=f"{label}_percentage",
                        data=df,
                        errorbar=("ci", ci),
                        n_boot=1000,
                        errcolor="gray",
                        errwidth=1.5,
                    )
                if include_annotations:
                    self.autolabels(
                        ax,
                        [
                            int(df.loc[df[xrow] == modname, "total_sentences"].sum())
                            for modname in df[xrow].unique()
                        ],
                    )
                plt.xlabel("")
            if ylim:
                plt.ylim([0, ylim])
            handles, labels = ax.get_legend_handles_labels()
            if len(labels) > 1:
                caption = {
                    "non_cognate_evaluation": "non-cognate sentences",
                    "cognate_evaluation": "cognate sentences",
                    "non_cognate": "non-cognate",
                }
                print(labels)
                plt.legend(
                    loc="upper center",
                    fancybox=True,
                    ncol=2,
                    shadow=True,
                    bbox_to_anchor=bbox_to_anchor,
                    handles=handles[1:],
                    labels=[
                        caption.get(l, l)
                        for l in (
                            labels[1:]
                            if "pairwise_training" in self.results_dir
                            else labels
                        )
                    ],
                )
            plt.savefig(
                self.get_plot_path(
                    df.network_num.max(),
                    f'{label}_{ci}CI_{df_name.replace(".csv", "").replace("_models_merged", "")}'
                    f'epoch{df.epoch.max()}{"_line" if lineplot else ""}_'
                    f'sent{int(df.total_sentences.sum())}{hue if hue else ""}',
                )
            )
            plt.close()

    def plot_cognate_effect_over_time(
        self,
        df_name,
        info_to_plot=(
            "code_switched",
            "switched_before",
            "switched_at",
            "switched_right_after",
            "switched_second_after",
            "switched_after_anywhere",
        ),
        ignore_baseline=False,
        ci=95,
    ):
        df = pd.read_csv(f"{self.results_dir}/{df_name}")
        if ignore_baseline:
            df = df[df.model != "zero_cognates"]
        for label in info_to_plot:
            ax = sns.lineplot(
                x="epoch",
                y=f"{label}_percentage",
                hue="model",
                errorbar=("ci", ci),
                n_boot=1000,
                data=df,
            )

            plt.xlim([df.epoch.min(), df.epoch.max()])

            handles, labels = ax.get_legend_handles_labels()
            plt.legend(
                handles=handles[1:],
                labels=labels[1:],
                loc="upper center",
                fancybox=True,
                ncol=3,
                shadow=True,
                bbox_to_anchor=(0.5, 1.11),
            )
            plt.tight_layout()  # make room for labels
            plt.ylim([0, 32])
            plt.savefig(
                self.get_plot_path(
                    df.network_num.max(), f'{label}_{df_name.replace(".csv", "")}'
                )
            )
            plt.close()

    def print_switches_around_switch_point(
        self,
        df_name,
        ci=95,
        info_to_plot=(
            "code_switched",
            "switched_before",
            "switched_at",
            "switched_right_after",
            "switched_one_after",
            "switched_after_anywhere",
        ),
        ignore_baseline=True,
    ):
        false_friends = False
        if "ff" in df_name:
            false_friends = True
        df = pd.read_csv(f"{self.results_dir}/{df_name}")
        df = df[df.epoch == df.epoch.max()]
        df_cog_or_ff = df[
            df.model == ("cognate" if not false_friends else "false_friend")
        ]
        df_no_cog_or_ff = df[
            df.model == ("non_cognate" if not false_friends else "non_false_friend")
        ]
        all_dfs = [df_cog_or_ff, df_no_cog_or_ff]

        if not ignore_baseline:
            df_baseline = df[df.model == "baseline"]
            all_dfs.append(df_baseline)

        print(df_name, sum(df.total_sentences))
        for i in info_to_plot:
            for d in all_dfs:
                if f"{i}_percentage" not in d:
                    i = "switched_second_after"
                low, high = self.get_ci(d[f"{i}_percentage"], ci=ci)
                print(
                    i,
                    round(d[f"{i}_percentage"].mean(), 1),
                    f"[{round(low, 1)}, {round(high, 1)}]",
                )
            print("------")

    def lineplot_code_switches(
        self, df, fname="code_switches_over_time", ylim=50, legend_loc="upper center"
    ):
        sns.lineplot(
            x="epoch",
            y="alternational_percentage",
            data=df,
            errorbar=None,
            color="#0173b2",
            label="alternational",
        )
        sns.lineplot(
            x="epoch",
            y="insertional_percentage",
            data=df,
            errorbar=None,
            label="insertional",
            color="#de8f05",
        )
        sns.lineplot(
            x="epoch",
            y="ambiguous_percentage",
            data=df,
            errorbar=None,
            label="ambiguous",
            color="#029E73",
        )
        sns.lineplot(
            x="epoch",
            y="intersentential_percentage",
            data=df,
            errorbar=None,
            label="intersentential",
        )

        sns.swarmplot(
            x="epoch",
            y="alternational_percentage",
            data=df,
            size=2,
            alpha=0.4,
            color="#0173b2",
        )
        sns.swarmplot(
            x="epoch",
            y="insertional_percentage",
            data=df,
            size=2,
            alpha=0.4,
            color="#de8f05",
        )
        sns.swarmplot(
            x="epoch",
            y="ambiguous_percentage",
            data=df,
            size=2,
            alpha=0.4,
            color="#029E73",
        )
        sns.swarmplot(
            x="epoch", y="intersentential_percentage", data=df, size=2, alpha=0.4
        )

        plt.xlabel("epochs")
        plt.ylabel("")
        plt.ylim([0, ylim])
        plt.yticks(np.arange(0, ylim + 1, step=10))

        xticks = np.arange(df.epoch.min(), df.epoch.max() + 1, step=2)
        plt.xticks(xticks, xticks)

        plt.xlim([df.epoch.min(), df.epoch.max()])
        plt.legend(
            loc=legend_loc,
            fancybox=True,
            ncol=4,
            shadow=True,
            bbox_to_anchor=(0.5, 1.11),
        )
        plt.tight_layout()  # make room for labels
        plt.savefig(self.get_plot_path(len(df.network_num.unique()), fname))
        plt.close()

    def barplot_code_switches(self, df, grouped):
        df = pd.read_csv(f"{self.results_dir}/{m}{self.fname_suffix}/all_results.csv")
        grouped = pd.read_csv(
            f"{self.results_dir}/{m}{self.fname_suffix}/all_results.csv"
        )
        all_labels = grouped.pos_of_switch_point.unique().tolist()
        index_size = np.arange(len(all_labels))

        mean_correct_sentences = []
        for switch_point in all_labels:
            """correct_sentences.append(df[(df.epoch == df.epoch.max())
               & df.meaning == 1].produced_pos.str.contains(switch_point).sum() /
            df.network_num.max())"""
            mean_correct_sentences.append(
                df[(df.epoch == df.epoch.max()) & df.meaning == 1]
                .produced_pos.str.contains(switch_point)
                .mean()
            )

        for switch_type in [
            "insertional",
            "alternational",
            "ambiguous",
        ]:  # one plot per switch_type
            fig, ax = plt.subplots()
            rects = []
            annotate_labels = []
            for i, lang in enumerate(grouped.switch_from.unique().tolist()):
                val = []
                ci_low = []
                ci_high = []
                for switch_point in all_labels:
                    switches = grouped[
                        (grouped.switched_type == switch_type)
                        & (grouped.pos_of_switch_point == switch_point)
                        & (grouped.switch_from == lang)
                    ].code_switched

                    switches_percentage = switches * 100 / mean_correct_sentences
                    switches_percentage_mean = switches_percentage.mean()
                    low, high = self.get_ci(switches_percentage, ci=95)
                    ci_low.append(round(switches_percentage_mean - low, 1))
                    ci_high.append(round(high - switches_percentage_mean, 1))

                    val.append(switches.sum() * 100 / mean_correct_sentences)
                    rects.append(
                        ax.bar(
                            index_size + (self.bar_width * i),
                            val,
                            self.bar_width,
                            yerr=(ci_low, ci_high),
                            ecolor="grey",
                        )
                    )
                    annotate_labels.extend(switches.sum())

            self.autolabels(ax, annotate_labels)

            ax.set_xticks(index_size + self.bar_width / len(all_labels))
            ax.set_ylim(bottom=0)
            ax.legend(["Switch into Spanish", "Switch into English"], loc="upper left")
            ax.set_xticklabels(
                [self.rename_label.get(x, x) for x in all_labels], rotation=55
            )  # rotate labels to fit

            plt.tight_layout()  # make room for labels
            plt.savefig(
                self.get_plot_path(df.network_num.max(), f"{switch_type}_barplot")
            )
            plt.close()

    def plot_code_switche_types_per_pos_for_all_models(
        self, models=("early", "enes", "esen"), l2_epoch=25, ylim=7
    ):
        sns.set_style("white")
        code_switch_types = ["insertional", "alternational", "ambiguous"]
        labels = {
            "insertional": ["adj", "aux", "det", "noun", "participle", "prep", "verb"],
            "alternational": [
                "adj",
                "aux",
                "det",
                "noun",
                "participle",
                "prep",
                "verb",
            ],
            "ambiguous": ["noun", "participle", "verb", "adverb"],
        }
        legend = {
            "early": "Early",
            "enes": "L1 English",
            "esen": "L1 Spanish",
            "messageless_balanced": "Early",
        }
        correct_sentences = {}
        code_switches = {}
        for m in models:
            df = pd.read_csv(
                f"{self.results_dir}/{m}{self.fname_suffix}/all_results.csv",
                index_col=None,
                header=0,
                skipinitialspace=True,
                dtype={"epoch": int},
            )
            epoch = (
                l2_epoch if m == ("early" or "messageless_balanced") else df.epoch.max()
            )
            df = df[(df.epoch == epoch) & (df.meaning == 1)]
            code_switches[m] = {}
            correct_sentences[m] = {}
            for switch_type in code_switch_types:
                correct_sentences[m][switch_type] = []
                for switch_point in labels[switch_type]:
                    pos = (
                        f"{switch_point} ."
                        if switch_type == "ambiguous"
                        else switch_point
                    )
                    correct_sentences[m][switch_type].append(
                        df.produced_pos.str.contains(pos).sum()
                    )

                code_switches[m][switch_type] = {}
                for lang in self.languages:
                    code_switches[m][switch_type][lang] = {}
                    for switch_point in labels[switch_type]:
                        code_switches[m][switch_type][lang][switch_point] = df[
                            (df.switched_type == switch_type)
                            & (df.pos_of_switch_point == switch_point)
                            & (df.switch_from == lang)
                        ].is_code_switched  # .sum()

        for switch_type in code_switch_types:  # one plot per switch_type and lang
            index_size = np.arange(len(labels[switch_type]))
            bar_width = 0.15 if switch_type == "ambiguous" else self.bar_width
            for lang in self.languages:
                fig, ax = plt.subplots()
                rects = []
                annotate_labels = []
                for idx, model in enumerate(models):
                    val = []
                    ci_low = []
                    ci_high = []
                    for switch_point in labels[switch_type]:
                        v = (
                            code_switches[model][switch_type][lang][switch_point]
                            * 100
                            / correct_sentences[model][switch_type][
                                labels[switch_type].index(switch_point)
                            ]
                        )

                        low, high = self.get_ci(v, ci=95)

                        r = code_switches[model][switch_type][lang][switch_point].sum()
                        r_mean = truediv(
                            code_switches[model][switch_type][lang][switch_point].mean()
                            * 100,
                            (
                                correct_sentences[model][switch_type][
                                    labels[switch_type].index(switch_point)
                                ]
                            ),
                        )
                        val.append(r_mean)
                        ci_low.append(round(r_mean - low, 1))
                        ci_high.append(round(high - r_mean, 1))

                        annotate_labels.append(r)
                    rects.append(
                        ax.bar(
                            index_size + (bar_width * idx),
                            val,
                            bar_width,
                            align="center",
                            yerr=(ci_low, ci_high),
                            ecolor="gray",
                        )
                    )
                self.autolabels(ax, annotate_labels)

                ax.set_xticks(index_size + bar_width)
                ax.set_ylim(bottom=0, top=ylim)
                ax.legend(
                    [legend[model] for model in models],
                    loc="upper center",
                    fancybox=True,
                    ncol=3,
                    shadow=True,
                    bbox_to_anchor=(0.5, 1.12),
                )
                ax.set_xticklabels(
                    [self.rename_label.get(x, x) for x in labels[switch_type]],
                    rotation=(0 if switch_type == "ambiguous" else 90),
                )
                plt.tight_layout()  # make room for labels
                plt.savefig(
                    self.get_plot_path(df.network_num.max(), f"{switch_type}_{lang}")
                )
                plt.close()

    @staticmethod
    def autolabels(ax, val, yoffset=4.8):
        """Attach a text label above each bar in *rects*, displaying its height."""
        for rect, v in zip(ax.patches, val):
            height = rect.get_height()
            ax.annotate(
                v if v else None,
                xy=(rect.get_x() + rect.get_width() / 2, height),
                xytext=(0, yoffset),
                size=9,
                textcoords="offset points",
                ha="center",
                va="bottom",
                color="black",
                backgroundcolor="w",
            )

    def plot_code_switch_types_per_model(
        self, models=("early", "enes", "esen"), bar_width=0.25, l2_epoch=25
    ):
        sns.set_style("white")
        code_switch_types = ["alternational", "insertional", "ambiguous"]
        legend = {
            "early": "Early",
            "enes": "L1 English",
            "esen": "L1 Spanish",
            "messageless_balanced": "Early",
        }

        all_dfs = {}
        for m in models:
            temp_df = pd.read_csv(
                f"{self.results_dir}/{m}{self.fname_suffix}/performance_per_lang.csv",
                index_col=None,
                header=0,
                skipinitialspace=True,
                dtype={"epoch": int},
            )
            epoch = (
                l2_epoch
                if m in ["early", "messageless_balanced"]
                else temp_df.epoch.max()
            )
            temp_df = temp_df[temp_df.epoch == epoch]
            all_dfs[m] = temp_df
        network_num = temp_df.network_num.max()

        index_size = np.arange(len(code_switch_types))
        for lang in self.languages:
            annotate_labels = []
            fig, ax = plt.subplots()
            rects = []
            for idx, model in enumerate(models):
                df_per_lang = all_dfs[model]
                df_per_lang = df_per_lang[df_per_lang.switch_from == lang]
                val = []
                ci_low = []
                ci_high = []
                for switch_type in code_switch_types:
                    if f"{switch_type}_percentage" in df_per_lang:
                        val.append(df_per_lang[f"{switch_type}_percentage"].mean())
                        low, high = self.get_ci(
                            df_per_lang[f"{switch_type}_percentage"], ci=95
                        )
                        ci_low.append(
                            round(
                                df_per_lang[f"{switch_type}_percentage"].mean() - low, 1
                            )
                        )
                        ci_high.append(
                            round(
                                high - df_per_lang[f"{switch_type}_percentage"].mean(),
                                1,
                            )
                        )
                    else:
                        val.append(0)
                        low, high = 0.0, 0.0
                        ci_low.append(low)
                        ci_high.append(high)
                    annotate_labels.append(int(df_per_lang[switch_type].sum()))

                rects.append(
                    ax.bar(
                        index_size + (bar_width * idx),
                        val,
                        bar_width,
                        yerr=(ci_low, ci_high),
                        align="center",
                        ecolor="grey",
                    )
                )

            self.autolabels(ax, annotate_labels)
            ax.set_xticks(index_size + bar_width)
            ax.set_ylim(bottom=0, top=26)
            ax.legend(
                [legend[model] for model in models],
                loc="upper center",
                fancybox=True,
                ncol=3,
                shadow=True,
                bbox_to_anchor=(0.5, 1.12),
            )
            ax.set_xticklabels(
                [x.replace("ambiguous", "final-word") for x in code_switch_types]
            )

            plt.tight_layout()  # make room for labels
            plt.savefig(self.get_plot_path(network_num, f"switch_types_{lang}"))
            plt.close()

    def performance_all_models(self, models=("enes", "esen", "early")):
        for m in models:
            df = pd.read_csv(
                f"{self.results_dir}/{m}{self.fname_suffix}/performance.csv",
                index_col=None,
                header=0,
                skipinitialspace=True,
                dtype={"epoch": int},
            )
            self.performance(df, fname=f"performance_{m}")

    def l1_performance_all_models(self, models=("enes", "esen", "early")):
        for m in models:
            df = pd.read_csv(
                f"{self.results_dir}/{m}{self.fname_suffix}/performance_per_lang.csv",
                index_col=None,
                header=0,
                skipinitialspace=True,
                dtype={"epoch": int},
            )
            langs = [m[:2]] if m != "early" else self.languages
            for l1_lang in langs:
                self.performance(
                    df[df.switch_from == l1_lang],
                    fname=f"l1_performance_{m}_{l1_lang}",
                    include_code_switches=True,
                )

    def performance(
        self,
        df,
        fname="performance",
        ylim=100,
        legend_loc="upper center",
        include_individual_points=True,
        include_code_switches=False,
        max_epochs=None,
        threshold=0,
    ):
        if df.empty:
            import sys

            sys.exit("Cannot plot performance, the dataframe is empty")

        plt.set_loglevel("WARNING")

        if max_epochs:
            df = df[df.epoch < max_epochs + 1]
        df = df[df.meaning > threshold]  # remove simulations that did not succeed
        # errorbar: CI
        sns.lineplot(
            x="epoch",
            y="grammaticality_percentage",
            data=df,
            color="#0173b2",
            errorbar=None,
            label="grammaticality",
        )
        sns.lineplot(
            x="epoch",
            y="meaning_percentage",
            data=df,
            color="#de8f05",
            errorbar=None,
            label="meaning",
            marker="X",
        )
        if include_individual_points:
            sns.swarmplot(
                x="epoch",
                y="grammaticality_percentage",
                data=df,
                color="#0173b2",
                size=1,
                alpha=0.5,
            )
            sns.swarmplot(
                x="epoch",
                y="meaning_percentage",
                data=df,
                color="#de8f05",
                size=1,
                alpha=0.5,
            )

        if include_code_switches and df.code_switched_percentage.sum() > 0:
            sns.lineplot(
                x="epoch",
                y="code_switched_percentage",
                data=df,
                color="#029E73",
                errorbar=None,
                label="code-switching",
                marker="v",
            )
            if include_individual_points:
                sns.swarmplot(
                    x="epoch",
                    y="code_switched_percentage",
                    data=df,
                    color="#029E73",
                    size=2,
                    alpha=0.5,
                )

        plt.xlabel("epochs")
        plot_label = {
            "l1_performance_early_en": "Balanced model tested on English",
            "l1_performance_early_es": "Balanced model tested on Spanish",
            "l1_performance_enes_en": "L1 English model tested on English",
            "l1_performance_esen_es": "L1 Spanish model tested on Spanish",
        }
        ylabel = ""
        if fname in plot_label:
            ylabel = plot_label[fname]
        plt.ylabel(ylabel)
        plt.ylim([0, ylim])
        plt.yticks(np.arange(0, ylim + 1, step=10))

        xticks = np.arange(df.epoch.min(), df.epoch.max() + 1, step=2)
        plt.xticks(xticks, xticks)

        plt.xlim([df.epoch.min(), df.epoch.max()])
        plt.legend(
            loc=legend_loc,
            fancybox=True,
            ncol=3,
            shadow=True,
            bbox_to_anchor=(0.5, 1.11),
        )
        plt.tight_layout()  # make room for labels
        plt.savefig(self.get_plot_path(len(df.network_num.unique()), fname))
        plt.close()

    def l2_performance_all_models(self, models=("enes", "esen")):
        for m in models:
            df = pd.read_csv(
                f"{self.results_dir}/{m}{self.fname_suffix}/performance_per_lang.csv",
                index_col=None,
                header=0,
                skipinitialspace=True,
                dtype={"epoch": int, "l2_epoch": int},
            )
            l2_lang = m[2:]
            self.l2_performance(
                df,
                l2_lang=l2_lang,
                fname=f"l2_performance_{m}_{l2_lang}",
                include_code_switches=True,
            )

    def l2_performance(
        self, df, l2_lang, fname, ylim=100, max_epochs=None, include_code_switches=False
    ):
        if max_epochs:
            df = df[df.epoch < max_epochs + 1]
        df = df[df.switch_from == l2_lang]
        df = df[df.epoch > df.l2_epoch]
        epoch_range = range(df.epoch.min(), df.epoch.max())

        ax = sns.swarmplot(
            x="epoch",
            y="grammaticality_percentage",
            data=df,
            color="#0173b2",
            size=2,
            alpha=0.7,
        )
        sns.swarmplot(
            x="epoch",
            y="meaning_percentage",
            data=df,
            color="#de8f05",
            size=2,
            alpha=0.7,
        )

        xaxis = ax.get_xticks()[1:]
        plt.plot(
            xaxis,
            [df[df.epoch == ep].grammaticality_percentage.mean() for ep in epoch_range],
            label="grammaticality",
            color="#0173b2",
        )
        plt.plot(
            xaxis,
            [df[df.epoch == ep].meaning_percentage.mean() for ep in epoch_range],
            label="meaning",
            color="#de8f05",
            marker="x",
            markersize=4,
        )

        if include_code_switches and df.code_switched_percentage.sum() > 0:
            sns.swarmplot(
                x="epoch",
                y="code_switched_percentage",
                data=df,
                color="#029E73",
                size=2,
                alpha=0.7,
            )
            plt.plot(
                xaxis,
                [
                    df[df.epoch == ep].code_switched_percentage.mean()
                    for ep in epoch_range
                ],
                label="code-switching",
                color="#029E73",
                marker="v",
                markersize=4,
            )

        plot_labels = {
            "l2_performance_enes_es": "L1 English model tested on Spanish",
            "l2_performance_esen_en": "L1 Spanish model tested on English",
        }
        plt.xlabel("epochs")
        plt.ylabel(plot_labels.get(fname, ""))
        plt.ylim([0, ylim])
        plt.yticks(np.arange(0, ylim + 1, step=10))
        plt.xlim([ax.get_xticks()[0], ax.get_xticks()[-1]])
        plt.legend(
            loc="upper center",
            fancybox=True,
            ncol=3,
            shadow=True,
            bbox_to_anchor=(0.5, 1.11),
        )
        plt.tight_layout()  # make room for labels
        plt.savefig(self.get_plot_path(len(df.network_num.unique()), f"{fname}"))
        plt.close()

    def plot_code_switches_from_all_models(
        self,
        models=("enes", "esen"),
        fname="code_switching_all",
        include_swarmplot=True,
    ):
        frames = []
        for m in models:
            df = pd.read_csv(
                f"{self.results_dir}/{m}{self.fname_suffix}/performance_per_lang.csv",
                index_col=None,
                header=0,
                skipinitialspace=True,
                dtype={"epoch": int, "l2_epoch": int},
            )
            df = df[df.switch_from == m[2:]]
            df["model"] = m
            frames.append(df)
            # color_model = {'early': '#0173b2', 'enes': '#de8f05', 'esen': '#029E73'}
            color_model = {"enes": "#0173b2", "esen": "#de8f05"}
            if include_swarmplot:
                ax = sns.swarmplot(
                    x="epoch",
                    y="code_switched_percentage",
                    data=df,
                    size=2,
                    alpha=0.7,
                    color=color_model[m],
                )
        df_full = pd.concat(frames)
        plt.xlim([0, 40])
        plt.ylim([0, 40])
        ci = None if include_swarmplot else 95
        ax = sns.lineplot(
            x="epoch",
            y="code_switched_percentage",
            hue="model",
            data=df_full,
            errorbar=("ci", ci),
        )
        handles, labels = ax.get_legend_handles_labels()
        rename_labels = {
            "early": "Balanced",
            "enes": "L1 English",
            "esen": "L1 Spanish",
        }
        plt.legend(
            labels=[rename_labels[x] for x in labels[1:]],
            loc="upper center",
            fancybox=True,
            ncol=3,
            shadow=True,
            bbox_to_anchor=(0.5, 1.11),
        )
        xrange = range(0, 40)

        # plt.xticks([])
        # plt.xticks(xrange)
        plt.xlabel("epochs")
        plt.ylabel("")
        plt.savefig(self.get_plot_path(len(df.network_num.unique()), f"{fname}_Ls"))
        plt.close()

    def get_plot_path(self, num_simulations, fname):
        return f"{self.results_dir}/{num_simulations}_{fname}.png"

    def print_switches_per_model(
        self,
        models=("early", "enes", "esen"),
        l2_epoch=25,
        print_total=True,
        n_sample=10000,
        print_per_lang=True,
        switch_type=("alternational", "insertional", "ambiguous"),
    ):
        for m in models:
            print(m)
            if print_total:
                df = pd.read_csv(
                    f"{self.results_dir}/{m}{self.fname_suffix}/performance.csv",
                    index_col=None,
                    header=0,
                    skipinitialspace=True,
                    dtype={"epoch": int},
                )
                df = df[df.epoch == (l2_epoch if m == "early" else df.epoch.max())]
                print(df.epoch.max())
                cs_sum = (
                    df[f"alternational_percentage"]
                    + df[f"insertional_percentage"]
                    + df[f"ambiguous_percentage"]
                )
                low, high = boot.ci(cs_sum, n_samples=n_sample)
                print(
                    "TOTAL",
                    round(cs_sum.mean(), 1),
                    "CI:",
                    round(low, 1),
                    round(high, 1),
                )
                for stype in switch_type:
                    low, high = boot.ci(df[f"{stype}_percentage"], n_samples=n_sample)
                    print(
                        stype,
                        round(df[f"{stype}_percentage"].mean(), 1),
                        "CI:",
                        round(low, 1),
                        round(high, 1),
                    )

            if print_per_lang:
                df = pd.read_csv(
                    f"{self.results_dir}/{m}{self.fname_suffix}/performance_per_lang.csv",
                    index_col=None,
                    header=0,
                    skipinitialspace=True,
                    dtype={"epoch": int},
                )
                df = df[df.epoch == (l2_epoch if m == "early" else df.epoch.max())]
                for lang in self.languages:
                    print("per lang:", lang)
                    df_lang = df[df.switch_from == lang]

                    cs_sum = (
                        df_lang[f"alternational_percentage"]
                        + df_lang[f"insertional_percentage"]
                        + df_lang[f"ambiguous_percentage"]
                    )
                    low, high = boot.ci(cs_sum, n_samples=n_sample)
                    print(
                        "TOTAL per lang",
                        round(cs_sum.mean(), 1),
                        "CI:",
                        round(low, 1),
                        round(high, 1),
                    )

                    for stype in switch_type:
                        low, high = boot.ci(
                            df_lang[f"{stype}_percentage"], n_samples=n_sample
                        )
                        print(
                            stype,
                            round(df_lang[f"{stype}_percentage"].mean(), 1),
                            "CI:",
                            round(low, 1),
                            round(high, 1),
                        )

    @staticmethod
    def get_ci(df, ci, n_samples=10000):
        alpha = 0.05
        if ci == 68:
            alpha = 0.32
        return boot.ci(df, n_samples=n_samples, alpha=alpha)

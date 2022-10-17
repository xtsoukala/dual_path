#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import hashlib
import os
import sys

import pandas as pd

sys.path.append("..")

from modules import create_dataframes_for_plots
from modules.plotter import Plotter


def create_model_csv_files(
    results_dir,
    models=("cog1", "cog2"),
    model_name="cognate",
    only_last_epoch=False,
    only_compare_with_sentences_not_containing_any_cognates=True,
    only_test_cognates=True,
):
    """
    :param results_dir:
    :param models:
    :param model_name: cognate or false_friend
    :param only_last_epoch:
    :param only_compare_with_sentences_not_containing_any_cognates:
    :return:
    """
    cognate_list = None

    print("Cognate list file name:", cognate_list_fname)
    if cognate_list_fname:
        with open(f"{results_dir}/{cognate_list_fname}", encoding="utf-8") as f:
            cognate_list = [line.rstrip("\n").lower() for line in f]

    for model_pair in [models, list(reversed(models))]:
        print(model_pair)

        target_concepts = None
        if cognate_list:
            with open(
                f"{results_dir}/{model_pair[0]}/input/cognates.in", encoding="utf-8"
            ) as f:
                cognates_in_simulation = [line.rstrip("\n").lower() for line in f]
            target_concepts = "|".join(
                set(cognate_list).intersection(cognates_in_simulation)
            )
            print("target concepts:", target_concepts)
        elif only_test_cognates:
            with open(
                f"{results_dir}/{model_pair[0]}/input/cognates.in", encoding="utf-8"
            ) as f:
                cognates_in_simulation = [line.rstrip("\n").lower() for line in f]
            target_concepts = "|".join(cognates_in_simulation)
            print("target concepts:", target_concepts)

        if cognate_list and not target_concepts:
            break

        cog_or_ff_df = pd.read_csv(f"{results_dir}/{model_pair[0]}/all_results.csv")
        cog_or_ff_df.loc[:, "model"] = model_name

        no_cog_or_ff_df = pd.read_csv(f"{results_dir}/{model_pair[1]}/all_results.csv")
        no_cog_or_ff_df.loc[:, "model"] = f"non_{model_name}"

        if only_last_epoch:
            cog_or_ff_df = cog_or_ff_df[cog_or_ff_df.epoch == cog_or_ff_df.epoch.max()]
            print(len(cog_or_ff_df))

            no_cog_or_ff_df = no_cog_or_ff_df[
                no_cog_or_ff_df.epoch == no_cog_or_ff_df.epoch.max()
            ]
            print(len(no_cog_or_ff_df))

        if "false_friend" in model_name:
            sentences_with = cog_or_ff_df.loc[
                cog_or_ff_df.target_has_false_friend == True
            ].copy()
        else:
            sentences_with = cog_or_ff_df.loc[
                cog_or_ff_df.target_has_cognate == True
            ].copy()

        if target_concepts:
            sentences_with = sentences_with.loc[
                sentences_with.target_sentence.str.contains(target_concepts)
            ]

        # assign sentence_idx:
        sentences_with["sentence_idx"] = sentences_with.apply(
            lambda x: hash_string(f"{x.message}{x.network_num}"), axis=1
        )
        no_cog_or_ff_df["sentence_idx"] = no_cog_or_ff_df.apply(
            lambda x: hash_string(f"{x.message}{x.network_num}"), axis=1
        )
        sentences_without = no_cog_or_ff_df.copy()
        # Remove sentences with incorrect meaning or those in which the word of interest was produced at the end.
        sentences_with.drop(
            sentences_with.loc[sentences_with.meaning == 0].index, inplace=True
        )

        print(len(sentences_without))
        sentences_without.drop(
            sentences_without.loc[sentences_without.meaning == 0].index, inplace=True
        )
        print("correct meaning:", len(sentences_without))
        if only_compare_with_sentences_not_containing_any_cognates:
            sentences_without.drop(
                sentences_without.loc[
                    sentences_without.target_has_cognate == True
                ].index,
                inplace=True,
            )
            print("without: not containing any cognates", len(sentences_without), "---")

        sentences_to_test = pd.concat([sentences_with, sentences_without], sort=False)

        sentences_to_test.loc[
            sentences_to_test.concept_position == "None", "concept_position"
        ] = -1
        sentences_to_test.loc[
            sentences_to_test.first_switch_position == "None", "first_switch_position"
        ] = -1

        # sentences that are correctly produced among all models
        fname = f'all_epochs_{"_".join(model_pair).replace("/", "_")}.csv'

        # remove sentences that have not been produced by both cognate/non-cognate models
        count_correct = sentences_to_test.groupby("sentence_idx").count()
        sentences_to_test = sentences_to_test.loc[
            sentences_to_test["sentence_idx"].isin(
                count_correct[count_correct["model"] == len(model_pair)].index
            )
        ]
        print("final sentences to test:", len(sentences_to_test))
        # -1 because indexing of other columns starts from 0, not 1
        sentences_to_test.to_csv(f"{results_dir}/{fname}")

        group_models(results_dir, fname)


def group_models(results_dir, fname, make_exclusive=False, per_switch_direction=False):
    print(f"{results_dir}/{fname}")
    df = pd.read_csv(
        f"{results_dir}/{fname}",
        dtype={
            "switched_before": int,
            "switched_at": int,
            "switched_right_after": int,
            "switched_second_after": int,
            "switched_after_anywhere": int,
            "concept_position": int,
            "first_switch_position": int,
        },
    )

    if make_exclusive:
        df["switched_after_anywhere"] = df.apply(
            lambda x: (
                0
                if (
                    (x["switched_right_after"] == 1)
                    or (x["switched_second_after"] == 1)
                    or (x["switched_at"] == 1)
                    or (x["switched_before"] == 1)
                )
                else x["switched_after_anywhere"]
            ),
            axis=1,
        )

        df["switched_second_after"] = df.apply(
            lambda x: (
                0
                if (
                    (x["switched_right_after"] == 1)
                    or (x["switched_at"] == 1)
                    or (x["switched_before"] == 1)
                )
                else x["switched_second_after"]
            ),
            axis=1,
        )
        df["switched_right_after"] = df.apply(
            lambda x: (
                0
                if (x["switched_at"] == 1) or (x["switched_before"] == 1)
                else x["switched_right_after"]
            ),
            axis=1,
        )
        df["switched_at"] = df.apply(
            lambda x: 0 if x["switched_before"] == 1 else x["switched_at"], axis=1
        )
    df.to_csv(
        f'{results_dir}/{"exclusive_" if make_exclusive else ""}{"per_lang" if per_switch_direction else ""}'
        f"{fname}"
    )

    groups = ["epoch", "network_num", "model"]
    if "model_name" in df:
        groups.append("model_name")
    if per_switch_direction:
        groups.append("switch_from")

    gb = df.groupby(groups).apply(
        lambda dft: pd.Series(
            {
                "code_switched": dft.is_code_switched.sum(),
                "total_sentences": len(dft.meaning),
                "switched_before": dft.switched_before.sum(),
                "switched_at": dft.switched_at.sum(),
                "switched_right_after": dft.switched_right_after.sum(),
                "switched_second_after": dft.switched_second_after.sum(),
                "switched_after_anywhere": dft.switched_after_anywhere.sum(),
                "code_switched_percentage": dft.is_code_switched.sum()
                * 100
                / len(dft.meaning),
                "switched_before_percentage": (
                    dft.switched_before.sum() * 100 / len(dft.meaning)
                ),
                "switched_at_percentage": dft.switched_at.sum()
                * 100
                / len(dft.meaning),
                "switched_right_after_percentage": (
                    dft.switched_right_after.sum() * 100 / len(dft.meaning)
                ),
                "switched_second_after_percentage": (
                    dft.switched_second_after.sum() * 100 / len(dft.meaning)
                ),
                "switched_after_anywhere_percentage": (
                    dft.switched_after_anywhere.sum() * 100 / len(dft.meaning)
                ),
            }
        )
    )

    gb.to_csv(
        f'{results_dir}/{"exclusive_" if make_exclusive else ""}{"per_lang" if per_switch_direction else ""}'
        f"count_{fname}"
    )


def hash_string(message):
    return hashlib.md5(message.encode()).hexdigest()


def create_all_model_csv_files(
    results_dir,
    only_last_epoch=True,
    create_csv=True,
    models=("ff",),
    per_switch_direction=False,
):
    if create_csv:
        for m in models:
            create_model_csv_files(
                results_dir, models=(f"{m}1", f"{m}2"), only_last_epoch=only_last_epoch
            )

    for m in models:
        m = m.replace("/", "_")
        fnames = [
            f"{results_dir}/all_epochs_{m}1_{m}2.csv",
            f"{results_dir}/all_epochs_{m}2_{m}1.csv",
        ]
        all_df = []
        for fname in fnames:
            if os.path.isfile(fname):
                df = pd.read_csv(fname)
                all_df.append(df)

        columns = [
            "epoch",
            "network_num",
            "sentence_idx",
            "model",
            "meaning",
            "is_code_switched",
            "switched_type",
            "switched_before",
            "switched_at",
            "switched_right_after",
            "switched_second_after",
            "switched_after_anywhere",
            "first_switch_position",
            "switch_from",
            "produced_sentence",
            "target_sentence",
            "produced_pos",
            "target_pos",
        ]
        pd.concat(all_df, sort=False).to_csv(
            f"{results_dir}/{m}_full_models_merged.csv", index=False, columns=columns
        )
        group_models(
            results_dir,
            f"{m}_models_merged.csv",
            per_switch_direction=per_switch_direction,
        )


def pairwise_cross_model_comparison(
    create_files,
    fname="cog_models_merged",
    only_last_epoch=True,
    results_dir="../../simulations/cog_paper/cognate_percentage/pairwise_training/"
    "evaluation",
    models=("10/cog", "15/cog", "20/cog", "25/cog", "30/cog"),
):
    if create_files:
        create_all_model_csv_files(
            results_dir, models=models, create_csv=True, only_last_epoch=only_last_epoch
        )

    all_df = []
    for m in models:
        m = m.replace("/", "_")
        print(m, f"{results_dir}/{m}_models_merged.csv")
        df = pd.read_csv(f"{results_dir}/{m}_models_merged.csv")
        df["model_name"] = m.split("_")[0]
        all_df.append(df)
    sentences_to_test = pd.concat(all_df, sort=False)

    only_common_sentences = True
    if only_common_sentences:
        count_correct = sentences_to_test.groupby("sentence_idx").count()
        num_per_unique_sentence = (
            len(models) * 2
        )  # models * (cognate + non_cognate sentences)
        sentences_to_test = sentences_to_test.loc[
            sentences_to_test["sentence_idx"].isin(
                count_correct[
                    count_correct["model_name"] == num_per_unique_sentence
                ].index
            )
        ]

    sentences_to_test.to_csv(f"{results_dir}/{fname}.csv")
    group_models(results_dir, f"{fname}.csv")

    plt = Plotter(results_dir=results_dir)
    plt.plot_cognate_last_epoch(
        df_name=f"count_{fname}.csv",
        ci=68,
        xaxis_step=5,
        info_to_plot=("code_switched",),
        lineplot=True,
    )


def non_pairwise_cross_model_comparison(
    results_dir="../../simulations/cog_paper/cognate_percentage/"
    "non_pairwise_training/",
    create_csv=True,
    num_simulations=70,
    remove_incorrect_meaning=True,
):
    if create_csv:
        df_per_test_set = []
        for fname in ["non_cognate_evaluation", "cognate_evaluation"]:
            models = [
                i for i in range(0 if "non" in fname else 10, num_simulations + 1, 10)
            ]
            num_per_unique_sentence = len(models)
            all_dfs = []
            for m in models:
                print(m)
                df = pd.read_csv(f"{results_dir}/{fname}/{m}/all_results.csv")
                df = df[df.epoch == df.epoch.max()]
                if remove_incorrect_meaning:
                    df.drop(df.loc[df.meaning == 0].index, inplace=True)
                if fname == "cognate_evaluation":
                    assert len(df) == len(df[df.target_has_cognate == True])
                df["model_name"] = m
                df["sentence_idx"] = df.apply(
                    lambda x: hash_string(f"{x.message}{x.network_num}"), axis=1
                )
                df["test_set"] = fname
                all_dfs.append(df)
            non_pairwise_merged = pd.concat(all_dfs, sort=False)

            only_common_sentences = True
            if only_common_sentences:
                count_correct = non_pairwise_merged.groupby("sentence_idx").count()
                print(num_per_unique_sentence, "total:", len(non_pairwise_merged))
                non_pairwise_merged = non_pairwise_merged.loc[
                    non_pairwise_merged["sentence_idx"].isin(
                        count_correct[
                            count_correct["model_name"] == num_per_unique_sentence
                        ].index
                    )
                ]
                print("clean:", len(non_pairwise_merged))

            df_per_test_set.append(non_pairwise_merged)

        test_sets_merged = pd.concat(df_per_test_set, sort=False)
        test_sets_merged.to_csv(f"{results_dir}/non_pairwise_cognate_non_cognate.csv")

        gb = test_sets_merged.groupby(
            ["epoch", "network_num", "model_name", "test_set"]
        ).apply(
            lambda dft: pd.Series(
                {
                    "code_switched": dft.is_code_switched.sum(),
                    "total_sentences": len(dft.meaning),
                    "code_switched_percentage": dft.is_code_switched.sum()
                    * 100
                    / len(dft.meaning),
                }
            )
        )
        gb.to_csv(
            f"{results_dir}/non_pairwise_test_sets_grouped"
            f'{f"_include_incorrect" if not remove_incorrect_meaning else ""}.csv'
        )

    plt = Plotter(results_dir=results_dir)
    plt.plot_cognate_last_epoch(
        df_name="non_pairwise_test_sets_grouped.csv",
        hue="test_set",
        include_annotations=False,
        lineplot=True,
        ci=68,
        xrow="model_name",
    )


def cognate_simulations(
    results_dir,
    models,
    only_last_epoch,
    create_files,
    create_csv,
    plot_items,
    per_switch_direction,
):
    if create_files:
        create_all_model_csv_files(
            results_dir,
            models=models,
            create_csv=create_csv,
            per_switch_direction=per_switch_direction,
            only_last_epoch=only_last_epoch,
        )

    if plot_items:
        plt = Plotter(results_dir=results_dir)
        # plt.plot_cognate_last_epoch()
        all_models = []
        for m in models:
            all_models.extend([f"{m}1", f"{m}2"])

        # plt.performance_all_models(models=all_models)

        # plt.plot_cognate_effect_over_time(df_name=f'count_{fname}', ci=68)
        # for i in range(10, 31, 10):
        #    plt.plot_cognate_effect_over_time(df_name=f'count_{i}cog_models_merged.csv', ci=68, ignore_baseline=True,
        #                                      info_to_plot=('code_switched',))
        #    plt.print_switches_around_switch_point(df_name=f'count_{i}cog_models_merged.csv')
        for i in models:
            print(i)
            i = i.replace("/", "_")
            print(i, results_dir)
            info_to_plot = (
                (
                    "code_switched",
                    "switched_before",
                    "switched_at",
                    "switched_right_after",
                    "switched_second_after",
                    "switched_after_anywhere",
                )
                if ("eos" in results_dir or "bos" in results_dir)
                else ("code_switched",)
            )
            plt.plot_cognate_last_epoch(
                df_name=f'{"per_lang" if per_switch_direction else ""}'
                f"count_{i}_models_merged.csv",
                ci=68,
                info_to_plot=info_to_plot,
                lineplot=False,
            )
            # plt.plot_cognate_last_epoch(df_name=f'count_{i}_models_merged.csv', ci=68, xrow='model', hue=None,
            #                            info_to_plot=('code_switched',) + info_to_plot, epoch=30)
            # plt.print_switches_around_switch_point(df_name=f'count_{i}_models_merged.csv')


def code_switching_patterns_model_comparison():
    results_dir = "../../simulations/patterns"
    plot_code_switches = True
    create_csv_files = False

    if create_csv_files:
        num_sim = 40
        for m in ["early", "esen", "enes"]:
            create_dataframes_for_plots(
                results_dir=f"{results_dir}/{m}",
                epoch_from=0,
                epoch_to=40,
                simulation_range=range(1, num_sim + 1),
            )

    plt = Plotter(results_dir=results_dir)
    if plot_code_switches:
        plt.l1_performance_all_models()
        plt.l2_performance_all_models()
        # plt.plot_code_switches_from_all_models()
        # plt.print_switches_per_model(models=('early', 'esen', 'enes'))
        # plt.plot_code_switch_types_per_model()
        # plt.plot_code_switche_types_per_pos_for_all_models()


def plot_l1_with_code_switches(
    results_dir="../../simulations/messageless/messageless_balanced",
    languages=["en", "es"],
):
    df = pd.read_csv(
        f"{results_dir}/performance_per_lang.csv",
        index_col=None,
        header=0,
        skipinitialspace=True,
        dtype={"epoch": int},
    )
    plt = Plotter(results_dir=results_dir)
    for l in languages:
        plt.performance(
            df[df.switch_from == l],
            fname=f"l1_performance_{l}",
            include_code_switches=True,
            max_epochs=40,
        )


cognate_list_fname = None  # '../cognates_of_interest.in'  # 'all_cognates.in'


def plot_l1_l2_performance_cognate_models(results_dir="../../simulations/cog_paper/"):
    plt = Plotter(results_dir=results_dir)
    for testset in ["generic"]:  # ['bos', 'eos', 'generic']:
        for model in ["balanced", "enes", "esen"]:
            for m in ["cog1", "cog2"]:
                print(f"{results_dir}/{testset}/{model}/{m}/performance_per_lang.csv")
                df = pd.read_csv(
                    f"{results_dir}/{testset}/{model}/{m}/performance_per_lang.csv",
                    index_col=None,
                    header=0,
                    skipinitialspace=True,
                    dtype={"epoch": int},
                )
                l2_lang = model[-2:] if model != "balanced" else None
                lang = [model[-4:-2]] if model != "balanced" else ["en", "es"]
                if model != "balanced":
                    df.l2_epoch = 10
                print(lang, l2_lang)
                for l in lang:
                    plt.performance(
                        df[df.switch_from == l],
                        fname=f"l1_{testset}_{model}_{m}_{l}",
                        include_code_switches=True,
                    )
                if l2_lang:
                    plt.l2_performance(
                        df,
                        l2_lang=l2_lang,
                        fname=f"l2_{testset}_{model}_{m}_{l2_lang}",
                        include_code_switches=True,
                    )


def generate_and_plot_cognate_files(
    per_switch_direction,
    results_dir="../../simulations/cog_paper",
    testset="generic",
    simulations=["balanced", "enes", "esen"],
    create_files=True,
    create_csv=True,
    only_last_epoch=True,
    plot_items=True,
):
    for model in simulations:
        cognate_simulations(
            create_files=create_files,
            create_csv=create_csv,
            only_last_epoch=only_last_epoch,
            results_dir=f"{results_dir}/{testset}/{model}",
            models=("cog",),
            plot_items=plot_items,
            per_switch_direction=per_switch_direction,
        )


def plot_regression_analysis_results(
    results_dir="../../mixed_effects_regression_analysis",
):
    plt = Plotter(results_dir=results_dir)
    for fname, ylim in [
        ("cog_enes_esen_sim_per_L1", 3)
    ]:  # , ('cog_enes_esen_sim_per_L2', 30),
        # ('cog_balanced_enes_esen_sim', 26)]:
        plt.plot_merged_cognate_csv(
            df_name=fname, ylim=ylim
        )  # cog_enes_all_esen_all_sim_per_L1')#_per_L2


if __name__ == "__main__":
    # Uncomment the functions below to generate new plots
    # plot_l1_l2_performance_cognate_models()
    # code_switching_patterns_model_comparison()
    # pairwise_cross_model_comparison(create_files=False)
    # non_pairwise_cross_model_comparison(create_csv=False, remove_incorrect_meaning=True)
    # generate_and_plot_cognate_files(per_switch_direction=True, create_files=False)
    plot_regression_analysis_results()

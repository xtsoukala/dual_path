import logging
import os
import shutil
import sys

import numpy as np
import pandas as pd  # future tip: check modin for speed

logging.basicConfig(level=logging.INFO)


def str2bool(v):
    if isinstance(v, bool):
        return v
    return int(v.lower() in ("yes", "true", "t", "1", "flex-true", "flex-false"))


def create_dataframes_for_plots(
    results_dir,
    epoch_from,
    epoch_to,
    simulation_range,
    l2_decimal,
    auxiliary_experiment,
):
    if not os.path.exists(results_dir):
        sys.exit(f"{results_dir} is not an existing path.")

    all_dfs = []
    for network_num in simulation_range:
        temp_df = pd.read_csv(
            f"{results_dir}/{network_num}/test.csv",
            index_col=None,
            header=0,
            skipinitialspace=True,
            dtype={"is_code_switched": str, "meaning": str},
        )
        temp_df["network_num"] = network_num
        all_dfs.append(temp_df)
    df = pd.concat(all_dfs, axis=0, ignore_index=True)
    if epoch_to < df.epoch.max() or epoch_from > df.epoch.min():
        df = df[(df.epoch >= epoch_from) & (df.epoch <= epoch_to)]
    df["switch_from"] = df.message.str[-2:]
    df.meaning = df.meaning.apply(lambda x: str2bool(x))
    df.is_code_switched = df.is_code_switched.apply(lambda x: str2bool(x))
    df.to_csv(f"{results_dir}/all_results.csv", index=False)
    df = pd.read_csv(f"{results_dir}/all_results.csv", low_memory=False)

    df["strict_grammaticality"] = df.target_pos == df.produced_pos  # FIXME
    column_names = [["epoch", "network_num"]]
    if l2_decimal > 0:
        column_names.append(["epoch", "network_num", "switch_from"])
    for idx, group in enumerate(column_names):
        if auxiliary_experiment:
            df_performance = df.groupby(group).apply(
                lambda dft: pd.Series(
                    {
                        "meaning": dft.meaning.sum(),
                        "code_switched": dft[
                            (dft.meaning == 1)
                            & (dft.switched_type != "inter-sentential")
                        ].is_code_switched.sum()
                        if dft[
                            (dft.meaning == 1)
                            & (dft.switched_type != "inter-sentential")
                        ].is_code_switched.sum()
                        > 0
                        else np.nan,
                        "intersentential": len(
                            dft[dft.switched_type == "inter-sentential"]
                        ),
                        "ambiguous": len(dft[dft.switched_type == "ambiguous"]),
                        "alternational": len(dft[dft.switched_type == "alternational"]),
                        "insertional": len(dft[dft.switched_type == "insertional"]),
                        "is_grammatical": dft.is_grammatical.sum(),
                        "strict_grammatical": dft.strict_grammaticality.sum(),
                        "total_sentences": len(dft.meaning),
                        "total_perfect_sentences": len(
                            dft[dft.message.str.contains("PERFECT")].meaning
                        ),
                        "total_progressive_sentences": len(
                            dft[dft.message.str.contains("PROGRESSIVE")].meaning
                        ),
                        "l2_epoch": int(dft.l2_epoch.unique()[0])
                        if "l2_epoch" in dft
                        else 0,
                        "switched_auxiliary_perfect": dft[
                            dft.message.str.contains("PERFECT")
                        ].switched_at_es_en.sum(),
                        "switched_participle_perfect": dft[
                            dft.message.str.contains("PERFECT")
                        ].switched_right_after_es_en.sum(),
                        "switched_auxiliary_prog": dft[
                            dft.message.str.contains("PROGRESSIVE")
                        ].switched_at_es_en.sum(),
                        "switched_participle_prog": dft[
                            dft.message.str.contains("PROGRESSIVE")
                        ].switched_right_after_es_en.sum(),
                        "meaning_perfect": dft[
                            dft.message.str.contains("PERFECT")
                        ].meaning.sum(),
                        "meaning_progressive": dft[
                            dft.message.str.contains("PROGRESSIVE")
                        ].meaning.sum(),
                    }
                )
            )
        else:
            df_performance = df.groupby(group).apply(
                lambda dft: pd.Series(
                    {
                        "meaning": dft.meaning.sum(),
                        "code_switched": dft[
                            (dft.meaning == 1)
                            & (dft.switched_type != "inter-sentential")
                        ].is_code_switched.sum()
                        if dft[
                            (dft.meaning == 1)
                            & (dft.switched_type != "inter-sentential")
                        ].is_code_switched.sum()
                        > 0
                        else np.nan,
                        "intersentential": len(
                            dft[dft.switched_type == "inter-sentential"]
                        ),
                        "ambiguous": len(dft[dft.switched_type == "ambiguous"]),
                        "alternational": len(dft[dft.switched_type == "alternational"]),
                        "insertional": len(dft[dft.switched_type == "insertional"]),
                        "is_grammatical": dft.is_grammatical.sum(),
                        "strict_grammatical": dft.strict_grammaticality.sum(),
                        "total_sentences": len(dft.meaning),
                        "l2_epoch": int(dft.l2_epoch.unique()[0])
                        if "l2_epoch" in dft
                        else 0,
                    }
                )
            )

        df_performance["meaning_percentage"] = (
            df_performance.meaning * 100 / df_performance.total_sentences
        )
        df_performance["grammaticality_percentage"] = (
            df_performance.is_grammatical * 100 / df_performance.total_sentences
        )
        df_performance["strict_grammaticality_percentage"] = (
            df_performance.strict_grammatical * 100 / df_performance.total_sentences
        )
        df_performance["code_switched_percentage"] = (
            df_performance.code_switched * 100 / df_performance.meaning
        )
        df_performance["insertional_percentage"] = (
            df_performance.insertional * 100 / df_performance.meaning
        )
        df_performance["alternational_percentage"] = (
            df_performance.alternational * 100 / df_performance.meaning
        )
        df_performance["ambiguous_percentage"] = (
            df_performance.ambiguous * 100 / df_performance.meaning
        )
        df_performance["intersentential_percentage"] = (
            df_performance.intersentential * 100 / df_performance.meaning
        )

        if auxiliary_experiment:
            df_performance["meaning_perfect_percentage"] = (
                df_performance.meaning_perfect
                * 100
                / df_performance.total_perfect_sentences
            )
            df_performance["meaning_progressive_percentage"] = (
                df_performance.meaning_progressive
                * 100
                / df_performance.total_progressive_sentences
            )
            # df_performance['meaning_perfect'] = df_performance.meaning_correct_perfect * 100 / 350
            # df_performance['meaning_prog'] = df_performance.meaning_correct_prog * 100 / 350
            df_performance["switched_aux_perfect"] = (
                df_performance.switched_auxiliary_perfect
                * 100
                / df_performance.meaning_perfect
            )
            df_performance["switched_participle_perfect"] = (
                df_performance.switched_participle_perfect
                * 100
                / df_performance.meaning_perfect_percentage
            )
            df_performance["switched_aux_prog"] = (
                df_performance.switched_auxiliary_prog
                * 100
                / df_performance.meaning_progressive
            )
            df_performance["switched_participle_prog"] = (
                df_performance.switched_participle_prog
                * 100
                / df_performance.meaning_progressive_percentage
            )
            df_performance["switched_participle_prog_ALT"] = (
                df_performance.switched_participle_prog
                * 100
                / df_performance.meaning_progressive
            )

        fname = "performance" if idx == 0 else "performance_per_lang"
        df_performance.to_csv(f"{results_dir}/{fname}.csv")

    if l2_decimal > 0:  # only save CS-related info if the model is bilingual
        gb = (
            df[df.switched_type != "False"]
            .groupby(["epoch", "switched_type", "pos_of_switch_point", "switch_from"])
            .apply(lambda dft: pd.Series({"code_switched": dft.is_code_switched.sum()}))
        )
        gb.to_csv(f"{results_dir}/code_switch_types.csv")


def copy_files(src, dest, ends_with=None):
    os.makedirs(dest)
    for filename in os.listdir(src):
        if not ends_with or (ends_with and filename.endswith(ends_with)):
            shutil.copyfile(os.path.join(src, filename), os.path.join(dest, filename))

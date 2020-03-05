import torch
from torch import ones, zeros, cat, stack, empty
from torch.multiprocessing import Pool, Process, cpu_count, set_start_method
import lz4.frame as lz4
import numpy as np
import pandas as pd
import os
import sys
import logging
import time
import subprocess
from collections import defaultdict, Counter
from datetime import datetime
from .formatter import InputFormatter, is_not_nan, copy_files, training_is_successful
from .elman_network import SimpleRecurrentNetwork
from .dual_path import DualPath
from .plotter import Plotter
from .corpus_generator import SetsGenerator


def str2bool(v):
    if isinstance(v, bool):
        return v
    return int(v.lower() in ("yes", "true", "t", "1", "flex-true", "flex-false"))


def create_dataframes_for_plots(results_dir, num_sim, epoch_from, epoch_to):
    if not os.path.exists(results_dir):
        sys.exit(f"{results_dir} is not an existing path.")

    all_dfs = []
    for network_num in range(1, num_sim + 1):
        temp_df = pd.read_csv(f'{results_dir}/{network_num}/test.csv', index_col=None, header=0,
                              skipinitialspace=True, dtype={'is_code_switched': str, 'meaning': str})
        temp_df['network_num'] = network_num
        all_dfs.append(temp_df)
    df = pd.concat(all_dfs, axis=0, ignore_index=True)
    if epoch_to < df.epoch.max() or epoch_from > df.epoch.min():
        df = df[(df.epoch >= epoch_from) & (df.epoch <= epoch_to)]
    df['switch_from'] = df.message.str[-2:]
    df.meaning = df.meaning.apply(lambda x: str2bool(x))
    df.is_code_switched = df.is_code_switched.apply(lambda x: str2bool(x))
    df.to_csv(f'{results_dir}/all_results.csv', index=False)

    for idx, group in enumerate([['epoch', 'network_num'], ['epoch', 'network_num', 'switch_from']]):
        df_performance = df.groupby(group).apply(lambda dft: pd.Series(
            {'meaning': dft.meaning.sum(),
             'code_switched': dft[(dft.meaning == 1) & (dft.switched_type != 'inter-sentential')
                                  ].is_code_switched.sum() if dft[(dft.meaning == 1) &
                                                                  (dft.switched_type != 'inter-sentential')
                                                                  ].is_code_switched.sum() > 0 else np.nan,
             'intersentential': len(dft[dft.switched_type == 'inter-sentential']),
             'ambiguous': len(dft[dft.switched_type == 'ambiguous']),
             'alternational': len(dft[dft.switched_type == 'alternational']),
             'insertional': len(dft[dft.switched_type == 'insertional']),
             'is_grammatical': dft.is_grammatical.sum(),
             'total_sentences': len(dft.meaning),
             'l2_epoch': int(dft.l2_epoch.unique()[0]) if 'l2_epoch' in dft else 0
             }))
        df_performance['meaning_percentage'] = df_performance.meaning * 100 / df_performance.total_sentences
        df_performance['grammaticality_percentage'] = (df_performance.is_grammatical * 100 /
                                                       df_performance.total_sentences)
        df_performance['code_switched_percentage'] = df_performance.code_switched * 100 / df_performance.meaning
        df_performance['insertional_percentage'] = df_performance.insertional * 100 / df_performance.meaning
        df_performance['alternational_percentage'] = df_performance.alternational * 100 / df_performance.meaning
        df_performance['ambiguous_percentage'] = df_performance.ambiguous * 100 / df_performance.meaning
        df_performance['intersentential_percentage'] = df_performance.intersentential * 100 / df_performance.meaning

        fname = 'performance' if idx == 0 else 'performance_per_lang'
        df_performance.to_csv(f'{results_dir}/{fname}.csv')

    gb = df[df.switched_type != 'False'].groupby(
        ['epoch', 'switched_type', 'pos_of_switch_point', 'switch_from']).apply(
        lambda dft: pd.Series({'code_switched': dft.is_code_switched.sum()}))
    gb.to_csv(f'{results_dir}/code_switch_types.csv')

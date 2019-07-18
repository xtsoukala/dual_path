import torch
import lzma
import pickle
import numpy as np
import pandas as pd
import os
import sys
import logging
from collections import defaultdict, Counter
from modules.elman_network import SimpleRecurrentNetwork
from modules.formatter import InputFormatter, compute_mean_and_std, extract_cs_keys
from modules.dual_path import DualPath
from modules.plotter import Plotter
import pathos


print(torch.get_default_dtype(), 'default')

mp = pathos.helpers.mp
if torch.cuda.is_available() and torch.get_default_dtype() != 'torch.cuda.FloatTensor':
    print('CUDA available')
    torch.set_default_tensor_type('torch.cuda.FloatTensor')
    # print(torch.get_default_dtype(), 'default')
    mp.set_start_method('spawn', force=True)


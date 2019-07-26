import torch
import lzma
import pickle
import numpy as np
import pandas as pd
import os
import sys
import logging
from collections import defaultdict, Counter
from src.elman_network import SimpleRecurrentNetwork
from src.formatter import InputFormatter, compute_mean_and_std, extract_cs_keys
from src.dual_path import DualPath
from src.plotter import Plotter


if torch.cuda.is_available():
    print('CUDA available')
    torch.set_default_tensor_type('torch.cuda.FloatTensor')

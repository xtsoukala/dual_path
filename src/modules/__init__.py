import torch
from torch import ones, zeros, cat, stack, empty
from torch.multiprocessing import Pool, Process, cpu_count, set_start_method
import lz4.frame as lz4
import pickle
import numpy as np
from numpy import around as round
import pandas as pd
import os
import sys
import logging
import time
import re
import subprocess
from collections import defaultdict, Counter
from datetime import datetime
from .formatter import (InputFormatter, compute_mean_and_std, extract_cs_keys, is_not_nan,
                        copy_files, training_is_successful)
from .elman_network import SimpleRecurrentNetwork
from .dual_path import DualPath
from .plotter import Plotter
from .corpus_generator import SetsGenerator

# if torch.cuda.is_available(): torch.set_default_tensor_type('torch.cuda.FloatTensor')

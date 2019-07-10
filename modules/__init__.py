import torch
import pickle
import numpy as np
import pandas as pd
import os
import sys
from collections import defaultdict, Counter


if torch.cuda.is_available():
    print('CUDA available')
    torch.set_default_tensor_type('torch.cuda.FloatTensor')

#!/usr/bin/python3
import os
import sys

# Include lib to sys.path, to be able to include matrix
sys.path.append(os.path.abspath("../lib"))

import numpy as np
from matrix import gemm

dim = 3 if len(sys.argv) == 1 else int(sys.argv[1])
print(dim)

a = np.random.rand(dim,dim)
b = np.random.rand(dim,dim)
c = np.zeros((dim,dim))

print("a:\n%s" % a)
print("b:\n%s" % b)
print("c:\n%s\n" % c)

z = np.matmul(a, b)
print("z = np.matmul(a, b) =\n%s\n" % z)

gemm(c, a, b)
print("gemm(c, a, b), c =\n%s\n" % c)

print("np.allclose(c, z) = \n%s\n" % np.allclose(c, z))




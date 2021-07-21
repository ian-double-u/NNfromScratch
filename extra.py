from math import exp
import numpy as np

activation_function = lambda x: (exp(x))/(exp(x)+1)
cost_function = lambda out, ex: sum(np.square(np.subtract(out,ex)))
rule_function = lambda output: output.index(max(output)[0])

import sys
import numpy as np
import matplotlib.pyplot as plt
sys.path.append("/home/nivkeren/PycharmProjects/computational-methods/home-work/check-scripts/")
from ex2 import *

i = 0

# def print_qaud_sol(a, b, c):
#     print(f"a={a}, b={b}, c={c}")
#     print(solve_quadratic_equation(a, b, c))
#
#
# def print_linear_sol(A, b):
#     print("A")
#     print(A)
#     print("b")
#     print(b)
#     print("solution")
#     print(solve_linear_system(A, b))
#
#
# def print_try(f, *args):
#     try:
#         global i
#         i += 1
#         print(f"------------------{i}-------------------")
#         f(*args)
#     except Exception as e:
#         print(e)


print("------------------------------#1 plot_linear_func-----------------------------")
try:
    plot_linear_func(1, 0, xstart=-1, xend=1)
    plot_linear_func(2, 2, xstart=-10, xend=10)
    plot_linear_func(-5.5, 5, xstart=0, xend=6)
    plot_linear_func(0, 5, xstart=-2, xend=2)
except Exception as e:
    print(e)

print("--------------------------------#2 plot_quad_func--------------------------------")
try:
    plot_quad_func(1, 0, 0)
    plot_quad_func(2, 1, 10)
    plot_quad_func(0, 1, 1)
    plot_quad_func(-4, 30, -15)
except Exception as e:
    print(e)

print("-----------------------------#3 load_and_plot-------------------------------")
data = ["Ex2/data/data1.npy", "Ex2/data/data2.npy", "Ex2/data/data3.npy",
        "Ex2/data/data4.npy", "Ex2/data/data5.npy"]
# d0 = np.load("Ex2/data/data1.npy").reshape((2, -1))
# d2 = np.load("Ex2/data/data2.npy")
# d3 = np.load("Ex2/data/data3.npy")
# d4 = np.load("Ex2/data/data4.npy")
# d5 = np.load("Ex2/data/data5.npy")
# print(d0.shape)
# print(d2.shape)
#
# plt.plot(d0[0], d0[1], '.')
# plt.show()
# plt.hist(d2.reshape(-1))
# plt.plot(d4, d3.reshape(-1), '.')
# plt.show()
# plt.hist2d(d5[:, 0], d5[:, 1])
# plt.show()
#
try:
    load_and_plot(data)
except Exception as e:
    print(e)

    line = f"File NO. {i}: vec {i} is of size {arr.size} and shape {arr.shape}, and its mean values is {mean}\n"
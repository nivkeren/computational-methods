import sys
import numpy as np
sys.path.append("/home/nivkeren/PycharmProjects/computational-methods/home-work/check-scripts/")
from ex1 import *

i = 0


def print_qaud_sol(a, b, c):
    print(f"a={a}, b={b}, c={c}")
    print(solve_quadratic_equation(a, b, c))


def print_linear_sol(A, b):
    print("A")
    print(A)
    print("b")
    print(b)
    print("solution")
    print(solve_linear_system(A, b))


def print_try(f, *args):
    try:
        global i
        i += 1
        print(f"------------------{i}-------------------")
        f(*args)
    except Exception as e:
        print(e)


print("------------------------------#1 solve_quadratic_equation-----------------------------")

print_try(print_qaud_sol, *(1, 0, -1))
print_try(print_qaud_sol, *(1, 0, 1))
print_try(print_qaud_sol, *(0, 1, -1))
print_try(print_qaud_sol, *(1, -2, 1))
print_try(print_qaud_sol, *(1.2, -2.5, 0))

print("--------------------------------#2 array35--------------------------------")
try:
    print(array35())
except Exception as e:
        print(e)

print("-----------------------------#3 solve_linear_system-------------------------------")

A = np.arange(1, 5).reshape((2, 2))
b = np.array([1, 1]).reshape((-1, 1))
print_try(print_linear_sol, *(A, b))

A = np.array([[1, 2, 0], [4, 5, 6], [3, 7, 8]]).reshape((3, 3))
b = np.array([1, 1, 1]).reshape((-1, 1))
print_try(print_linear_sol, *(A, b))

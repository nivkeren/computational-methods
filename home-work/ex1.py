import numpy as np


def solve_quadratic_equation(a,b,c):

    r1=(-b + (np.sqrt(b * b - 4 * a *c))) / (2 * a)
    r2=(-b - (np.sqrt(b * b - 4 * a *c))) / (2 * a)
    if ((b * b - 4 * a *c)<0):
        print('No real solution')
        return 0
    else:
        print('Solutions are:')
        if (r1==r2):
            print(r1)
        else:
            print(r1,r2)
        return(r1,r2)


def array35():
    v=range(1,36)
    print('array 1:')
    for i in v:
        print(i)
    matrix_a=np.reshape(v,(5,7))
    print('matrix 1:')
    for i in matrix_a:
        print(i)
    matrix_b=np.transpose(matrix_a)
    print('matrix 2:')
    for i in matrix_b:
        print(i)
    return(v,matrix_a,matrix_b)

def solve_linear_system(x,y):
    inv=np.linalg.inv(x)
    solution = np.dot(inv,y)
    print(solution)
    return(solution)
# p=np.matrix([[1,2],[3, 4]])
# q=np.matrix([[1],[1]])
# solve_linear_system(p,q)

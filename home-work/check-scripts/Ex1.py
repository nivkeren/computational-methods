import numpy as np
def equation_quadratic_s(a,b,c):
    sqrt=b**2-4*a*c
    if sqrt>0:
        x1=(-b+sqrt**(1/2))/(2*a)
        x2=(-b-sqrt**(1/2))/(2*a)
        return x1,x2
    else:
        print('n real No ')
        return 0
def array35():
    v = np.arange(1,36)
    rows = v.reshape((5, 7))
    b = v.reshape((35,1))
    columns = b.reshape(7,5).swapaxes(0,1)
    return v, rows, columns
def m_linear_solve(matrix1, matrix2):
    return np.linalg.solve(matrix1,matrix2)
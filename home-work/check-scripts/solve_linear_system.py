import numpy as np

def solve_linear_system (matrix,vector):
    x=np.linalg.solve(matrix,vector)

    return (x)

#def main():
 #   m = int(input("Enter value for m:"))
  #  a = np.random.random((m, m))
   # b = np.random.random((m, 1))
    #print (solve_linear_system(a,b))

#if __name__=="__main__":
 #   main()

import numpy as np
def array35():
    v=[]
    for i in range (1,36):
        v.append(i)
    array1=np.reshape(v, (5, 7))
    array2 = np.reshape(v, (7, 5))
    return (v,array1,array2)

#def main():
 #   for i in array35():
  #      print (i)

#main()
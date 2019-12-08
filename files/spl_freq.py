import numpy as np

hz = np.concatenate((np.arange(20, 110, 10), np.arange(200, 1100, 100), np.array([1500]), np.arange(2000, 11000, 1000)))
spl = np.array([77, 66, 59, 54, 49, 46, 42, 40, 38, 22,
                14, 9, 6, 3.5, 2.5, 1.4, 0.7, 0, -1, -3,
                -8, -7, -2, 2, 7, 9, 11, 12])

np.save("hz.npy", hz)
np.save('spl.npy', spl)
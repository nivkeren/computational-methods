import numpy as np

def n_quadratic_s(a, b, c):
	a = float(a)
	b = float(b)
	c = float(c)
	if a == 0:
		if b != 0:
			return -(c/b), -(c/b)
		else:
			if c!=0:
				print("No real solution")
				return 0

	else:

		if ((b**2)-(4*(a*c)))<0:
			print('"No real solution"')
			return 0
		else:
			return ((-b+(((b**2)-(4*(a*c))))**0.5)/(2*a), (-b-(((b**2)-(4*(a*c))))**0.5)/(2*a))

def array35():
	v = np.arange(35)
	v+=1
	a = np.reshape(v,(5, 7))
	b = np.transpose(a)
	return (v, a, b)

def system_linear_s(m, s):
	m = np.linalg.inv(m)
	return m.dot(s)


	




import numpy as np

marginErr = 0.001
x = 1
y = 1
err = 1
while (err > marginErr):
    f =  np.power(x-3, 2) + np.power(y-2, 2)
    f_old = f
    fx = 2 * x - 6
    fy = 2 * y - 4
    pass

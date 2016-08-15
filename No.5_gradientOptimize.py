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
    coe_g = np.array(([np.power(fx, 2) + np.power(fy, 2), 2*(x-3)*fx + 2*(y-2)*fy]))
    diff_g = np.array(([2*coe_g[0], coe_g[1]]), dtype = np.float)
    h_solved = diff_g[1] / diff_g[0]
    x = x - fx*h_solved
    y = y - fy*h_solved
    f =  np.power(x-3, 2) + np.power(y-2, 2)
    if (f == 0):
        err = 0
    else:
        err = np.abs((f - f_old) / f)

posMin = [x, y]

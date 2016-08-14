import numpy as np

x = 1
i = np.array(range(0,11),dtype = object)
h = 2 * np.power(10, -i)
y = 25 * np.power(x, 3) - 6 * np.power(x, 2) + 7 * x - 88
y1 = 75 * np.power(x, 2) - 12 * x + 7
y2 = 150 * x - 12
f = y + y1 * h + y2 * np.power(h, 2) / 2;
err = np.zeros(11)
err[0] = 1
for n in range(1, 11):
    err[n] = (f[n] - f[n-1]) / f[n]

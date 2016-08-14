import numpy as np

xLeft = 0.5
xRight = 1.0
marginErr_bisect = 0.01
marginErr_fp = 0.002
marginErr_NR = 0.001

#------------- Bisection method ------------------#
xi = xLeft
xu = xRight
xr = 0
xr_old = 0
err = 1
while (err > marginErr_bisect):
    xr = (xi+xu) / 2
    fi = -26 + 85*xi - 91*np.power(xi, 2) + 44*np.power(xi, 3) - 8*np.power(xi, 4) + np.power(xi, 5)
    fr = -26 + 85*xr - 91*np.power(xr, 2) + 44*np.power(xr, 3) - 8*np.power(xr, 4) + np.power(xr, 5)
    if (fi * fr < 0):
        xu = xr
    elif (fi * fr > 0):
        xi = xr
    elif (fi * fr == 0):
        root_bisect = xr
    err = abs((xr - xr_old) / xr)
    xr_old = xr

root_bisect = xr

#------------ False-position method --------------#
xi = xLeft
xu = xRight
xr = 0
xr_old = 0
err = 1
while (err > marginErr_fp):
    fi = -26 + 85*xi - 91*np.power(xi, 2) + 44*np.power(xi, 3) - 8*np.power(xi, 4) + np.power(xi, 5)
    fu = -26 + 85*xu - 91*np.power(xu, 2) + 44*np.power(xu, 3) - 8*np.power(xu, 4) + np.power(xu, 5)
    xr = xu - (fu * (xi - xu)) / (fi - fu)
    fr = -26 + 85*xr - 91*np.power(xr, 2) + 44*np.power(xr, 3) - 8*np.power(xr, 4) + np.power(xr, 5)
    if (fi * fr < 0):
        xu = xr
    elif (fi * fr > 0):
        xi = xr
    elif (fi * fr == 0):
        root_fp = xr;
    err = abs((xr - xr_old) / xr);
    xr_old = xr;

root_fp = xr;

#------------ Newton-Raphson method --------------#
x = 1
x_old = 0
err = 1
while(err > marginErr_NR):
    fx = -26 + 85*x - 91*np.power(x, 2) + 44*np.power(x, 3) - 8*np.power(x, 4) + np.power(x, 5)
    fx_1d = 85 - 182*x + 132*np.power(x, 2) - 32*np.power(x, 3) + 5*np.power(x, 4)
    x_old = x
    x = x - float(fx) / fx_1d
    err = abs((x - x_old) / x)
    
root_NR = x

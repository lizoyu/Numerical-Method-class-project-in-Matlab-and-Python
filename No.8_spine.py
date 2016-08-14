import numpy as np
import matplotlib.pyplot as plt
from scipy import interpolate

# Since realization of mouse clicking for outline of hand in Python requires
# much unrelated effort, here we simply read the coordinate from files
x, y = np.loadtxt(handOutline, delimiter = ',', unpack = True)

#------------ spline and cubic Hermite interpolation -------------#
n = np.size(x)
s = np.transpose(np.arange(1, n, 1))
t = np.transpose(np.arange(1, n, 0.05))

u = np.interpolate.splrep(s,x)
u = np.interpolate.splev(s,u)
v = np.interpolate.splrep(s,y)
v = np.interpolate.splev(s,v)

a = np.interpolate.interp1d(s,x, kind = 'cubic')
b = np.interpolate.interp1d(s,y, kind = 'cubic')
#---------- spline interpolation in polar coordinates -----------#
r = np.sqrt(np.power(x,2)+np.power(y,2))
ta = np.arctan2(y,x)
n = np.size(ta)
s = np.transpose(np.arange(1, n, 1))
t = np.transpose(np.arange(1, n , 0.05))

c = np.interpolate.splrep(s,ta)
c = np.interpolate.splev(s,c)
d = np.interpolate.splrep(s,r)
d = np.interpolate.splev(s,d)
#---------------------------- plot -----------------------------#

plt.subplot(2,1,1)
plt.plot(x,y,'.g')
plt.plot(u,v,'b')
plt.plot(a,b,'r')
plt.title('Outline of hand in Cartesian coordinate')
plt.legend('input point','spline','cubic Hermite')

plt.subplot(2,1,2)
plt.polar(c,d)                 
plt.polar(c,d,'.')
plt.title('Outline of hand in polar coordinate')

plt.show()

import numpy as np
import matplotlib.pyplot as plt

n = 70
x = np.linspace(-1,1,600)
x1 = np.linspace(-1,1,n+1)
x2 = np.column_stack((-np.random.random((1,n/2)), 0, np.random.random((1,n/2)))).reshape((71,))
y2 = 1 / (1 + 25*np.power(x2, 2))
y1 = 1 / (1 + 25*np.power(x1, 2))
y = 1 / (1 + 25*np.power(x, 2))

#------------------------------------------ Newton interpolation ---------------------------------------#
fdd1 = np.zeros((n+1,n+1))
fdd2 = np.zeros((n+1,n+1))
fdd1[:,0] = np.transpose(y1)
fdd2[:,0] = y2
for j in range(1, n+1):
    for i in range(j, n+1):
        fdd1[i,j] = (fdd1[i,j-1] - fdd1[i-1,j-1]) / (x1[i] - x1[0])
        fdd2[i,j] = (fdd2[i,j-1] - fdd2[i-1,j-1]) / (x2[i] - x2[0])

xt1 = 1
yt1 = y1
xt2 = 1
yt2 = y2
for k in range(1, n+1):
    xt1 = xt1 * (x1[k] - x1[k-1])
    yt1 = yt1 + fdd1[k,k]*xt1
    xt2 = xt2 * (x2[k] - x2[k-1])
    yt2 = yt2 + fdd2[k,k]*xt2

#--------------------------------------------------- plot ----------------------------------------------#
plt.subplot(211)
plt.plot(x1,yt1,'r')
plt.scatter(x1,yt1)
plt.plot(x,y,'b')

plt.subplot(212)
plt.plot(x2,yt2,'r')
plt.scatter(x2,yt2)
plt.plot(x2,y2,'b')

plt.show()

import numpy as np
import matplotlib.pyplot as plt

y = np.array(([75.995,91.972,105.711,123.203,131.669,150.697,179.323,203.212,226.505,249.633,281.422]))
y = np.reshape(y,(11,1))
t = np.arange(1900, 2010, 10, dtype = object).reshape(11,1)
n = 11
sumt = sum(t)
sumy = sum(y)
sumty = sum(t*y)
sumt2 = sum(t*t)
t2 = np.power(t, 2)     
t3 = t2 * t
t4 = t3 * t         
t5 = t4 * t 

#-------- fitting order: 1 ---------#
a1 = (n*sumty - sumt*sumy) / (n*sumt2 - np.power(sumt, 2))
a0 = (sumy - a1*sumt) / n
y1 = a0 + a1*t
#plt.plot(t, y1)
#plt.plot(t, y, 'ro')
#plt.show()

#-------- fitting order: 2 - 5 ---------#
y_all = y1
X_ex = np.zeros((11,6))
X_ex[:,0] = 1
X_ex[:,1] = t[0:11].reshape(11)
X_ex[:,2] = t2[0:11].reshape(11)
X_ex[:,3] = t3[0:11].reshape(11)
X_ex[:,4] = t4[0:11].reshape(11)
X_ex[:,5] = t5[0:11].reshape(11)

for order in range(2,6):
    X = X_ex[:,0:order + 1]
    a = np.dot(np.dot(np.linalg.pinv(np.dot(np.transpose(X), X)), np.transpose(X)), y)
    y_order = 0
    for n in range(0, order+1):
        y_order = y_order + a[n]*np.power(t, n)

    y_all = np.column_stack((y_all, y_order))

#plt.plot(t, y_all[:,order])
#plt.plot(t, y, 'ro')
#plt.show()

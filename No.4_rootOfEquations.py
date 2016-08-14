import numpy as np

A = np.array(([2,0,0,0],[4,3,0,0],[.5,.5,.5,0],[2,3,1,-3]),dtype=np.float)
A = np.column_stack((A, np.eye(4)))
for k in range(0,3):
    for i in range(k+1,4):
        fac = A[i,k] / A[k,k]
        for j in range(k,4):
            A[i,j] = A[i,j] - fac*A[k,j]

U = A[0:4,0:4]                      
L = A[0:4,4:8]
b = np.array(([6],[4],[5],[2]))
d = np.dot(L, b)
x = np.dot(np.linalg.pinv(U),d)

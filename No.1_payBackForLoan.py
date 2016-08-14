import numpy as np

def payBackForLoan(P, i, n):
    amount = np.zeros(n)
    for j in range(0,n):
        amount[j] = P*i*np.power(1+i,j+1)/(np.power(1+i,j+1)-1)
    return amount

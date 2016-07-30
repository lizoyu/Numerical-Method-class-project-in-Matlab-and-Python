% Solve the following martix equation:
% [2 0 0 0; 4 3 0 0;0.5 0.5 0.5 0;2 3 1 -3] = [6 4 5 2]
% We first use Gaussian Elimination to get the Row Echelon Form of this
% martix, then LU decomposition to get the answer.

A=[2 0 0 0; 4 3 0 0;0.5 0.5 0.5 0;2 3 1 -3];       
A=[A eye(4)];
% Gaussian Elimination
for k=1:3                                 
    for i=k+1:4
        fac=A(i,k)/A(k,k);
        for j=k:4
            A(i,j)=A(i,j)-fac*A(k,j);
        end
    end
end
% LU decomposition
U = A(1:4,1:4);                            
L = A(1:4,5:8);                         
b = [6;4;5;2];                               
d = L * b;                               
x = inv(U) * d;


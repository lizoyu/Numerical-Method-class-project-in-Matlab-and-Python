% Finite differences for boundary value problem
%   - calculate the matrix of finite differences and solve A*X = B
%input:
% a,b - lower and upper range of interval
% alpha,beta - boundary value of a and b, eg. x(a), x(b)
% h - step size
% p,q,r - coefficients of first order, zero order, and constant of equation
% t_solution - where the solution lies, eg. t in x(t)
%output:
% X - arrays containing all values
% solution - result values, eg. x(t)
%--------------------------------------------------%
a = 0; b = 1; alpha = 1; beta = 1; h = 0.001;
p = @(t) 0; q = @(t) (1-2*t).^2; r = @(t) 0;
t_solution = 0.5;
%--------------------------------------------------%
t = h:h:b; N = (b - a) / h;
% calculate the central diagonal of A
if(numel(q(t))==1)
    diagonal = zeros(N,1);
    diagonal(:) = 2;
else
    diagonal = 2 + h^2*q(t); 
end
% calculate the left and right diagonal of A
if(numel(p(t))==1)
    left = zeros(N-1,1);
    left(:) = -1;
    right = left;
else
    left = -h*p(t(2:end))/2 - 1; 
    right = h*p(t(1:end-1))/2 - 1;
end
% construct the matrix B
B = zeros(N,1);
if(numel(r(t))==1)
    B(1) = alpha*(h*p(h)/2 + 1);
    B(end) = beta*(-h*p(b)/2 + 1);
else
    B = -h^2*r(t);
    B(1) = B(1) + alpha*(h*p(h)/2 + 1);
    B(end) = B(end) + beta*(-h*p(b)/2 + 1);
end
% construct the matrix A
A = zeros(N); 
A(1,1:2) = [diagonal(1) right(1)];
A(end,end-1:end) = [left(end) diagonal(end)];
for i = 2:N-1
    A(i,i-1:i+1) = [left(i-1) diagonal(i) right(i)];
end
% solve the matrix equation A*X = B
X = pinv(A) * B;
% get the result we want from matrix X
solution = X(round(t_solution/h));
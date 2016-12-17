% Trapzoidal for integral approximation
%   - calculate the integral by approximation using trapzoids with very
%   small height (width).
%input:
%	- a,b: lower and upper range of the integral
%	- h: step size (width of each trapezoid)
%   - f: equation
%output:
%	- area: integral (area below the curve)
%--------------------------------------------------%
a = 0; b = 2; h = 0.001;
x = a:h:b;
f = @(x) exp(x.^2);
%--------------------------------------------------%
area = sum((f(x(2:end))+f(x(1:end-1)))*h/2);
% Use 2nd Taylor series to approximate the following functions:
% fx = 25*x^3 - 6*x^2 + 7*x - 88,
% where x(i) = 1, h = 2*10.^-i (i = 0:10)
% Calculate fx in each h, and relative error.

x = 1;
i = [0:10];
h = 2 * 10.^-i;
y = 25*x^3 - 6*x^2 + 7*x - 88;
y1 = 75*x^2 - 12*x + 7;
y2 = 150*x - 12;
f = y + y1*h + y2*(h.^2)/2;
err = zeros(1,11);
err(1) = 1;
for n = 2:11
    err(n) = (f(n) - f(n-1)) / f(n);
end
[f; err]
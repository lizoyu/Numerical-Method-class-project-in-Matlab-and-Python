% 1st-order Heun's method for initial value problems in differential equations
%input:
% a,b - the lower and upper range of interval
% h - step size
% f - 1st-order equation
% y - initial value
%output:
% Y - arrays containing all calculated values
%--------------------------------------------------%
a = 0; b = 1; h = 0.001;
y = 1;
f = @(t,y) (1-2*t).^2*y;
%--------------------------------------------------%
t = a;
Y = zeros(1,(b-a)/h); i = 1;
while(t < b)
    Y(i) = y; i = i+1;
    p = y + h*f(t,y);
    t = t + h;
    y = y + h*(f(t-h,y) + f(t,p))/2;
end
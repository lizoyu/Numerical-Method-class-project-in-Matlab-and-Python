% Heun's method for initial value problem in differential equations
a = 0; b = 1; M = 100000;
h = (b - a) / M;
t = 0; y = 1;

while(t < b)
    p = y + h*(1-2*t)^2*y;
    t = t + h;
    y = y + h*((1-2*(t-h))^2*y + (1-2*t)^2*p)/2;
end
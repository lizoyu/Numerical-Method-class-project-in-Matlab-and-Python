% Linear shooting with Heun's method for boundary value problem
% Second-order Heun's method (modified)
a = 0; b = 1; h = 0.001;
z = -0.16575; x = 1; X = 0;

t = 0;
while(t < b)
    p1 = z + h*(1-2*t)^2*x;
    p2 = x + h*z;
    
    t = t + h;
    x = x + h*(z + p1)/2;
    X(end+1) = x;
    
    z = z + h*((p1-z)/h + (1-2*t)^2*p2)/2;
end

X = X(2:end);
plot(X)
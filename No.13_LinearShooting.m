% Linear shooting with Heun's method for boundary value problem
% Second-order Heun's method
%   - divide the boundary problem into two initial value problem u and v,
%   then solve the linear shooting equation.
%input:
% a,b - lower and upper range of interval
% h - step size
% f - equation to be solved
% x,y - initial values of zero order
% t_solution - where the solution lies, eg. x(t)
%output:
% x - array containing all values
% x_solution - the result value, eg. x(t)
%--------------------------------------------------%
a = 0; b = 1; h = 0.001;
f = @(t,x) (1-2*t).^2*x;
x = 1; y = 1; t_solution = 0.5;
%--------------------------------------------------%
t = a; z_u = 0; z_v = 1;                % z - initial value of 1st order
u = x; v = 0;                           % initial value of u and v
U = zeros(1,(b-a)/h); V = U; i = 1;  % array of calculated values
while(t < b)
    p1_u = z_u + h*f(t,u);
    p2_u = u + h*z_u;
    p1_v = z_v + h*f(t,v);
    p2_v = u + h*z_v;
    
    t = t + h;
    u = u + h*(z_u + p1_u)/2;
    v = v + h*(z_v + p1_v)/2;
    U(i) = u; V(i) = v; i = i+1;
    z_u = z_u + h*((p1_u-z_u)/h + f(t,p2_u))/2;
    z_v = z_v + h*((p1_v-z_v)/h + f(t,p2_v))/2;
end
if(v(end)==0)
    x = U(round(t_solution/h));
else
    x = U + V*(y-U(end))/V(end);
end
x_solution = x(round(t_solution/h));
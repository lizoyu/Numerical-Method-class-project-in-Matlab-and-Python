% Finite differences for boundary value problem
a = 0; b = 1; x = 1; h = 0.001;
t = h:h:b; N = (b - a) / h;

center = 2+ h^2*(1-2*t).^2;
A = zeros(1000); B = zeros(1000,1);
A(1,1:2) = [center(1) -1];
A(end,end-1:end) = [-1 center(end)];
B(1) = 1; B(end) = 1;

for i = 2:N-1
    A(i,i-1:i+1) = [-1 center(i) -1];
end

X = pinv(A) * B;
solution = X(N/2);
% 2D Nelder-Mead method for local minimum
%   - use three initial points, form a triangle, then look for a new points
%   for a new smaller triangle containing the local minimum, until error
%   threshold.
%input:
% x,y - three initial point, x for x axis, y for y axis
% f - the equation
% thres - relative error threshold
%output:
% value_array - the calculation results of all iterations
% value - the final results
%--------------------------------------------------%
x = [0 0 1];
y = [0 1 0];
f = @(x,y) 5*exp(2*x) - 4*exp(x) + 8*y.*exp(x) + 4*y.^2 + 7;
thres = 0.001;
%--------------------------------------------------%
V = f(x,y);
pyramid = (sortrows([x; y; V]', 3))';
B = pyramid(:,1); G = pyramid(:,2); W = pyramid(:,3);
center = (B(1:2)+G(1:2)+W(1:2)) / 3;
value = f(center(1),center(2));

value_array = 0;
error = 1;
while (error > thres)
    M = (B(1:2)+G(1:2)) / 2;
    R = 2*M - W(1:2);
    R(end+1) = f(R(1),R(2));
    if (R(3) < W(3))
        E = 2*R(1:2) - M(1:2);
        E(end+1) = f(E(1),E(2));
        if(E(3) < R(3))
            W = E;
        else
            W = R;
        end
    else if(R(3) == W(3))
            C1 = (W(1:2) + M(1:2)) / 2;
            C2 = (M(1:2) + R(1:2)) / 2;
            C1(end+1) = f(C(1),C(2));
            C2(end+1) = f(C(1),C(2));
            if (C1(3) < C2(3))
                C = C1;
            else
                C = C2;
            end
            if (C(3) < W(3))
                W = C;
            else
                G = M;
                S = (B(1:2) + W(1:2)) / 2;
                S(end+1) = f(S(1),S(2));
                W = S;
            end
        end
    end
    pyramid = (sortrows([B G W]', 3))';
    B = pyramid(:,1); G = pyramid(:,2); W = pyramid(:,3);
    center = (B(1:2)+G(1:2)+W(1:2)) / 3;
    value_old = value;
    value = f(center(1),center(2));
    value_array(end+1) = value;
    error = abs((value-value_old)/value_old);
end
value_array = value_array(2:end);
% B: Best; G: Great; W: Worse;
x = [0 0 1];
y = [0 1 0];
V = 5*exp(2*x) - 4*exp(x) + 8*y.*exp(x) + 4*y.^2 + 7;
pyramid = (sortrows([x; y; V]', 3))';
B = pyramid(:,1); G = pyramid(:,2); W = pyramid(:,3);
center = (B(1:2)+G(1:2)+W(1:2)) / 3;
value = 5*exp(2*center(1)) - 4*exp(center(1)) + 8*center(2).*exp(center(1)) + 4*center(2).^2 + 7;

value_array = 0;
error = 1;
while (error > 0.001)
    M = (B(1:2)+G(1:2)) / 2;
    R = 2*M - W(1:2);
    R(end+1) = 5*exp(2*R(1)) - 4*exp(R(1)) + 8*R(2).*exp(R(1)) + 4*R(2).^2 + 7;
    if (R(3) < W(3))
        E = 2*R(1:2) - M(1:2);
        E(end+1) = 5*exp(2*E(1)) - 4*exp(E(1)) + 8*E(2).*exp(E(1)) + 4*E(2).^2 + 7;
        if(E(3) < R(3))
            W = E;
        else
            W = R;
        end
    else if(R(3) == W(3))
            C1 = (W(1:2) + M(1:2)) / 2;
            C2 = (M(1:2) + R(1:2)) / 2;
            C1(end+1) = 5*exp(2*C1(1)) - 4*exp(C1(1)) + 8*C1(2).*exp(C1(1)) + 4*C1(2).^2 + 7;
            C2(end+1) = 5*exp(2*C2(1)) - 4*exp(C2(1)) + 8*C2(2).*exp(C2(1)) + 4*C2(2).^2 + 7;
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
                S(end+1) = 5*exp(2*S(1)) - 4*exp(S(1)) + 8*S(2).*exp(S(1)) + 4*S(2).^2 + 7;
                W = S;
            end
        end
    end
    pyramid = (sortrows([B G W]', 3))';
    B = pyramid(:,1); G = pyramid(:,2); W = pyramid(:,3);
    center = (B(1:2)+G(1:2)+W(1:2)) / 3;
    value_old = value;
    value = 5*exp(2*center(1)) - 4*exp(center(1)) + 8*center(2).*exp(center(1)) + 4*center(2).^2 + 7;
    value_array(end+1) = value;
    error = abs((value-value_old)/value_old);
end
value_array = value_array(2:end);
value
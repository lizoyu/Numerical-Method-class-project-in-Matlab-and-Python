% Richardson extropolation for integral approximation
R = zeros(3);
R(1:3,1) = [T1 T2 T3]';

for K = 2:3
    for J = K:3
        R(J,K) = (4^(K-1)*R(J,K-1)-R(J-1,K-1))/(4^(K-1)-1);
    end
end

result = R(3,3);
R
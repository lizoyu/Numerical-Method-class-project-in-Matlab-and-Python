% 2nd-order Richardson extropolation for integral approximation
%   - use three results from trapzoidal to get the integral result with
%   higher accuracy.
%input:
% T1,T2,T3 - three results from trapzoidal
%output:
% result
%--------------------------------------------------%
R = zeros(3);
R(1:3,1) = [T1 T2 T3]';
%--------------------------------------------------%
for K = 2:3
    for J = K:3
        R(J,K) = (4^(K-1)*R(J,K-1)-R(J-1,K-1))/(4^(K-1)-1);
    end
end

result = R(3,3);
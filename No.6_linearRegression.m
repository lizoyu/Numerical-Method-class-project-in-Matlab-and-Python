% Realize polynomial regression of data of US population from 1900 to 2000,
% with fitting order from 1 to 5.
% Extra requirement: Use Gaussian Elimination to solve the problem.

y = [ 75.995  91.972 105.711 123.203 131.669 150.697 ...
     179.323 203.212 226.505 249.633 281.422]';    % US population
t = (1900:10:2000)';                               % Years
n = 11;
sumt = sum(t(:));
sumy = sum(y(:));
sumty = sum(t.*y(:));
sumt2 = sum(t.*t(:));   
t2 = t.^2;        
t3 = t.^3;          
t4 = t.^4;        
t5 = t.^5;      

%-------- fitting order: 1 ---------%
a1 = (n * sumty - sumt * sumy) / (n * sumt2 - sumt^2);
a0 = (sumy - a1 * sumt)/n;
y1  = a0+a1*t;
%plot(t,y1);
%hold on
%plot(t,y,'.');

%-------- fitting order: 2 - 5 ---------%
y_all = y1;
X_ex = zeros(11,6);
X_ex(:,1) = 1;
X_ex(:,2) = t(1:11);
X_ex(:,3) = t2(1:11);
X_ex(:,4) = t3(1:11);
X_ex(:,5) = t4(1:11);
X_ex(:,6) = t5(1:11);

for order = 2:5
    X = X_ex(:,1:order + 1);
    a = pinv(X'* X) * X'* y;
    y_order = 0;
    for n = 1:order+1
        y_order = y_order + a(n)*t.^(n-1);
    end
    y_all = [y_all y_order];
    %plot(t,y_all(:,order));
    %hold on
    %plot(t,y,'.');
end
% Use n-order Newton interpolation for the following function:
%    f(x) = 1 / (1 + 25*x^2), x=[-1,1]
% Extra requirements as follow:
% 1) When x is uniformly distributed
% 2) When x is non-uniformly distributed

n = 70; % order
x = linspace(-1,1,600);  % original function
x1 = linspace(-1,1,n+1); % uniformly distributed
x2 = sort([-rand(1,n/2) 0 rand(1,n/2)]); % randomly distributed 
y2 = 1 ./ (1 + 25*x2.^2);
y1 = 1 ./ (1 + 25*x1.^2);
y = 1 ./ (1 + 25*x.^2);
%%------------------------------------------ Newton interpolation ---------------------------------------%%
fdd1 = zeros(n+1,n+1);
fdd2 = zeros(n+1,n+1);
fdd1(:,1) = y1;
fdd2(:,1) = y2;
for j = 2:n+1            % construct target matrix
    for i = j:n+1
        fdd1(i,j) = (fdd1(i,j-1) - fdd1(i-1,j-1)) / (x1(i) - x1(1));
        fdd2(i,j) = (fdd2(i,j-1) - fdd2(i-1,j-1)) / (x2(i) - x2(1));
    end
end
xt1 = 1;
yt1 = y1;
xt2 = 1;
yt2 = y2;
for k = 2:n+1
    xt1 = xt1 * (x1(k) - x1(k-1));      % iteration for interpolation function
    yt1 = yt1 + fdd1(k,k)*xt1;
    xt2 = xt2 * (x2(k) - x2(k-1));
    yt2 = yt2 + fdd2(k,k)*xt2;
end
%%--------------------------------------------------- plot ----------------------------------------------%%
shg
clf reset
subplot(2,1,1)
plot(x1,yt1,'r');
hold on
scatter(x1,yt1,'r','.');
plot(x,y,'b');
hold off
title('uniformly distributed interpolation')
xlabel('x')
ylabel('y')
legend('interpolation','','original')

subplot(2,1,2)
plot(x2,yt2,'r');
hold on
scatter(x2,yt2,'r','.');
plot(x2,y2,'b');
title('non-uniformly distributed interpolation')
xlabel('x')
ylabel('y')
legend('interpolation','','original')
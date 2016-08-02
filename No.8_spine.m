% Use Spine interpolation to realize outline of hands
% Extra requirement:
% 1) try to use both Cartesian and polar coordinates
% 2) try to use both spline and cubic Hermite interpolation

%----------- put your hand on screens and click around -----------%
figure('position',get(0,'screensize'))
axes('position',[0 0 1 1])
[x,y] = ginput;
%------------ spline and cubic Hermite interpolation -------------%
n = length(x);
s = (1:n)';
t = (1:.05:n)';
u = splinetx(s,x,t);
v = splinetx(s,y,t);
a = pchiptx(s,x,t);
b = pchiptx(s,y,t);
%---------- spline interpolation in polar coordinates -----------%
r = sqrt(x.^2+y.^2);
ta = atan2(y,x);
n = length(ta);
s = (1:n)';
t = (1:.05:n)';
c = splinetx(s,ta,t);
d = splinetx(s,r,t);
%---------------------------- plot -----------------------------%
clf reset
subplot(2,1,1)
plot(x,y,'.','Color','g');
hold on
plot(u,v,'b');
plot(a,b,'r');
title('Outline of hand in Cartesian coordinate')
legend('input point','spline','cubic Hermite')
subplot(2,1,2)
polar(c,d); 
hold on                         
polar(c,d,'.');
title('Outline of hand in polar coordinate')
% Trapziodal for integral approximation
a = 0; b = 2; M = 1000;
%h = abs(b-a) / M;
h = 0.001;

lowers = exp(-(a:h:(b-h)).^2);
uppers = exp(-((a+h):h:b).^2);
T3 = sum((uppers+lowers)*h/2);
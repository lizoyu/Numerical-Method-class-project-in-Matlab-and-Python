% Use bisection method, false-position method and Newton-Raphson method to
% calculate the root of the following function:
% f(x) = -26 + 85x - 91x^2 + 44x^3 - 8x^4 + x^5
% For bisection: range is [0.5, 1.0], margin of error is 1%;
% For false-position: range is [0.5, 1.0], margin of error is 0.2%;
% For Newton-Raphson: x0 = 1.0, margin of error is 0.1%

xLeft = 0.5;
xRight = 1.0;
marginErr_bisect = 0.01;
marginErr_fp = 0.002;
marginErr_NR = 0.001;

%------------- Bisection method ------------------%
xi = xLeft;
xu = xRight;
xr = 0;
xr_old = 0;
err = 1;
while (err > marginErr_bisect)
    xr = (xi+xu) / 2;
    fi=-26+85*xi-91*xi^2+44*xi^3-8*xi^4+xi^5;
    fr=-26+85*xr-91*xr^2+44*xr^3-8*xr^4+xr^5;
    if (fi * fr < 0)
        xu = xr;
    else if (fi * fr > 0)
        xi = xr;
        else if (fi * fr == 0)
            root_bisect = xr;
            end
        end
    end
    err = abs((xr - xr_old) / xr);
    xr_old = xr;
end
root_bisect = xr;
%-------------------------------------------------%

%------------ False-position method --------------%
xi = xLeft;
xu = xRight;
xr = 0;
xr_old = 0;
err = 1;
while (err > marginErr_fp)
    fi=-26+85*xi-91*xi^2+44*xi^3-8*xi^4+xi^5;
    fu=-26+85*xu-91*xu^2+44*xu^3-8*xu^4+xu^5;
    xr = xu - (fu * (xi - xu)) / (fi - fu);
    fr=-26+85*xr-91*xr^2+44*xr^3-8*xr^4+xr^5;
    if (fi * fr < 0)
        xu = xr;
    else if (fi * fr > 0)
        xi = xr;
        else if (fi * fr == 0)
            root_fp = xr;
            end
        end
    end
    err = abs((xr - xr_old) / xr);
    xr_old = xr;
end
root_fp = xr;
%-------------------------------------------------%

%------------ Newton-Raphson method --------------%
x = 1;
x_old = 0;
err = 1;
while(err > marginErr_NR)
    fx = -26+85*x-91*x^2+44*x^3-8*x^4+x^5;
    fx_1d = 85-182*x+132*x^2-32*x^3+5*x^4;
    x_old = x;
    x = x - fx / fx_1d;
    err = abs((x - x_old) / x);
end
root_NR = x;
%-------------------------------------------------%
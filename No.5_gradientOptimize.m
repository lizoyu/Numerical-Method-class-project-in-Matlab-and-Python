% Use gradient method to find the minimum of following function:
%                f(x,y) = (x-3)^2 + (y-2)^2
% where initial position is (1,1), margin of error is 0.1%

marginErr = 0.001;
x = 1;
y = 1;
err = 1;
while (err > marginErr)
   f =  (x-3)^2 + (y-2)^2;
   f_old = f;
   fx = 2 * x - 6;
   fy = 2 * y - 4;
   syms h
   x0 = x - fx * h;
   y0 = y - fy * h;
   g = (x0-3)^2 + (y0-2)^2;
   h_solved = double(solve(diff(g,h) == 0, 'h'));
   x = x - fx * h_solved;
   y = y - fy * h_solved;
   f =  (x-3)^2 + (y-2)^2;
   if (f == 0)
       err = 0;
   else
       err = abs((f - f_old) / f);
   end
end
posMin = [x y];
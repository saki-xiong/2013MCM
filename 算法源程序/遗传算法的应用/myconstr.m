function [c,ceq] = myconstr(x,a2)
         c = exp(x)-a2;
         % No nonlinear equality constraints:
          ceq = [];
 
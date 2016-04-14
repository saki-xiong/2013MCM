clc,clear
%  A*X  <= B, Aeq*X  = Beq (linear constraints)
%  C(X) <= 0, Ceq(X) = 0 (nonlinear constraints),c和ceq在myconstr.m中返回产生。
%  LB <= X <= ub
%  myfit为需要求最小值的目标函数；
a2 = 600; % define parameters first,a2为非线性约束的参数
fplot('myfit',[5 7]);
% Mutation function for constrained minimization
options = gaoptimset('MutationFcn',@mutationadaptfeasible);
objectivefunction=@(x)myfit(x);constraintfounction=@(x)myconstr(x,a2);
x = ga(objectivefunction,1,[],[],[],[],5,7,constraintfounction,options);   
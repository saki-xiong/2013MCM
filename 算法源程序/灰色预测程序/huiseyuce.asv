clc,clear
x0=[71.1 72.4 72.4 72.1 71.4 72.0 71.6];
n=length(x0);
lamda=x0(1:n-1)./x0(2:n);                  %计算级比偏差
range=minmax(lamda);
if range(1)>exp(-2/(n+1))&range(2)<exp(2/(n+1))
    disp('级比符合');
else
    warning('级比不符合');
    broke
end
x1=cumsum(x0);
for i=2:n
    z(i)=0.5*(x1(i)+x1(i-1));
end
B=[-z(2:n)',ones(n-1,1)];
Y=x0(2:n)';
u=B\Y
x=dsolve('Dx+a*x=b','x(0)=x0');
x=subs(x,{'a','b','x0'},{u(1),u(2),x1(1)});
yuce1=[];
for i=0:n
    yuce1(i+1)=subs(x,'t',i);
end
digits(6),y=vpa(x)          %为提高预测精度，先计算预测值，再显示微分方程的解

yuce=[x0(1),diff(yuce1)]
epsilon=x0-yuce(1,n);            %计算残差
delta=abs(epsilon./x0)      %计算相对误差


if delta<0.2&delta>0.1
    disp('残差检验达到一般要求')
elseif delta<0.1
    disp('残差检验达到较高要求')
else
    disp('残差检验未达到要求')
end
rho=1-(1-0.5*u(1))/(1+0.5*u(1))*lamda   %计算级比偏差值
if rho<0.2&rho>0.1
    disp('级比偏差值检验达到一般要求')
elseif rho<0.1
    disp('级比偏差值检验达到较高要求')
else
    disp('级比偏差值检验未达到要求')
end

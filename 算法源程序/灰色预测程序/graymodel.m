function f=graymodel(y)
% 本程序主要用来计算根据灰色理论建立的模型的预测值。
% 应用的数学模型是 GM(1,1)。
% 原始数据的处理方法是一次累加法。
%y=input('请输入数据 ');如：y=[71.1 72.4 72.4 72.1 71.4 72.0 71.6];
n=length(y);
lamda=y(1:n-1)./y(2:n);                  %计算级比偏差
range=minmax(lamda);
if range(1)>exp(-2/(n+1))&range(2)<exp(2/(n+1))
    disp('级比符合');
else
    warning('级比不符合');
    broke
end
yy=ones(n,1);
yy(1)=y(1);
for i=2:n
    yy(i)=yy(i-1)+y(i);
end
B=ones(n-1,2);
for i=1:(n-1)
    B(i,1)=-(yy(i)+yy(i+1))/2;
    B(i,2)=1;
end
BT=B';
for j=1:n-1
    YN(j)=y(j+1);
end
YN=YN';
A=inv(BT*B)*BT*YN;
a=A(1);
u=A(2);
t=u/a;
t_test=input('请输入需要预测个数：');
i=1:t_test+n;
yys(i+1)=(y(1)-t).*exp(-a.*i)+t;
yys(1)=y(1);
for j=n+t_test:-1:2
    ys(j)=yys(j)-yys(j-1);
end
x=1:n;
xs=2:n+t_test;
yn=ys(2:n+t_test);
plot(x,y,'^r',xs,yn,'*-b');
det=0;
for i=2:n
    det=det+abs(yn(i)-y(i));
end
det=det/(n-1);
disp(['百分绝对误差为：',num2str(det),'%']);
disp(['预测值为： ',num2str(ys(n+1:n+t_test))]);
if det/100<0.2&det/100>0.1
    disp('残差检验达到一般要求')
elseif det/100<0.1
    disp('残差检验达到较高要求')
else
    disp('残差检验未达到要求')
end



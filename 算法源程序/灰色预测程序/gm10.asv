function []=gm10(y)
% 本程序主要用来计算根据灰色理论建立的模型的预测值。
% 应用的数学模型是 GM(1,1)。
% 原始数据的处理方法是一次累加法。
n=length(y);
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
i=1:n+10;
yys(i+1)=(y(1)-t).*exp(-a.*i)+t;
yys(1)=y(1);
for j=n+10:-1:2
    ys(j)=yys(j)-yys(j-1);
end
x=1:n;
xs=2:n+10;
yn=ys(2:n+10);
plot(x,y,'^r',xs,yn,'*-b');
det=0;
for i=2:n+10
    det=det+abs(yn(i)-y(i));
end
det=det/(n-1);
disp(['百分绝对误差为：',num2str(det),'%']);
disp(['未来第一年 ',num2str(ys(n+1))]);
disp(['未来第二年',num2str(ys(n+2))]);
disp(['未来第三年',num2str(ys(n+3))]);
disp(['未来第四年',num2str(ys(n+4))]);
disp(['未来第五年',num2str(ys(n+5))]);
disp(['未来第六年',num2str(ys(n+6))]);
disp(['未来第七年',num2str(ys(n+7))]);
disp(['未来第八年',num2str(ys(n+8))]);
disp(['未来第九年',num2str(ys(n+9))]);
disp(['未来第十年',num2str(ys(n+10))]);

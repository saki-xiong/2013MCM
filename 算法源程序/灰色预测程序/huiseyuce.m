clc,clear
x0=[71.1 72.4 72.4 72.1 71.4 72.0 71.6];
n=length(x0);
lamda=x0(1:n-1)./x0(2:n);                  %���㼶��ƫ��
range=minmax(lamda);
if range(1)>exp(-2/(n+1))&range(2)<exp(2/(n+1))
    disp('���ȷ���');
else
    warning('���Ȳ�����');
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
digits(6),y=vpa(x)          %Ϊ���Ԥ�⾫�ȣ��ȼ���Ԥ��ֵ������ʾ΢�ַ��̵Ľ�

yuce=[x0(1),diff(yuce1)]
epsilon=x0-yuce(1,n);            %����в�
delta=abs(epsilon./x0)      %����������


if delta<0.2&delta>0.1
    disp('�в����ﵽһ��Ҫ��')
elseif delta<0.1
    disp('�в����ﵽ�ϸ�Ҫ��')
else
    disp('�в����δ�ﵽҪ��')
end
rho=1-(1-0.5*u(1))/(1+0.5*u(1))*lamda   %���㼶��ƫ��ֵ
if rho<0.2&rho>0.1
    disp('����ƫ��ֵ����ﵽһ��Ҫ��')
elseif rho<0.1
    disp('����ƫ��ֵ����ﵽ�ϸ�Ҫ��')
else
    disp('����ƫ��ֵ����δ�ﵽҪ��')
end

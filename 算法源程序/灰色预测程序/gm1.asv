%二次拟合预测GM(1,1)模型
function  gmcal=gm1(x)
sizexd2 = size(x,2);
%求数组长度

k=0;
for y1=x
    k=k+1;
    if k>1
        x1(k)=x1(k-1)+x(k);
        %累加生成
        z1(k-1)=-0.5*(x1(k)+x1(k-1));   
        %z1维数减1，用于计算B
        yn1(k-1)=x(k);
    else
        x1(k)=x(k);
    end
end
%x1,z1,k,yn1

sizez1=size(z1,2);
%size(yn1);
z2 = z1';
z3 = ones(1,sizez1)';

YN = yn1';   %转置
%YN

B=[z2 z3];
au0=inv(B'*B)*B'*YN;
au = au0';
%B,au0,au

afor = au(1);
ufor = au(2);
ua = au(2)./au(1);
%afor,ufor,ua 
%输出预测的  a u 和 u/a的值

constant1 = x(1)-ua;
afor1 = -afor;
x1t1 = 'x1(t+1)';
estr = 'exp';
tstr = 't';
leftbra = '(';
rightbra = ')';
%constant1,afor1,x1t1,estr,tstr,leftbra,rightbra

strcat(x1t1,'=',num2str(constant1),estr,leftbra,num2str(afor1),tstr,rightbra,'+',leftbra,num2str(ua),rightbra)
%输出时间响应方程

%******************************************************
%二次拟合

k2 = 0;
for y2 = x1
    k2 = k2 + 1;
    if k2 > k  
    else
        ze1(k2) = exp(-(k2-1)*afor);  
    end
end
%ze1

sizeze1 = size(ze1,2);
z4 = ones(1,sizeze1)';
G=[ze1' z4];
X1 = x1';
au20=inv(G'*G)*G'*X1;
au2 = au20';
%z4,X1,G,au20

Aval = au2(1);
Bval = au2(2);
%Aval,Bval
%输出预测的  A,B的值

strcat(x1t1,'=',num2str(Aval),estr,leftbra,num2str(afor1),tstr,rightbra,'+',leftbra,num2str(Bval),rightbra)
%输出时间响应方程

nfinal = sizexd2-1 + 1;
%决定预测的步骤数5  这个步骤可以通过函数传入

%nfinal = sizexd2 - 1 + 1;
%预测的步骤数 1

for  k3=1:nfinal
    x3fcast(k3) = constant1*exp(afor1*k3)+ua;
end
%x3fcast
%一次拟合累加值

for  k31=nfinal:-1:0
    if k31>1
        x31fcast(k31+1) = x3fcast(k31)-x3fcast(k31-1);
    else
        if k31>0
            x31fcast(k31+1) = x3fcast(k31)-x(1);
        else
            x31fcast(k31+1) = x(1);
        end
    end
   
end
x31fcast
%一次拟合预测值


for  k4=1:nfinal
    x4fcast(k4) = Aval*exp(afor1*k4)+Bval;
end
%x4fcast

for  k41=nfinal:-1:0
    if k41>1
        x41fcast(k41+1) = x4fcast(k41)-x4fcast(k41-1);
    else
        if k41>0
            x41fcast(k41+1) = x4fcast(k41)-x(1);
        else
            x41fcast(k41+1) = x(1);
        end
    end
   
end
x41fcast,x
%二次拟合预测值

%***精度检验p C************//////////////////////////////////
k5 = 0;
for y5 = x
    k5 = k5 + 1;
    if k5 > sizexd2  
    else
        err1(k5) = x(k5) - x41fcast(k5);  
    end
end
%err1
%绝对误差


xavg = mean(x);
%xavg
%x平均值

err1avg = mean(err1);
%err1avg
%err1平均值

k5 = 0;
s1total = 0 ;
for y5 = x
    k5 = k5 + 1;
    if k5 > sizexd2  
    else
        s1total = s1total + (x(k5) - xavg)^2;  
    end
end
s1suqare = s1total ./ sizexd2;
s1sqrt = sqrt(s1suqare);
%s1suqare,s1sqrt
%s1suqare  残差数列x的方差  s1sqrt 为x方差的平方根S1

k5 = 0;
s2total = 0 ;
for y5 = x
    k5 = k5 + 1;
    if k5 > sizexd2  
    else
        s2total = s2total + (err1(k5) - err1avg)^2;  
    end
end
s2suqare = s2total ./ sizexd2;
%s2suqare   残差数列err1的方差S2

Cval = sqrt(s2suqare ./ s1suqare);
Cval
%nnn = 0.6745 * s1sqrt
%Cval  C检验值

k5 = 0;
pnum = 0 ;
for y5 = x
    k5 = k5 + 1;
    if abs( err1(k5) - err1avg ) < 0.6745 * s1sqrt
        pnum = pnum + 1;
        %ppp = abs( err1(k5) - err1avg )     
    else
    end
end
pval = pnum ./ sizexd2;
pval
%p检验值

% arr1 = x41fcast(1:6)
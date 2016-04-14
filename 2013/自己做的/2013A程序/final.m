clc,clear
hold off
T1(1)=81;
T2(1)=104;
T3(1)=81;T0=20;
L=2.2
for i=1:126*L
    theta(i)=(i-1)*pi/(250*L);
    if i<=42*L
        y(i)=0.03 /cos(theta(i));
    end
    if i>42*L
        if i<84*L
        y(i)=0.03/cos(pi/6);
        end
    end
    if i>=84*L
        y(i)=0.03/cos(pi/2-theta(i));
    end
    for j=1:126*L
    rho(i)=y(i)/(125*L)*j;
    z11=0.05;
d(i)=y(i)-rho(i);
if d(i)<0.000011  
    d(i)=0.000011;
end
dqc(i,j)=(0.25*(T1(1)-T0)+0.5*0.35*(T1(1)^2-T0^2))/d(i);
dqd(i,j)=(0.25*(T2(1)-T0)+0.5*0.35*(T2(1)^2-T0^2))/z11;    
dq4(i,j)=dqc(i,j)+dqd(i,j);
    end
end
dq4(:,j)=dq4(:,j-1);
for i=1:126*L
    for j=1:126*L
        while dq4(i,j)>1.27*10^6
        dq4(i,j)=1.2*10^6;
        end
    end
end

for i=1:126*L
    for j=1:126*L
rho(i,j)=y(i)/(125*L)*j;
t(i,j)=theta(i);
    end
end
 figure(2)
[X,Y,Z]=pol2cart(t,rho,dq4);
mesh(X,Y,Z);hold on
mesh(-X,Y,Z);hold on
mesh(X,-Y,Z);hold on
mesh(-X,-Y,Z)
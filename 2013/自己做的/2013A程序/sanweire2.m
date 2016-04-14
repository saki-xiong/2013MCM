clc,clear
hold off
T1(1)=81;
T2(1)=104;
T3(1)=81;T0=20;
for i=2:11
    T1(i)=T1(i-1)-3;T2(i)=T2(i-1)-3;T3(i)=T3(i-1)-3;
end
for i=1:11
    for j=1:11
            for k=1:11 
        x1=0.003*(i-1);
        y1=0.004*(j-1);
        z1=0.0025*(k-1);
dqyoz(i,j,k)=(0.5*(T1(1)-T0)+0.5*0.35*(T1(1)^2-T0^2))/x1;
dqxoy(i,j,k)=(0.5*(T2(1)-T0)+0.5*0.35*(T2(1)^2-T0^2))/y1;
dqxoz(i,j,k)=(0.5*(T3(1)-T0)+0.5*0.35*(T3(1)^2-T0^2))/z1;
dq(i,j,k)=dqyoz(i,j,k)+dqxoy(i,j,k)+dqxoz(i,j,k);
        end
    end
end
dq(1,:,:)=dq(2,:,:);
dq(:,1,:)=dq(:,2,:);
dq(:,:,1)=dq(:,:,2);

x1=0:0.003:0.03;y1=0:0.004:0.04;z1=0:0.0025:0.025;
%[x1,y1,z1]=meshgrid(x1,y1,z1);
xi=0:0.0001:0.03;
yi=0:0.0001:0.04;
zi=0:0.0005:0.025;
% z1i=interp2(x1,y1,dq,xi,yi');
%subplot(2,1,1);
figure(1)
slice(x1,y1,z1,dq,xi,yi,zi);hold on
slice(x1,y1,0.05-z1,dq,xi,yi,0.05-zi);hold on
slice(0.06-x1,y1,z1,dq,0.06-xi,yi,zi);hold on
slice(x1,0.08-y1,z1,dq,xi,0.08-yi,zi);hold on
slice(0.06-x1,y1,0.05-z1,dq,0.06-xi,yi,0.05-zi);hold on
slice(x1,0.08-y1,0.05-z1,dq,xi,0.08-yi,0.05-zi);hold on
slice(0.06-x1,0.08-y1,z1,dq,0.06-xi,0.08-yi,zi);hold on
slice(0.06-x1,0.08-y1,0.05-z1,dq,0.06-xi,0.08-yi,0.05-zi);hold on
shading interp
% surfc(xi,yi,z1i);
% surfc(0.1-xi,0.1-yi,z1i);hold on
% surfc(0.1-xi,yi,z1i);hold on
% surfc(xi,0.1-yi,z1i);hold on
rotate3d
for i=1:51
    for j=1:51
        for k=51
            
    theta=i*pi/25;
    rho=0.001*j;
    z11=0.001*(k-1);
    d=0.05-rho;
dqc(i,j,k)=(0.5*(T1(1)-T0)+0.5*0.35*(T1(1)^2-T0^2))/d;
dqd(i,j,k)=(0.5*(T2(1)-T0)+0.5*0.35*(T2(1)^2-T0^2))/z11;    
dq2(i,j,k)=dqc(i,j,k)+dqd(i,j,k);
dq2=dq2;
        end
    end
end
dq2(:,:,j)=dq2(:,:,j-1);
for i=1:51
    for j=1:51 
        for k=1:51
        while dq2(i,j,k)>max(max(max(dq)))
        dq2(i,j,k)=max(max(max(dq)))/1.13;
        end
    end
    end
end
theta=0:pi/25:2*pi;
rho=0:0.001:0.05;
figure(2)
[t,r,g]=meshgrid(theta,rho,z11);
[X,Y,Z]=pol2cart(t,r,dq2);
mesh(X,Y,Z)
%slice(theta,rho,z11,dq2,X,Y,Z);
hold on
% axis([0 0.05 0 0.05])
for i=1:501
    theta=i*pi/250;
    r=0.0024/sqrt(0.0016*cos(theta)^2+0.0036*sin(theta)^2);
    for j=1:501
    rho=r/500*j;
    z11=0.05;
    d=abs(0.0024/sqrt(0.0016*cos(theta)^2+0.0036*sin(theta)^2)-rho);
dqc(i,j)=(0.25*(T1(8)-T0)+0.5*0.035*(T1(8)^2-T0^2))/d;
dqd(i,j)=(0.25*(T2(8)-T0)+0.5*0.035*(T2(8)^2-T0^2))/z11;    
dq3(i,j)=dqc(i,j)+dqd(i,j);
    end
end
dq3(:,j)=dq3(:,j-1);
for i=1:501
    for j=1:501
        while dq3(i,j)>max(max(max(dq)))
        dq3(i,j)=max(max(max(dq)))/1.13;
        end
    end
end
theta=0:pi/250:2*pi;
for i=1:501
    for j=1:501
r1(i)=0.0024/sqrt(0.0016*cos(theta(i))^2+0.0036*sin(theta(i))^2);
rho(i,j)=r1(i)/500*j;
t(i,j)=theta(i);
    end
end
 figure(3)
%[t,r]=meshgrid(theta,rho);
[X,Y,Z]=pol2cart(t',rho',dq3');
mesh(X,Y,Z)


for i=1:251
    theta=i*pi/500;  
    %r=0.0024/sqrt(0.0016*cos(theta)^2+0.0036*sin(theta)^2);
    if theta<=pi/4
        r(i)=0.03/cos(theta) ;
    end
    if pi/4<=theta<=pi/3
        r(i)=0.03/cos(pi/4);
    end
    if pi/3<=theta<=pi/2
        r(i)=0.04/cos(pi/2-theta);
    end
    for j=1:251
    rho(i)=r(i)/250*j;
    z11=0.05;
    %d=abs(0.0024/sqrt(0.0016*cos(theta)^2+0.0036*sin(theta)^2)-rho);
%     if theta<=pi/4
%         d=3/cos(theta)-rho;end
%     if pi/4<theta<=pi/3
%         d=3/cos(pi/4)-rho;end
%     if pi/3<theta<=pi/2
%         d=4/cos(theta)-rho;end
d=r(i)-rho(i);
    d=abs(d);
dqc(i,j)=(0.25*(T1(1)-T0)+0.5*0.35*(T1(1)^2-T0^2))/d;
dqd(i,j)=(0.25*(T2(1)-T0)+0.5*0.35*(T2(1)^2-T0^2))/z11;    
dq4(i,j)=dqc(i,j)+dqd(i,j);
    end
end
dq4(:,j)=dq4(:,j-1);
% for i=1:251
%     for j=1:251
%         while dq3(i,j)>max(max(max(dq)))
%         dq4(i,j)=max(max(max(dq)))/1.13;
%         end
%     end
% end
theta=0:pi/500:2*pi;
for i=1:251
    for j=1:251
if theta(i)<=pi/4
        r1(i)=abs(0.03/cos(theta(i)));end
    if pi/4<theta(i)<=pi/3
        r1(i)=abs(0.03/cos(pi/4));end
   if pi/3<theta<=pi/2
        r=0.04/cos(pi/2-theta)
    end
rho(i,j)=r1(i)/251*j;
t(i,j)=theta(i);
    end
end
 figure(4)
[X,Y,Z]=pol2cart(t,rho,dq4');
mesh(X,Y,Z)


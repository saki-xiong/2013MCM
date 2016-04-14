clc,clear
hold off
T1=81;T2=104;T3=81;T0=20;
for i=1:5
    for j=1:5
        x1=0.01*i;
        y1=0.01*j;
        %for z1=0.01:0.01:0.5
        z1=0.01;
dqyoz(i,j)=(0.5*(T1-T0)+0.5*0.5*x1*(T1^2-T0^2))/x1;
dqxoy(i,j)=(0.5*(T2-T0)+0.5*0.5*y1*(T2^2-T0^2))/y1;
dqxoz(i,j)=(0.5*(T3-T0)+0.5*0.5*z1*(T3^2-T0^2))/z1;
dq(i,j)=dqyoz(i,j)+dqxoy(i,j)+dqxoz(i,j);
% dq(i,101-j)=dq(i,j);dq(101-i,101-j)=dq(i,j);dq(101-i,j)=dq(i,j);
        %end
    end
end
x1=0:0.01:0.049;y1=0:0.01:0.049;
xi=0:0.0005:0.05;
yi=0:0.0005:0.05;
z1i=interp2(x1,y1,dq,xi,yi');
surfc(xi,yi,z1i);hold on
% surfc(0.1-xi,0.1-yi,z1i);hold on
% surfc(0.1-xi,yi,z1i);hold on
% surfc(xi,0.1-yi,z1i);hold on
rotate3d

% for n=1:10
%     figure(n)
%     interp(x1,y1,dq);
% end
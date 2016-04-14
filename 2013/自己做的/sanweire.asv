clc,clear
hold off
T1=81;T2=104;T3=81;T0=20;
for i=1:10
    for j=1:10
        x1=0.01*i;
        y1=0.01*j;
        %for z1=0.01:0.01:0.5
        z1=0.02;
dqyoz(i,j)=(0.5*(T1-T0)+0.65*(T1^2-T0^2))/x1;
dqxoy(i,j)=(0.5*(T2-T0)+0.65*(T2^2-T0^2))/y1;
dqxoz(i,j)=(0.5*(T3-T0)+0.65*(T3^2-T0^2))/z1;
dq(i,j)=dqyoz(i,j)+dqxoy(i,j)+dqxoz(i,j);
% dq(i,101-j)=dq(i,j);dq(101-i,101-j)=dq(i,j);dq(101-i,j)=dq(i,j);
        %end
    end
end
x1=0:0.01:0.099;y1=0:0.01:0.099;
xi=0:0.001:0.1;
yi=0:0.001:0.1;
z1i=interp2(x1,y1,dq,xi,yi');
% subplot(2,1,1);
surfc(xi,yi,z1i);hold on
 surfc(0.1-xi,0.1-yi,z1i);hold on
 surfc(0.1-xi,yi,z1i);hold on
 surfc(xi,0.1-yi,z1i);hold on
 shading interp
rotate3d
for i=1:100
    for j=1:100
    x11=0.0005*i;
    y11=0.0005*j;
    z11=0.02;
%    
%     if j>100
%         j=0;
%         i=i+1;
%     end
    d=0.05-sqrt((x11-0.05)^2+(y11-0.05)^2);
dqc(i,j)=(0.5*(T1-T0)+0.5*0.5*d*(T1^2-T0^2))/d;
dqd(i,j)=(0.5*(T2-T0)+0.5*0.5*z11*(T2^2-T0^2))/z11;    
dq2(i,j)=dqc(i,j)+dqd(i,j);
 if (x11-0.05)^2+(y11-0.05)^2>0.0025
     dq2(i,j)=0;
%         if y11>0.05
%             y11=y11-0.05;
%         else if y11<0.05
%                 y11=y11+0.05;
%             end
%         end
    end
% if (x11-0.05)^2+(y11-0.05)^2 >0.0025
%     dq2(i,j)=0;
% end
    end
end
 x11=0:0.0005:0.0495;y11=0:0.0005:0.0495;
%  xii=0:0.0005:0.05;
%  yii=0:0.0005:0.05;
%z1ii=interp2(x11,y11,dq2,xii,yii');
subplot(2,1,2);
%surfc(xii,yii,z1ii);
%surfc(x11,y11,dq2);
contour(x11,y11,dq2,10)
hold on
axis([0 0.05 0 0.05])



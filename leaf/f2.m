clc,clear 
hold off
%for N1=7:12
N1=3
L1=1.5;theta=pi/12;x0=5*ones(1,N1);y0=5*ones(1,N1);N2=fix(N1/2);
jd=0.001;no=5;
[x1 y1 z1 x2 y2 z2,z,L]=treeGeneration2(x0,y0,L1,N1,theta);
draw(x0,y0,z,x1,y1,z1,x2,y2,z2,N1);
shadowx(:,1)=x1;shadowx(:,2)=x2;
shadowy(:,1)=y1;shadowy(:,2)=y2;

% shadow1=shadearea2(x1,y1,jd,N1,no);
% shadow2=shadearea2(x2,y2,jd,N1,no);
for SB=1:2
    if SB==2
        x1(m)=x2(m);y1(m)=y2(m);z1(m)=z2(m);
    end
    for m=1:N1
        X(m,1)=x0(m)+(x1(m)-x0(m))/(N2*2);
        Y(m,1)=y0(m)+(y1(m)-x0(m))/(N2*2);
        Z(m,1)=z(m)+(z1(m)-z(m))/(N2*2);
    end
fz=z(1);
for m=1:N1
    fx=x1(m);fy=y1(m);fz1=z1(m);
    if SB==2
        fx=x2(m);fy=y2(m);fz1=z2(m);
    end
  for n=2:N2+2
      X(m,n)=X(m,n-1)+(fx-x0(m))/(N2);
      Y(m,n)=Y(m,n-1)+(fy-y0(m))/(N2);
      Z(m,n)=Z(m,n-1)+(fz1-z(m))/(N2);
  end
end

for m=1:N1
  for n=1:2:N2
      X11(m,n)=X(m,n+1)+rand(1)*(X(m,n+2)-X(m,n+1));
      Y11(m,n)=Y(m,n+1)+rand(1)*(Y(m,n+2)-Y(m,n+1));
      Z11(m,n)=Z(m,1)+rand(1)*(Z(m,n+2)-Z(m,n+1));
  end
  for n=2:2:N2
      X11(m,n)=X(m,n);
      Y11(m,n)=Y(m,n);
      Z11(m,n)=Z(m,n)+rand(1)*(Z(m,n+2)-Z(m,n+1));
  end
end

for m=1:N1
    for n=2:N2
        xx1=[X(m,n-1) X(m,n) X11(m,n)];
        yy1=[Y(m,n-1) Y(m,n) Y11(m,n)];
        zz1=[Z(m,n-1) Z(m,n)  Z11(m,n)];
        %xx2=[x0(n) x0(n) x2(n)];yy2=[y0(n) y0(n) y2(n)];
        if n>1
            zz1=[Z(m,(n-1)) Z(m,n) Z11(m,n)];
            plot3(xx1,yy1,zz1);hold on;
            plot3(X11(m,n),Y11(m,n),Z11(m,n),'gh','markersize',20);
        end
       
    end
end
view(-37.5,10);hold on
end
shadowx=[shadowx,X11];shadowy=[shadowy,Y11];
[m,n]=size(shadowx);
plot3([5,5],[5,5],[0,5],'linewidth',3)
shadow=shadearea2(shadowx,shadowy,jd,no);
shadowlv(N1)=(sum(sum(shadow))*jd*jd)/(m*n*pi*0.03*0.015*no)

%end
function f=draw(x0,y0,z,x1,y1,z1,x2,y2,z2,N1)

for n=1:N1
    xx1=[x0(n) x0(n) x1(n)];yy1=[y0(n) y0(n) y1(n)];
    xx2=[x0(n) x0(n) x2(n)];yy2=[y0(n) y0(n) y2(n)];
    if n>1
        zz1=[z(n-1) z(n) z1(n)];
        zz2=[z(n-1) z(n) z2(n)];
    else
        zz1=[0 z(1) z1(1)];zz2=[0 z(1) z2(1)];
    end
        plot3(xx1,yy1,zz1);hold on;plot3(xx2,yy2,zz2);grid on
        plot3(x1(n),y1(n),z1(n),'gh','markersize',20);%plot3(x1(n),y1(n),0,'ro');
        plot3(x2(n),y2(n),z2(n),'gh','markersize',20);%plot3(x2(n),y2(n),0,'ro');
end
        view(-37.5,10);hold on
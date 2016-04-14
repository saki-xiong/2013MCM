function [x1 y1 z1 x2 y2 z2,z,L]=treeGeneration2(x0,y0,L1,N1,theta)
L(1)=L1;
for n=2:N1+1
    L(n)=0.65*L(n-1);
end 

for n=1:N1
    %for m=1:N1-1
    r=L(n)*sin(theta);
    x1(n)=(rand(1)*2*r)+(x0(n)-r);
    y1(n)=sqrt((r^2)-(x1(n)-x0(n))^2)+y0(n);
    x2(n)=2*x0(n)-x1(n);
    y2(n)=2*y0(n)-y1(n);
    z(n)=0.5*n*(L(1)+L(n));
    z1(n)=z(n)+L(n+1)*cos(theta);
    z2(n)=z1(n)+0.1*L(n);
end

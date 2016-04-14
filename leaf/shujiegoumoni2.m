clc,clear,hold off;
L=1.2;
x0=5;y0=5; 
sums=0;
%for cishu=1:2
shadow=0;
   
    theta=(((rand(1)*20)+15)/180)*(pi);
        x1(:,1)=[x0;x0;0];y1(:,1)=[y0;y0;0];z1(:,1)=[0;L;0];L(1)=L;
        for n=2:8
            L(n)=L(n-1)*0.8^(n-1);
        end
        for n=1:6
            for m=1:2:2^n
                 r=L(n)*sin(theta);
                 x2(:,m)=x1(:,1);y2(:,m)=y1(:,1);z2(:,m)=z1(:,1);
                 x2(:,m+1)=x2(:,m);y2(:,m+1)=y2(:,m);z2(:,m+1)=z2(:,m);
                 
                 x2(3,m)=x1(2,1)+r*(rand(1))*0.6;
                 x2(3,m+1)=x1(2,1)-r*(rand(1))*0.6;
        
                 y2(3,m)=y1(2,1)+r*(rand(1))*0.6;
                 y2(3,m+1)=y1(2,1)-r*(rand(1))*0.6;

                 z2(3,m)=z1(2,1)+r*(rand(1))*0.8;
                 z2(3,m+1)=z1(2,1)+r*(rand(1))*0.8;
                 
                 plot3(x2(:,m)',y2(:,m)',z2(:,m)');hold on;plot3(x2(:,m+1)',y2(:,m+1)',z2(:,m+1)');
                 
                 grid on;axis([4 6 4 6 0 4]);
                 
                 x1(:,1)=[];y1(:,1)=[];z1(:,1)=[]; 
                 
            end
             x1=zeros(3,m+1);y1=zeros(3,m+1);z1=zeros(3,m+1);
             x1(1,:)=x2(2,:);x1(2,:)=x2(3,:);
             y1(1,:)=y2(2,:);y1(2,:)=y2(3,:);
             z1(1,:)=z2(2,:);z1(2,:)=z2(3,:);
        end
  for i=1:2^8
            plot3(x2(3,i),y2(3,i),z2(3,i),'gh','markersize',15);
            %plot3(x2(3,i),y2(3,i),0,'ro','markersize',3);  
  end 
            w=(((rand(1)*120))/180)*(pi);
            cosw1=cos(w);cosw2=cos(w+(2/3)*pi);cosw3=cos(w+(4/3)*pi);
            sinw1=sin(w);sinw2=sin(w+(2/3)*pi);sinw3=sin(w+(4/3)*pi);
            maxx=max(x2(3,:))
            minx=min(x2(3,:))
            row=fix((maxx+0.2-minx)/0.005)
 for mm=1:row
        xx=minx-0.1+0.005*(mm);
     for nn=1:row
         yy=minx-0.1+0.005*(nn);
        for i=1:2^6
            %plot3(x2(3,i),y2(3,i),z2(3,i),'gh','markersize',30);
            %plot3(x2(3,i),y2(3,i),0,'ro','markersize',3);

            xx1=xx*cosw1+yy*sinw1-x2(3,i)*cosw1-y2(3,i)*sinw1;
            xx2=xx*cosw2+yy*sinw2-x2(3,i)*cosw2-y2(3,i)*sinw2;
            xx3=xx*cosw3+yy*sinw3-x2(3,i)*cosw3-y2(3,i)*sinw3;
            yy1=-xx*sinw1+yy*cosw1+x2(3,i)*sinw1-y2(3,i)*cosw1;
            yy2=-xx*sinw2+yy*cosw2+x2(3,i)*sinw2-y2(3,i)*cosw2;
            yy3=-xx*sinw3+yy*cosw3+x2(3,i)*sinw3-y2(3,i)*cosw3;
            %plot(xx1,yy1,'yo');
            if (4*(xx1-0.05)^2)/0.0036+(4*(yy1)^2)/0.0009<=1.1 || (4*(xx2-0.05)^2)/0.0036+(4*(yy2)^2)/0.0009<=1.1  || (4*(xx3-0.05)^2)/0.0036+(4*(yy3)^2)/0.0009<=1.1
                 %shadow(mm,nn)=1;
                 shadow=shadow+1;
            %else
                %shadow(mm,nn)=0;
            end
            %if sum(shadow) >sums
               
                %x3(i)=x2(3,i);y3(i)=y2(3,i);z3(i)=z2(3,i);
                %else
        end
     end
        
     end
 %end 
 %sums=sum(sum(shadow)),dianshu
%end
 
hold off;
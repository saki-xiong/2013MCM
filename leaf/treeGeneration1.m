function [x3 y3 z3 x2 y2 z2]=treeGeneration1(x0,y0,L1,N)
%x0,y0Ϊ��������λ�ã�L1Ϊ���ɳ���NΪ��֧����
theta=(((rand(1)*25)+20)/180)*(pi);
        x1(:,1)=[x0;x0;0];y1(:,1)=[y0;y0;0];z1(:,1)=[0;L1;0];
        L(1)=L1;
        for n=2:8
            L(n)=L(n-1)*0.8^(n-1);
        end
        for n=1:N
            for m=1:2:2^n
                 r=L(n)*sin(theta);
                 x2(:,m)=x1(:,1);y2(:,m)=y1(:,1);z2(:,m)=z1(:,1);
                 x2(:,m+1)=x2(:,m);y2(:,m+1)=y2(:,m);z2(:,m+1)=z2(:,m);               
                 x2(3,m)=x1(2,1)+r*(rand(1))*0.8;
                 x2(3,m+1)=x1(2,1)-r*(rand(1))*0.8;
                 y2(3,m)=y1(2,1)+r*(rand(1))*0.8;
                 y2(3,m+1)=y1(2,1)-r*(rand(1))*0.8;              
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
             for m=1:2^n
                 x3(1,m,n)=x2(3,m);y3(1,m,n)=y2(3,m);z3(1,m,n)=z2(3,m);
             end
        end
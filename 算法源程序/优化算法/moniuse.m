% first为初始解
first=rand(1)*
e=0.1^30;L=100000000;at=0.999;T=1;
 %退火过程
 for k=1:L
     %产生新解
     %计算代价函数变换值
     df=f1-();
     %接受准则
     if df<0
         
        %接受，并记录
     elseif exp(-df/T)>rand(1)
         
         %以概率接受，并记录
     end
     T=T*at;
     if T<e
         break;%退出
     end
 end
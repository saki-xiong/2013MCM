function f=greedy_method(c,w,limitw,n)
% ��������������룺
% c=[220,208,198,192,180,180,165,162,160,158,155,130,125,122,120,118,115,110,105,101,100,100,98,96,95,90,88,82,80,77,75,73,72,70,69,66,65,63,60,58,56,50,30,20,15,10,8,5,3,1];
% w=[80,82,85,70,72,70,66,50,55,25,50,55,40,48,50,32,22,60,30,32,40,38,35,32,25,28,30,22,50,30,45,30,60,50,20,65,20,25,30,10,20,25,15,10,10,10,4,4,2,1];
% limitw=1000;n=50;
knapsack(n,limitw,w,c)
% ���в������ͣ�
% ����C��ʾ��С,W��ʾ��ֵ��limitw��ʾw�ļ��ޣ�n��ʾ��Ʒ������
end
%%
function [a1,b1]=sort1(n,a,b)%����λ��ֵ����
[m,n]=size(a);
d=zeros(m,n);
for k=1:n
   d(k)=a(k)/b(k);
end%��λ��ֵ
for h=1:n-1
  for j=1:n-h%�������
   if d(j)<d(j+1)
      t1=a(j);a(j)=a(j+1);a(j+1)=t1;
     t2=b(j);b(j)=b(j+1);b(j+1)=t2;
    t3=d(j);d(j)=d(j+1);d(j+1)=t3;%��ʡ��
end
end
end
a1=a;b1=b;
end
%%
function knapsack(n,limitw,w,c)
totalc=0;totalw=0;
[m,n]=size(w); %m ��w ������n ��w ������
x=zeros(m,n);
t=w;%��¼ԭ���� 
k=c;y=x;
[p,c,w]=goodsinknapsack(n,limitw,c,w,x);%���򼰼���װ����Ʒ��
for j=1:p%װ����p����Ʒ
  for i=1:n%ԭn����Ʒ
   if (w(j)==t(i))&&(c(j)==k(i))%��ѡ�����Ʒװ��
     y(i)=1;
  end
 end
end
 y
for i=1:n
  totalc=totalc+k(i)*y(i);%�������ܼ�ֵ
 if y(i)==1
  totalw=totalw+t(i);%������װ�������
 end
end
totalw,totalc
end
%%
function [p,c,w]=goodsinknapsack(n,limitw,c,w,x)%���㱳������Ʒ��
cl=limitw;%clΪ����ʣ���װ������
p=0;[m,z]=size(c);x=zeros(m,z);
[v,t]=sort1(n,c,w)%��Ʒ����λ��ֵ����
c=v;w=t;
for i=1:n
  if w(i)>cl break;%�����������Ʒ�������ڰ��ɳ��ܵ�����,����ѭ��
   else 
      x(i)=1;%x(i)Ϊ1ʱ,��Ʒi�ڰ���
     cl=cl-w(i);
p=p+1;%p��¼���뱳����Ʒ�ĸ���
 end
end
end
%%
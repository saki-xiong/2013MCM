n=8;A=[0 2 8 1 0 0 0 0; 2 0 6 0 1 0 0 0;8 6 0 7 5 1 2 0;1 0 7 0 0 0 9 0;
0 1 5 0 0 3 0 8;0 0 1 0 3 0 4 6;0 0 2 9 0 4 0 3;0 0 0 0 8 6 3 0];
k=1; %��¼A�в�ͬ�����ĸ���
for(i=1:n-1)for(j=i+1:n) %��ѭ���ǲ���A�����в�ͬ������
if(A(i,j)>0)x(k)=A(i,j); %����x ��¼A�в�ͬ������
kk=1; %��ʱ����
for(s=1:k-1)if(x(k)==x(s))kk=0;break;end;end %�ų���ͬ������
k=k+kk;end;end;end
k=k-1 %��ʾA�����в�ͬ�����ĸ���
for(i=1:k-1)for(j=i+1:k) %��x �в�ͬ��������С��������
if(x(j)<x(i))xx=x(j);x(j)=x(i);x(i)=xx;end;end;end
T(n,n)=0; %������T �����е�Ԫ�ظ�ֵΪ0
q=0; %��¼���뵽��T �еı���
for(s=1:k)if(q==n)break;end %�����С������T, �㷨��ֹ
for(i=1:n-1)for(j=i+1:n)if (A(i,j)==x(s))T(i,j)=x(s);T(j,i)=x(s); %����ߵ���T ��
TT=T; %��ʱ��¼T
while(1)pd=1; %����TT �����е���֦
for(y=1:n)kk=0;
for(z=1:n)if(TT(y,z)>0)kk=kk+1;zz=z;end;end %Ѱ��TT �е���֦
if(kk==1)TT(y,zz)=0;TT(zz,y)=0;pd=0;end;end %����TT �е���֦
if(pd)break;end;end %�ѿ�����TT �����е���֦
pd=0; %�ж�TT ���Ƿ���Ȧ
for(y=1:n-1)for(z=y+1:n)if(TT(y,z)>0)pd=1;break;end;end;end
if(pd)T(i,j)=0;T(j,i)=0; %����TT ����Ȧ
else q=q+1;end;end;end;end;end
T %��ʾ������С������T, �������

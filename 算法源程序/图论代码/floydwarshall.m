%floyd.m
function [D,R]= floydwarshall(A)
% %����floyd�㷨����ͼ����������֮�����·�̣������и�Ȩ��
%����DΪ��ͨͼ��Ȩ����
%R��·�ɾ���
D=A; n=length(D);	%����ֵ
for(i=1:n)for(j=1:n)R(i,j)=j;end;end	%��·����ֵ
for(k=1:n)
for(i=1:n)
for(j=1:n)
if(D(i,k)+D(k,j)<D(i,j))
    D(i,j)=D(i,k)+D(k,j); 	%����dij��˵��ͨ��k��·�̸���
	R(i,j)=k;end;end;end		%����rij����Ҫͨ��k
	k;  	%��ʾ��������
	D;	%��ʾÿ���������·��
	R;	%��ʾÿ���������·����R(i,j)��ʾ��i����j�����Ⱦ�����R(i,j)
	pd=0;for i=1:n	%���и�Ȩʱ
		if(D(i,i)<0)pd=1;break;end;end	%�����ڲ��forѭ�� ����һ�����ж���vi�ĸ���·
	if(pd==1)  fprintf('�и���·');break;end		%����һ������·, ���������ѭ�� ��ֹ����
end	%�������


%Ford_Fulkerson.m
n=8;C=[0	5	4	3	0	0	0	0
0	0	0	0	5	3	0	0
0	0	0	0	0	3	2	0
0	0	0	0	0	0	2	0
0	0	0	0	0	0	0	4
0	0	0	0	0	0	0	3
0	0	0	0	0	0	0	5
0	0	0	0	0	0	0	0];	%������
for(i=1:n)for(j=1:n)f(i,j)=0;end;end	%ȡ��ʼ������fΪ����
for(i=1:n)No(i)=0;d(i)=0;end	%No,d��¼���
while(1)
	No(1)=n+1;d(1)=Inf;	%������vs���
	while(1)pd=1;	%��Ź���
		for(i=1:n)if(No(i))	%ѡ��һ���ѱ�ŵĵ�vi
			for(j=1:n)if(No(j)==0&f(i,j)<C(i,j))	%����δ����ŵĵ�vj, ��vivjΪ�Ǳ��ͻ�ʱ
					No(j)=i;d(j)=C(i,j)-f(i,j);pd=0;
					if(d(j)>d(i))d(j)=d(i);end
				elseif(No(j)==0&f(j,i)>0)	%����δ����ŵĵ�vj, ��vjviΪ��������ʱ
					No(j)=-i;d(j)=f(j,i);pd=0;
					if(d(j)>d(i))d(j)=d(i);end;end;end;end;end
		if(No(n)|pd)break;end;end	%���յ�vt�õ���Ż����޷����, ��ֹ��Ź���
	if(pd)break;end	%vtδ�õ����, f���������, �㷨��ֹ
	dvt=d(n);t=n;	%�����������, dvt��ʾ������
	while(1)
		if(No(t)>0)f(No(t),t)=f(No(t),t)+dvt;	%ǰ�򻡵���
		elseif(No(t)<0)f(No(t),t)=f(No(t),t)-dvt;end	%���򻡵���
		if(No(t)==1)for(i=1:n)No(i)=0;d(i)=0; end;break;end	%��t�ı��Ϊvsʱ, ��ֹ��������
		t=No(t);end;end;	%��������ǰһ�λ��ϵ���f
wf=0;for(j=1:n)wf=wf+f(1,j);end	%�����������
f	%��ʾ�����
wf	%��ʾ�������
No	%��ʾ���, �ɴ˿ɵ���С��, �������

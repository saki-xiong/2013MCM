function [l,t]=dijkstra(A,v)
%dijkstra���·�㷨,ĳ������v�����ඥ������·
% A=[0 2 8 1 inf inf inf inf
%      2 0 6 inf 1 inf inf inf
%      8 6 0 7 5 1 2 inf
%      1 inf 7 0 inf inf 9 inf
%      inf 1 5 inf 0 3 inf 8
%      inf inf 1 inf 3 0 4 6
%      inf inf 2 9 inf 4 0 3
%      inf inf inf inf 8 6 3 0];
%  v=1;
n=length(A);%�������
V=1:n;%���㼯��
s=1;%�Ѿ��ҵ����·�ĵ㼯����ʼΪv
l=A(v,:);%��ǰv�㵽������ľ��룬��ʼΪֱ�Ӿ���
t=v.*ones(1,n);%��ǰ����ʱ��ĸ����㣬��ʼ��Ϊv
ss=setdiff(V,s);nn=length(ss);%��û���ҵ����·�ĵ㼯
for j=1:n-1%һ������n-1�ε���
    k=ss(1);
    for i=1:nn%�Ի�û���ҵ����·�ĵ�
    if l(k)>l(ss(i))
        k=ss(i);
        l(k)=l(ss(i));%�ڵ�ǰһ�о�����ȡ��Сֵ
    end
    end
    if l(k)==inf%�����ǰ����Сֵ������������
       break;
    else%����k������·�ҵ�
        s=union(s,k);
        ss=setdiff(V,s);
        nn=length(ss);
    end
    if length(s)==n%ȫ��������·���ҵ�
       break;
    else 
        for i=1:nn%��kΪ�����㣬���ͨ��k�����̣�����ĵ�ǰ��̾���
            if l(ss(i))>l(k)+A(k,ss(i))
               l(ss(i))=l(k)+A(k,ss(i));
               t(ss(i))=k;  
            end
        end
    end
end
%��������������������������Ĺۿ���v����vv����̾�����·����������С����
% v=1;%vҪ�������vһ��
% vv=6;k=vv;tt=vv;
% while(1)
% if k==v
%    tt            %·��vv <--...<-- v     ·����v��vv
%    l(vv)         %����
%    break;
% else
%    k=t(k);
%    tt=[tt,k];
% end
% end  
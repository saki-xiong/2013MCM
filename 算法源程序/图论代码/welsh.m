function welsh(n,e)
totalcolor=0;%eΪ�ڽӾ���
temp=zeros(1,n);%��ʱ���� 
for (i=1:n)  temp=e(i,:);t(i)=sum(temp);temp=0;q(i)=i;c(i)=i;end%t��¼vi�Ķȣ��ڽӾ����кͣ�q��¼������,c����ɫ��
[t,q]=sortd(n,t,q);%��������
[m,n]=size(e);
bepaint=zeros(m,n);%��ʼ����ɫ����
for i=1:n bepaint(:,i)=c(i); end 
i=1;
    for j=1:n%���㣭��
      pcivj=min(bepaint(j,:));bepaint(j,i)=pcivj;%������Сֵ
        for k=j+1:n
            if (e(j,k)==1) bepaint(k,i)=bepaint(k,i)+inf;end
        end
         pcivj=0;i=i+1;
    end
bepaint;
A=[];
for i=1:n
    A=[A ,min(bepaint(i,:))];
end
A

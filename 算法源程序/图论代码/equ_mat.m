function [P,Q,f]=equ_mat(A)
%Equivalence Matrix���ȼ۾��󣩷��������ƥ��
% A=[3 6 2 3
% 4 5 3 2
% 1 3 5 1
% 4 2 1 4];
% [P,Q,f]=equ_mat(A)
%�����뷽��������Ƿ�����걸�ģ���������ⶥ��������
%�ķ�����ɷ��������Ȩ����Ϊ0
n=length(A);
B=[];C=ones([1,n]);MM=[];
for i=1:n 
    B(i)=max(A(i,:));%ȡÿһ�е����ֵ
    M=B(i).*C;%����������
    MM=[MM;M];%�������ֵ����
end
E=A-MM;% ��ͬ�е����ֵ�õ��ȼ۷������
while(1)
num=zeros(1,n);E1=E;  H=[]; L=[];
for i=1:n
    for j=1:n
        if E1(i,j)==0
            num(i)=num(i)+1;%��¼ÿ����Ԫ����
        end
    end
    if num(i)==1%�������ҵ����е�����Ԫ���н��д���
       H=[H,i];%��¼ֻ��һ����Ԫ����(������Ԫ����ܳ����µĵ�����Ԫ�У���)
         for j=1:n
             if E1(i,j)==0
                 L=[L,j];%��¼�����Ԫ����
                  for k=1:n% �������Ԫ���ڵ�j��
                      if E1(k,j)==0&k~=i%������һ�е�������Ԫ
                          E1(k,j)=inf;
                      end
                  end
              end
          end
      end
end
num=zeros(1,n);
for j=1:n
    for i=1:n
        if E1(i,j)==0
            num(j)=num(j)+1;%��¼ÿ����Ԫ����
        end
    end
    if num(j)==1&~(ismember(L,j))%�������ҵ����е�����Ԫ(��L���е�)���н��д���
      L=[L,j];%��¼ֻ��һ����Ԫ����
         for i=1:n
             if E1(i,j)==0
                  H=[H,i];%��¼�����Ԫ����
                  for k=1:n% �������Ԫ���ڵ�i��
                      if E1(i,k)==0&k~=j%������һ�е�������Ԫ
                          E1(i,k)=inf;
                      end
                  end
              end
          end
      end
end
for i=1:n
    for j=1:n
        if (~(ismember(L,j)|ismember(L,j))& E1(i,j)==0)|length(H)==0
            %��ͬ��ͬ�ж�����Ԫ����Ԫ,H=[]ʱ����ʹ�ü��Ϻ���
            H=[H,i]; L=[L,j];%��ȡһ����Ϊ������Ԫ
            for k=1:n% �������Ԫ���ڵ�j��
                if E1(k,j)==0&k~=i%������һ�е�������Ԫ
                   E1(k,j)=inf;
                end
            end
            for k=1:n% �������Ԫ���ڵ�i��
                if E1(i,k)==0&k~=j%������һ�е�������Ԫ
                  E1(i,k)=inf;
               end
           end
       end
   end
end
if length(H)==n%�õ����ŷ���
    P=[];Q=[];
    for i=1:n
       P(H(i),L(i))=A(H(i),L(i));%�����������
       Q=[Q;H(i),L(i)];
       f=sum(sum(P));%���ŷ���ֵ���ܺ�
    end
    break;%�ҵ����ŷ��䣬�˳�
else
    a=[];b=[];
    for i=1:n
        if ~(ismember(H,i))%����ѡ�е���Ԫ���ڵ���
            a=[a,i];
            for j=1:n
                if E(i,j)==0%�ҵ���ѡ����Ԫ���ڵ���
                    b=[b,j];
                    for k=1:n
                        if (E(k,j)==0)&(ismember(k,H))%�ҵ����еı�ѡ����Ԫ
                            a=[a,k];
                        end
                    end
                end
            end
        end
    end
    E2=E;
    E2(:,b)=[];
    m=max(max(E2(a,:)));%ȥ�����Ժ�ı�ѡ����
     E(a,:)=E(a,:)-m;%����������ѡ�е��м���|m|
     E(:,b)=E(:,b)+m; %����������ѡ�е��м�ȥ|m|   
end
end

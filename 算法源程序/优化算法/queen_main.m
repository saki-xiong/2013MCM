function queen_main()
count=anpai_queen();
disp(sprintf('һ����%d��ڷŷ���',count));
end
%%
function count=anpai_queen()
count=0;k=1;N=8;
x(k)=0;
while(k>=1)
    x(k)=x(k)+1;%��ʼ����
    while x(k)<=N&~canbeplace(k,x)
        x(k)=x(k)+1;%��ʾ�Ѿ�������һ������
    end
    if x(k)>N   %����
        k=k-1;
    else
        if k==N
            %%%%%%%%%%%%%%%%%%%%%%
            printresult(x);%��ӡһ���
            %%%%%%%%%%%%%%%%%%%
            count=count+1;
        else
            k=k+1;
            x(k)=0;%������һ�ε���
        end
    end
end
end
%%
function flag=canbeplace(k,x)
flag=1;
for i=1:k
    if i~=k
    if ((x(i)==x(k))|(abs(x(i)-x(k))==abs(i-k)))%��ʽԼ��
        flag=0;
    end
    end
end
end
%%
function printresult(x)
board=zeros(8,8);N=8;
for i=1:N
    board(i,x(i))=1;
end
disp(board);
end
%%


        
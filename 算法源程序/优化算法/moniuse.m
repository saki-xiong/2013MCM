% firstΪ��ʼ��
first=rand(1)*
e=0.1^30;L=100000000;at=0.999;T=1;
 %�˻����
 for k=1:L
     %�����½�
     %������ۺ����任ֵ
     df=f1-();
     %����׼��
     if df<0
         
        %���ܣ�����¼
     elseif exp(-df/T)>rand(1)
         
         %�Ը��ʽ��ܣ�����¼
     end
     T=T*at;
     if T<e
         break;%�˳�
     end
 end
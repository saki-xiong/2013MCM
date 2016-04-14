function shortroad_ant_main
% Ant main program
clear all;close all;clc;%����
tic;%��ʱ��ʼ
Ant=50;Ger=100;%���в�����ʼ��
power=[0 5 3 100 100 100 100 100 100 100 100 100 100 100 100 100;
    100 0 100 1 3 6 100 100 100 100 100 100 100 100 100 100;
    100 100 0 100 8 7 6 100 100 100 100 100 100 100 100 100;
    100 100 100 0 100 100 100 6 8 100 100 100 100 100 100 100;
    100 100 100 100 0 100 100 3 5 100 100 100 100 100 100 100;
    100 100 100 100 100 0 100 100 3 3 100 100 100 100 100 100;
    100 100 100 100 100 100 0 100 8 4 100 100 100 100 100 100;
    100 100 100 100 100 100 100 0 100 100 2 2 100 100 100 100;
    100 100 100 100 100 100 100 100 0 100 100 1 2 100 100 100;
    100 100 100 100 100 100 100 100 100 0 100 3 3 100 100 100;
    100 100 100 100 100 100 100 100 100 100 0 100 100 3 5 100;
    100 100 100 100 100 100 100 100 100 100 100 0 100 5 2 100;
    100 100 100 100 100 100 100 100 100 100 100 100 0 6 6 100;
    100 100 100 100 100 100 100 100 100 100 100 100 100 0 100 4;
    100 100 100 100 100 100 100 100 100 100 100 100 100 100 0 3;
    100 100 100 100 100 100 100 100 100 100 100 100 100 100 100 0];
[PM PN]=size(power);
% ��ʼ������λ��
v=init_population(Ant,PN);
v(:,1)=1;v(:,PN)=1;%ʼ����յ�����·��
%�Ѿ��뵱��Ϣ��Ũ��
fit=short_road_fun(v,power);
%����ԽСԽ�ã�����Ҫ����Ϣ��Ũ�����Ӧ��
T0 = max(fit)-fit;
% ����ͼ��
figure(1);grid on;hold on;
plot(fit,'k*');
title('(a)���ϵĳ�ʼλ��');
xlabel('x');ylabel('f(x)');
% ��ʼ��
vmfit=[];vx=[];
P0=0.2;           % P0----ȫ��ת��ѡ������
P=0.8;            % P ----��Ϣ������ϵ��
%C=[];
% ��ʼѰ��
for i_ger=1:Ger
    lamda=1/i_ger;    % ת�Ʋ������� 
    [T_Best(i_ger),BestIndex]=max(T0);%�����Ϣ��Ũ��   
    for j_g=1:Ant    % ��ȡȫ��ת�Ƹ���
        r=T0(BestIndex)-T0(j_g);%����ѵ����ϵľ���
        Prob(i_ger,j_g)=r/T0(BestIndex);%Ӧ���Զ�������������£
    end  
    for j_g_tr=1:Ant
        if Prob(i_ger,j_g_tr)<P0
            %�ֲ�ת��----С����ת��
            M=rand(1,PN)<lamda;
            temp=v(j_g_tr,:)-2.*(v(j_g_tr,:).*M)+M;
        else
            %ȫ��ת��----�󲽷�ת��
            M=rand(1,PN)<P0;
            temp=v(j_g_tr,:)-2.*(v(j_g_tr,:).*M)+M;
        end
        %ʼ����յ����¼��롣���������ƶ������з����ı䡣
        temp(:,1)=1;temp(:,end)=1;        
        if short_road_fun(temp,power)<short_road_fun(v(j_g_tr,:),power)
            %��¼
            v(j_g_tr,:)=temp;
        end
    end  
    %��Ϣ�ظ��� ��׼����һ�ε���
    fit=short_road_fun(v,power);
    T0 = (1-P)*T0+(max(fit)-fit);%��Ϣ������
    [sol,indb]=min(fit);
    v(1,:)=v(indb,:);%��¼���ε�����״̬
    media=mean(fit);
    vx=[vx sol];
    vmfit=[vmfit media];
end
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%%%% �����
disp(sprintf('\n'));    %��һ��
% ��ʾ���Ž⼰����ֵ
disp(sprintf('Shortroad is %s',num2str(find(v(indb,:)))));%num2str����ת�����ַ���
disp(sprintf('Mininum is %d',sol));
v(indb,:)
% ͼ����ʾ���Ž��
figure(2);grid on;hold on;
plot(fit,'r*');
title('���ϵ�����λ��');
xlabel('x');
ylabel('f(x)');
% ͼ����ʾ���ż�ƽ������ֵ�仯����
figure(3);
plot(vx);
title('����,ƽ������ֵ�仯����');
xlabel('Generations');ylabel('f(x)');
hold on;plot(vmfit,'r');hold off;
runtime=toc%ʱ�����
end
%%
function fit=short_road_fun(v,power)
[vm vn]=size(v);
fit=zeros(vm,1);%��¼ÿһ��·���ľ���
for i=1:vm
    I=find(v(i,:)==1);%Ѱ����·���ϵĵ�
    [Im,In]=size(I);
    for j=1:In-1
        fit(i)=fit(i)+power(I(j),I(j+1));%��·���ľ���
    end
end
end
%%
%Function init_population
function v=init_population(n1,s1)
v=round(rand(n1,s1));%��ʼ�����е�����
end

    
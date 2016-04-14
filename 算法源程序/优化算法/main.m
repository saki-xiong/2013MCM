function main()
%����Ⱥ�㷨
clc
clear
format long;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N =30;    %������Ŀ
dt=2;    %ʱ����
vm=30;   %����ٶ�
w0=0.4;  %Ȩֵ  ��ͬ
w1=0.3;w2=0.5;
width=1024;  %ͼƬ�Ŀ�
height=768;  %ͼƬ�ĸ�
MN=1024;    %�����ɵ����������
con=1;          %���Ƽ�����ǵڼ���Բ�ļ�������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bpos=zeros(5,MN);   %���Ա������Բ��ȫ���������
file_in=fopen('data.txt','r+');
%��ֻ����ʽ�������ļ���
%������ļ�ָ����һЩ���ص����꣬�ɴ�����Ƭ��õ�
num=1;pos_x=0;pos_y=0;count=1;
[num,count_data]=fscanf(file_in,'%d',[1 1]);
while (~feof(file_in))
    [pos_x,count_data]=fscanf(file_in,'%d',[1 1]);
    if pos_x<=6%�����Ƿ����¸�Բ������
        num=pos_x;
        count=1;
        continue;
    end
    [pos_y,count_data]=fscanf(file_in,'%d',[1 1]);
    if num==5&count>590 break;end%�ļ���д����
    bpos(num,count)=pos_x;
    bpos(num,count+1)=pos_y;
    count=count+2;
end
fclose(file_in);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 disp(sprintf('Բ�ĵ��������£�'));
while con<=5%���Ƽ�����ڼ���Բ������
    pos=bpos;
    pos_calc=zeros(N,6);%���浱ǰλ��(x1,x2)����ʷ����λ��(x3,y4)����ǰ�ٶ�(x5,x6)
    gbest=[100,100];b=[0,0];%����Ⱥ����λ��
    %srand(time(tic));%??????????????
    for i=1:N %��ʼ��30������
        %��ʼ��λ��
        pos_calc(i,3)=fix(rand()*width);%//λ��  x,
        pos_calc(i,1)=pos_calc(i,3);
        pos_calc(i,4)=fix(rand()*height);%//λ��  y
        pos_calc(i,2)= pos_calc(i,4);
        %��ʼ�ٶ�
        if rem(rand(),2)==0
            pos_calc(i,5)=fix(rand()*vm);
        else
            pos_calc(i,5)=-fix(rand()*vm);
        end
        if rem(rand( ),2)==0
            pos_calc(i,6)=fix(rand()*vm);
        else
            pos_calc(i,6)=-fix(rand()*vm);
        end
        %�Ƚϻ������λ�ã�����ǰ�������໥�Ƚ�
        if  f(pos_calc(i,1),pos_calc(i,2),con,pos)<f(gbest(1),gbest(2),con,pos) %//��ó�ʼ����Ⱥ����λ��
            gbest(1)=pos_calc(i,1);gbest(2)=pos_calc(i,2);
        end
    end
    count=0;
    while count<20 %����20�Σ�ֱ������㹻С
        for i=1:N  %�����ٶ�
            vx=w0*(pos_calc(i,3)-pos_calc(i,1))/dt+w1*(gbest(1)-pos_calc(i,1))/dt+w2*pos_calc(i,5);
            vy=w0*(pos_calc(i,4)-pos_calc(i,2))/dt+w1*(gbest(2)-pos_calc(i,2))/dt+w2*pos_calc(i,6);
            if vx>vm  %��ֹ��������ٶ�
                pos_calc(i,5)=vm/3;
            else
                pos_calc(i,5)=vx;
            end
            if vy>vm
                pos_calc(i,6)=vm/3;
            else
                pos_calc(i,6)=vy;
            end
        end
        for i=1:N %����λ��
            pos_calc(i,1)=pos_calc(i,1)+pos_calc(i,5)*dt;
            pos_calc(i,2)=pos_calc(i,2)+pos_calc(i,6)*dt;
            if f(pos_calc(i,1),pos_calc(i,2),con,pos)<f(pos_calc(i,3),pos_calc(i,4),con,pos)%������ʷ���λ��
                pos_calc(i,3)=pos_calc(i,1);
                pos_calc(i,4)=pos_calc(i,2);%��ǰ����ʷ���Ų�����
            end
            b(1)=gbest(1);
            b(2)=gbest(2);
            if f(pos_calc(i,1),pos_calc(i,2),con,pos)<f(gbest(1),gbest(2),con,pos)
                %��ǰ��������Ⱥ���ţ���������Ⱥ����λ��
                gbest(1)=pos_calc(i,1);gbest(2)=pos_calc(i,2);
            end
        end
        count=count+1;
    end
    b(1)=fix(gbest(1));gbest(1)=b(1);%����ȡ��
    b(2)=fix(gbest(2));gbest(2)=b(2);
    for i=(b(1)-5):(b(1)+5) %//�������ڼ���õ����Ž�
        for j=(b(2)-5):(b(2)+5)
            if f(i,j,con,pos)<f(gbest(1),gbest(2),con,pos)
                gbest(1)=i;gbest(2)=j;%�����ڵ���
            end
        end
    end
    disp(sprintf('%d  %d',gbest(1),gbest(2)));
    con=con+1;
end
end
%%
function r=f(x,y,num,pos)%��Ӧ�Ⱥ������˺���ֵԽ������Ӧ��ԽС
r=0;
MN=1024;    %�����ɵ����������
for i=1:2:MN %��˵㵽��Բ�ĸ����ľ���֮��
    if pos(num,i)~=0
        r=r+sqrt((x-pos(num,i))*(x-pos(num,i))+(y-pos(num,i+1))*(y-pos(num,i+1)));
    end
end
end
%%
function pos=init_data()  %��ʼ������---���ļ��ж�ȡ
MN=1000;    %�����ɵ����������
pos=zeros(5,MN);   %���Ա������Բ��ȫ���������
file = fopen('data.txt','r+');
if(file~=-1)
    disp('ok');
else
    disp('sorry!');
end
%��ֻ����ʽ�������ļ���
%������ļ�ָ����һЩ���ص����꣬�ɴ�����Ƭ��õ�
num=0;pos_x=0;pos_y=0;count=1;
[num,count_data]=fscanf(file,'%d');
while ~feof(file)
%     if feof(file)
%         break;
%     end
disp('here');
    [pos_x,count_data]=fscanf(file,'%d');
    if pos_x<=6%�����Ƿ����¸�Բ������
        num=pos_x;
        count=1;
        continue;
    end
    [pos_y,count_data]=fscanf(file,'%d');
    pos(num,count)=pos_x;
    pos(num,count+1)=pos_y;
    count=count+2;
end
fclose(file);
pos
end
%%




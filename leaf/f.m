clc,clear
%�õ���x2��y2,z2Ϊ����������ڽڵ�����꣬x3,y3,z3Ϊ����ÿ���ڵ�����꣨����һ���⣩
x0=5;y0=5;
L1=1.4;
N=7
jd=0.001;
no=4
[x3 y3 z3 x2 y2 z2]=treeGeneration1(x0,y0,L1,N);

shadow=shadearea(jd,x2,y2,no,N) 
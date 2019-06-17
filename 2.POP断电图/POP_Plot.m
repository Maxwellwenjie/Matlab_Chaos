clear
close all
clc

x=-1.5:0.01:1.5;
y=x - x.^3;
plot(x,y);

axis([-1.5 1.5 -1.5 1.5]); %����x-y���귶Χ
grid on;%��ʾ������
axis on;%��ʾ������
xlabel('X��');ylabel('Y��');%�������ʾ�����ǩ
text(-1,0,'Q1(-1,0)','FontSize',12 ); %text(pi,0,' \leftarrow ����');
text(0,0,'Q2(0,0)','FontSize',12 );
text(1,0,'Q3(1,0)','FontSize',12 );
xlabel('x') 
ylabel('dx/dt');
set(get(gca,'XLabel'),'FontSize',16);%ͼ������Ϊ8 point��С5��
set(get(gca,'YLabel'),'FontSize',16);
set(0,'defaultfigurecolor','w');
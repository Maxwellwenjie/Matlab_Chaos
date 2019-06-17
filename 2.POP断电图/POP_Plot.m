clear
close all
clc

x=-1.5:0.01:1.5;
y=x - x.^3;
plot(x,y);

axis([-1.5 1.5 -1.5 1.5]); %设置x-y坐标范围
grid on;%显示网格线
axis on;%显示坐标轴
xlabel('X轴');ylabel('Y轴');%坐标轴表示对象标签
text(-1,0,'Q1(-1,0)','FontSize',12 ); %text(pi,0,' \leftarrow 正弦');
text(0,0,'Q2(0,0)','FontSize',12 );
text(1,0,'Q3(1,0)','FontSize',12 );
xlabel('x') 
ylabel('dx/dt');
set(get(gca,'XLabel'),'FontSize',16);%图上文字为8 point或小5号
set(get(gca,'YLabel'),'FontSize',16);
set(0,'defaultfigurecolor','w');
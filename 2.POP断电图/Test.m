clear
close all
clc

x=-3:0.01:2;
y=x.^2 +1.1* x - 0.8;
plot(x,y);

axis([-2.6 1.5 -1.5 2]); %����x-y���귶Χ
grid on;%��ʾ������
axis on;%��ʾ������
xlabel('X��');ylabel('Y��');%�������ʾ�����ǩ
text(-1,-0.9,'P1(-1,-0.9)','FontSize',12 ); %text(pi,0,' \leftarrow ����');
text(0,-0.8,'P2(0,-0.8)','FontSize',12 );
text(1,1.3,'P3(1,1.3)','FontSize',12 );

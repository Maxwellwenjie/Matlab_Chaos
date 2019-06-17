clc;
clear;
close all;

RelTol=1e-5;		
AbsTol=1e-6;		
options=odeset('RelTol',RelTol,'AbsTol',AbsTol);

x0=[0.1;0.1;-0.2];   %��ֵ����x,y,z���й�ϵ.x,y����̫��

t0=0:0.01:200;
[t,x]=ode45('wenjie',t0,x0,options);

n=1:1000;
figure
subplot(311)
plot(n, x(1:1000,1),'k'); % 1Ӧ�ô���y(1)΢�ַ��̵ĵ�һ����
% xlabel('t') 
ylabel('i_m');
set(get(gca,'XLabel'),'FontSize',16);%ͼ������Ϊ8 point��С5��
set(get(gca,'YLabel'),'FontSize',16);
set(get(gca,'TITLE'),'FontSize',15);
set(gca,'fontsize',14);

subplot(312)
plot(n, x(1:1000,2),'k'); % y(2)΢�ַ��̵ڶ�����
% xlabel('t') 
ylabel('u_c');
set(get(gca,'XLabel'),'FontSize',16);%ͼ������Ϊ8 point��С5��
set(get(gca,'YLabel'),'FontSize',16);
set(get(gca,'TITLE'),'FontSize',15);
set(gca,'fontsize',14);

subplot(313)
plot(n, x(1:1000,3),'k');  %y(3)΢�ַ��̵�������
xlabel('t') 
ylabel('x');
set(get(gca,'XLabel'),'FontSize',16);%ͼ������Ϊ8 point��С5��
set(get(gca,'YLabel'),'FontSize',16);
set(get(gca,'TITLE'),'FontSize',15);
set(gca,'fontsize',14);

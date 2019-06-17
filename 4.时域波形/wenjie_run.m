clc;
clear;
close all;

RelTol=1e-5;		
AbsTol=1e-6;		
options=odeset('RelTol',RelTol,'AbsTol',AbsTol);

x0=[0.1;0.1;-0.2];   %初值振荡与x,y,z都有关系.x,y不能太大

t0=0:0.01:200;
[t,x]=ode45('wenjie',t0,x0,options);

n=1:1000;
figure
subplot(311)
plot(n, x(1:1000,1),'k'); % 1应该代表y(1)微分方程的第一个解
% xlabel('t') 
ylabel('i_m');
set(get(gca,'XLabel'),'FontSize',16);%图上文字为8 point或小5号
set(get(gca,'YLabel'),'FontSize',16);
set(get(gca,'TITLE'),'FontSize',15);
set(gca,'fontsize',14);

subplot(312)
plot(n, x(1:1000,2),'k'); % y(2)微分方程第二个解
% xlabel('t') 
ylabel('u_c');
set(get(gca,'XLabel'),'FontSize',16);%图上文字为8 point或小5号
set(get(gca,'YLabel'),'FontSize',16);
set(get(gca,'TITLE'),'FontSize',15);
set(gca,'fontsize',14);

subplot(313)
plot(n, x(1:1000,3),'k');  %y(3)微分方程第三个解
xlabel('t') 
ylabel('x');
set(get(gca,'XLabel'),'FontSize',16);%图上文字为8 point或小5号
set(get(gca,'YLabel'),'FontSize',16);
set(get(gca,'TITLE'),'FontSize',15);
set(gca,'fontsize',14);

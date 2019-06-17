clc;
clear;
close all;

x0=[0.1;0.1;0.2];
RelTol=1e-5;		%Relative tolerance
AbsTol=1e-6;		%Absolute tolerance
options=odeset('RelTol',RelTol,'AbsTol',AbsTol);

t0=0:0.01:200;
tic
[t,x]=ode45('wenjie', t0, x0, options);

figure(1);
X = (x(500:end,1));  %x(1)����Uc
Y = (x(500:end,3));  %x(3)����x     ����ӵ�1000�ε��������һ��
plot(X, Y, 'k');
xlabel('i_m') 
ylabel('x');
set(get(gca,'XLabel'),'FontSize',16);%ͼ������Ϊ8 point��С5��
set(get(gca,'YLabel'),'FontSize',16);
set(get(gca,'TITLE'),'FontSize',15);
set(gca,'fontsize',14);



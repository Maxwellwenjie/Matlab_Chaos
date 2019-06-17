clc;
clear;
close all;

x0=[0.1;0.1;0.2];
RelTol=1e-5;		%Relative tolerance
AbsTol=1e-6;		%Absolute tolerance
options=odeset('RelTol',RelTol,'AbsTol',AbsTol);

t0=0:0.01:1000;
tic
[t,x]=ode45('wenjie', t0, x0, options);
[t,x1]=ode45('wenjie1', t0, x0, options);
[t,x2]=ode45('wenjie2', t0, x0, options);
[t,x3]=ode45('wenjie3', t0, x0, options);

figure(1);
X = (x(1000:end,1));  %x(1)代表Uc
Y = (x(1000:end,3));  %x(3)代表x     代表从第1000次迭代到最后一次

X1 = (x1(1000:end,1));
Y1 = (x1(1000:end,3));

X2 = (x2(1000:end,1));
Y2 = (x2(1000:end,3));

X3 = (x3(1000:end,1));
Y3 = (x2(1000:end,3));


subplot(2,2,1);plot(X,Y,'k');
subplot(2,2,2);plot(X1,Y1,'k');
subplot(2,2,3);plot(X2,Y2,'k');
subplot(2,2,4);plot(X3,Y3,'k');
axis([-40 20 0.5 3.5])

hold on
%xlabel('u_c') 
%ylabel('x');
set(get(gca,'XLabel'),'FontSize',16);%图上文字为8 point或小5号
set(get(gca,'YLabel'),'FontSize',16);
set(get(gca,'TITLE'),'FontSize',15);
set(gca,'fontsize',14);

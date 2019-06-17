clc;
clear;
close all;

x0=[0.1;0.1;0.2];
RelTol=1e-5;		%Relative tolerance
AbsTol=1e-6;		%Absolute tolerance
options=odeset('RelTol',RelTol,'AbsTol',AbsTol);

t0=0:0.01:200;
set(0,'defaultfigurecolor','w')
[t,x]=ode45('wenjie', t0, x0, options);

figure(1);
X = (x(1000:end,1));  %x(1)代表Uc
Y = (x(1000:end,3));  %x(3)代表x     代表从第1000次迭代到最后一次




plot(X,Y,'k');



xlabel('i_m') 
ylabel('x');
set(get(gca,'XLabel'),'Fontname', 'Times New Roman','FontAngle','italic','FontSize',16);%图上文字为8 point或小5号
set(get(gca,'YLabel'),'Fontname', 'Times New Roman','FontAngle','italic''FontSize',16);
set(get(gca,'TITLE'),'Fontname', 'Times New Roman','FontAngle','italic''FontSize',15);
set(gca,'fontsize',14);

clear all;
clc;
close all;
RelTol=1e-5;		
AbsTol=1e-6;		
options=odeset('RelTol',RelTol,'AbsTol',AbsTol);

x0=0.1;

t0=0:0.01:500;
[t,x]=ode45('myddefun2',t0,x0,options);

%n=9000:10000;
vm=sin(3*t);

aa=2*sin(3*t+pi)+sin(1*t);
I1 = vm .*(1.3*x.^2-1*x-1.3); % current  

figure
subplot(211)
plot(t(1000:1500), I1(1000:1500),'k');
%plot(sol.x,sol.y)
hold on;
plot(t(1000:1500), vm(1000:1500),'r');
%subplot(212)
%plot(vm(1000:10000), I1(1000:10000));

subplot(212)
plot(vm(1000:10000), aa(1000:10000));
hold on;
%axis([-1.2 1.2 -1.5 1]);

grid on
xlabel('\bf\iti')    %it应为斜体
ylabel('\bf\itu')
set(get(gca,'XLabel'),'FontSize',14);  %FontSize字体大小设置，gca表示当前的图；
set(get(gca,'YLabel'),'FontSize',14);
set(get(gca,'TITLE'),'FontSize',14);
set(gca,'fontsize',14);
set(0,'defaultfigurecolor','w');

%figure(2);



%t0=0:0.01:1;
%[t,x]=ode45('myddefun2',t0,x0,options);

%n=9000:10000;
%I1 = vm .*(1.3*x.^2-1*x-1.3); % current  
%vm=sin(10*t);
%plot(t,vm);
%plot(t,I1);
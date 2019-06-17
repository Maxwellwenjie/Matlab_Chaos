clear
close all
clc
global a1  a3  b1  c11 k;

syms x              %定义变量x
%-----------------定义参数
a1 = 2;
a3 = -2;
b1= 0.7; 
c11= -1.5;
k=1;   

%vm =  -0.4:0.005:0.4;
vm =  -0.4:0.005:0;
%vm =  -4:0.05:4;
index = find(vm == 0)   %find(vm == 0)：找到Vm序列中Vm=0的索引(从1开始)；
for i = 1:length(vm)    %表示i从1依次取到length(vm)，length(vm)表示Vm的长度；
    dx = a1*x+a3*x^3+b1*vm(i)+c11*x*vm(i);
    sol = roots(sym2poly(dx));   %root求多项式的根；sym2poly（多项式）返回的是符号多项式的系数（降幂）；
    n = 1;
    for j = 1:length(sol)   %j从1取到多项式根的个数；
        if imag(sol(j)) == 0  %根序列中元素的虚部如果恒为0,即为实根；
            ss(n) = sol(j);   %把该根赋给ss（）序列
            n = n + 1;
        end
    end

    %x1 = min(ss);%x的最小值;
    %x2 = max(ss);%x的最大值;

    %im1(i)=k*(ss(1)^2-ss(1)-1)*vm(i);  % im1(i) = k*(ss(1)^2-ss(1)-1)*vm(i);
    %im2(i)=k*(ss(2)^2-ss(2)-1)*vm(i);  %-ss(1)-1
    %im3(i)=k*(ss(3)^2-ss(3)-1)*vm(i);
    
    im1(i)=k*(1.3*ss(1)^2-1*ss(1)-1.3)*vm(i); 
    im2(i)=k*(1.3*ss(2)^2-1*ss(2)-1.3)*vm(i);
    im3(i)=k*(1.3*ss(3)^2-1*ss(3)-1.3)*vm(i);
 
end

figure
plot(vm,im1,'g')
hold on
plot(vm,im2,'r')
hold on
plot(vm,im3,'b')
hold on

%axis([-0.2 0.3 -0.3 0.3]) %横坐标和纵坐标范围设置
%axis([-4 4 -2 2])

grid on
xlabel('\itI_M/mA')    %it应为斜体
ylabel('\itV_M')
set(get(gca,'XLabel'),'FontSize',14);  %FontSize字体大小设置，gca表示当前的图；
set(get(gca,'YLabel'),'FontSize',14);
set(get(gca,'TITLE'),'FontSize',14);
set(gca,'fontsize',14);
set(0,'defaultfigurecolor','w');





vm1 =  0:0.005:0.4;
%vm =  -4:0.05:4;
index = find(vm1 == 0)   %find(vm == 0)：找到Vm序列中Vm=0的索引(从1开始)；
for i = 1:length(vm1)    %表示i从1依次取到length(vm)，length(vm)表示Vm的长度；
    dx = a1*x+a3*x^3+b1*vm1(i)+c11*x*vm1(i);
    sol = roots(sym2poly(dx));   %root求多项式的根；sym2poly（多项式）返回的是符号多项式的系数（降幂）；
    n = 1;
    for j = 1:length(sol)   %j从1取到多项式根的个数；
        if imag(sol(j)) == 0  %根序列中元素的虚部如果恒为0,即为实根；
            ss(n) = sol(j);   %把该根赋给ss（）序列
            n = n + 1;
        end
    end

    %x1 = min(ss);%x的最小值;
    %x2 = max(ss);%x的最大值;

    %im1(i)=k*(ss(1)^2-ss(1)-1)*vm(i);  % im1(i) = k*(ss(1)^2-ss(1)-1)*vm(i);
    %im2(i)=k*(ss(2)^2-ss(2)-1)*vm(i);  %-ss(1)-1
    %im3(i)=k*(ss(3)^2-ss(3)-1)*vm(i);
    
    im4(i)=k*(1.3*ss(1)^2-1*ss(1)-1.3)*vm1(i); 
    im5(i)=k*(1.3*ss(2)^2-1*ss(2)-1.3)*vm1(i);
    im6(i)=k*(1.3*ss(3)^2-1*ss(3)-1.3)*vm1(i);
 
end

%figure
plot(vm1,im4,'r')
hold on
plot(vm1,im5,'g')
hold on
plot(vm1,im6,'b')
hold on

%axis([-0.2 0.3 -0.3 0.3]) %横坐标和纵坐标范围设置
grid on
xlabel('\itI_M/mA')    %it应为斜体
ylabel('\itV_M')
set(get(gca,'XLabel'),'FontSize',14);  %FontSize字体大小设置，gca表示当前的图；
set(get(gca,'YLabel'),'FontSize',14);
set(get(gca,'TITLE'),'FontSize',14);
set(gca,'fontsize',14);
set(0,'defaultfigurecolor','w');


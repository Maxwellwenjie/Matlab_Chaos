function [Xmax] = getmax_1(y)
a=length(y);
j=1;
% Xmax=zeros(a,1);网上可以找到该程序getmax法——取最大值法
%用于对单参数分岔图的计算方法，另一种方法叫Poincare截面法
for i=(a-1)/2:a
    b=(y(i,1)-y(i-2,1))/2;
    c=(y(i,1)+y(i-2,1))/2-y(i-1,1);
    
    if y(i-2,1)<=y(i-1,1)&&y(i-1,1)>=y(i,1)&&c==0
        Xmax(j)=y(i-1,1);
        j=j+1;
    elseif y(i-2,1)<=y(i-1,1)&&y(i-1,1)>=y(i,1)
        Xmax(j)=y(i-1,1)-b^2/(4*c);
        j=j+1;
    end
    
end
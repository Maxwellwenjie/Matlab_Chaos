function [Xmax] = getmax_1(y)
a=length(y);
j=1;
% Xmax=zeros(a,1);���Ͽ����ҵ��ó���getmax������ȡ���ֵ��
%���ڶԵ������ֲ�ͼ�ļ��㷽������һ�ַ�����Poincare���淨
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
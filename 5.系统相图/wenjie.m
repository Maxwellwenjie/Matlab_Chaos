function dy=wenjie(~,y)

c = 0.13;   %电容130mF
L = 0.035;   %电感20mH

%i1 = (a + b*y(4)^2)*y(1); %我没有用到i1,所以不需要

dy=[ -1/c*((1.3*y(3)^2-y(3)-1.3)*y(1)+y(2)); 
     1/L*y(1);
     2*y(3)-1.9*y(3)^3+1.7*y(1)-2*y(3)*y(1);
   ];

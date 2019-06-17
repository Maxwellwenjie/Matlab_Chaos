function dy=yzq_fencha_1(~,y)

global parameter

%d = 2.12;
% c = 6.57;
%c = parameter;
%e = 1.26;
%f = 1.38;
%a = -2.83;
%b = 69;

%i1 = (a + b*y(4)^2)*y(1);
%if abs(i1) > 200
%    t=600;
%  dy = [nan, nan, nan, nan];
%else


%dy=[ y(2) - e*i1; 
%     c*(y(3) - i1);
%     d*(f*y(3) - y(2));
%     y(1);
%   ];


%end

c = 0.13;   %µçÈİ300mF
%L = 0.05;   %µç¸Ğ20mH
L = parameter

dy=[ -1/c*((1.3*y(3)^2-y(3)-1.3)*y(1)+y(2)); 
     1/L*y(1);
     2.01*y(3)-1.9*y(3)^3+1.7*y(1)-2*y(3)*y(1);
   ];

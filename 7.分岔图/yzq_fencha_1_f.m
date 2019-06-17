clc; 
close all;
clear all;
Z=[]; 

global parameter;

t0=0:0.01:400;%积分时间
X0=[0.1;0.1;0.2];

RelTol=1e-5;		%Relative tolerance
AbsTol=1e-6;		%Absolute tolerance
options=odeset('RelTol',RelTol,'AbsTol',AbsTol);    %精度控制

for   parameter=linspace(0.027, 0.07, 200);  %a的变化精度
        %disp(parameter);
        [t,y]=ode45('yzq_fencha_1', t0, X0, options);
        
       
        if length(y(:,1))>1001 &&  ~isnan(y(end,1))
             [Xmax]=getmax_1(y(1001:end,1));             %取点 
        else
            Xmax = nan;
        end
        % -------------------验证相图用---------------%
        % figure(1);                                
        % plot(y(10000:end,1),y(10000:end,2));
        % xlabel('x') 
        % ylabel('y');

        % -------------------分叉图作图---------------%
         figure (1);

        plot(parameter, Xmax,'b','markersize',5)
        hold on
        clear Xmax
end
%axis([0.02 0.055 0 23])
xlabel('1/L'); 
ylabel('\phi_L');
set(get(gca,'XLabel'),'FontSize',16);%图上文字为8 point或小5号
set(get(gca,'YLabel'),'FontSize',16);
set(get(gca,'TITLE'),'FontSize',15);
set(gca,'fontsize',14);


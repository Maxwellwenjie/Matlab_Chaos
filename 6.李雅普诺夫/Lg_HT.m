clc;
clear all;
close all;

e=0;
global parameter;

scan = linspace(0.027, 0.07, 150); %在0-0.165区间内等间隔取200个点
for parameter = scan; 
    parameter
InitialTime=0;	%初始时间
FinalTime=800;	%终止时间
TimeStep=0.01;		%步长
RelTol=1e-5;		%Relative tolerance
AbsTol=1e-6;		%Absolute tolerance
 
DiscardItr=150;	%Iterations to be discarded不再使用的迭代次数
UpdateStepNum=10;	%Lyapunov exponents updating steps——李雅普诺夫指数更新步长
linODEnum=9;	%No. of linearized ODEs
ic=[0.1;0.1;0.2];	%Initial conditions ——初始条件
 
%Dimension of the linearized system (total: d x d ODEs)——线性化系统的维数
d=sqrt(linODEnum);
%Initial conditions for the linearized ODEs——线性化常微分方程的初始条件
Q0=eye(d);
IC=[ic(:);Q0(:)];
ICnum=length(IC);		%Total no. of initial coniditions——？初始条件
%One iteration: Duration for updating the LEs——一次迭代，更新LES的持续时间
Iteration=UpdateStepNum*TimeStep;	
DiscardTime=DiscardItr*Iteration+InitialTime;
 

T1=InitialTime;
T2=T1+Iteration; %T1+迭代
TSpan=T1:TimeStep:T2;
%Absolute tolerance of each components is set to the same value
options=odeset('RelTol',RelTol,'AbsTol',ones(1,ICnum)*AbsTol);

%Initialize variables
n=0;		%Iteration counter
k=0;		%Effective iteration counter
		% (discarded iterations are not counted)
Sum=zeros(1,d);
xData=[];
yData=[];
  
A=[];

%Main loop
while (1)
   n=n+1;
   %Integration
   [t,X]=ode45('Lg_F_3',TSpan,IC,options);    
   
   [rX,cX]=size(X);
   L=cX-linODEnum;      %No. of initial conditions for 
                        %the original system

    for i=1:d
          m1=L+1+(i-1)*d;
          m2=m1+d-1;
          A(:,i)=(X(rX,m1:m2))';
   end
   %QR decomposition
   if d>1
      %The algorithm for 1st-order system doesn't require
      %QR decomposition
      [Q,R]=qr(A);
      if T2>DiscardTime
         Q0=Q;
      else
         Q0=eye(d);
      end
   else
      R=A;
   end
         
  %in the following calculation, so discard this step.
   permission=1;
   for i=1:d
      if R(i,i)==0
         permission=0;
         break;
      end
   end
  %To determine the Lyapunov exponents
   if (T2>DiscardTime && permission)
      k=k+1;
      T=k*Iteration;
      TT=n*Iteration+InitialTime;
      %There are d Lyapunov exponents
      Sum=Sum+log(abs(diag(R))');
      Lambda=Sum/T;
      
 
      %Display the calculated Lyapunov exponents every 10 steps
      if rem(k,10)==0
         Lambda ; % Lambda is the calculated Lyapunov exponents
         T2	; %Current time

         xData=[xData;TT]; %store the data to plot
         yData=[yData;Lambda];
      end
   end
        
   %If calculation is finished , exit the loop.
   if (T2>=FinalTime)
      %Show the final results (for making sure the final results being shown if DisplayStep>1)
      if (T2>DiscardTime && permission)
         Lambda
%         LD      %the Lyapunov dimension
      end
      break;
   end
   %Update the initial conditions and time span for the next iteration
      ic=X(rX,1:L);
      T1=T1+Iteration;
      T2=T2+Iteration;
      TSpan=T1:TimeStep:T2;
   IC=[ic(:);Q0(:)];
end		%End of main loop
pp=length(yData(:,1));
e=e+1;
ll(e,1)= yData(pp,1);
ll(e,2)= yData(pp,2);
ll(e,3)= yData(pp,3);
%ll(e,4)= yData(pp,4);
end

a = scan ;
plot(a, ll(:,1),a, ll(:,2),a, ll(:,3));grid;

xlabel('x(0)') 
ylabel('Lyapunov');
set(get(gca,'XLabel'),'FontSize',22);%图上文字为8 point或小5号
set(get(gca,'YLabel'),'FontSize',20);
set(get(gca,'TITLE'),'FontSize',15);
set(gca,'fontsize',16);

legend('LE1', 'LE2', 'LE3');
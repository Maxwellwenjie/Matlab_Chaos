function OUT=Lg_F_3(~,X)

global parameter;

uc=X(1);il=X(2);x=X(3);

Q=[ X(4), X(7), X(10);
    X(5), X(8), X(11);
    X(6), X(9), X(12)];


%ww=k1*((1-k2*(z-k3))^(-1/2));


CC=0.13;
LL=parameter;

duc=-1/CC * (il + (1.3*x^2-x-1.3)*uc);
dil= (1/LL) * (uc);
dx= 2.01*x - 1.9*x^3+1.7*uc-2*uc*x;



DX1=[duc;dil;dx];	%Output data

%Linearized system
aa=(1.3*x.^2-x-1.3);
bb=(1.7-2*x);
cc=(2.01-1.9*3*x);

 J=[
    -aa/CC, -1/CC,  0;
    1/LL,      0,  0;
    bb,       0,  cc];


   
%Variational equation   
F=J*Q;

%Output data must be a column vector
OUT=[DX1; F(:)];



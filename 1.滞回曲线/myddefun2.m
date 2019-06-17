function dy = myddefun2(t,y)

global vm;


dy=[
   2*y(1)-2*y(1)^3+0.7*vm-2*y(1)*vm
       ];
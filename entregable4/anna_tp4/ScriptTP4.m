format long
x=[-1;1];

f=@(t,x) [-t*x(2) ; 
          t*x(1)-t*x(2)];
          
inter=[0 20];
ha=0.05;
La=20/ha;
hb=0.1;
Lb=3/hb;


#-----------------INCISO A-----------------#
IncisoA

#-----------------INCISO B-----------------#
IncisoB

#-----------------INCISO C-----------------#
IncisoC

#-----------------INCISO D-----------------#
%IncisoD

#-----------------INCISO E-----------------#
%IncisoE

% Ejercicio 3
clear;close all;clc;
format long;
% item C
f   = @(x) sin(x)+cos(1+x.^2)-1;
df  = @(x) cos(x)-(2*x.*sin(1+x.^2));
d2f = @(x) (-sin(x))-(((4*x.^2).*cos(1+x.^2))+2*sin(1+x.^2));
tol = 1e-10;
x = 0:0.01:5;
y = f(x);

% intervalos primeras 5 raices positivas
intervalos = [2 2.6; 2.3 5];

disp('biseccion ------------------------------')
[pb1 ib1] = biseccion(df,intervalos(1,1),intervalos(1,2),tol,tol,100)
% [pb2 ib2] = biseccion(f,intervalos(2,1),intervalos(2,2),tol,tol,100)

disp('newtonR --------------------------------')
[pn1 in1] = newtonRaphson(df,d2f,2.25,tol,100)
% [pn1 in1] = newtonRaphson(f,df,2.5,tol,100)

disp('secante --------------------------------')
[ps1 is1] = secante(df,2.2,2.35,tol,100)
% [ps2 is2] = secante(f,2.3,3,tol,100)

figure; genAxis(x,y);
hold on;
plot(x,df(x));
plot(ps1,f(ps1),'*')
hold off;

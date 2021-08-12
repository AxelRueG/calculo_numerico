% Ejercicio 2
close all;clear;clc;


% Inciso b
f = @(x) (x.^3)+(4*x.^2)-10;
a = 1; b = 2;

x = [a:0.1:b];
y = f(x);

g1 = @(x) 0.5*(10-x.^3).^0.5;
g2 = @(x) (10./(4+x)).^0.5;

tol = 1e-3;
p0 =  1.5;

[p1 i1] = puntoFijo(g1,p0,tol,50)
[p2 i2] = puntoFijo(g2,p0,tol,50)

figure
genAxis(x,y)
hold on
plot(p1,0,"*")
hold off

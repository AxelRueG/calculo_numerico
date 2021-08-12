% Ejercicio 4
clear; close all; clc;

f = @(x) x.^2;
d = @(x) (0-f(x)).^2+(1-x).^2;
%derivamos para obtener el minimo local
dd = @(x) (-4*x.*(0-f(x)))-2*(1-x);
d3 = @(x) (-4.*(0-f(x)))+8*x.^2-2;

[r it] = newtonRaphson(dd,d3,1,1e-4,100)

% Graficas
x = -2:0.1:2;
figure
genAxis(x,f(x));
hold on; plot(1,0,'*');plot(r,f(r),'*'); hold off;
figure
genAxis(x,d(x));
hold on; plot(1,0,'*');plot(x,dd(x));plot(x,d3(x)); hold off;


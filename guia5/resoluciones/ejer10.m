% Ejercicio 10 y 11
close all; clear all; clc;

% Ejercicio 10 --------------------------------------------------
% x = [-1 0 1 2];
% y = [-1.1 -0.4 -0.9 -2.7];

% y_ln = log(-y); % llevamos los datos a un polinomio de grado 3

% Ejercicio 11 --------------------------------------------------
x = [4 8 12 16 20 24];
y = [1590 1320 1000 900 650 560];

y_ln = log(y);


[a,ymod,resid,SRC,ECM,r2]=mincuad(x,y_ln,1);

f = @(x) a(1);
for i = 1:length(a)-1
  f = @(x) f(x)+a(i+1)*x.^i;
end

xr = 4:1:24;
yr = f(xr);

figure
hold on
plot(x,y_ln,'*')
plot(xr,yr)
hold off

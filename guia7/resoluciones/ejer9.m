% Ejercicio 9
close all; clear; clc;

% sistema de ecuaniones
% tenemos un sistema de orden 3, que llevamos a un sistema dado por:

f = @(t,y) [
  y(2);
  y(3);
  -(4*sin(t)+28*cos(t)+4*y(3)+5*y(2)+2*y(1));
]; 
y0 = [0; 0; -1];
a = 0;
b = 15;
h = 0.1;

[x,y,~] = RK4(f,a,b,h,y0);

size(x)
size(y)

figure
hold on
plot(x,y(1,:))
plot(x,y(2,:))
plot(x,y(3,:))
hold off
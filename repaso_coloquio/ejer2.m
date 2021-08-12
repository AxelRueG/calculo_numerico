% PREGUNTA 2
close all; clear all; clc;
format short
% format long

% DESARROLLO -----------------------
m = 20;
k = 20;
c = 10;

F = @(t,x) [
  x(2);
  -(c*x(2)+k*x(1))/m
];

a = 0;
b = 10;
% parte del reposo vo = 0
% a un metro a la derecha (tomando derecha como positivo)
y0 = [1; 0];

h = 0.01;
[t,x,~] = runge_Kutta_4(F,a,b,h,y0);

h = 0.001;
[t,x,~] = runge_Kutta_4(F,a,b,h,y0);

disp("posicion de la masa a los 10 segundos: ")
x(1,end)
disp("[velocidad posicion tiempo]")
[xm,i] = max(abs(x(2,:))); % buscomos en valor absoluto porque es la velosidad maxima sin direccion
velocidad = x(2,i)
% xt = x(1,i)
tt = t(i)


% size(x)
figure
hold on
plot(t,x(1,:))
plot(t,x(2,:),'-.g')
hold off

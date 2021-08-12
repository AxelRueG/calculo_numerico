% Ejemplo 2 (PCI)\
close all;clear all; clc;
format long

% inciso A ---------------------------------------------------------------------
m = 10;
c = 0.2;
g = -9.81;

F = @(t,x) [
  x(3);
  x(4);
  (-c*x(1))/m;
  g-c*x(2)/m
];

y0 = [0; 30; 40; 0];

h = 0.001;
[t,x,~] = runge_Kutta_4(F,0,2.5,h,y0);
i = find(x(2,:) >= 0);
t(i(end))
x(1,i(end))

figure
subplot(3,1,1)
plot(t,x(1,:))
title('x vs t')
subplot(3,1,2)
plot(t,x(2,:));hold on;plot(t,zeros(1,length(t)));hold off;
title('y vs t')
subplot(3,1,3)
plot(x(1,:),x(2,:));hold on;plot(x(1,:),zeros(1,length(t)));hold off;
title('x vs y')

% ------------------------------------------------------------------------------
% inciso B ---------------------------------------------------------------------

% dev3Puntos = @(f,x,h) (1/(2*h))*(f(x+h)-f(x-h)); % fomula del punto medio
dev3Puntos = @(x,l,h) (1/(h))*(x(2:l)-x(1:l-1)); % fomula del punto medio

l = length(x)
dx1 = dev3Puntos(x(1,:),l,h);
dx2 = dev3Puntos(x(2,:),l,h);
% dx1 = 40*ones(1,l);
dx1 = [40 dx1];
dx2 = [0 dx2];

dL = sqrt((dx1).^2+(dx2).^2);

I = simpsonCompuestaDatos(t,dL)
I = trapezoidalCompuestaDatos(t,dL)

figure
subplot(2,1,1)
plot(t,dx1)
title('vx vs t')
subplot(2,1,2)
hold on
plot(t,dx2)
plot(t,zeros(1,length(dx2)))
hold off
title('vy vs t')
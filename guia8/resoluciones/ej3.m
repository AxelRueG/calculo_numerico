% Ejercicio 3
clear;close all;clc;

% dado:
% f -> p(x)dy+q(x)y+r(x)
f = @(x) [(-2./x) (2./x.^2) (sin(log(x))./x.^2)];

c2 = 1/70*(8-12*sin(log(2))-4*cos(log(2)));
c1 = 11/10-c2;
y_real = @(x) (c1*x)+(c2./x.^2)-((3/10)*sin(log(x)))-((1/10)*cos(log(x)));

inter = [1; 2];
yc = [1; 2];

h = 0.1;
L = (inter(2)-inter(1))/h;
[x1,y1] = dif_fin_dir(f,inter,yc,L);
[x2,y2] = disparo_lineal(f,inter,yc,h);

figure
hold on
grid on
xi = inter(1):0.1:inter(2);
yi = y_real(xi);
plot(xi,yi,'r')
plot(x1,y1,'-.g')
plot(x2,y2,'-.b')
legend({'real','estimada diferecia finita','estimada disparo lineal'})
hold off


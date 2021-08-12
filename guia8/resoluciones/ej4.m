% Ejercicio 4
clear;close all;clc;

% dado:
% f -> p(x)dy+q(x)y+r(x)
f = @(x) [(-2./x) (2./x.^2) (sin(log(x))./x.^2)];

c2 = 1/70*(8-12*sin(log(2))-4*cos(log(2)));
c1 = 11/10-c2;
y_real = @(x) (c1*x)+(c2./x.^2)-((3/10)*sin(log(x)))-((1/10)*cos(log(x)));
dy_real = @(x) (c1)-(2*c2./x.^3)-((3/10)*cos(log(x))./x)+((1/10)*sin(log(x))./x);

inter = [1; 2];
alpha = 1;
rob = [2 -0.0656 2]; % fueron estimadas a travez de: Ay'(b)+By(b)=C
% dy = dy_real(inter(2))


h = 0.1;
L = (inter(2)-inter(1))/h;
[x1,y1] = dif_fin_rob(f,inter,alpha,rob,L);

figure
hold on
grid on
xi = inter(1):0.1:inter(2);
yi = y_real(xi);
plot(xi,yi,'r')
plot(x1,y1,'-.g')
legend({'real','estimada diferecia finita'})
hold off
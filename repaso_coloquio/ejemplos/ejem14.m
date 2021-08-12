% Ejercicio 1
close all; 
clear all;
clc;
format long

% ------------------------------------------------------------------------------
% Ejer 1 (guia 5) --------------------------------------------------------------

t = [0 1 2];
x = [0 2 6];
y = [0 4 6];
x0 = 0;
y0 = 0;
dx0 = 0;
dy0 = 0;

S1 = funcionSplineSujeto(t,x,x0,dx0);
S2 = funcionSplineSujeto(t,y,y0,dy0);

% ------------------------------------------------------------------------------
% calculo de la derivada
dev3Puntos = @(f,x,h) (1/(2*h))*(f(x+h)-f(x-h)); % fomula del punto medio
h = 1e-11;

dx = dev3Puntos(S1,0.5,h);
dy = dev3Puntos(S2,0.5,h);
disp(dx)
disp(dy)

% ------------------------------------------------------------------------------
tt = 0:0.2:2;
xx = zeros(1,length(tt));
yy = zeros(1,length(tt));
for i = 1:length(tt)
  xx(i) = S1(tt(i));
  yy(i) = S2(tt(i));
end

figure
hold on 
plot(tt,xx);
plot(tt,yy);
plot(t,x,'xk')
plot(t,y,'ok')
legend('pos x','pos y')
hold off

figure
hold on
plot(xx,yy,'-.k')
plot(x,y,'*b')
hold off
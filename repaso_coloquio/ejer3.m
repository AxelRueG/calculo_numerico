% Ejercicio 3
clear; close all; clc;
% format long
format short

% ------------------------------------------------------------------------------
% proceso de difusión en una barra de material homogéneo
L = 2;
k0 = 0.57;
alpha = 6;

c = 0.217; % calor especifico
Area = 0.01;
dencidad = 2.7;

inter = [0; L];
% DEFINICION ECUACIONES EJER 6 -------------------------------------------------
F  = @(x) 12*cos(2*x);
Cr = @(x) 5*(x-2);
f  = @(x) [0.*x (Cr(x)/k0) (-F(x)/k0)];

% ------------------------------------------------------------------------------
% Condiciones de frontera de Robin (Parcial)
% -k0.u'(L) = H[u(L)-ue] -> [A B C] -> [k0 H H.ue]
H = 10;
ue = 4;
rob = [k0 H (H*ue)];

h = 0.01;
N = (inter(2)-inter(1))/h;
[x1,y1] = dif_fin_rob(f,inter,alpha,rob,N);
y1(end)

% h = 0.0002; 
% N = (inter(2)-inter(1))/h;
% [x2,y2] = dif_fin_rob(f,inter,alpha,rob,N);

% y2(end)

figure
hold on
plot(x1,y1)
% plot(x2,y2,'-.')
% plot(x1(mid1),y1(mid1),'*')
legend({'0.01','0.001'})
hold off

% INCISO B
disp("iniciso b ------")

dev2p = @(y,l,h) (y(2:l)-y(1:l-1))/h;
len = length(y2);
dy = dev2p(y2,len,h);

-k0*dy(end)

% INCISO C
disp("iniciso c ------")
% tenemos que calcular la integral dada por:
% A*int( fx, a, b) -> fx = c.p.u -> calor espesifico, dencidad, u 

fx = c*dencidad*y2;

E = Area*trapezoidalCompuestaDatos(x2,fx)
E = Area*simpsonCompuestaDatos(x2,fx)
% I = trapezoidalCompuestaDatos(x2,fx)
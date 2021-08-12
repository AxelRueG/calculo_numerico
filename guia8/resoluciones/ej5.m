% Ejercicio 5 y 6
clear; close all; clc;
 format long
%format short

% ------------------------------------------------------------------------------
% proceso de difusión en una barra de material homogéneo

L = 5;
k0 = 0.9;

inter = [0; L];
alpha = 6;

% DEFINICION ECUACIONES EJER 5 -------------------------------------------------
% f = @(x) [0.*x 0.*x ((-20*sin(5*(x-1)))./k0)];

% DEFINICION ECUACIONES EJER 6 -------------------------------------------------
f = @(x) [0.*x ((0.01*x.^3+0.5)/k0) ((-5*x.*(5-x))/k0)];

% ------------------------------------------------------------------------------
% Condiciones de frontera de Robin (Parcial)
% -k0.u'(L) = H[u(L)-ue] -> [A B C] -> [k0 H H.ue]
H = 15;
ue = 4;
rob = [k0 H (H*ue)];


h = 0.01;
N = (inter(2)-inter(1))/h;
[x1,y1] = dif_fin_rob(f,inter,alpha,rob,N);

mid1 = find(x1 == 3);
disp(y1(mid1))

h = 0.001;
N = (inter(2)-inter(1))/h;
[x2,y2] = dif_fin_rob(f,inter,alpha,rob,N);

mid2 = find(x2 == 3);
disp(y2(mid2))

figure
hold on
plot(x1,y1)
plot(x2,y2,'-.')
legend({'0.01','0.001'})
hold off

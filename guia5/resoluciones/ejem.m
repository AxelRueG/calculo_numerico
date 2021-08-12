% ejemplos de las transparencias
close all; clear all; clc;

%% EJEMPLO 1 ------------------------------------------------------------------- 
% x = [0 1 2 2.5 3];
% y = [2.9 3.7 4.1 4.4 5];

% [f,E] = minimo_cuadrado_lineal(x,y)
% [a,ymod,resid,SRC,ECM,r2]=mincuad(x,y,1);
% a

% figure
% hold on
% plot(x,y, '*')
% xp = 0:0.2:3;
% plot(xp,f(xp))
% hold off


%% EJEMPLO 2 -------------------------------------------------------------------
x = [0 2 4 6 8 10 12 14 16 18 20];
y = [0 215 394 553 639 701 740 729 653 584 430];

[a,ymod,resid,SRC,ECM,r2]=mincuad(x,y,2)
% a = [a0; a1; a2; ... an];
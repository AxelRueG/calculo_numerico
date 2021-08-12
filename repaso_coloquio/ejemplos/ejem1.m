% Ejemplo parcial 2 (PCV)
clear all;close all;clc;

F = @(x) [0*x 0*x -20*exp(-10*(x-0.7).^2)];

inter = [0 1];
valores = [5 6];

L = 40;

[x, y] = dif_fin_dir(F,inter,valores,L);

i = find(x == 0.5)
y(i)
length(x)

plot(x,y);
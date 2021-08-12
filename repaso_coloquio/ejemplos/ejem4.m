% PREGUNTA % (PVC)
close all; clear all; clc;

% DESARROLLO ----------------------------
% uxx = pux+qu+r
F = @(x) [ 0*x 5+(0*x) (-100*x.*(1-x)) ];

inter = [0 1];
val   = [0 0];

L = 40;

[x,y] = dif_fin_dir(F,inter,val,L);

i = find(x == 0.5)
x(i)
y(i)

figure
plot(x,y)
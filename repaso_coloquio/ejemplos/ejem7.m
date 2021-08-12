% PREGUNTA 7
close all; clear all; clc;
format short
% format long

% DESARROLLO --------------------
x = [1     1.2   1.4   1.6   1.8   2     2.2   2.4];
y = [0.678 0.512 0.387 0.293 0.221 0.167 0.126 0.096];

y_ln = log(y);

[a,ymod,resid,SRC,ECM,r2]=mincuad(x,y_ln,1);

% a = [a0 a1 a2]
f = @(x) a(1);
for i = 1:length(a)-1
  f = @(x) f(x)+a(i+1)*x.^i;
end

df = @(x) a(2);
for i = 2:length(a)-1
  df = @(x) df(x)+i*a(i+1)*x.^(i-1);
end

rev = @(x) (2*pi*exp(f(x)).*sqrt(1+(df(x).*exp(f(x))).^2));
intervalo = 1:0.1:2.4;
y_rev = rev(intervalo);

simpsonCompuestaDatos(intervalo,y_rev)
trapezoidalCompuestaDatos(intervalo,y_rev)

cuad_gauss_c(rev,1,2.4,100,3)





% p = f(1.9)
% exp(p)

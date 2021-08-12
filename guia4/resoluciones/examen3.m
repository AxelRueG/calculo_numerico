% Ejercicio 3
close all;clear;clc;

format long;

f  = @(x) x+((exp(-5*x.^2)).*cos(x));
df = @(x) 1-(10*x.*exp(-5*x.^2).*cos(x))-(sin(x).*exp(-5*x.^2));


[r it] = newtonRaphson(f,df,0.5,1e-16,100) 


x = -2*pi:0.1:2*pi;
figure; genAxis(x,f(x)); 
hold on;
plot(x,df(x));
hold off;

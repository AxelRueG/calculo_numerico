% Ejercicio 5
clear; close all; clc;

% [p+a(N/V)^2](V-Nb) - kNT = 0
p = 3.5e7; % presion
T = 300; %temperatura
k = 1.3806503e-23;
a = 0.401;
b = 42.7e-6;
N = 1000;

f = @(V) ((p+a*(N./V).^2).*(V-(N*b)))-(k*N*T);

x = -100:100;
y = f(x);

figure; genAxis(x,y);








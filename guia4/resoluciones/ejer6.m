% Ejercicio 6
close all; clear; clc;

f = @(x) x.*(log(x+3)-17)-1;
i = 1;
numit = 100;
tol = 10e-2;


while numit>=100
	[r numit] = biseccion(f,0,i,tol,tol,numit)
	i = i*2;
end

[r numit] = biseccion(f,0,i,tol,tol,100)

% Graficas
x = -1:0.1:i;
figure; genAxis(x,f(x)); 

# Ejercicio 4
close all;clear;clc;

A = [ 1 -2  2 -1;
			0  2 -1  1;
			0  0 -1 -1;
			0  0  0  2];

b = [-8 6 -4 4]';

B1 = [A b];
x1 = sustitucionHaciaAtras(B1)


B2 = [A' b];
x2 = sustitucionHaciaAdelante(B2)

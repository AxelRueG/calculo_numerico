# Ejercicio 5
clear; clc; clc; close all;

# definicion del sistema
b = [1 2 3]';
% A1 = [8 4 1; 2 6 2; 2 4 8];
% A1 = [5.00e-02 5.57e+02 -4.00e-02;1.98e+00 1.94e+02 -3.00e-03;2.74e+02 3.11e+00 7.50e-02];
A1 = [1 2 -1; 2 4 0; 0 1 -1];

disp("gauss")
tic
x1 = gauss1(A1,b)
toc

disp("gauss con pivoteo")
tic
x2 = gauss_p(A1,b)
toc

disp("factorizacion de doolittle con pivoteo")
tic
[x3 L U P] = doolittle_p(A1,b);
x3
toc

disp("factorizacion de doolittle")
tic
[A L1 U1] = doolittle(A1);
y = sustitucionHaciaAdelante([L,b]);
x4 = sustitucionHaciaAtras([U,y])
toc

disp("comprobacion doolittle pivoteado")
disp("PA")
P*A1
disp("LU")
L*U

disp("comprobacion doolittle")
A1
disp("LU")
L1*U1
disp("L")
L1
disp("U")
U1

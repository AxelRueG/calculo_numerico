# Ejercicio 6

A = [1 -2 3 0; 3 -6 9 3; 2 1 4 1;1 -2 2 -2];
b = [1 2 3 4]';

[x L U P] = doolittle_p(A,b);

disp("PA =")
P*A

disp("LU =")
L*U



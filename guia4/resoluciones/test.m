% Ejercicio 7 (Entregable)
close all; clear; clc;

E   = @(t) ((t+(1/3)).^3+(1/3)).*exp(-t);
Ea  = @(t) ((t+(1/3)).^3+(1/3)).*exp(-t)-1.5;
dE  = @(t) (-t.^3+2*t.^2+(5/3)*t-(1/27)).*exp(-t);
d2E = @(t) (t.^3-5*t.^2+(4/3)*t+(46/27)).*exp(-t);


tol = 1e-9;

% inciso A
disp("INCISO A --------------------------------------------")
disp("Biseccion")
intervalos = [0 3; 3 6];
[ra1 it1] = biseccion(Ea,intervalos(1,1),intervalos(1,2),tol,tol,50)
[ra2 it2] = biseccion(Ea,intervalos(2,1),intervalos(2,2),tol,tol,50)
E(ra1)
E(ra2)

disp("\nnewton raphson")
[r1 it1] = newtonRaphson(Ea,dE,1.6,tol,50)
[r2 it2] = newtonRaphson(Ea,dE,4,tol,50)
E(r1)
E(r2)

disp("\nSecante")
intervalos = [1 2; 3.5 4.5];
[r1 it1] = secante(Ea,intervalos(1,1),intervalos(1,2),tol,50)
[r2 it2] = secante(Ea,intervalos(2,1),intervalos(2,2),tol,50)
E(r1)
E(r2)

disp("\nPunto fijo")
pf = @(t) t+Ea(t);
[r1 it1] = puntoFijo(pf,1.6,tol,50)
[r2 it2] = puntoFijo(pf,4,tol,50)
E(r1)
E(r2)

% Inciso B
disp("\nINCISO B --------------------------------------------")
disp("Biseccion")
intervalos = [2 3];
[r it] = biseccion(dE,intervalos(1),intervalos(2),tol,tol,50)
E(r)

disp("\nnewton raphson")
[r it] = newtonRaphson(dE,d2E,1.6,tol,50)
E(r)

disp("\nSecante")
intervalos = [1 3];
[r it] = secante(dE,intervalos(1),intervalos(2),tol,50)
E(r)

disp("\nPunto fijo")
pf = @(t) t+dE(t);
[r it] = puntoFijo(pf,1.6,tol,50)
E(r)

% Inciso C
disp("\nINCISO C --------------------------------------------")
disp("Biseccion")
intervalos = [0.6 1];
[r it] = biseccion(d2E,intervalos(1),intervalos(2),tol,tol,50)
E(r)

disp("\nnewton raphson")
d3E = @(t) (1/27)*(-27*t.^3+216*t.^2-333*t+17).*exp(-t);
[r it] = newtonRaphson(d2E,d3E,0.5,tol,50)
E(r)

disp("\nSecante")
[r it] = secante(dE,intervalos(1),intervalos(2),tol,50)
E(r)

disp("\nPunto fijo")
pf = @(t) t+d2E(t);
[r it] = puntoFijo(pf,0.7,tol,50)
E(r)





% Graficas
x = [0:0.2:10];
figure
genAxis(x,E(x))
ax = gca();
set(ax, 'fontsize', 15);
hold on
plot(x,dE(x)) 
plot(x,d2E(x))
%plot(ra1,E(ra1),'*k')
%plot(ra2,E(ra2),'*k')
%plot(r,E(r),'*k')
%plot(r,0,'*k')
hold off
legend({'E(t)','t','dE/dt(t)','d2E/dt^2(t)'})

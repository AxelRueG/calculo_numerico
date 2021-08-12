% Ejercicio 1
clear;close all;clc;

f1 = @(x) 3*(x+1).*(x-0.5).*(x-1);

x = -2:0.1:1.5;
y = f1(x);

[p1 i] = biseccion(f1,-2,1.5,1e-4,1e-4,30)
[p2 i] = biseccion(f1,-2,1.5,1e-4,1e-4,30)
[p3 i] = biseccion(f1,-2,1.5,1e-4,1e-4,30)

figure
genAxis(x,y)
hold on
plot(p1,0,'*');
hold off


% parte c
cota = @(a,b,epsilon) log2(abs(b-a)/epsilon);
disp("inciso c")
n = cota(1,4,1e-3)

f2 = @(x) x.^3+x-4;

[p4 i] = biseccion(f2,1,4,1e-3,1e-3,30)
x = 1:0.1:4;
y = f2(x);

figure
genAxis(x,y);
hold on
plot(p4,0,"*");
hold off

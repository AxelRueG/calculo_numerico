% Ejercicio 4
close all;clear;clc;

A = [4,2,-2;2 4 2;-2 2 4.05];
b = [7;2;5];
maxit = 500;

% doolittle
#[xd,Ad,L,U] = doolittle(A,b);
#disp("x:");xd

%jacobi
#[xj,itj,r_hj] = jacobi(A,b,b,maxit,1e-8);
#xj
#itj
#figure;plot(r_hj);

%Gauss
#[xg,itg,r_hg] = gaussseidel(A,b,b,maxit,1e-8);
#xg
#itg
#figure;plot(r_hg);

%Sor
#[xs,its,r_hs] = sor(A,b,b,maxit,1e-8,1.8);
#xs
#its
#figure;plot(r_hs);

% gradiente
#[xc,itc,r_hc] = conjugado(A,b,b,maxit,1e-8);
#xc
#itc
#figure;plot(r_hc);

omega = 0:0.1:2;
er = [];
it = [];
for i = 1:length(omega)
  [xs,its,r_hs] = sor(A,b,b,maxit,1e-8,omega(i));
  er = [er r_hs(length(r_hs))];
  it = [it its];
end
figure; plot(omega,er); title("error relativo");
figure; plot(it); title("iteraciones");

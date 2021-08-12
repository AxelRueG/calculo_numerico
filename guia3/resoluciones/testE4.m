# Ejercicio 4

A = [10 5 0 0; 5 10 -4 0; 0 -4 8 -1; 0 0 -1 5];
b = [5 25 -11 -11]';
x = [1 1 1 1]';
maxit = 20;
tol = 1e-5;
w = 1.1; 

[xs,its,r_hs] = sor(A,b,x,maxit,tol,w);
[xg,itg,r_hg] = gaussseidel(A,b,x,maxit,tol);

printf("SOR %2.0f iteraciones\n",its)
xs
printf("Gauss Seidel %2.0f iteraciones\n",itg)
xg




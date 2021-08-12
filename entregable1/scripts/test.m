% Entregable
close all; clear; clc;

% varibles iniciales
L = [0 1];		% rango
N = 40;       % numero de particiones
h = sum(L)/N; % delta de x

% definimos f dada por la parte derecha de la imagen 2
f = @(xi) h^2*20*exp(-10*(xi-0.7).^2);

%% Inciso A
% generamos nuestro sistema
% la matriz A es una matriz banda donde su diagonal principal es igual a 2
% y sus diagonales superior e inferior igual a -1
A = diag(2*ones(1,N+1))-diag(ones(1,N),-1)-diag(ones(1,N),1);
x = [0:h:1]';
b = f(x); 

% condiciones de borde dados por la imagen 3
b(1) = 5; b(N+1) = 6; b(2) += 5; b(N) += 6;

%% ------------------------------------------------------------------
%% Datos de analicis ------------------------------------------------
t = zeros(1,5); 	% genero un vector t con el tiempo de cada metodo
x = ones(N-1,1);	% vector x0 para metodos iterativos
tol = 1e-4;				% tolerancia metodos iterativos
maxit = 50;			% numero maximo de iteraciones por metodo

Ai = A(2:N,2:N);
bi = b(2:N);

%% Inciso B
% usando doolittle (sin pivoteo devido a que es una matriz diagonal
% dominante, por lo que no es necesario intercambiar filas
tic
[u1,Alu,L,U] = doolittle(Ai,bi);
t(1) = toc;

%% Inciso C
% usando jacobi
tic
[u2,itj,r_hj] = jacobi(Ai,bi,x,maxit,tol);
t(2) = toc;

% usando Gauss-Seidel
tic
[u3,itgs,r_hgs] = gaussseidel(Ai,bi,x,maxit,tol);
t(3) = toc;

% usando SOR
tic
[u4,itsor,r_hsor] = sor(Ai,bi,x,maxit,tol,0.01);
t(4) = toc;

% gradiente conjugado
tic
[u5,itgc,r_hgc] = conjugado(Ai,bi,x,maxit,tol);
t(5) = toc;


%% Parte D 
% calculamos el radio espectral:
% def: max(|lambda|) // siendo lambda un autovalor de la matriz
radioEspectral = max(abs(eig(A)));
fprintf("radio espectral: %f\n",radioEspectral);

% calculamos el numero de condicion como: 
% k(A) = ||A^-1||.||A||
numCondicion = norm(inv(A))*norm(A);
% nc = radioEspectral/min(abs(eig(A)));  %otra forma de calcular el numero de condicion
fprintf("numero de condicion: %f\n",numCondicion);

%% ------------------------------------------------------------------
%% buscamos el mejor omega(w) para el metodo SOR --------------------
w = 0:0.05:2; w_len = length(w);
w_error = zeros(1,w_len);
w_it = zeros(1,w_len);
for omega = 1:w_len
	% comprovamos para todos los omegas
	[u4,itsor,r_hsor] = sor(Ai,bi,x,maxit,tol,w(omega));
	w_error(omega) = r_hsor(end);
	w_it(omega) = itsor;
end

figure
plot(w,w_error)
xlabel("omega")
ylabel("error")
figure
plot(w,w_it)
xlabel("omega")
ylabel("numero de iteraciones");

[emin,pos] = min(w_error); 
fprintf("w optimo: %1.2f\n",w(pos(1))) 

%% tras realizar esto obtenemos que el mejor omega es:
%% w=0 
%% que es equivalente al metodo de Gauss-Seidel
%% --------------------------------------------------------------------------


%% graficas del historial de convergencia
figure
plot(r_hj);
title(["error cometido por periodo metodo: Jacobi"]);
xlabel("periodo");
ylabel("error");

figure
plot(r_hgs);
title(["error cometido por periodo metodo: Gauss-Seidel"]);
xlabel("periodo");
ylabel("error");

figure
plot(r_hsor);
title(["error cometido por periodo metodo: SOR"]);
xlabel("periodo");
ylabel("error");

figure
plot(r_hgc);
title(["error cometido por periodo metodo: Gradiente conjugado"]);
xlabel("periodo");
ylabel("error");

%% numero de iteraciones cometidas
it = [itj itgs itsor itgc];
figure
stem(it);
title(["numero de iteraciones por metodo"]);
xlabel("metodo");
ylabel("numero iteraciones");

%% tiempo de ejecucion 
figure
stem(t);
title(["tiempo"]);
xlabel("metodo");
ylabel("tiempo [s]");

disp("U obtenidas por los distintos metodos")
U = [u1 u2 u3 u4 u5]'

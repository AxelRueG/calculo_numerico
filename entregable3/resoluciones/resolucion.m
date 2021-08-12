% Ejercicio Entregableo
close all;clear;clc;
format long;

%%% Cargamos archivos -------------------------------------
M = load('datos_temperatura.txt');
t = M(:,1);
M = M(:,2:end);
[fil, col] = size(M);  % cantidad de filas y columnas
%animacion(t,M);

%%% Datos del problema ------------------------------------
rho = 1;
c = 1;
A = 0.01;
L = 1;
E = @(I) A*rho*c*I; 	  % Energia del sistema 

%% Inciso a -----------------------------------------------
X = linspace(0,L,col);
it1 = find(t == 1);  		% indice de la fila t=1

E1 = E(trapezoidalCompuestaDatos(X,M(it1,:)))
E2 = E(simpsonCompuestaDatos(X,M(it1,:)))

figure
plot(X,M(it1,:),'b-o'); axis([0,1,0,7]);
title('temperatura medida en t=1 segundo'); 
xlabel('longitud'); ylabel('temperatura');

disp(['precision del resultado: ' num2str(abs(E2-E1)/abs(E2))])

%% Inciso b -----------------------------------------------
ME = [];
for i = 1:fil
	ME = [ME; trapezoidalCompuestaDatos(X,M(i,:))];
end

[maxE,p1] = max(ME);
[minE,p2] = min(ME);
disp(['la Energia termica mayor alcanzada es: '
			num2str(maxE) ' en: ' num2str(t(p1)) ' seg'])
disp(['la Energia termica menor alcanzada es: ' 
			num2str(minE) ' en: ' num2str(t(p2)) ' seg'])

figure
plot(X,M(p1,:),'b-o'); axis([0,1,0,7]);
title(['maxima energia medida en t=' num2str(t(p1)) ' segundo']); 
xlabel('longitud'); ylabel('temperatura');
figure
plot(X,M(p2,:),'b-o'); axis([0,1,0,7]);
title(['minima energiamedida en t=' num2str(t(p2)) ' segundo']); 
xlabel('longitud'); ylabel('temperatura');

%% Inciso c -----------------------------------------------
% calculamos el spline
[a,b,c,d] = splineCubicoSujeto(X,M(it1,:),0,0);

% generamos la funcion
Ns = length(a);
S = @(x) ((a(Ns)+(b(Ns)*(x-X(Ns)))+(c(Ns)*(x-X(Ns)).^2)+(d(Ns)*(x-X(Ns)).^3)).*(x==X(end)));
for i = 1:Ns
	S = @(x) S(x)+((a(i)+(b(i)*(x-X(i)))+(c(i)*(x-X(i)).^2)+(d(i)*(x-X(i)).^3)).*((x>=X(i))&&(x<X(i+1))));
end

% vemos si los puntos coinciden con la interpolacion
XP = linspace(0,1,100);YP = [];
for i = 1:length(XP)
	YP = [YP, S(XP(i))]; 
end

figure
hold on
plot(X,M(it1,:),'bo')
plot(XP,YP,'k.-')
axis([0,1,0,7])
title('interpolacion');
legend({'puntos dados en t=1','interpolacion de splines cubico sujeto'})
xlabel('longitud'); ylabel('temperatura');
hold off

%% Inciso d -----------------------------------------------
E3 = E(cuad_gauss_c(S,0,1,40,2))

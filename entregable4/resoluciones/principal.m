% TP Entregable 4
close all; clear; clc;
format long;

% Ecuacion diferencial:
f = @(t,x) [-t*x(2); t*x(1)-t*x(2) ];

% Inciso A ---------------------------------------------------------------------
h = 0.1; y0 = [-1 ; 1];

% usamos runge_kutta_4 para graficar la trayectoria de la particula
[t,XY,~] = runge_Kutta_4(f,0,20,h,y0);

% figure;
% plot(XY(1,:),XY(2,:));
% title('trayectoria de una particula en t=[0,20] segundos');
% ylabel('X2');
% xlabel('X1');

% % Inciso B ---------------------------------------------------------------------
% figure;plot(XY(1,1:31),XY(2,1:31));
% title('trayectoria de una particula en t=[0,3] segundos');
% ylabel('X2');
% xlabel('X1');

% disp('posicion de la particula a los tres segundos:');
% disp(['posicion en X: ' num2str(XY(1,31))]);
% disp(['posicion en Y: ' num2str(XY(2,31))]);

% V = f(t(31),XY(:,31));
% disp('');
% disp('velocidad de la particula a los tres segundos:');
% disp(['velocidad X: ' num2str(V(1))]);
% disp(['velocidad Y: ' num2str(V(2))]);

% disp('');
% disp('rapidez de la particula a los tres segundos:');
% disp(['rapidez: ' num2str(norm(V,2))]);

% % Inciso C ---------------------------------------------------------------------
% hc = [1/10;1/20;1/40;1/80;1/160];

% for i = 1:length(hc)
%   [tc,XYc,~] = runge_Kutta_4(f,0,3,hc(i),y0);
%   disp(['Soluciones con RK4 h: ' num2str(hc(i))]);
%   XYc(:,end)'
% end

% % Inciso D ---------------------------------------------------------------------
% df = @(t,x) [-t.*x(2,:); t.*x(1,:)-t.*x(2,:) ];

% % calculamos las derivadas de X1 y X2
% Aux = df(t(1:31),XY(:,1:31));
% % sqrt(dX1^2+dX2^2);
% Xsq = sqrt( Aux(1,:).^2 + Aux(2,:).^2 );

% disp(['longitud de la trayectoria (simpson): ' num2str(simpsonCompuestaDatos(t(1:31),Xsq))]);
% disp(['longitud de la trayectoria (trapezoidal): ' num2str(trapezoidalCompuestaDatos(t(1:31),Xsq))]);


% Inciso E ---------------------------------------------------------------------
distancias = zeros(1,length(t));
for i = 1:length(t)
  distancias(i) = norm(XY(:,i),2); % distancias con respecto al origen
end

it = find(distancias<0.01);
disp(['tiempo a partir de que la distancia se hace menor a 0.01: ' num2str(t(it(1))) 's']);
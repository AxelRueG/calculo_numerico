% Ejercicio del Parcial
close all;clear;

% constantes
m1 = 1;
m2 = 3;

k1 = 3;
k2 = 4;
% k3 = 1;

% sistema de ecuaciones:
% x = [x1 x2 x'1 x'2];
F = @(t,x) [
  x(3);
  x(4);
  ((-(k1+k2)*x(1))+(k2*x(2)))/m1;
  (-k2*(x(2)-x(1)))/m2
];

% % [du,dv,dx1,dx2]
% F = @(t,x) [
%   ((-(k1+k2)*x(1))+(k2*x(2)))/m1;
%   ((k2*x(1))-((k3+k2)*x(2)))/m2;
%   x(3);
%   x(4);
% ];
x0 = [0;1;0;-1];

inter = [0,20];
h = 0.01;
[t,x,~] = RK4(F,inter(1),inter(2),h,x0);
disp(x(:,end))
% disp('-------------------------')
% h = 0.001;
% [t,x,~] = RK4(F,inter(1),inter(2),h,x0);
% disp(x(:,end))

figure
hold on;
plot(t,x(1,:))
plot(t,x(2,:))
legend({'masa 1','masa 2'})
hold off
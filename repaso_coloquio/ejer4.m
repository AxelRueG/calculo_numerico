% Ejercicio 4
clear; close all; clc;
format long
% format short

% ------------------------------------------------------------------------------
f  = @(x) sin(3*x-1).*exp(-0.63*x);
df = @(x) (3*cos(3*x-1).*exp(-0.63*x))-(0.63*sin(3*x-1).*exp(-0.63*x));

a = -2;
b = 5;

cant_puntos = 7;
N = cant_puntos-1;
h = (b-a)/N;
puntos = a:h:b;
y_puntos = f(puntos);
dy0 = df(a)
dyn = df(b)


[S, dS] = f_SpS(puntos,y_puntos,dy0,dyn);


% graficas
p = -2:0.1:5;
yp = zeros(1,length(p));

for i = 1:length(p)
  yp(i) = S(p(i));
end

% Respuestas ----
t = 0.8;
r_real = f(t);
r_sp   = S(t);

disp("\nerrores: ")
err = r_real-r_sp
e_absoluto = abs(err)

% x_max_sp = fzero(dS,[-2 -0])
% y_max_sp = S(x_max_sp)

disp("\nmaximo del spline: ")
[x_max,i] = biseccion(dS,-2,-0,1e-10,1e-10,100)
y_max = S(x_max)

% GRAFICAS ------------------
figure
hold on
plot(p,f(p))
plot(p,yp)
plot(puntos,y_puntos,'*r')
plot(x_max,y_max,'or')

plot(p,zeros(1,length(p)),'k')
hold off
legend('f(x)','sp')
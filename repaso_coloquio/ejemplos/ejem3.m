% PREGUNTA 4 (splines)
close all; clear; clc;

% DESARROLLO -------------------------------------------------------------------
f  = @(x) log(x.^2+1)-exp(x/2).*cos(pi*x);
df = @(x) ((2*x)./(x.^2+1))-(1/2*exp(x/2).*cos(pi*x))+(pi*exp(x/2).*sin(pi*x));

a = -5;
b = 6;
df0 = df(a);
dfn = df(b);

% calculamos h -----------------------------------------------------------------
N = 8; % cantidad de intervalos
h = (b-a)/N;
x = a:h:b;
y = f(x);

S = funcionSplineSujeto(x,y,df0,dfn);

% valores reales ---------------------------------------------------------------
x_real = a:0.1:b;
y_real = f(x_real);
dy_real = df(x_real);

y_sp = zeros(1,length(x_real));
for i = 1:length(x_real)
  y_sp(i) = S(x_real(i));
end

% Respiestas
t = 4.2;
r_real = f(t);
r_sp   = S(t);

disp("errores: ")
err = r_real-r_sp
e_absoluto = abs(err)
e_relativo = e_absoluto/abs(r_real)

disp("maximo")
[val, i] = max(y_sp);
disp("x: ")
x_real(i)
disp("val: ")
y_sp(i)

% graficas ---------------------------------------------------------------------
figure
hold on
plot(x_real,y_real,'b')
% plot(x_real,dy_real,'-.g')
plot(x_real,y_sp,'-.k')
plot(x,y,'*r')
hold off
% legend('f(x)','df(x)','aproximacion splines')
legend('f(x)','aproximacion splines')
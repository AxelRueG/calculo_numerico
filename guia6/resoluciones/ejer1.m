% Ejercicio 1
close all;clear;clc;
format long;

% Definiciones -----------------------------------------------------------------
f  = @(x) (exp(x)-2*x.^2+3*x-1);
df = @(x) (exp(x)-4*x+3);
df2= @(x) (exp(x)-4); 


dev2Puntos = @(f,x,h) (f(x+h)-f(x))/h;
dev3Puntos = @(f,x,h) (1/(2*h))*(f(x+h)-f(x-h)); % fomula del punto medio
dev3PuntosE = @(f,x,h) (1/(2*h))*(-3*f(x)+4*f(x+h)-f(x+2*h)); % fomula del extremo de tres puntos
errTrunc = @(d2fdx2,h,x) ((abs(h)/2).*abs(d2fdx2(x)));

figure
hold on
x = linspace(-1,1,100);
plot(x,f(x))
plot(x,df(x))
plot(x,df2(x))
legend({'f(x)','df(x)','d2f(x)'})
hold off

% Error de error ---------------------------------------------------------------
% Inciso A
h = linspace(1e-11,1e-1,20);
x0 = 0;
devf2 = zeros(1,length(h));
devf3 = zeros(1,length(h));
devf3e = zeros(1,length(h));
eRedondeo = zeros(1,length(h));

% disp('derivadas')
for i = 1:length(h)

  devf2(i) = dev2Puntos(f,x0,h(i));
  devf3(i) = dev3Puntos(f,x0,h(i));
  devf3e(i) = dev3PuntosE(f,x0,h(i));
  eRedondeo(i) = errTrunc(df2,h(i),x0);

end

realDev = df(x0)
disp(abs(realDev-devf2)')

figure
plot(h,eRedondeo);
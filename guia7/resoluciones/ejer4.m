% Esto es un ejemplo que aparece en las transparencias
close all; clear; clc;

f = @(t) ((t.*exp(3.*t))/5)-(exp(3.*t)/25)+(exp(-2.*t)/25);
dydf = @(t,y) (t.*exp(3.*t))-(2.*y);
y0 = 0;

h = 0.1;
a = 0;
b = 1;
x = linspace(a,b,50);
[x1,y1,~] = forward_euler(dydf,a,b,h,y0);
[x2,y2,~] = backward_euler(dydf,a,b,h,y0);
[x3,y3,~] = crank_nicholson(dydf,a,b,h,y0);

disp([f(b);y1(end);y2(end);y3(end)])

figure; hold on;
grid on;

% subplot(2,2,1)
plot(x,f(x));
% title('real')

% subplot(2,2,2)
plot(x1,y1,'-.');
% title('euler ->')

% subplot(2,2,3)
plot(x2,y2,'-.');
% title('euler <-')

% subplot(2,2,4)
plot(x3,y3,'-.');
% title('crank_nicholson')
legend({'exacta','euler: 1','backward euler: 0.5','crank-nicholson'});
hold off;

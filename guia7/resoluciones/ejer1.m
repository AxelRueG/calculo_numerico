% Ejercicio 1
clear;close all;clc;
format long;


x0 = 0;
y0 = 0;
h = 0.1;
f = @(x,y) (-y+sin(x)+cos(x));

b = 2;
[x1,y1,n1] = forward_euler(f,x0,b,h,y0);
[x2,y2,n2] = runge_Kutta_2(f,x0,b,h,y0);
[x3,y3,n3] = runge_Kutta_4(f,x0,b,h,y0);
[x4,y4,n4] = adams_bashford(f,x0,b,h,y0);
[x6,y6,n6] = adams_moulton(f,x0,b,h,y0);
[x5,y5,n5] = backward_euler(f,x0,b,h,y0);

% disp([x1;x2;x3]);

figure
hold on
plot(x1,y1);
plot(x2,y2);
plot(x3,y3);
plot(x4,y4);
plot(x5,y5);
plot(x6,y6);
legend({'euler','RK2','RK3','Adam-B','backward','moulton'});
hold off

% disp([n1 n2 n3]);
disp([y1(end);y2(end);y3(end);y4(end);y5(end);y6(end)])

he=0.1;
Le=20/he;

x1=wa(1,:);
x2=wa(2,:);
j=1;

for i=1:length(ta)
  d(i)=norm([x1(i) x2(i)],2);
  if(d(i)<=0.01)
    tiempo(j)=ta(i);
    posicion(j,1)=x1(i);
    posicion(j,2)=x2(i);
    j++;  
  endif
endfor

disp("Distancia menor a 0.01")
posicion(1,:)
disp("Tiempo en el que ocurre")
tiempo(1)

figure(3)
title("Distancia menor o igual a 0.01")
plot(wa(1,:),wa(2,:))
hold on
plot(posicion(1,1),posicion(1,2),'r*')
r = 0.01;
theta = linspace(0,2*pi);
x = r*cos(theta);
y = r*sin(theta);
plot(x,y,'m-- -- ')
axis equal
legend("Trayectoria","Tiempo t=4.55", "circunferencia igual a 0.01")

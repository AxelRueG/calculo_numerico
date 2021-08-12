% sistema de 2 masas y 3 muelles
 clear all
 % Intervalo de tiempo
 t0=0;
 tN=10;
 % Datos
 k1=4;
 k2=2;
 k3=1;
m1=2;
m2=1;
%Condiciones iniciales
x0=1;
y0=1.5;
u0=0;
v0=0;

N=1000; % Pasos
h=(tN-t0)/N; % Intervalo


% Primeros valores
xx(1)=x0;
yy(1)=y0;
uu(1)=u0;
vv(1)=v0;

% Metodo de Runge-Kutta


for n=1:N
    % Primera K
    k1x=uu(n); % dx
    k1y=vv(n); % dy
    k1u=-(k2+k1)/m1*xx(n)+k2/m1*yy(n); % d2x
    k1v=k2/m2*xx(n)-((k2+k3)/m2)*yy(n);% d2y
    
    % Segunda K
    k2x=uu(n)+1/2*h*k1u;
    k2y=vv(n)+1/2*h*k1v;
    k2u=-(k2+k1)/m1*(xx(n)+1/2*h*k1x)+k2/m1*(yy(n)+1/2*k1y*h);
    k2v=k2/m2*(xx(n)+1/2*h*k1x)-((k2+k3)/m2)*(yy(n)+1/2*k1y*h);
    
    % Tercera K
    k3x=uu(n)+1/2*h*k2u;
    k3y=vv(n)+1/2*h*k2v;
    k3u=-(k2+k1)/m1*(xx(n)+1/2*h*k2x)+k2/m1*(yy(n)+1/2*k2y*h);
    k3v=k2/m2*(xx(n)+1/2*h*k2x)-((k2+k3)/m2)*(yy(n)+1/2*k2y*h);
    
    % Cuarta K
    k4x=uu(n)+h*k3u;
    k4y=vv(n)+h*k3v;
    k4u=-(k2+k1)/m1*(xx(n)+h*k3x)+k2/m1*(yy(n)+k3y*h);
    k4v=k2/m2*(xx(n)+h*k3x)-((k2+k3)/m2)*(yy(n)+k3y*h);
    
    
    xx(n+1)=xx(n)+(h/6)*(k1x+2*k2x+2*k3x+k4x);
    yy(n+1)=yy(n)+(h/6)*(k1y+2*k2y+2*k3y+k4y);
    uu(n+1)=uu(n)+(h/6)*(k1u+2*k2u+2*k3u+k4u);
    vv(n+1)=vv(n)+(h/6)*(k1v+2*k2v+2*k3v+k4v);
end

t=t0:h:tN;
axis([0,9,0,10])
hold on
title('Runge-Kutta')
plot(xx+2,t,'-')
plot(yy+4,t,'-r')
plot(2,t,'-g')
plot(4,t,'-g')
legend('Masa m1','Masa m2','Posicion de equilibrio')
hold off
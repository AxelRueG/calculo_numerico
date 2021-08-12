function [X,W]=rungeKutta4(a,b,f,y0,n) #recibe el inicio y final del intervalo, la función y la condición inicial
  h=(b-a)/n;#paso
  X=[a:h:b]'; #creo un vector desde a hasta b con paso h
  W=zeros(length(y0),n+1); #creo un vector de tamaño n con ceros
  W(:,1)=y0; #coloco como primer valor de W a la condicion inicial del sistema
  for i=1:n
    k1=h*f(X(i),W(:,i));
    k2=h*f(X(i)+(h/2),W(:,i)+ (0.5*k1));
    k3=h*f(X(i)+(h/2),W(:,i)+ (0.5*k2));
    k4=h*f(X(i)+h,W(:,i)+k3);
    W(:,i+1)=W(:,i)+((k1+2*k2+2*k3+k4)/6);#esquema de runge kutta 4
  endfor
endfunction
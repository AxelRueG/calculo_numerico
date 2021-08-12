function [x,y]=disparo_lineal(f,inter,yc,h)
  %function [x,y]=disparo_lineal(f,[a b],[alpha,beta],L)
  %Metodo del disparo lineal que resuelve
  %el problema de valores de contorno lineal con
  %usando Runge-Kutta
  %condiciones Dirichlet
  % y'' = p(x)y' + q(x)y + r(x) para x en [a,b]
  % y(a)=alpha , y(b)=beta
  % f: funcion columnas con las funciones p,q,r
  % inter: [a,b]
  % yc = [y(a),y(b)]
  % L: cantidad de subintervalos
    
  p=@(x) f(x)(:,1);
  q=@(x) f(x)(:,2);
  r=@(x) f(x)(:,3);

  %costruye sistema
  F=@(x,y) [y(3);
            y(4);
            p(x)*y(3)+q(x)*y(1)+r(x);
            p(x)*y(4)+q(x)*y(2)+r(x)];

  %define condiciones iniciales del sistema
  y0=[yc(1);yc(1);0;1];

  [x,yd,~]=runge_Kutta_4(F, inter(1), inter(2), h, y0);
  yd = yd'; % hay que transponer

  lambda=(yc(2)-yd(end,2))/(yd(end,1)-yd(end,2));
  y=lambda*yd(:,1)+(1-lambda)*yd(:,2);

end
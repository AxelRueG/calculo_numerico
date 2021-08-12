function [a,ymod,resid,SRC,ECM,r2]=mincuad(x,y,n)
  % Garantiza que sean vectores columnas
  x = x(:); 
  y = y(:);

  % genera una matriz de vandermode V(i,j)=a_i^n-1
  V= fliplr(vander(x));
  % trunco a solo las columnas necesarias
  D=V(:,1:(n+1));
  % obtengo los valores de a;
  a=D\y;
  % [y] obtenida de P
  ymod=D*a;
  % residuo
  resid=y-ymod; 
  m=length(x); 
  % error cuadratico total
  SRC = sum(resid.^2);
  %Error cuadratico medio
  ECM = SRC/(m);
  %coeficiente de determinacion
  SSyy= y'*y-sum(y)^2/m;
  r2= 1 - SRC/SSyy; 

  %% -- GRAFICA ----------------------------------------------------------------
  % xx= linspace (min(x), max(x),100);
  % yy=zeros(size(xx));
  % for i= 1:n+1
  %   yy= yy + a(i)*xx.^(i-1);
  % end 
  % plot(x,y,'ok',xx,yy,'r-')
end
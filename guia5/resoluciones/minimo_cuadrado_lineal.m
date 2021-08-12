% function [m,b] = minimo_cuadrado_lineal(x,y)
function [f,E] = minimo_cuadrado_lineal(x,y)
  n = length(x);

  X = sum(x);
  Y = sum(y);
  xx = sum(x.^2);
  xy = sum(x.*y);

  m = (xy-(X*Y)/n)/(xx-(X^2/n));
  b = Y/n - m*X/n;
  b
  m

  f = @(t) m*t+b;

  E = sum((y-f(x)).^2)/n;

end
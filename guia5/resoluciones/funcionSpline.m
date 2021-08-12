function S = funcionSpline(X,Y)
  % calculamos el spline
  [a,b,c,d] = splineCubicoNatural(X,Y);

  % generamos la funcion
  Ns = length(a);
  S = @(x) ((a(Ns)+(b(Ns)*(x-X(Ns)))+(c(Ns)*(x-X(Ns)).^2)+(d(Ns)*(x-X(Ns)).^3)).*(x==X(end)));
  for i = 1:Ns
          S = @(x) S(x)+((a(i)+(b(i)*(x-X(i)))+(c(i)*(x-X(i)).^2)+(d(i)*(x-X(i)).^3)).*((x>=X(i))&&(x<X(i+1))));
  end
end
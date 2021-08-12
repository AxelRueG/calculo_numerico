function [S dS] = f_SpS(X,Y,dx0,dxn)
  % calculamos el spline
  [a,b,c,d] = splineCubicoSujeto(X,Y,dx0,dxn);

  % generamos la funcion
  Ns = length(a);
  S = @(x) ((a(Ns)+(b(Ns)*(x-X(Ns)))+(c(Ns)*(x-X(Ns)).^2)+(d(Ns)*(x-X(Ns)).^3)).*(x==X(end)));
  for i = 1:Ns
    S = @(x) S(x)+((a(i)+(b(i)*(x-X(i)))+(c(i)*(x-X(i)).^2)+(d(i)*(x-X(i)).^3)).*((x>=X(i))&&(x<X(i+1))));
  end

  dS = @(x) (((b(Ns))+(2*c(Ns)*(x-X(Ns)))+(3*d(Ns)*(x-X(Ns)).^2)).*(x==X(end)));
  for i = 1:Ns
    dS = @(x) dS(x)+(((b(i))+(2*c(i)*(x-X(i)))+(3*d(i)*(x-X(i)).^2)).*((x>=X(i))&&(x<X(i+1))));
  end
end
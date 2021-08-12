function I = trapezoidalComp(f,a,b,N)

  h = (b-a)/N;
  X = a:h:b;
  Y = f(X);

	I = 0;
	n = 1:N;
	I = 0.5*(sum( (X(n+1)-X(n)).*(Y(n+1)+Y(n)) ));

end

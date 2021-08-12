function I = trapezoidalCompuestaDatos(X,Y)

	N = length(X)-1;
	I = 0;
	n = 1:N;
	I = 0.5*(sum( (X(n+1)-X(n)).*(Y(n+1)+Y(n)) ));

end

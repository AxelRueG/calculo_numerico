function I = simpsonCompuestaDatos(X,Y)

	n = length(X)-1; 			% n numero de subintervalos
	h = (X(end)-X(1))/n;	% (b-a)/n

	f_x0 = Y(1);
	f_xn = Y(end);
	Y = Y(2:n);

	% impares
	si = sum(Y(2*[1:n/2]-1));
	% pares
	sp = sum(Y(2*[2:n/2]-2));

	% formula de Simpson
	I = (h/3)*(f_x0+2*sp+4*si+f_xn);
	
end

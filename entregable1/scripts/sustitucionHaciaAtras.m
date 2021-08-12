function x = sustitucionHaciaAtras(A)
	x = A(:,end);  # necesario para que x sea columna
	n = length(x); # definimos n por ser una variable local

	x(n) = A(n,n+1)/A(n,n);
	for i = n-1:-1:1
		j = i+1:n;
		x(i) = (A(i,n+1)-A(i,j)*x(j))/A(i,i);
	end

end


function x = sustitucionHaciaAdelante(A)
	x = A(:,end);  # necesario para que x sea columna
	n = length(x); # definimos n por ser una variable local

	x(1) = A(1,n+1)/A(1,1);
	for i = 2:n
		j = 1:i-1;
		x(i) = (A(i,n+1)-A(i,j)*x(j))/A(i,i);
	end

end

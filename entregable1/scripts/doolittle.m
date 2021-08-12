function [x,A,L,U] = doolittle(A,b)
	n = length(A);
	for k=1:n
		A(k+1:n,k) = A(k+1:n,k)/A(k,k);
		A(k+1:n,k+1:n) -= A(k+1:n,k)*A(k,k+1:n);
	end
	L = eye(n)+tril(A,-1);
	U = triu(A);

	y = sustitucionHaciaAdelante([L b]);
	x = sustitucionHaciaAtras([U y]);
end

function [L,U] = LU_fact(A)
	
	n = length(A);
	A = doolittle(A);
	L = eye(n)+tril(A,-1);
	U = triu(A);

end

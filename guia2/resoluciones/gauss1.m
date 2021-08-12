function [x,A] = gauss1(A,b)
	n = length(A);
	A = [A b];
	for k = 1:n
		m = A(k+1:n,k)/A(k,k);
		A(k+1:n,k+1:n+1) = A(k+1:n,k+1:n+1)-m*A(k,k+1:n+1);
	end
	if(A(n,n)==0)
		disp('no hay solucion unica');
	end
	x = sust_atras1(A);
end

function [x] = gauss_p(A,b)

	n = length(b);
	A = [A b];
	r = 1:n; % se usa r por rows
	episilon = 1e-9;
	for k = 1:n-1
		% max() devuelva:
		% pmax: el pivote de mayor valor absoluto
		% p: posicion donde se encuentra pmax
		[pmax,p] = max(abs(A(r(k:n),k)));
		if pmax<episilon 
			disp('Los posibles pivots sopn CERO');
			break
		end
		p = p+k-1; % obtenemos la posicion real
		if p~=k
			r([p k]) = r([k p]); % actualiza el pivote
		end
		A(r(k+1:n),k) = A(r(k+1:n),k)/A(r(k),k);
		A(r(k+1:n),k+1:n+1) = A(r(k+1:n),k+1:n+1)-A(r(k+1:n),k)*A(r(k),k+1:n+1);
	end
	x = sustitucionHaciaAtras(A(r,:));

end

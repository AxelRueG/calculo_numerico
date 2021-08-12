function [x,L,U,P] = doolittle_p(A,b)
	n = length(b);
	r = 1:n;
	epsilon = 1e-9;
	for k=1:n
		[pmax,p] = max(abs(A(r(k:n),k)));
		if pmax<epsilon
			disp('Los posibles pivotes son nulos');
			break;
		end
		p = p(1)+k-1;
		if p~=k
			r([p k]) = r([k p]);
		end
		P = eye(n)(r,:);
		A(r(k+1:n),k) = A(r(k+1:n),k)/A(r(k),k);
		A(r(k+1:n),k+1:n) -= A(r(k+1:n),k)*A(r(k),k+1:n);
	end

	# soluciones
	L = eye(n)+tril(A(r,:),-1);
	U = triu(A(r,:));

	br = P*b;

	y = sustitucionHaciaAdelante([L br]);
	x = sustitucionHaciaAtras([U y]);

end

function [x,it,r_h] = jacobi(A,b,x,maxit,tol)
	n = length(A);
	it = 0;
	r_h = [];
	while it<maxit
		it++;
		w = x;
		for i=1:n
			s = A(i,1:i-1)*w(1:i-1)+A(i,i+1:n)*w(i+1:n);
			x(i) = (b(i)-s)/A(i,i);
		end
		r_h = [r_h norm(w-x,inf)];
		if norm(w-x,inf)<tol
			return
		end
	end
end

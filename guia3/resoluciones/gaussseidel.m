function [x,it,r_h] = gaussseidel(A,b,x,maxit,tol)
	n = length(A);
	it = 0;
	r_h = [];
	while it<maxit
		it++;
		w = x;
		for i=1:n
			s = A(i,1:i-1)*x(1:i-1)+A(i,i+1:n)*x(i+1:n);
			x(i) = (b(i)-s)/A(i,i);
		end
		r_h = [r_h norm(x-w,inf)];
		if norm(x-w,inf)<tol
			return
		end
	end
end

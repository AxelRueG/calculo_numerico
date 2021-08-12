function [x,it,r_h] = sor(A,b,x,maxit,tol,w)
	n = length(A);
	it = 0;
	r_h = [];
	while it<maxit
		it++;
		xp = x;
		for i=1:n
			s = A(i,1:i-1)*x(1:i-1)+A(i,i+1:n)*x(i+1:n);
			x(i) = (w*(b(i)-s)/A(i,i)) + ((1-w)*xp(i));
		end
		r_h = [r_h norm(x-xp,inf)];
		if norm(x-xp,inf)<tol
			return
		end
	end

end

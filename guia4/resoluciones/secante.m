function [p,i] = secante(f,p0,p1,tol,kmax)
	i = 2;
	q0 = f(p0); q1 = f(p1);
	while i<kmax
		p = p1 - (q1*(p1-p0))/(q1-q0);
		if (abs(p-p1)<tol)
			return
		end
		i+=1;
		p0 = p1; q0 = q1; p1 = p; q1 = f(p);
	end
	printf("no se hallo la raiz en %3.0f iteraciones\n",kmax);
end


function [p,i] = biseccion(f,a,b,tol1,tol2,kmax)
	i = 1;
	while i<kmax
		p = a+((b-a)/2);
		if (abs(f(p))<tol1 || (b-a)/2<tol2)
			return
		end
		i++;
		if (f(a)*f(p)>0)
			a = p;
		else
			b = p;
		end
	end
	printf("no se hallo la raiz en %3.0f iteraciones\n",kmax);
end


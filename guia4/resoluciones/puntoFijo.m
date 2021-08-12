function [p,i] = puntoFijo(g,p0,tol,kmax)
	i = 1;
	while i<kmax
		p = g(p0);
		if (abs(p-p0)<tol)
			return
		end
		i+=1;
		p0 = p;
	end
	printf("no se hallo la raiz en %3.0f iteraciones\n",kmax);
end


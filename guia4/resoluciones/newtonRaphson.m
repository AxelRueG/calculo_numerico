function [p,i] = newtonRaphson(f,df,p0,tol,kmax)
	i = 1;
	while i<kmax
		p = p0-(f(p0)/df(p0));
		if (abs(p-p0)<tol)
			return
		end
		i+=1;
		p0 = p;
	end
	printf("no se hallo la raiz en %3.0f iteraciones\n",kmax);
end


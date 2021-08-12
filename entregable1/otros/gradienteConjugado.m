function [x,k,r_h] = gradienteConjugado(A,b,x,maxit,tol)

  r = b-A*x;
  v = r;
  k = 0;
  r_h = [];

  while k<maxit
    k+=1;

    t = (r'*r)/(v'*A*v);
    x += t*v;
    rk = r - (t*A*v);
    s = (rk'*rk)/(r'*r);
    v = rk+s*v;
    r = rk;

    r_h = [r_h norm(r)];
    if norm(r)<tol
      return
    end
  end

end
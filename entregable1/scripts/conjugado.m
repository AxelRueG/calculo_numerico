function[x,it,r_h]=conjugado(A,b,x0,maxit,tol)
  r=b-A*x0;
  p=r;
  ro=r'*p;
  ro0=ro;
  
  for it=1:maxit 
    a=A*p;
    m=p'*a;
    alfa=ro/m;
    x=x0+(alfa*p);
    r=r-(alfa*a);
    roOld=ro;
    ro=r'*r;
    gama=ro/roOld;
    p=r+(gama*p);
    r_h(it+1)=norm((x-x0),'inf')/norm(x,'inf');
    if r_h(it+1)<tol
     break;
    endif
    x0=x;
  endfor
endfunction

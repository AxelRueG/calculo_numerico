function [s]=cuadG(f,a,b,t,coef,n)
  const=(b-a)/2;
  fi=@ (t)((b-a)*t+(b+a))/2;
  s=0;
  for i=1:n
    s=s+(coef(i)*f(fi(t(i))));
  endfor
  s=s*const;
endfunction
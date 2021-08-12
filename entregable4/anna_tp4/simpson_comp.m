function [s] = simpson_comp(f, a, b, M)
  s = 0;
  h=(b-a)/M;
  for i=2:2:length(f)-2
    s = s + f(i-1) + 4*f(i) + f(i+1);
  endfor
  s = (h/3) * s ;
endfunction
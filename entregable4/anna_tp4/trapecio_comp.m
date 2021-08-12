function [s] = trapecio_comp(f, a, b, n)
  h = (b-a)/n;
  s = 0;
  for i=1:length(f)-1
    fa=f(i);
    fb=f(i+1);
    s = s + h/2*(fb+fa);
  endfor
endfunction
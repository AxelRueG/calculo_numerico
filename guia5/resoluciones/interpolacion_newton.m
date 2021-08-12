function Px = interpolacion_newton(x,y,x0)
  n = length(x);
  Px = 0;
  c = dif_div(x,y);

  for i = 1:n
    mult = 1;
    for j = 1:i-1
      mult = (x0-x(j));
    end
    Px += mult*c(i);
  end
end
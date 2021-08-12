% x es el vector de puntos en la ordena
% y es el vector de puntos en las abscisas
% xo es el valor de x que estamos interpolando
function Px = lagrange(x,y,xo)
  n = length(x);
  P = zeros(1,n);

  for k = 1:n  
    num1 = 1;
    den1 = 1;
    for i = find([1:n] ~= k)
      num1 *= (xo-x(i));
      den1 *= (x(k)-x(i));
    end
    P(k) = num1/den1;
  end

  Px = y*P';

end

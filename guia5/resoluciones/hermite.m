function [Q,Fx] = hermite(x,y,dy,x0)
  n = length(x);

  z = zeros(1,n);
  Q = zeros(2,n);

  %  Diferencias divididas
  for i  = 1:n
    z(2*i-1) = x(i);
    z(2*i) = x(i);
    Q(2*i-1,1) = y(i);
    Q(2*i,1) = y(i);
    Q(2*i,2) = dy(i);
    if i ~= 1
      Q(2*i-1,2) = (Q(2*i-1,1)-Q(2*i-2,1))/(z(2*i-1)-z(2*i-2));
    end
  end

  for i = 3:2*n
    for j = 3:i
      Q(i,j) = (Q(i,j-1)-Q(i-1,j-1))/(z(i)-z(i-j+1));
    end
  end

  %% Interpolacion
  Fx = Q(1,1);
  for p = 1:length(x)-1
    L = 1;
    for k = 1:p
      L *= (x0-x(k));
    end
    Fx += L*Q(p+1,p+1);
  end

end
function [c] = dif_div(x,y)
  n = length(x);
  M = zeros(n,n);
  M(:,1) = y;

  for i = 2:n
    aux = length(M(i:end,i));
    M(i:end,i) = (M(i:end,i-1)-M(i-1:end-1,i-1))./(x(i:end)'-x(1:aux)');
  end
  c = diag(M);
  
end
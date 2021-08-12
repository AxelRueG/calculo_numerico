function [x,y,n] = crank_nicholson(f,a,b,h,y0)
	n = (b-a)/h;
	x = zeros(1,n+1);
	y = zeros(1,n+1);
	x(1) = a;
	y(1) = y0;
  % -------------------------------------------------------
	for i = 1:n
    % y(n+1) = y(n)+h*f(x(n+1),y(n+1))
    % 0 = y(n)+ h*f(x(n+1),y(n+1))-y(n+1)
    % donde y(n) y f(x(n),y(n)) son valores conocidos
    % funE = @(Y) y(i)+f(x(i+1),Y)-Y;
		% y(i+1) = y(i)+h*f(x(i),y(i));

		x(i+1) = x(i)+h;
		% fzero(fun,x0)
    Yn = fzero(@(Y) y(i)+h*f(x(i+1),Y)-Y,y(i));
		y(i+1) = y(i)+0.5*h*(f(x(i),y(i))+f(x(i+1),Yn));
	end

end

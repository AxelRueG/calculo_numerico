function [x,y,n] = euler(f,a,b,h,y0)

	n = (b-a)/h;
	x = zeros(1,n+1);
	y = zeros(1,n+1);
	x(1) = a;
	y(1) = y0;

	for i = 2:n+1
		y(i) = y(i-1)+h*f(x(i-1),y(i-1));
		x(i) = x(i-1)+h;
	end

end

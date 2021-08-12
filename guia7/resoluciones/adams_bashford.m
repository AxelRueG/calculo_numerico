function [x,y,n] = adams_bashford(f,a,b,h,y0)

	n = (b-a)/h;
	x = zeros(1,n+4);
	y = zeros(1,n+4);
	x(4) = a;
	y(4) = y0;

	for i = 4:n+3
		F1 = f(x(i),y(i));
		F2 = f(x(i-1),y(i-1));
		F3 = f(x(i-2),y(i-2));
		F4 = f(x(i-3),y(i-3));

		y(i+1) = y(i)+(h/24)*(55*F1 - 59*F2 + 37*F3 - 9*F4);
		x(i+1) = x(i)+h;
	end

	x = x(4:end);
	y = y(4:end);

end

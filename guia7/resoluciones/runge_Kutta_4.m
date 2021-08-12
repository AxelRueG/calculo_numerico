function [x,y,n] = runge_Kutta_4(f,a,b,h,y0)

	n = (b-a)/h;
	x = zeros(1,n+1);
	y = zeros(1,n+1);
	x(1) = a;
	y(1) = y0;

	for i = 1:n
		K1 = h*f(x(i)      , y(i));
		K2 = h*f(x(i)+0.5*h, y(i)+0.5*K1);
		K3 = h*f(x(i)+0.5*h, y(i)+0.5*K2);
		K4 = h*f(x(i)+h    , y(i)+K3);

		y(i+1) = y(i)+(K1+2*K2+2*K3+K4)/6;
		x(i+1) = x(i)+h;
	end

end

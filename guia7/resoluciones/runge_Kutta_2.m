function [x,y,n] = runge_Kutta_2(f,a,b,h,y0)

	n = (b-a)/h;
	x = zeros(1,n+1);
	y = zeros(1,n+1);
	x(1) = a;
	y(1) = y0;

	for i = 1:n
		
		x(i+1) = x(i)+h;
		F1 = h*f(x(i),y(i));
		F2 = h*f(x(i)+h,y(i)+0.5*F1);

		y(i+1) = y(i)+(1/2)*(F1+F2);

	end

end

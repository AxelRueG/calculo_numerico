function [x,y,n] = adams_moulton(f,a,b,h,y0)

	n = (b-a)/h;
	x = zeros(1,n+4);
	y = zeros(1,n+4);
	x(4) = a;
	y(4) = y0;
	for i = 4:n+3
		Fn = f(x(i),y(i));
		Fn_1 = f(x(i-1),y(i-1));
		Fn_2 = f(x(i-2),y(i-2));

		x(i+1) = x(i)+h;
    Yn1 = fzero(@(P) y(i)+(h/24)*((9*f(x(i+1),P))+(19*Fn)-(5*Fn_1)+Fn_2)-P,y(i));
		y(i+1) = y(i)+(h/24)*(9*f(x(i+1),Yn1)+19*Fn-5*Fn_1+Fn_2);
	end

	x = x(4:end);
	y = y(4:end);

end

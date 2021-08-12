function [t,y,n] = runge_Kutta_4(f,a,b,h,y0)

	[fil,~] = size(y0); % tiene que ser un vector columna

	n = (b-a)/h;
	t = zeros(1,n+1);
	y = zeros(fil,n+1);
	t(1) = a;
	y(:,1) = y0;

	for i = 1:n
		K1 = h*f(t(i)      , y(:,i));
		K2 = h*f(t(i)+0.5*h, y(:,i)+0.5*K1);
		K3 = h*f(t(i)+0.5*h, y(:,i)+0.5*K2);
		K4 = h*f(t(i)+h    , y(:,i)+K3);

		y(:,i+1) = y(:,i)+(K1+2*K2+2*K3+K4)/6;
		t(i+1) = t(i)+h;
	end

end

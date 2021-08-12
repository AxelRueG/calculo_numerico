function [a,b,c,d] = splineCubicoSujeto(X,Y,FPO,FPN)

	N = length(X);
	a = Y;
	% paso 1
	p = 1:N-1;
	h = X(p+1)-X(p);

	% paso 2
	% v es el vector de b del sistema de ecuaciones
	v = zeros(N,1);
	v(1) = ((3/h(1))*(a(2)-a(1)))-(3*FPO);
	v(N) = (3*FPN)-((3/h(N-1))*(a(N)-a(N-1)));

	# paso 3
	p = 2:N-1;
	v(p) = (3./h(p)).*(a(p+1)-a(p))-((3./h(p-1)).*(a(p)-a(p-1)));
	
	%% paso 4
	l = zeros(N,1);
	u = zeros(N,1);
	z = zeros(N,1);
	l(1) = 2*h(1);
	u(1) = 0.5;
	z(1) = v(1)/l(1);

	%% paso 5
	for i = 2:N-1
		l(i) = 2*(X(i+1)-X(i-1))-(h(i-1)*u(i-1));
		u(i) = h(i)/l(i);
		z(i) = (v(i)-h(i-1)*z(i-1))/l(i);
	end

	%% paso 6
	l(N) = h(N-1)*(2-u(N-1));
	z(N) = (v(N) - h(N-1)*z(N-1))/l(N);
	c = zeros(N,1);
	c(N) = z(N);

	%% paso 7
	b = zeros(N-1,1);
	d = zeros(N-1,1);
	for j = N-1:-1:1
		c(j) = z(j)-u(j)*c(j+1);
		b(j) = (( a(j+1) - a(j) )/h(j)) - (( h(j)*( c(j+1) + 2*c(j) ))/3);
		d(j) = (c(j+1)-c(j))/(3*h(j));
	end
	a = Y(1:N-1)';
	c = c(1:N-1);

end

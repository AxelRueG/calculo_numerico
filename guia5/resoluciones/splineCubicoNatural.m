function [a,b,c,d] = splineCubicoNatural(X,Y)

	N = length(X);
	a = Y;
	% paso 1
	p = 1:N-1;
	h = X(p+1)-X(p);

	% paso 2
	% v es el vector de b del sistema de ecuaciones
	v = zeros(N,1);
	p = 2:N-1;
	v(p) = (3./h(p)).*(a(p+1)-a(p))-((3./h(p-1)).*(a(p)-a(p-1)));
	
	%% paso 3
	l = zeros(N,1);
	u = zeros(N,1);
	z = zeros(N,1);
	l(1) = 1;
	u(1) = 0;
	z(1) = 0;

	%% paso 4
	for i = 2:N-1
		l(i) = 2*(X(i+1)-X(i-1))-(h(i-1)*u(i-1));
		u(i) = h(i)/l(i);
		z(i) = (v(i)-h(i-1)*z(i-1))/l(i);
	end

	%% paso 5
	l(N) = 1;
	z(N) = 0;
	c = zeros(N,1);
	c(N) = 0;

	%% paso 6
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

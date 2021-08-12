function [r1 r2] = ejer10(x)
	delta = x(2)^2-4*x(1)*x(3);

	r1 = (-x(2)+sqrt(delta))/(2*x(1));
	r2 = (-x(2)-sqrt(delta))/(2*x(1));

	if delta<0
		printf('raices complejas\n')
	else 
		printf('raices reales\n')
	end


	entrada = -10:0.1:10;
	salida = polyval(x,entrada);
	plot(entrada,salida)
end

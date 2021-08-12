function dy = DiferenciacionDosPuntos(f,x,h)

	dy = (f(x+h)-f(x))./h;

end

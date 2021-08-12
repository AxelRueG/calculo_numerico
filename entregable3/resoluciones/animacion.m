function [] = animacion(t,M)

	[fil,col] = size(M);
	figure
	x = linspace(0,1,col);
	for i = 1:fil
		plot(x,M(i,:),'b-o');
		title(['tiempo: ' num2str(t(i))])
		axis([0,1,0,8]);
		pause(0.0005);
	end

end

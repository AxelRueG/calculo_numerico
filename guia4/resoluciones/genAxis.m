function [] = genAxis(x,y)
	hold on
	plot(x,y);
	plot([x(1) x(end)],[0 0],'-.k')
	if(x(1)<0 && x(end)>0)
		plot([0 0],[max(y) min(y)],'-.k');
	end
	hold off
end


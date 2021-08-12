[tb,wb]=rungeKutta4(inter(1),3,f,x,Lb);

figure(2)
plot(wb(1,:),wb(2,:));

disp("Posicion en t=3s")
pos=wb(:,end)

disp(" ")
disp("Velocidad en t=3")
xp=f(3,pos)

disp("Rapidez en t=3")
v=f(3,pos);
norm(v,2)


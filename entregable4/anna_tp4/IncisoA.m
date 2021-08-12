[ta,wa]=rungeKutta4(inter(1),inter(2),f,x,La);
figure(1)
plot(wa(1,:),wa(2,:),"linewidth",1.5)
title("Trayectoria de la particula (X1 vs X2)")
xlabel("X2")
ylabel("X1")
legend("Runge Kutta orden 4")

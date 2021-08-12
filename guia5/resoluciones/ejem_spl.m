x = linspace(0,2*pi,10);
y = sin(x);

S = funcionSpline(x,y);

% interpolacion
xp = 0:0.2:2*pi-0.2;
yp = zeros(1,length(xp));
for i = 1:length(xp)
  yp(i) = S(xp(i));
end

% graficas
figure
hold on
grid on

plot(x,y,'k*');
plot(xp,yp);

hold off
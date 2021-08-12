format long

h1=1/10;
h2=1/20;
h3=1/40;
h4=1/80;
h5=1/160;

x1=@(t) t*x(2)*x(1);
x2=@(t) t*x(1)*x(2)-(t/2)*x(2)^2;

areax=zeros(length(x),1);

[t1,w1]=rungeKutta4(inter(1),3,f,x,(3/h1));
[t2,w2]=rungeKutta4(inter(1),3,f,x,(3/h2));
[t3,w3]=rungeKutta4(inter(1),3,f,x,(3/h3));
[t4,w4]=rungeKutta4(inter(1),3,f,x,(3/h4));
[t5,w5]=rungeKutta4(inter(1),3,f,x,(3/h5));

disp("Soluciones con RK4")
w1(:,end)
w2(:,end)
w3(:,end)
w4(:,end)
w5(:,end)


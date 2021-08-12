x1=wb(1,:);
x2=wb(2,:);
x1d=zeros(1,length(tb));
x2d=zeros(1,length(tb));
for i=1:length(tb)
  x1d(i)= -tb(i).*x2(i);
  x2d(i)= tb(i).*x1(i)-tb(i).*x2(i);
endfor

fdEval=zeros(1,length(tb));
for i=1:length(tb)
  fdEval(i)=sqrt(x1d(i)^2+x2d(i)^2);
endfor 

[tr] = trapecio_comp(fdEval,inter(1),3,Lb)
[s]=simpson_comp(fdEval,inter(1),3, Lb)


[a,b,c,d]=cubic_spline_clamped(tb',fdEval,0,0);
fEval=zeros(40,50);
divI=zeros(40,50);
aG=0;#se suma los pedacitos que se obtuvo con gauss
for i=1:length(a)
    #divido cada intervalo en 50 puntos
    divI(i,:)=linspace(tb(i),tb(i+1),50);
    funcion=@(t) a(i)+b(i).*(t-tb(i))+c(i).*((t-tb(i)).^2)+d(i).*((t-tb(i)).^3);
    aG=aG+cuadG(funcion,tb(i),tb(i+1),[0.5773502692 0.5773502692],[1 1],2);
    fEval(i,:)=funcion(divI(i,:)');
endfor

disp("Area obtenida con Cuadratura de gauss")
aG
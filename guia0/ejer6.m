A = [1 2 3; 4 5 6;7 8 9]
B = A'
C = [-3.2 5 6.4 6; 4 17 -1.3 2.1; 5.9 -6 0 4.5]

mat = C'

C(1:2,2:4)
C(:,3)
C(2,:)
zeros(5,2)
ones(2,3)
v = diag(A)
D = diag(v,1)
E = diag(v,-1)

F = diag(5*ones(3,1),0)+diag(ones(2,1),-1)+diag(-3*ones(2,1),1)

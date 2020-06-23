clear 
format long
A = [1 2 1 1; 1 4 0 2; 2 10 4 0; 1 0 2 2]
b = [3 3 10 1]'


%% Punto A
x1 = A \ b

[L, U, P] = lu(A)
x2 = U \ (L \ (P * b))

erroredue = norm(x1-x2,2)/norm(x2,2)
erroreinf = norm(x1-x2,inf)/norm(x2,inf)

%% punto B

det = det(A) % confronto

dettest = prod(diag(U)) 
clear
format long
e = 1e-4;
A = [1 0 0; 0 1 0; 0 0 e];
b = [1 0 0]'

normauno = @(x) sqrt(max(eig(x' * x)));
normadue = @(x) sqrt(max(eig(x' * x)));
normainf = @(x) sqrt(max(eig(x' * x)));

cond2 = cond(A,2)
k2 = normadue(A) * normadue(inv(A))
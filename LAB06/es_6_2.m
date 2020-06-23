 A1 = [1 2 2; 1 1 1; 2 2 1]

x = [1 2 3]';

x0 = zeros(3,1);

b1= A1 * x;

D = diag(diag(A1));
L = tril(A1,-1);
U = triu(A1,+1);

%% Jacobi
B_j = -D\(L+U);
B_gs = -(D+L)\U;

g_j = D\b1;
g_gs = (D+L)\b1; 

[x_j, iter_j, incr_j] = stationary_method(B_j, g_j, x0, 1e-3, 100)
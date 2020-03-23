%% punto A
f = @(x) 3 - 1./x - 2.* log(x);
close all
figure(1)
rootfinding_function_plot(f,0,2*pi,false)
% lo zero si trova tra [0.1, 0.3] 
% l'altro tra [3.8 e 4.2]

%% punto B
tol = 1e-5;
n_1 = ceil(log2((0.3-0.1)./(2*tol)))
n_2 = ceil(log2((6-2)./(2*tol)))

%% punto C
a1 = 0.1;
b1 = 0.3;

a2 = 3.8;
b2 = 4.2;

[xi, xiter] = bisection(f, a1, b1, tol);
figure(2)
semilogy(abs(xi-xiter));
[xi, xiter] = bisection(f, a2, b2, tol);
figure(3)
semilogy(abs(xi-xiter));
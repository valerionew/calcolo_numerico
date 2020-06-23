%% (a) 

m = 5000; 
Z = randn(m,m);
A = Z'*Z; b = randn(m,1);
tic; x=A\b; toc;

%% (b) 
tic; x = A\b; toc;

%% (c)
A2 = A; A2(m,1) = A2(m,1)/2;
tic; x = A2\b; toc;

%% (d) 
I = eye(m,m); emin = min(eig(A));
A3 = A - .9*emin*I;
tic; x = A3\b ; toc;

%% (e) 
A4 = A - 1.1*emin*I;
tic; x = A4\b; toc;

%% (f)
A5 = triu(A) ;
tic; x = A5\b; toc;

%% (g) 
A6 = A5; A6(m,1) = A5(1,m);
tic; x = A6\b; toc;

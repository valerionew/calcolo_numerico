% tool for selecting a capacitance and an inductance values given the
% eigenvalues and the resistance

%  IN -----UUUUU---\/\/\/----+----------+-- OUT
%            L       R1      |          |
%                            \         _|_
%                        R2  /         ___ C
%                            \          |
%                           _|_        _|_
%                           \ /        \ /
%

lambda = [-100 ; -1e6];
syms C L

R1 = 20;
R2 = 1000;

A = [   -1/(R2*C)    1/C     ; 
        -1/L         -R1/L   ];
    
symLambda = eig(A)

[C, L] = solve( symLambda - [-100 ; -1e6], C, L)

 C = double(C)
 L = double(L)

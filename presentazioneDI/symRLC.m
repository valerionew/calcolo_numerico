clear
close all

% solve for L and C given lambda1, lambda2, R1, R2

syms C L

syms R1 R2

syms lambda1 lambda2

A = [   -1/(R2*C)    1/C     ; 
        -1/L         -R1/L   ];
    
symLambda = eig(A)

[C, L] = solve( symLambda - [-700; -1300], C, L)

% C = double(C)
% L = double(L)


% figure(4);
% rotate3d on
% fsurf(C(1),[10 1e6]);
% set(gca, 'XLim', [10, 1e6], 'YLim', [10, 1e6], 'ZLim', [1e-9, 1e-3], ...
%          'XScale','log', 'YScale', 'log','ZScale', 'log');
%      
%      
% figure(5);
% rotate3d on
% fsurf(C(2),[10 1e6]);
% set(gca, 'XLim', [10, 1e6], 'YLim', [10, 1e6], 'ZLim', [1e-9, 1e-3], ...
%          'XScale','log', 'YScale', 'log','ZScale', 'log');   
%      
% figure(6);
% rotate3d on
% fsurf(L(1),[10 1e4]);
% set(gca, 'ZLim', [1e-9, 1e-1],'XScale','log', 'YScale', 'log', 'ZScale', 'log');
% xlabel('R2'); 
% ylabel('R1'); 
% zlabel('Inductance L'); 
% 
% figure(7);
% rotate3d on
% fsurf(L(2),[10 1e4]);
% set(gca, 'ZLim', [1e-9, 1e-1],'XScale','log', 'YScale', 'log', 'ZScale', 'log');
% xlabel('R2'); 
% ylabel('R1'); 
% zlabel('Inductance L'); 

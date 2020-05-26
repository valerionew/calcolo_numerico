clear all
close all
syms s L C R1 R2

t1 = 0.02;

TF = R2./( s.^2.*L.*C.*R2 + s.*(L + R1.*R2.*C) + R1 + R2);

F = TF .* (0.25 .* exp(-s.*t1) ./ s);

f = ilaplace(F);
% Poco stiff
% lambda = [-100, -200]
C = 7.6e-4;
R1 = 20;
R2 = 1e3;
L = 67e-3;

% Molto stiff
% lambda = [-100, -1e6]
% C = 500e-6;
% R1 = 20;
% R2 = 1e3;
% L = 20e-6;

% 
% TF = subs(TF)
% 
% [n,d]=numden(TF);
% num=sym2poly(n);
% den=sym2poly(d);
% TF=tf(num,den);
% 
% 
% bode(TF);
% 
% title("RLC filter - not stiff system");

t = linspace(0,0.1,1000);

t_ex = t;
y_ex = double(subs(f));

save( "y_ex_nonstiff_shifted_step_0.25V.mat", 'y_ex', 't_ex');

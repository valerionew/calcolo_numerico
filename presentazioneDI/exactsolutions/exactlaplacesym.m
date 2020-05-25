clear all
close all
syms s L C R1 R2
 
Ampl = 0.5;
w = 100;


TF = R2./( s.^2.*L.*C.*R2 + s.*(L + R1.*R2.*C) + R1 + R2);
F = TF .* Ampl.*(2.*pi.*w)./((2.*pi.*w).^2 + s.^2);

f = ilaplace(F);
% Poco stiff
% lambda = [-100, -200]
% C = 7.6e-4;
% R1 = 20;
% R2 = 1e3;
% L = 67e-3;

% Molto stiff
% lambda = [-100, -1e6]
C = 500e-6;
R1 = 20;
R2 = 1e3;
L = 20e-6;

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

save( "y_ex_stiff_0.5V_100Hz.mat", 'y_ex', 't_ex');

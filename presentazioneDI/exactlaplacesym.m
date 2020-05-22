clear all
close all
syms s L_sym C_sym R1_sym R2_sym
 
Ampl = 0.5;
w = 50;
TF = R2_sym./( s.^2.*L_sym.*C_sym.*R2_sym + s.*(L_sym + R1_sym.*R2_sym.*C_sym) + R1_sym + R2_sym);
F = TF .* Ampl.*(2.*pi.*w)./((2.*pi.*w).^2 + s.^2);

f = ilaplace(F);

% C_sym = 500e-6;
% R1_sym = 20;
% R2_sym = 1e3;
% L_sym = 20e-6;

C_sym = 7.6e-4;
R1_sym = 20;
R2_sym = 1e3;
L_sym = 67e-3;


TF = subs(TF)

[n,d]=numden(TF);
num=sym2poly(n);
den=sym2poly(d);
TF=tf(num,den);


bode(TF);

title("RLC filter - not stiff system");

t = linspace(0,0.1,1000);

t_ex = t;
y_ex = double(subs(f));

save( "y_ex.mat", 'y_ex', 't_ex');

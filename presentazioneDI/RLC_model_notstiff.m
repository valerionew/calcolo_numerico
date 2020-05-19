function dydt = RLC_model_notstiff(t, y)
%% parametri
% Poco stiff
% lamda = [-100, -1000]
C = 1e-4;
R1 = 1e3;
R2 = 1e2;
L = 1;

% Molto stiff
% lamda = [-2, -1e6]
% C = 1e-3;
% R1 = 1e3;
% R2 = 1e3;
% L = 1e-3;

% forzante
w = 100;

%% modello
Vi = @(t) sin(2*pi*w*t);
     
dydt = [ y(2).*C -  y(1)./(R2*C) ; Vi(t)./L - y(1)./L - y(2).*R1/L ];

end
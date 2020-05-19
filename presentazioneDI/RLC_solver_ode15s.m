hold on
clear all
%% Circuito simulato
%  IN -----UUUUU---\/\/\/----+----------+-- OUT
%            L       R1      |          |
%                            \         _|_
%                        R2  /         ___ C
%                            \          |
%                           _|_        _|_
%                           \ /        \ /
%
%% Parametri circuitali
% 
% Poco stiff
% lambda = [-100, -1000]
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
    

% forzante (t)
w = 100;
Vi = @(t) sin(2*pi*w*t);

%% BDF Solver 

[t_nots,y_nots] = ode15s(@(t,y) RLC_model(t,y,C,R1,R2,L,Vi),[0 0.1],[0; 0]);

%% Plot
figure(1);
hold on
plot(t_nots,y_nots(:,1));
title('Solution of RLC filter, low stiffness, Vin 1V @ 100 Hz');
xlabel('Time t');
ylabel('Vout');
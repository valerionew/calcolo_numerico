%  IN -----UUUUU---\/\/\/----+----------+-- OUT
%            L       R1      |          |
%                            \         _|_
%                        R2  /         ___ C
%                            \          |
%                           _|_        _|_
%                           \ /        \ /
format longe;
close all;
clear all;

addpath("BDF\");
addpath("exactsolutions\");

options = optimset('Display','off');
%% Parametri di simulazione
tstart = 0;
tend = 0.1;
nstep = 500;
t = linspace(tstart, tend, nstep);
h = (tend-tstart)/nstep

load y_ex_nonstiff_0.5V_50Hz.mat;

%% Parametri circuitali
% 
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

% forzante (t)
w = 50;
Vi = @(t) 0.5.* sin(2*pi*w*t);

% condizione iniziale
y0 = [0;0];

f = @(t,y) RLC_model(t, y, C, R1, R2, L, Vi);


%% BDF1 (Backwards euler)

y_BDF1 = BDF1(f,t,y0);

%% BDF2

y_BDF2 = BDF2(f,t,y0);

%% BDF3

y_BDF3 = BDF3(f,t,y0);

%% BDF4

y_BDF4 = BDF4(f,t,y0);

%% BDF5

y_BDF5 = BDF5(f,t,y0);

%% BDF6

y_BDF6 = BDF6(f,t,y0);
 
%% ode15s

[t_ode15s,y_ode15s] = ode15s(f,[tstart tend],[0; 0],odeset('Refine',1));

%% Plot function
figure(1);
hold on
ylim([-0.2 0.3])
plot(t_ex,y_ex);
plot(t,y_BDF1(1,:));
plot(t,y_BDF2(1,:));
plot(t,y_BDF3(1,:));
plot(t,y_BDF4(1,:));
plot(t,y_BDF5(1,:));
plot(t,y_BDF6(1,:));
plot(t_ode15s,y_ode15s(:,1));
ylim([-0.2 0.3])
title("RLC filter - stiff system - BDF# comparison");
legend('exact','BDF1','BDF2','BDF3','BDF4','BDF5','BDF6', 'ode15s');
ylabel('Vc(t) [V]');
xlabel('t [s]');
%% Plot errors

figure(2);
hold on

plot(t,abs(y_BDF1(1,:)-y_ex(1:2:numel(y_ex))));
plot(t,abs(y_BDF2(1,:)-y_ex(1:2:numel(y_ex))));
plot(t,abs(y_BDF3(1,:)-y_ex(1:2:numel(y_ex))));
plot(t,abs(y_BDF4(1,:)-y_ex(1:2:numel(y_ex))));
plot(t,abs(y_BDF5(1,:)-y_ex(1:2:numel(y_ex))));
plot(t,abs(y_BDF6(1,:)-y_ex(1:2:numel(y_ex))));
title("RLC filter - stiff system - BDF# comparison errors");
legend('BDF1','BDF2','BDF3','BDF4','BDF5','BDF6');



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

addpath("exactsolutions\");
addpath("BDF\");

options = optimset('Display','off');
%% Parametri di simulazione
tstart = 0;
tend = 1;
nstep = 100;
t = linspace(tstart, tend, nstep);
h = (tend-tstart)/nstep;

%% Parametri circuitali
%
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


% forzante (t)
% w = 50;
% Vi = @(t) 0.5 .* sin(2*pi*w*t);
Vi = @(t) ones(size(t)) .* 0.25;

f = @(t,y) RLC_model(t, y, C, R1, R2, L, Vi);

load y_ex_stiff_sca_0.25V.mat;

%% Eulero in avanti

y_fe(:,1) = [0;0];
for ii = 1:numel(t)-1
    y_fe(:,ii+1) = y_fe(:,ii) + h .* f(t(ii),y_fe(:,ii));
end

%% Eulero indietro

y_be(:,1) = [0;0];
for ii = 1:numel(t)-1
    BE = @(x)  y_be(:,ii) + h .* f(t(ii+1),x) - x;
    y_be(:,ii+1) = fsolve(BE, y_be(:,ii),options);
end

%% Crank-Nicholson

y_cn(:,1) = [0;0];
for ii = 1:numel(t)-1
    CN = @(x)  y_cn(:,ii) + (h/2) .* (f(t(ii+1),y_cn(:,ii))+ f(t(ii+1),x)) - x;
    y_cn(:,ii+1) = fsolve(CN, y_cn(:,ii),options);
end


%% BDF3
% risolta tramite BDF3 - pag 345 Quarteroni
% u(t+1) = 18/11*u(t) - 9/11*u(t-1) + 2/11*u(t-2) + 6/11*h*f(t+1);
y0 = [0;0];
y_BDF3 = BDF3(f,t,y0);

%% ode15s

% [t_ode15s,y_ode15s] = ode15s(f,[tstart tend],[0; 0]);

%% Plot
figure('Position', [100 100 900 600]);
hold on
plot(t_ex,y_ex);
plot(t,y_fe(1,:), 'color', '#A2142F');
plot(t,y_be(1,:), 'color', '#EDB120');
plot(t,y_cn(1,:), 'color', 	'#77AC30');
plot(t,y_BDF3(1,:), 'color', '#4DBEEE');
% plot(t_ode15s,y_ode15s(:,1));
ylim([-0.1 0.3])
xlim([0, 0.2]);
title("RLC filter - stiff system");
legend('exact','Forward euler','Backwards euler','Crank-Nicholson','BDF3', 'ode15s')
ylabel('Vc(t) [V]');
xlabel('t [s]');

%% Light plot
figure('Position', [100 100 900 600]);
hold on
plot(t_ex,y_ex, 'x'); %blue
plot(t,y_fe(1,:), 'color', '#A2142F'); %red
plot(t,y_BDF3(1,:), 'color', '#4DBEEE'); %cyan
%ylim([-0.2 0.3])
xlim([0, 0.25]);
title("RLC filter - stiff system - solution comparison");
legend('Exact solution','Forward euler','BDF3')
ylabel('Vc(t) [V]');
xlabel('t [s]');

%% FE Plot
figure('Position', [100 100 900 600]);
hold on
plot(t_ex,y_ex); %blue
plot(t,y_fe(1,:), 'color', '#A2142F'); %red
ylim([-0.1 0.3])
xlim([0, 0.1]);
title("RLC filter - stiff system - Forward Euler solution");
legend('Exact solution','Forward euler');
ylabel('Vc(t) [V]');
xlabel('t [s]');

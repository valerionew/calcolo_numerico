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
tend = 0.1;
nstep = 100;
t = [tstart:(tend/nstep):tend-(tend/nstep)];
h = (tend-tstart)/nstep

load y_ex_nonstiff_shifted_step_0.25V.mat;

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


% forzante (t)
t1 = 0.02;
Vi = @(t) 0.25 .* (t >= t1);

f = @(t,y) RLC_model(t, y, C, R1, R2, L, Vi);


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
y_BDF3 = zeros(numel(y0),numel(t));

for ii = 3:numel(t)-1
    BDF3 = @(x) (18/11).*y_BDF3 (:, ii) - (9/11).*y_BDF3 (:,ii-1) + ...
    (2/11).*y_BDF3 (:,ii-2)  + (6/11 ).* h.*f(t(ii+1),x) - x;
    y_BDF3 (:,ii+1) = fsolve(BDF3, y_BDF3 (:,ii),optimset('Display','off'));
end

%% ode15s

[t_ode15s,y_ode15s] = ode15s(f,[tstart tend],[0; 0]);

%% Plot
figure(1);
hold on
plot(t, Vi(t));
plot(t_ex,y_ex);
plot(t,y_fe(1,:));
plot(t,y_be(1,:),'x');
% plot(t,y_cn(1,:));
plot(t,y_BDF3(1,:),'x');
% plot(t_ode15s,y_ode15s(:,1));
ylim([-0.05 0.3])
xlim([0 0.1])
title("RLC filter - stiff system - BDF3 priming still to do right");
legend('in','exact','Forward euler','Backwards euler','BDF3')
ylabel('Vc(t) [V]');
xlabel('t [s]');

%%
figure(2);
hold on
%plot(t,abs(y_fe(1,:)-y_ex(1:10:numel(y_ex))));
plot(t,abs(y_be(1,:)-y_ex(1:10:numel(y_ex))));
plot(t,abs(y_BDF3(1,:)-y_ex(1:10:numel(y_ex))));


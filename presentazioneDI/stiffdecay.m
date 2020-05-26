
close all;
clear all;


addpath("BDF\");

options = optimset('Display','off');
%% Parametri di simulazione
tstart = 0;
tend = 3;
nstep = 50;
t = tstart:(tend/nstep):tend;
h = (tend-tstart)/nstep;

f = @(t,y) -100.*(y- sin(t));

y0 = 1;

%% Eulero in avanti

y_fe(:,1) = y0;
y_fe(:,2) = y0;
y_fe(:,3) = y0;
for ii = 3:numel(t)-1
    y_fe(:,ii+1) = y_fe(:,ii) + h .* f(t(ii),y_fe(:,ii));
end

%% Eulero indietro
y_be(:,1) = y0;
y_be(:,2) = y0;
y_be(:,3) = y0;
for ii = 3:numel(t)-1
    BE = @(x)  y_be(:,ii) + h .* f(t(ii+1),x) - x;
    y_be(:,ii+1) = fsolve(BE, y_be(:,ii),options);
end

%% Crank-Nicholson

y_cn(:,1) = y0;
y_cn(:,2) = y0;
y_cn(:,3) = y0;
for ii = 3:numel(t)-1
    CN = @(x)  y_cn(:,ii) + (h/2) .* (f(t(ii+1),y_cn(:,ii))+ f(t(ii+1),x)) - x;
    y_cn(:,ii+1) = fsolve(CN, y_cn(:,ii),options);
end


%% BDF3
% risolta tramite BDF3 - pag 345 Quarteroni
% u(t+1) = 18/11*u(t) - 9/11*u(t-1) + 2/11*u(t-2) + 6/11*h*f(t+1);
y_BDF3(:,1) = y0;
y_BDF3(:,2) = y0;
y_BDF3(:,3) = y0;
for ii = 3:numel(t)-1
    BDF3 = @(x) (18/11).*y_BDF3 (:, ii) - (9/11).*y_BDF3 (:,ii-1) + ...
    (2/11).*y_BDF3 (:,ii-2)  + (6/11 ).* h.*f(t(ii+1),x) - x;
    y_BDF3 (:,ii+1) = fsolve(BDF3, y_BDF3 (:,ii),optimset('Display','off'));
end

%% ode15s

% [t_ode15s,y_ode15s] = ode15s(f,[tstart tend],y0);

%% Plot
figure(1);
hold on
% plot(t, Vi(t));
%plot(t_ex,y_ex);
% plot(t,y_fe(1,:));
plot(t,y_be(1,:));
plot(t,y_cn(1,:));
plot(t,y_BDF3(1,:));
%plot(t_ode15s,y_ode15s(:,1));
title("RLC filter - stiff system - BDF3 priming still to do right");
legend('Backwards euler','CN','BDF3')
ylabel('Vc(t) [V]');
xlabel('t [s]');

%% Light plot
% figure(2);
% hold on
% % plot(t_ex,y_ex, 'x');
% plot(t,y_fe(1,:), 'r');
% plot(t,y_BDF3(1,:), 'm');
% title("RLC filter - stiff system - solution comparison");
% legend('Exact solution','Forward euler','BDF3')
% ylabel('Vc(t) [V]');
% xlabel('t [s]');

%% FE Plot
% 
% figure(3);
% hold on
% plot(t_ex,y_ex);
% plot(t,y_fe(1,:), 'r');
% ylim([-0.2 0.3])
% title("RLC filter - non stiff system - Forward Euler solution");
% legend('Exact solution','Forward euler');
% ylabel('Vc(t) [V]');
% xlabel('t [s]');

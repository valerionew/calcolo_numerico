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

options = optimset('Display','off');
%% Parametri di simulazione
tstart = 0;
tend = 0.1;
nstep = 500;
t = linspace(tstart, tend, nstep);
h = (tend-tstart)/nstep

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

load y_ex.mat;

%% Eulero indietro (BDF1)

% preallocating for speed
y_BDF1 = zeros(2,numel(t));

% priming with initial condition
y_BDF1(:,1) = y0;

for ii = 1:numel(t)-1
    BDF1 = @(x)  y_BDF1(:,ii) + h .* f(t(ii+1),x) - x;
    y_BDF1(:,ii+1) = fsolve(BDF1, y_BDF1(:,ii),options);
end

%% BDF2

% preallocating for speed
y_BDF2 = zeros(2,numel(t));

% priming with previous methods
y_BDF2(:,1) = y_BDF1(:,1);
y_BDF2(:,2) = y_BDF1(:,2);

for ii = 2:numel(t)-1
    BDF2 = @(x)  (4/3).* y_BDF2(:,ii) - (1/3).* y_BDF2(:,ii-1) + (2/3) .* h.*f(t(ii+1),x) - x;
    y_BDF2(:,ii+1) = fsolve(BDF2, y_BDF2(:,ii),options);
end

%% BDF3

% preallocating for speed
y_BDF3 = zeros(2,numel(t));

% priming with previous methods
y_BDF3(:,1) = y_BDF2(:,1);
y_BDF3(:,2) = y_BDF2(:,2);
y_BDF3(:,3) = y_BDF2(:,3);

for ii = 3:numel(t)-1
    BDF3 = @(x) (18/11).*y_BDF3(:, ii) - (9/11)*y_BDF3(:,ii-1) + ...
    (2/11).*y_BDF3(:,ii-2)  + (6/11 ).* h*f(t(ii+1),x) - x;
    y_BDF3(:,ii+1) = fsolve(BDF3, y_BDF3(:,ii),options);
end


%% BDF4

% preallocating for speed
y_BDF4 = zeros(2,numel(t));

% priming with previous methods
y_BDF4(:,1) = y_BDF3(:,1);
y_BDF4(:,2) = y_BDF3(:,2);
y_BDF4(:,3) = y_BDF3(:,3);
y_BDF4(:,4) = y_BDF3(:,4);

for ii = 4:numel(t)-1
    BDF4 = @(x) (48/25).*y_BDF4(:, ii) - (36/25).*y_BDF4(:,ii-1) + ...
    (16/25).*y_BDF4(:,ii-2) - (3/25).*y_BDF4(:,ii-3) + ...
    (12/25).* h.*f(t(ii+1),x) - x ;
    y_BDF4(:,ii+1) = fsolve(BDF4, y_BDF4(:,ii),options);
end

%% BDF5

% preallocating for speed
y_BDF5 = zeros(2,numel(t));

% priming with previous methods
y_BDF5(:,1) = y_BDF4(:,1);
y_BDF5(:,2) = y_BDF4(:,2);
y_BDF5(:,3) = y_BDF4(:,3);
y_BDF5(:,4) = y_BDF4(:,4);
y_BDF5(:,5) = y_BDF4(:,5);

for ii = 5:numel(t)-1
    BDF5 = @(x) (300/137).*y_BDF5(:, ii) - (300/137).*y_BDF5(:,ii-1) + ...
    (200/137).*y_BDF5(:,ii-2) - (75/137).*y_BDF5(:,ii-3) + (12/137).*y_BDF5(:,ii-4) ...
    + (60/137).* h.*f(t(ii+1),x) - x ;
    y_BDF5(:,ii+1) = fsolve(BDF5, y_BDF5(:,ii),options);
end

%% BDF6

% preallocating for speed
y_BDF6 = zeros(2,numel(t));

% priming with previous methods
y_BDF6(:,1) = y_BDF5(:,1);
y_BDF6(:,2) = y_BDF5(:,2);
y_BDF6(:,3) = y_BDF5(:,3);
y_BDF6(:,4) = y_BDF5(:,4);
y_BDF6(:,5) = y_BDF5(:,5);
y_BDF6(:,6) = y_BDF5(:,6);

for ii = 6:numel(t)-1
    BDF6 = @(x) (360/147).*y_BDF6(:, ii) - (450/147).*y_BDF6(:,ii-1) + ...
    (400/147).*y_BDF6(:,ii-2) - (225/147).*y_BDF6(:,ii-3) + (72/147).*y_BDF6(:,ii-4) ...
    - (10/147).*y_BDF6(:,ii-5) + (60/147).* h.*f(t(ii+1),x) - x ;
    y_BDF6(:,ii+1) = fsolve(BDF6, y_BDF6(:,ii),options);
end
 
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
<<<<<<< HEAD
legend('exact','BDF1','BDF2','BDF3','BDF4','BDF5','BDF6', 'ode15s')
=======
legend('exact','BDF1','BDF2','BDF4','BDF4','BDF5','BDF6', 'ode15s');
ylabel('Vc(t) [V]');
xlabel('t [s]');
>>>>>>> 014efc7... Esportato grafico soluzione RLC

%% Plot errors
% 
% not sure about this

figure(2);
hold on

plot(t,abs(y_BDF1(1,:)-y_ex(1:2:numel(y_ex))));
plot(t,abs(y_BDF2(1,:)-y_ex(1:2:numel(y_ex))));
plot(t,abs(y_BDF3(1,:)-y_ex(1:2:numel(y_ex))));
plot(t,abs(y_BDF4(1,:)-y_ex(1:2:numel(y_ex))));
plot(t,abs(y_BDF5(1,:)-y_ex(1:2:numel(y_ex))));
plot(t,abs(y_BDF6(1,:)-y_ex(1:2:numel(y_ex))));
title("RLC filter - stiff system - BDF# comparison errors");
legend('BDF1','BDF2','BDF4','BDF4','BDF5','BDF6');



%  audio in  ---UUUUU---\/\/\/----+----------+-- OUT
%                 L       R1      |          |
%                                 \         _|_
%                             R2  /         ___ C
%                                 \          |
%                                _|_        _|_
%                                \ /        \ /

% this probably isn't something smart, you should really solve something
% like this problem in the Fourier's transform domain, but the code was
% already there, it was just an experiment
% Sorry AVMG & TBBA, hope you're not too disappointed. 

close all;
clear all;

%% Parametri di simulazione

load handel.mat;

y = y';

tstart = 0;
tend = numel(y)/Fs;
nstep = numel(y);
t = [tstart:(tend/nstep):tend-(tend/nstep)];
h = (tend-tstart)/nstep;

Vi = @(t) y(((nstep/(tend-tstart)) .*t) + 1);

soundsc(y)

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

f = @(t,y) RLC_model(t, y, C, R1, R2, L, Vi);

%% Eulero indietro

y_be(:,1) = [0;0];
for ii = 1:numel(t)-1
    BE = @(x)  y_be(:,ii) + h .* f(t(ii+1),x) - x;
    y_be(:,ii+1) = fsolve(BE, y_be(:,ii),options);
end

%% BDF Plot
figure('Position', [100 100 900 600]);
hold on
plot(t, Vi(t));
plot(t,y_be(1,:));

title("Handel.mat in RLC");
legend('Handel.mat', 'Backwards euler')
ylabel('Vc(t) [V]');
xlabel('t [s]');

%% Ascolto del segnale filtrato
soundsc(y_be(1,:))
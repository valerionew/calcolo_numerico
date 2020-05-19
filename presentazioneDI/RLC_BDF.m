%% Parametri di simulazione
tstart = 0;
tend = 1;
nstep = 100;
t = linspace(tstart, tend, nstep);
h = (tend-tstart)/nstep;


% risolta tramite BDF3 - pag 345 Quarteroni
% u(t+1) = 18/11*u(t) - 9/11*u(t-1) + 2/11*u(t-2) + 6/11*h*f(t+1);

C = 1e-3;
R1 = 1e3;
R2 = 1e3;
L = 1e-3;
A = [   -1/(R2*C)    1/C     ;  % dVc/dt  = a Vc + b Il
        -1/L         -R1/L   ]; % dIl/dt = c Vc + d Il

f = @(t,y) [-1/(R2*C) * y(1) + 1/C * y(2), -1/L * y(2) - R1/L * y(2)];


y0 = [2, 2];

% u = [ones(nstep) .* y0(1), 
%      ones(nstep) .* y0(2)];

u = ones(2, nstep)';

for ii=3:nstep
    for jj=1:2
        u(ii+1, jj) = 18/11*u(ii, jj) - 9/11*u(ii-1, jj) + 2/11*u(ii-2, jj) + 6/11*h*f(ii+1, jj);
    end
end


plot(u(1));

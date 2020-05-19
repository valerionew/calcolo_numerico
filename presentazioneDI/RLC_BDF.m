clear all

%% Parametri di simulazione
tstart = 0;
tend = 100;
nstep = 500;
t = linspace(tstart, tend, nstep);
h = (tend-tstart)/nstep;


% risolta tramite BDF3 - pag 345 Quarteroni
% u(t+1) = 18/11*u(t) - 9/11*u(t-1) + 2/11*u(t-2) + 6/11*h*f(t+1);

C = 1e-3;
R1 = 1e3;
R2 = 1e3;
L = 1e-3;
A = [   -1/(R2*C)    1/C     ;  % dVc/dt  = a Vc + b Il + Vin/L
        -1/L         -R1/L   ]; % dIl/dt = c Vc + d Il
B = [0 , 1/L];

w = 100;
Vi = @(t) sin(2*pi*w*t);

f = @(t,y) [-1/(R2*C) * y(1) + 1/C * y(2), -1/L * y(2) - R1/L * y(2)]  + 5 ;


u(1,:) = [0,0];
u(2,:) = [0,0];
u(3,:) = [0,0];


for ii=3:nstep-1
    BDF3 = @(x)  (18/11)*u(ii, :) - (9/11)*u(ii-1, :) + 2/11*u(ii-2, :) + 6/11*h*f(t(ii+1), x)  - x;
    u(ii+1, :) = fsolve(BDF3, u(ii,:));
end


plot(t, u(:,1));

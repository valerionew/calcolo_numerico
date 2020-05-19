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
%% Parametri di simulazione
tstart = 0;
tend = 1;
nstep = 1e4;
t = linspace(tstart, tend, nstep);
h = (tend-tstart)/nstep

%% Parametri circuitali
% 
% Poco stiff
% lambda = [-100, -1000]
% C = 1e-4;
% R1 = 1e3;
% R2 = 1e2;
% L = 1;

% Molto stiff
% lambda = [-2, -1e6]
% C = 1e-3;
% R1 = 1e3;
% R2 = 1e3;
% L = 1e-3;



A = [   -1/(R2*C)    1/C     ; 
        -1/L         -R1/L   ];
    
[V,D] = eig(A)
    
D * h

%% Eulero in avanti

% procediamo con la diagonalizzata e poi riconvertiremo i risultati nelle
% incognite di A

for i = 1:nstep-1
    Z(:,i+1) = Z(:,i) + h * D * Z(:,i);   
end

% torniamo alla variabile pre diagonalizzazione
X = inv(V) * Z ;

%figure(2);
% here you can see the attempt to resolve with forward euler just explodes 
figure(1);
plot(t, X(1,:)); 
figure(2);
plot(t, X(2,:));




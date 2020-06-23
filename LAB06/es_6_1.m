format long

normadue = @(x) sqrt(max(eig(x' * x)));


%% Definizioni

A = [ 1 0 -1; 1 0 -3; 0 1 1; 0 -1 1];
b = [4 ; 6; -1; 2];

%% Punto A: soluzione unica?
if(rank(A) == min(size(A)))
    disp("Il sistema ha soluzione unica");
else
    disp("Il sistema non ha soluzione unica");
end

% soluzione con \
x = A \ b

% soluzione con inv
x_star = inv(A'*A)*A'*b

%% Punto B: errori

err = normadue(x - x_star) %probabilmente sbagliato

%% Punto C: QR

[Q,R] = qr(A)

[Q_eco, R_eco] = qr(A, 0)
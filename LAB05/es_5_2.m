
grado_richiesto = 9

x = linspace(0, pi, grado_richiesto + 1)';
y = sin(x);

for (i = 1:numel(x))
    % il vettore nodes contiene tutti i nodi eccetto x(i).
    nodes = setdiff(x, x(i))
    % poly(r) restituisce un vettore contenente i coefficienti le cui radici sono gli elementi di r.
    % polyval(coefficients, hat_x) valuta il polinomio, definito dal vettore dei coefficienti, nei punti di hat_x.
    lagr_poly(:, i) = poly(nodes) / polyval(poly(nodes), x(i));
    % ogni colonna contiene i coefficienti dell'i-esimo polinomio
    % ogni riga contiene il coefficiente relativo alla potenza j-esima 
end

%% Punto A: rappresentazione

xx = linspace(0, pi, 1000); %% x fitta per grafico

% Traccio il grafico delle funzioni di base
figure(1)
hold on, box on
axis([-0.5 pi+0.5 -1.5 2.5])
for (i = 1:numel(x))
  plot(xx, polyval(lagr_poly(:, i), xx), 'b-', 'LineWidth', 2)  % intera curva
  plot(x, polyval(lagr_poly(:,i), x), 'bo', 'LineWidth', 2, 'MarkerSize', 10) % punti assegnati
  % pause
end
set(gca,'FontSize',16)
set(gca,'LineWidth',1.5)
xlabel('x','FontSize',16)
ylabel('p_3(x)','FontSize',16)

coeff = lagr_poly * y % Costruiamo i coefficienti del polinomio interpolatore di Lagrange
yy = polyval(coeff, xx); % Valutiamo il polinomio interpolatore di Lagrange sulla griglia raffinata

%
figure(2)
hold on, box on
plot(x, y, 'kx', 'LineWidth', 2, 'MarkerSize', 10)
plot(xx, yy, 'b-', 'LineWidth', 2)
axis([-0.5 pi+0.5 -0.5 1.5])
set(gca,'FontSize',16)
set(gca,'LineWidth',1.5)
xlabel('x','FontSize',16)
ylabel('p_3(x)','FontSize',16)

%% Punto B: vandermonde

V = vander(x)
coeff2 = V \ y;

[coeff, coeff2]

%% Punto B: polyfit

coeff3 = polyfit(x, y, 9);
[coeff, coeff3']


%% Punto C: errori
% K_k+1 è la stima massima della derivata.
% nel nostro caso, lavorando con la funione seno,
% posso prendere 1
ek_x = 1*((x(2)-x(1))^(grado_richiesto+1))/(4*(grado_richiesto+1))

errore = sin(xx) - yy;

figure(3)
plot(xx, errore);

%% Punto D: polinomi di altro grado

% aumentando il grado fino a 17b l'errore diminusice
% ma per polinomi di grado superiore l'errore
% di cancellazione si fa molt grande e l'errore aumenta
%% Controesempio di Runge
% clear 
% clc
% close all
% 
% f = @(x) 1./(1+ (5.*x).^2);
% figure
% hold on
% 
% for k = 2:20
%     
%     x = linspace (-1, 1, k)';
% 
%     y = f(x);
% 
%     for (i = 1:numel(x))
%         % il vettore nodes contiene tutti i nodi eccetto x(i).
%         nodes = setdiff(x, x(i))
%         % poly(r) restituisce un vettore contenente i coefficienti le cui radici sono gli elementi di r.
%         % polyval(coefficients, hat_x) valuta il polinomio, definito dal vettore dei coefficienti, nei punti di hat_x.
%         lagr_poly(:, i) = poly(nodes) / polyval(poly(nodes), x(i));
%         % ogni colonna contiene i coefficienti dell'i-esimo polinomio
%         % ogni riga contiene il coefficiente relativo alla potenza j-esima 
%     end
% 
%     xx = linspace(-1, 1, 1000); %% x fitta per grafico
% 
%     coeff = lagr_poly * y % Costruiamo i coefficienti del polinomio interpolatore di Lagrange
%     yy = polyval(coeff, xx); % Valutiamo il polinomio interpolatore di Lagrange sulla griglia raffinata
% 
%     % a meno di un fattore di scala
%     % dato dal massimo della derivata
%     ek_x = ((x(2)-x(1))^(k+1))/(4*(k+1))
% 
%     errore = abs(f(xx) - yy);
% 
%     max_errori(k) = max(errore);
%     plot(xx, errore);
%     clear lagr_poly
%     pause
%     
% end
% 
% figure(2)
% plot(max_errori)


%% Punto B: nodi di chebyshev
clear

f = @(x) 1./(1+ (5.*x).^2);
figure(3)
for k = 2:20
    hold on
    index_chebyshev = [1:k]; 
    x = cos((1+2.*index_chebyshev).*pi/(2.*(k+1)))';

    y = f(x);

    for (i = 1:numel(x))
        % il vettore nodes contiene tutti i nodi eccetto x(i).
        nodes = setdiff(x, x(i))
        % poly(r) restituisce un vettore contenente i coefficienti le cui radici sono gli elementi di r.
        % polyval(coefficients, hat_x) valuta il polinomio, definito dal vettore dei coefficienti, nei punti di hat_x.
        lagr_poly(:, i) = poly(nodes) / polyval(poly(nodes), x(i));
        % ogni colonna contiene i coefficienti dell'i-esimo polinomio
        % ogni riga contiene il coefficiente relativo alla potenza j-esima 
    end

    xx = linspace(-1, 1, 1000); %% x fitta per grafico

    coeff = lagr_poly * y % Costruiamo i coefficienti del polinomio interpolatore di Lagrange
    yy = polyval(coeff, xx); % Valutiamo il polinomio interpolatore di Lagrange sulla griglia raffinata

    % a meno di un fattore di scala
    % dato dal massimo della derivata
    ek_x = ((x(2)-x(1))^(k+1))/(4*(k+1))

    errore = abs(f(xx) - yy);

    max_errori(k) = max(errore);
    plot(xx, errore);
    clear lagr_poly
    pause
    
end

figure(2)
plot(max_errori)

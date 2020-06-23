%{
    \begin{enumerate}
    \renewcommand{\theenumi}{\alph{enumi}}
    \setcounter{enumi}{0}
    \item Si costruisca il polinomio interpolante di grado minimo, che interpoli i punti dati, utilizzando come base i polinomi di Lagrange.    
    \end{enumerate}
%}
x = [0 1 3 4]';
y = [5 3 5 12]';

%{
    Dato che abbiamo quattro punti, l'ordine minimo del polinomio di interpolazione sar\`a 4-1=3. 
%}
%{
    Memorizziamo i coefficienti dei polinomi di Lagrange in una matrice-

%}
for (i = 1:numel(x))
    % il vettore nodes contiene tutti i nodi eccetto x(i).
    nodes = setdiff(x, x(i));
    % poly(r) restituisce un vettore contenente i coefficienti le cui radici sono gli elementi di r.
    % polyval(coefficients, hat_x) valuta il polinomio, definito dal vettore dei coefficienti, nei punti di hat_x.
    lagr_poly(:, i) = poly(nodes) / polyval(poly(nodes), x(i));
    % ogni colonna contiene i coefficienti dell'i-esimo polinomio
    % ogni riga contiene il coefficiente relativo alla potenza j-esima 
end

%{
    \begin{enumerate}
    \renewcommand{\theenumi}{\alph{enumi}}
    \setcounter{enumi}{1}
    \item Si tracci il grafico dei valori che il polinomio assume su un raffinamento della griglia di partenza, e si verifichi che effettivamente il polinomio interpoli i punti dati.    \end{enumerate}
%}
xx = linspace(-0.5, 4.5, 1000);

% Traccio il grafico delle funzioni di base
figure
hold on, box on
axis([-1 5 -1.5 2.2])
for (i = 1:numel(x))
  plot(xx, polyval(lagr_poly(:, i), xx), 'b-', 'LineWidth', 2)  
  plot(x, polyval(lagr_poly(:,i), x), 'bo', 'LineWidth', 2, 'MarkerSize', 10)
  pause
end
set(gca,'FontSize',16)
set(gca,'LineWidth',1.5)
xlabel('x','FontSize',16)
ylabel('p_3(x)','FontSize',16)

coeff = lagr_poly * y; % Costruiamo i coefficienti del polinomio interpolatore di Lagrange
yy = polyval(coeff, xx); % Valutiamo il polinomio interpolatore di Lagrange sulla griglia raffinata
%
figure
hold on, box on
plot(x, y, 'kx', 'LineWidth', 2, 'MarkerSize', 10)
plot(xx, yy, 'b-', 'LineWidth', 2)
axis([-1 5 0 20])
set(gca,'FontSize',16)
set(gca,'LineWidth',1.5)
xlabel('x','FontSize',16)
ylabel('p_3(x)','FontSize',16)

%{
    \begin{enumerate}
    \renewcommand{\theenumi}{\alph{enumi}}
    \setcounter{enumi}{2}
    \item Si costruisca il polinomio interpolatore usando la base di monomi e la matrice di Vandermonde.
    \end{enumerate}
%}
V = vander(x)
% ...oppure, equivalentemente, ...
V = [x.^3 x.^2 x.^1 x.^0]
coeff2 = V \ y;

% Verifica
[coeff, coeff2]

%{
    \begin{enumerate}
    \renewcommand{\theenumi}{\alph{enumi}}
    \setcounter{enumi}{3}
    \item Infine, si ricavi il polinomio interpolatore tramite il comando \texttt{polyfit} di Octave/MATLAB.
    \end{enumerate}
%}
coeff3 = polyfit(x, y, 3)
[coeff, coeff3']

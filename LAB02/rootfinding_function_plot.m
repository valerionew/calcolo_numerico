function rootfinding_function_plot (f, a, b, new_figure)
% ROOTFINDING_FUNCTION_PLOT : disegna il grafico di una funzione 
% di una variabile su un intervallo determinato, insieme all'asse
% delle ascisse, permettendo di individuare graficamente gli zeri 
% della funzione
%
% Sintassi:
%   rootfinding_function_plot (f, a, b, new_figure)
% 
% Input : f = function handle alla funzione da analizzare, 
%         a = estremo sinistro dell'intervallo,
%         b = estremo destro dell'intervallo,
%         new_figure = se vale false, il nuovo plot viene prodotto
%                      nella figura corrente; se vale true o non viene 
%                      fornito, una nuova figura viene creata.
%

  if ((nargin < 4) || new_figure)
	figure
  end
  hold on, box on
  x_plot = linspace(a, b, 1000);
  plot (x_plot, f (x_plot), 'LineWidth', 2)
  plot (x_plot, zeros (size (x_plot)), 'k-', 'LineWidth', 1)
  xlabel ('x', 'FontSize', 16)
  ylabel ('f(x)', 'FontSize', 16)
  set (gca, 'FontSize', 16)
  set (gca, 'LineWidth', 1.5)

end

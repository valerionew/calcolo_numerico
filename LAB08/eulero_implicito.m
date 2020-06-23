function y = eulero_implicito(f, y0, t)
  %EULERO_IMPLICITO Risolve l'equazione differenziale ordinaria y' = f(t, y), con
  %   y(0) = y0, nei punti definiti in t tramite il metodo di Eulero all'indietro (o implicito).
  %   y = EULERO_IMPLICITO(f, y0, t)
  %
  %   Input   : f  = function handle del termine noto
  %             y0 = condizione iniziale
  %             t  = vettore dei nodi
  %   Output  : y  = approssimazione numerica della soluzione valutata nei nodi

  % TODO
h = diff(t);
y(1) = y0;
for i = 1:max(size(t))-1
    g = @(z) z - y(i) - h(i)*f(t(i+1),z);
    y(i+1) = fsolve(g,y(i));  
end

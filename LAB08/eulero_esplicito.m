function y = BDF1(f, y0, t)
  %EULERO_ESPLICITO Risolve l'equazione differenziale ordinaria y' = f(t, y), con
  %   y(0) = y0, nei punti definiti in t tramite il metodo di Eulero in avanti (o esplicito).
  %   y = EULERO_ESPLICITO(f, y0, t)
  %
  %   Input   : f  = function handle del termine noto
  %             y0 = condizione iniziale
  %             t  = vettore dei nodi
  %   Output  : y  = approssimazione numerica della soluzione valutata nei nodi

  % TODO
  y(1) = y0;
for i = 1:max(size(t))-1
    y(i+1) = y(i) + (t(i+1)-t(i)) * f(t(i),y(i));    
end

function y = eulero_implicito_lineare(alpha, g, y0, t)
   %EULERO_IMPLICITO_LINEARE Risolve l'equazione differenziale ordinaria del
  %   tipo y' = alpha*y + g(t), con y(0) = y0, nei nodi definiti in t tramite il metoodo di Eulero implicito (o all'indietro).
  %   y = EULERO_IMPLICITO_LINEARE(alpha, g, y0, t)
  %
  %   Input   : alpha, g  = termine noto alpha*y + g(t)
  %             y0 = condizione iniziale
  %             t  = vettore dei nodi
  %   Output  : y  = approssimazione numerica della soluzione valutata nei
  %                  nodi
  % TODO
  h = diff(t);
  y(1) = y0;
for i = 1:max(size(t))-1
    y(i+1) = (y(i)+ h(i).*g(t(i)))./(1-h(i)*alpha);
end

end

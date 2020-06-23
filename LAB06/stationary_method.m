function [x, iter, incr] = stationary_method(B, g, x0, tol, max_it)
%STATIONARY_METHOD  risolve un sistema lineare con un metodo stazionario della forma
%x^(k+1) = B*x^(k) + g
%
%   [x, iter, incr] = stationary_method(B, g, x0, tol, max_it)
%
%   Input   : B      = matrice di iterazione
%             g      = vettore di iterazione
%             x0     = vettore iniziale
%             tol    = tolleranza richiesta
%             max_it = numero massimo di iterazione permesse
%   Output  : x      = approssimazione della soluzione
%             iter   = numero di iterazioni effettuate
%             incr   = ultimo incremento (puo' essere utilizzato per stimare l'errore)

% Inizializzazione
iter = 1;
prev_x = x0;
x    = B*x0 + g;
incr = norm(prev_x - x);


while (incr>=tol) && (iter < max_it)
    
  prev_x = x;
  x = B * prev_x + g;
  incr = norm(prev_x - x);
  iter = iter + 1;
  
end

end

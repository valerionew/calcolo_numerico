function [xi, x_iter] = fixed_point(phi, x0, tol, maxit)
  %FIXED_POINT Approssima una radice della funzone f(x) con il metodo
  %   di punto fisso x = phi(x), a partire dal dato iniziale x0.
  %
  %   [xi, x_iter] = FIXED_POINT(phi, x0, tol, maxit)
  %
  %   Input : phi   = 'function handle' alla funzione di iterazione
  %           x0    = dato iniziale
  %           tol   = tolleranza richiesta
  %           maxit = numero massimo di iterazioni
  %
  %   Output : xi     = valore approssimato della radice
  %            x_iter = vettore contente le approssimazioni 
  %                     successive ad ogni iterazione

  x_iter(iter+1) = phi(x_iter(iter))

end

function [xi, x_iter] = newton (f, df, x0, tol, maxit)
  %NEWTON Approssima la radice di f(x) attraverso il metodo di Newton,
  % a partire dal dato iniziale x0
  %
  %   [xi, x_iter] =  NEWTON(f, df, x0, tol, maxit)
  %
  %   Input : f     = 'function handle' ad f(x)
  %           df    = 'function handle' alla derivata di f(x)
  %           x0    = dato iniziale
  %           tol   = tolleranza richiesta
  %           maxit = massimo numero di iterazioni
  % 
  %   Output : xi     = valore approssimato della radice
  %            x_iter = vettore delle successive approssimazioni

  %% TODO %%
    x_iter(1) = x0;
    for i = 1:maxit
        x_iter(i+1) = x_iter(i) - (f(x_iter(i))./df(x_iter(i)));
        if(abs(x_iter(i+1) x_iter(i)<=tol)
            break;
        end
    end
    xi = x_iter(i+1);
end

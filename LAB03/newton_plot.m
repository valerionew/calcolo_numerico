function newton_plot (f, df, x0, tol, maxit, multiplicity)
  %NEWTON_PLOT Produce un grafico dell'evoluzione del metodo di Newton
  %
  %   NEWTON_PLOT(f, df, x0, tol, maxit)
  %
  %   Input : f     = 'function handle' ad f(x)
  %           df    = 'function handle' alla derivata di f(x)
  %           x0    = dato iniziale
  %           tol   = tolleranza richiesta
  %           maxit = massimo numero di iterazioni

  if (nargin < 6)
	multiplicity = 1;
  end
  phi_Newton = @(x) x - multiplicity * f (x) ./ df (x);
  fixed_point_plot (phi_Newton, x0, tol, maxit);

end

function fixed_point_plot(phi, x0, tol, maxit)
  %FIXED_POINT_PLOT Produce un grafico della funzione f(x) 
  %   e dell'evoluzione delle iterazioni di punto fisso
  %
  %   FIXED_POINT_PLOT(phi, x0, tol, maxit)
  %
  %   Input : phi   = 'function handle' alla funzione di iterazione
  %           x0    = dato iniziale
  %           tol   = tolleranza richiesta
  %           maxit = numero massimo di iterazioni

  [xi, x] = fixed_point(phi, x0, tol, maxit);
  a = min(x);
  b = max(x);
  
  figure
  hold on, box on
  x_plot = linspace(a, b, 1000);
  plot(x_plot, phi(x_plot), 'LineWidth', 2)
  plot(x_plot, x_plot, 'k-', 'LineWidth', 1)
  xlabel('x','FontSize', 16)
  ylabel('phi(x)','FontSize', 16)
  set(gca,'FontSize', 16)
  set(gca,'LineWidth', 1.5)
  pause
  
  old_color = 'kx-';
  new_color = 'gx-';
  for (iter = 1:length(x)-1)
    if (iter > 1)
      plot([x(iter-1) x(iter-1) x(iter)], ...
           [x(iter-1) x(iter) x(iter)], ...
           old_color, 'LineWidth', 2, 'MarkerSize', 8)
    plot([x(iter) x(iter) x(iter+1)], ...
         [x(iter) x(iter+1) x(iter+1)], ...
         new_color, 'LineWidth', 2, 'MarkerSize', 8)
    pause
  end

end

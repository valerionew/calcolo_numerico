function bisection_plot (f, a, b, tol)
  %BISECTION_PLOT Produce un grafico della funzione f(x) 
  %  e dell'evoluzione del metodo di bisezione
  %
  %  BISECTION_PLOT(f, a, b, tol)
  %
  %  Input  : f   = 'function handle' alla funzione f(x)
  %           a   = estremo sinistro
  %           b   = estremo destro
  %           tol = tolleranza richiesta

  figure
  hold on, box on
  x_plot = linspace (a, b, 1000);
  plot (x_plot, f (x_plot), 'LineWidth', 2)
  plot (x_plot, 0 * x_plot, 'k-', 'LineWidth', 1)
  xlabel ('x', 'FontSize', 16)
  ylabel ('f(x)', 'FontSize', 16)
  set (gca,'FontSize', 16)
  set (gca,'LineWidth', 1.5)
  pause

  left_color = 'rx-';
  right_color = 'cx-';
  old_color = 'kx-';
  new_color = 'gx-';
  plot ([a a], ...
        [0 f(a)], ...
        left_color, 'LineWidth', 2, 'MarkerSize', 8)
  plot ([b b], ...
        [0 f(b)], ...
        right_color, 'LineWidth', 2, 'MarkerSize', 8)
  pause

  [xi, x_iter] = bisection (f, a, b, tol)
  % Numero di iterazioni compiute durante il calcolo 
  max_iterb = numel (x_iter);
  
  for (iter = 1:max_iterb)
    x_iter(iter) = (a + b) / 2;
    f_iter(iter) = f (x_iter(iter));
    
    if (f (b) * f_iter(iter) < 0)
      plot ([x_iter(iter) x_iter(iter)], ...
            [0 f_iter(iter)], ...
            new_color, 'LineWidth', 2, 'MarkerSize', 8)
      pause
      plot ([a a], ...
            [0 f(a)], ...
            old_color, 'LineWidth', 2, 'MarkerSize', 8)
      a = x_iter(iter);
      plot ([x_iter(iter) x_iter(iter)], ...
            [0 f_iter(iter)], ...
            left_color, 'LineWidth', 2, 'MarkerSize', 8)
      pause
    elseif (f (a) * f_iter(iter) < 0)
      plot ([x_iter(iter) x_iter(iter)], ...
            [0 f_iter(iter)], ...
            new_color, 'LineWidth', 2, 'MarkerSize', 8)
      pause
      plot ([b b], ...
            [0 f(b)], ...
            old_color, 'LineWidth', 2, 'MarkerSize', 8)
      b = x_iter(iter);
      plot ([x_iter(iter) x_iter(iter)], ...
            [0 f_iter(iter)], ...
            right_color, 'LineWidth', 2, 'MarkerSize', 8)
      pause
    else % f(x) = 0
      break;
    end
  end

end

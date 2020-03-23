function [xi, x_iter] = bisection (f, a, b, tol)
  %BISECTION Approssima la radice di un'equazione f(x) = 0 
  %  nell'intervallo [a,b] con il metodo di bisezione. Gli 
  %  estremi dell'intervallo devono soddisfare la condizione: 
  %  f(a)*f(b)<0.
  %
  %   [xi, x_iter] = BISECTION(f, a, b, tol)
  %
  %   Input  : f   = 'function handle' alla funzione f(x)
  %            a   = estremo sinistro
  %            b   = estremo destro
  %            tol = tolleranza richiesta
  %   Output : 
  %            xi     = valore approssimato della radice
  %            x_iter = vettore contenente le approssimazioni ad ogni passo

  %% Si calcola il numero di iterazioni necessarie per raggiungere la tolleranza richiesta
  max_iterb = ceil(log2((b-a)./(2*tol)));
  
  %% per un numero di volte sufficiente
  for (iter = 1:max_iterb)
    %% si calcola il punto medio, salvandolo nel vettore delle soluzioni
    x_iter(iter) = (a+b)./2;

    %% si sceglie il semi-intervallo per continuare la ricerca
    if ( f(x_iter(iter)).*f(a) < 0)
      b = x_iter(iter);
    elseif ( f(x_iter(iter)).*f(b) < 0)
      a = x_iter(iter);
    else
      if (f(x_iter(iter) == 0))
          break
      end
    end
  end

  %% si seleziona la soluzione finale
  xi = x_iter(iter);

end

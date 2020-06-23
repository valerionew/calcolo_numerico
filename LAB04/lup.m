%% Data la matrice non-singolare A
%% costruisce le due matrici triangolari
%% L ed U ed il vettore di indici p
%% tali che A(p, :) = L * U
%% il comando built-in 'lu' svolge la stessa
%% funzione, questo codice ha scopo puramente
%% didattico

function [L,U,p] = lup (A)

  %% Sebbene sia possibile applicare
  %% lo stesso algoritmo di triangolarizzazione
  %% anche a matrici rettangolari, noi ci limitiamo
  %% a considerare solo matrici quadrate
  [m,n] = size (A);
  assert (m == n);
  
  p = 1 : n;
  for i = 1:n

    %% come visto a lezione, 
    %% il pivoting parziale per
    %% righe ha un costo trascurabile
    %% e migliora la stabilità dell'
    %% algoritmo quindi lo applichiamo sempre
    [maxpivot, prow] = max (abs (A(p(i:end), i)));

    if (~ (maxpivot > 0))
      error (['lup : ho trovato un pivot nullo, ', ...
              'non � possibile portare a termine ', ...
              'la fattorizzazione']);
    end
    ipivot = prow+i-1;   
    if (ipivot ~= i)
      %% scambiando gli indici nel vettore p
      %% teniamo conto di tutti gli scambi
      %% di riga effettuati durante la
      %% fattorizzazione
      p ([i, ipivot]) = p([ipivot, i]);
    end

    %% invece di spostare veramente
    %% il contenuto delle righe di
    %% A, usiamo il vettore p per indicizzarle
    %% in un ordine diverso
    pivot = A(p(i),i);
    for h = i+1:n
      A(p(h),i) = A(p(h),i)/pivot;
      A(p(h), i+1:n) = A(p(h), i+1:n) - A(p(h),i) * A(p(i), i+1:n);
    end

  end

  %% In linea di principio, non
  %% è necessario allocare memoria
  %% aggiuntiva per immagazzinare
  %% la fattorizzazione perchè
  %% è possibile sovrascrivere la
  %% matrice originale A, per illustrare
  %% in modo coerente la teoria copiamo però
  %% i dati in due nuove matrici L ed U
  L = eye (n);
  U = zeros (n);
  for i = 1:n
    U(i,i:n) = A(p(i),i:n);
    L(i+1:n,i) = A(p(i+1:end),i);
  end
  
end

function [x, iter, incr] = prec_rich_method(A, b, P, alpha, x0, tol, max_it)
%PREC_RICH_METHOD risolve un sistema lineare utilizzando il metodo di Richardson
%precondizionato della forma
%x^(k+1) = x^(k) + alpha * inv(P) * r^(k)
%
%   [x, iter, incr] = prec_rich_method(A, b, P, alpha, x0, tol, max_it)
%
%   Input   : A      = matrice
%             b      = vettore termine noto
%             P      = precondizionatore
%             alpha  = parametro di rilassamento
%             x0     = vettore iniziale
%             tol    = tolleranza richiesta
%             max_it = numero massimo di iterazioni permesse
%   Output  : x      = approssimazione della soluzione
%             iter   = numero di iterazioni effettuate
%             incr   = ultimo incremento (utile per stimare l'errore)

B = eye(size
end

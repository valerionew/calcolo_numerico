function y = bad_BDF1(f,t,y0)
%BDF1 risolve un sistema di equazioni differenziali
%precondizionato della forma
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
h = diff(t);
y = zeros(numel(y0),numel(t));

y(:,1) = y0;

for ii = 1:numel(t)-1
    BDF1 = @(x)  y(:,ii) + h(ii) .* f(t(ii+1),x) - x;
    y(:,ii+1) = fsolve(BDF1, y(:,ii),optimset('Display','off'));
end

end


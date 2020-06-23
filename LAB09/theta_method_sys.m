function y = theta_method_sys(f, y0, t, theta)
%THETA_METHOD_SYS Risolve il sistema di equazioni differenziali ordinarie y' = f(t, y)
%   con y(0) = y0 nei nodi definiti in t tramite il theta-metodo.
%   y = THETA_METHOD_SYS(f, y0, t, theta)
%
%   Input   : f     = function handle del termine noto
%             y0    = condizione iniziale
%             t     = nodi
%             theta = parametro del metodo
%   Output  : y     = approssimazione numerica della soluzione nei nodi

h = diff(t);
y = zeros(length(y0),length(t));
y(:,1) = y0;

for (n = 2:length(t))
    g = @(z) z - y(:, n-1) - h(n-1).* ( theta . f(t(n-1), y(:,n-1)) + (1-theta) .* f(t(n), z) );
    y(:, n) = fsolve(g,	y(:, n-1),optimset('Display', 'off', 'MaxIter', 1000) );
end

end

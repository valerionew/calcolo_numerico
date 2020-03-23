% a]
% b]
% c]

clear all;
format short e
n = 40;
% alpha = 1/8 non richiesto nell'esercizio
for (alpha = [1/8, 8])
	I(1) = log((alpha+1)/alpha);
	for (k = 1:n)
		I(k+1) = -alpha*I(k) + 1/k;
	end
	recursion_integral = I(n+1);
	upper_bound = (1/alpha)*(1/(n+1));
	exact_integral = quadl(@(x) (x.^n)./(x+alpha), 0, 1, 1e-16); % Valore esatto (non richiesto)
	[recursion_integral, upper_bound, exact_integral]
end

% d]

clear all;
n = 40;
big = 1000;
% alpha = 1/8 non richiesto dal compito
for (alpha = [1/8, 8])
	I(big + 1) = 0;
	for (k = big:-1:n+1)
		I(k) = -1/alpha*I(k+1) + 1/(k*alpha);
	end
	recursion_integral = I(n+1);
	upper_bound = (1/alpha)*(1/(n+1));
	exact_integral = quadl(@(x) (x.^n)./(x+alpha), 0, 1, 1e-16); % Valore esatto (non richiesto)
	[recursion_integral, upper_bound, exact_integral]
end



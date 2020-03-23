x = 10 .^ -([1:20])

fx = (exp(x) - 1)./x

hold on
plot(x,fx)

% fixiamo sostituendo a e^x la sua espansione di taylor


fx_fixed = ( (x.^1)/factorial(1) + (x.^2)/factorial(2) + (x.^3)/factorial(3) + (x.^4)/factorial(4) )./x

plot(x,fx_fixed)
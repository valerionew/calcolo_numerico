f = @(x) tan(x) .* ( cos(x) .* tan(x) - x );
df =@(x)  - (tan(x)^2 + 1)*(x - cos(x)*tan(x)) - tan(x)*(sin(x)*tan(x) - cos(x)*(tan(x)^2 + 1) + 1);

%% A
rootfinding_function_plot(f,-1,pi);

%% B
[xi, x_iter] = newton (f, df, 2, 1e-4, 15);

xi

%% C
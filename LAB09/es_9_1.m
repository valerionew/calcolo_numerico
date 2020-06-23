f = @(t,y) -2 .* t .*y;

y0 = 1;
for n = 4:8
        t = [0:2.^(-n):1];
        figure(n-3);
        hold on
        y_ex = exp(-t.^2);
        plot(t, y_ex)
        title(sprintf('Caso n = %d', n))
    for tetha = 0:0.25:1
        y = tetha_metodo(f, tetha, y0, t);
        plot(t,y);
        err_matrix(n-3, 4.*tetha+1) = max(abs(y-y_ex));
    end
        legend('Sol esatta', '0','1/4','1/2','3/4','1');
end

p = log(err_matrix(2:end, 4*tetha+1)) - log (err_matrix(1:end+1, 4*tetha+1)) / log(0.5)


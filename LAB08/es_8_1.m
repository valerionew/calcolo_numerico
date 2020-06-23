f = @(t,y) t - y + 1;
maxerror = 0.01;

% andrebbe ricavato dalla formula
h = maxerror*2/(exp(1)-1) 
t = [0:h:1];
t = [t, 1];

% y esatta fornita dal prob
y_ex = @(t,x) t + exp(-t);

y_ee = eulero_esplicito(f,1,t);

g = @(t) t+1;
y_eil = eulero_implicito_lineare(-1,g,1,t);

err_ee = (abs(y_ee - y_ex(t)));
err_eil = (abs(y_eil - y_ex(t)));

figure(1);
hold on
plot(t, y_ex(t),'blue');
plot(t, y_ee,'red');
plot(t, y_eil,'green');

figure(2);
hold on
plot(t,err_ee,'red');
plot(t,err_eil,'green');
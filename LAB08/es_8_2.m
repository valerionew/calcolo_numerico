f = @(t,y) -t*(y.^2);
maxerror = 0.001;

% y esatta fornita dal prob
y_ex = @(t) 2./(t.^2 + 2);


% andrebbe ricavato dalla formula
h = maxerror*2/(1); % max di y^2 è 1 quindi diviso 1 
t = [0:h:1];
t = [t, 1];

y_ei = eulero_implicito(f,1,t);

err_ei = (abs(y_ei - y_ex(t)));

figure(1);
hold on
plot(t, y_ex(t),'blue');
plot(t, y_ei,'red');

figure(2);
hold on
plot(t,err_ei,'red');
hold on
plot(t_ex,y_ex);
plot(t,y_fe(1,:), 'r');
ylim([-0.2 0.3])
title("RLC filter - non stiff system - Forward Euler solution");
legend('Exact solution','Forward euler');
ylabel('Vc(t) [V]');
xlabel('t [s]');

close all

[t_nots,y_nots] = ode15s(@RLC_model_notstiff  ,[0 0.5],[0; 0]);
[t_s,y_s]       = ode15s(@RLC_model_stiff     ,[0 0.5],[0; 0]);

figure(1);
hold on
plot(t_nots,y_nots(:,1));
plot(t_s,y_s(:,1));
title('Solution of RLC filter, low stiffness, Vin 1V @ 100 Hz');
xlabel('Time t');
ylabel('Vout');
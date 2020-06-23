close all
clear all

C = 1e-3;
R1 = 10;
R2 = 10;
L = 1e-1;
e = 5;

a = L * C;
b = (L/R2 + R1.*C);
c = (R1/R2 + 1);

A = [0, 1; -c/a, -b/a]
B = [0 1];
V = @(t) e;

f = @(t, y) A * y + B*V(t);

y0 = [0 ; 0];

figure(1)
hold on

%% ee
h = 0.001;
t_ee = [0:h:0.1];
y_ee = tetha_metodo(f, 1, y0, t_ee);
%% ee_coarse
h = 0.004;
t_eec = [0:h:0.1];
y_eec = tetha_metodo(f, 1, y0, t_eec);

%% ei
h = 0.004;
t_ei = [0:h:0.1];
y_ei = tetha_metodo(f, 0, y0, t_ei);

%% cn

y_cn = tetha_metodo(f, 0.5, y0, t_ei);


%% plot

plot(t_ee,y_ee(1,:));
plot(t_eec,y_eec(1,:));
plot(t_ei,y_ei(1,:));
plot(t_ei,y_cn(1,:));
% a]
clear all, close all, clc
format long

n_max = 71;
x = zeros(n_max+1, 1);

x(1) = 1;         % x_0 posto uguale a 1
for n = 0:n_max-1
  x(n+2) = 2^(n+1)*(sqrt(1 + x(n+1)/2^n) - 1);    % Attenzione agli indici!!!
end
x(end)            
x_lim = log(1 + x(1))

figure
hold on, box on
plot([0:71], x, 'bx-','Linewidth',3)
plot([0:71], x_lim*ones(n_max+1,1)', 'r-','Linewidth',3)
axis([-1 72 -0.05 1.05])
set(gca,'LineWidth',2)
set(gca,'FontSiz\`e,16)

x(53)

x_0 = 1;
n = log(log(1 + x_0)/eps)/log(2)

% b]
clc, clear all

n_max = 71;
x = zeros(n_max+1, 1);

x(1) = 1;           % x_0 set to 1
for n = 0:n_max-1
  x(n+2) = 2*x(n+1)/(sqrt(1 + x(n+1)/2^n) + 1);
end
x(end)

% L'errore in questo caso \`e
x(end) - log(1 + x(1))

figure
hold on, box on
plot([0:n_max], x,'bx-','Linewidth',3)
plot([0:n_max], log(1+x(1))*ones(n_max+1), 'r-','Linewidth',3)
axis([-1 72 0.67 1.02])
set(gca,'LineWidth',2)
set(gca,'FontSiz\`e,14)

% Dai calcoli precedenti si ha che (1 + xn/2^n) \`e circa 1 per  n >= 52, cosi' x_(n+1) = 2*x_n/(1 + 1) = x_n


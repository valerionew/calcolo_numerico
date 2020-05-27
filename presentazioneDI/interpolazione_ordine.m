close all;
clear all;

tstart = 0;
tend = 2;
nstep = 100;

x = linspace(tstart-1, tend+1, nstep);
x_fit = tstart:1:tend;
f = @(x) exp(x);
y = f(x);

BDF1_x = x_fit([1:2]);
BDF2_x = x_fit([1:3]);

BDF1_fit = polyfit(BDF1_x, f(BDF1_x), 1);
BDF1_plot = polyval(BDF1_fit, x);

BDF2_fit = polyfit(BDF2_x, f(BDF2_x), 2);
BDF2_plot = polyval(BDF2_fit, x);


figure('Position', [100 100 900 600]);
hold on
title("BDF order - approximation plot");
plot(x, f(x), 'color', '#0072BD');
plot(x, BDF1_plot, 'color', '#D95319', 'LineWidth', 1.0);
plot(x, BDF2_plot, 'color', '#77AC30', 'LineWidth', 1.0);
plot(x_fit, f(x_fit), 'marker', 'x', 'color', 'black', 'HandleVisibility', 'off', 'lineStyle', 'none');
xlim([tstart - 0.5, tend + 0.5]);
legend('exact function', 'approx BDF1','approx BDF2');
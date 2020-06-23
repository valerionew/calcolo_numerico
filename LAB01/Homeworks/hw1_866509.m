close all
clear all

%% HW 1.1

tic
    my_realmin = 1;
    while (my_realmin/2 ~= 0)
        my_realmin = my_realmin/2;
    end
toc % this code is faster

realmin = realmin
my_realmin
clear all

tic
    k = 0;
    zero = 1/2;
    while (0 + zero) > 0
      zero_old = zero;
      zero = zero / 2;
    end
toc % this code is slower
zero_old % < realmin
k

%% HW 1.2
x = [0:1e-5:5e-4]

fx = (1 - cos(x)) ./ (x.^2)

fx_taylor_0 = ( (x.^2)./factorial(2) -(x.^4)./factorial(4))./ (x.^2)

figure(2);
hold on;
plot (x, fx);
plot (x, fx_taylor_0);

% per la gx le soluzioni suggeriscono di razionalizzare,
% ma come ci saremmo dovuti arrivare?


%% HW 1.3

figure(3);
hold on;
grid on;
x = [-1:1e-5:1];


approx_1 = 1 - x + (x .^2)./2 - (x .^3)./6;
approx_2 = 1./(1 + x + (x .^2)./2 + (x .^3)./6);

plot(x, exp(0-x),'b');
plot(x, approx_1,'g');
plot(x, approx_2,'r');

%% HW 1.4







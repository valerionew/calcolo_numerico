format long

% a]
clear all, close all, clc
k = [1:30]';
x = 2.^(-k);
f = @(x) (1 - cos(x))./(x.^2);
[k x f(x)]

f_taylor_4 = @(x) 1/2 - x.^2/24 + x.^4/720;

[k x f(x) f_taylor_4(x)]


% b]
clear all, close all, clc
format short e

k = [1:20]';
x = 10.^(k);

g = @(x) x.*(sqrt(x+1) - sqrt(x));

[k x g(x)]


g2 = @(x) x./(sqrt(x+1) + sqrt(x));

[k x g(x) g2(x)]



%clear variables
clear all;
%closes all figures whose handles are visible
close all;
%clear console
clc

%include
addpath ./src/

%global variables
a = 5;
b = 11;

intervals = [[6, 8]
             [8, 9]];

offset = 3;
imax = 1000;
delta = 1e-8;

%main
X = linspace(a - offset, b + offset);
Y = f1(X);
hold on; grid on;
plot(X, Y, '-')
yline(0)
ylabel('Y') 
xlabel('X')
title('f(x) = 1.15 sin(x) + 2 ln(x + 2)–5.5')

for interval = intervals
    [x, e, i, t] = bisect(@f1, interval(1), interval(2), delta);
    sprintf('Bisection on: [%d, %d]: %0.5f with error: %0.5g after %d iterations\n in total time %0.5f. s. Approximated value: %0.5g'...
        , interval(1), interval(2), x, e, i, t, f1(x))
    newton_start = (interval(1) + interval(2))/2;
    [xn, en, in, tn] = newton(@f1, newton_start, delta, imax);
    sprintf('Newton on: [%d, %d]: %0.5f with error: %0.5g after %d iterations\n in total time %0.5f. s. Approximated value: %0.5g'...
        , interval(1), interval(2), xn, en, in, tn, f1(xn))
end


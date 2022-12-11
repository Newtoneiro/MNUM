%clear variables
clear all;
%closes all figures whose handles are visible
close all;
%clear console
clc

%include
addpath ./src/

%global variables
a = [2, 3, -5, 2, 1];
delta = 1e-8;
maxIter = 100;

%main
X = linspace(-5, 5);
Y = f2(X, a');
hold on; grid on;
plot(X, Y, '-', 'DisplayName', 'Original plot of polynomial')
yline(0, 'HandleVisibility','off')
xline(0, 'HandleVisibility','off')
xlim([-5 5])
ylim([-16 20])
ylabel('Y') 
xlabel('X')
title('f(x) = 2x^+3x^3-5x^2+2x+1')
%%
input_vectors = [[-3 -2 -1]
                 [-4 -3 -2]
                 [-500, -499, -498]];

for input_vector = input_vectors'
    [x_pred, e, i, t] = MM2(@f2, a', input_vector', delta, maxIter);
    sprintf('Muller MM2 method on : [%d, %d, %d]: %0.5f with error: %0.5g after %d iterations\n in total time %0.5f. s. Approximated value: %0.5g'...
            , input_vector(1), input_vector(2), input_vector(3), x_pred, e, i, t, f2(x_pred, a'))
end
%%
input_vector = [-3 -2 -1];
while 1
    [x_pred, e, i, t] = MM2(@f2, a', input_vector', delta, maxIter);
    q = myhorner(a, x_pred);
    r = q(length(q));
    a = q(1:length(q)-1);
    if ~isreal(r)
        break
    end
    Y = f2(X, a');
    plot(X, Y, '-', 'DisplayName', sprintf('Dekonwolucja (x - %0.5f)', x_pred))
end

legend()

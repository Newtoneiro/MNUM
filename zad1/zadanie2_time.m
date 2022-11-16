%clear variables
clear all;
%closes all figures whose handles are visible
close all;
%clear console
clc

%include
addpath ./src/

%global variables
values = [5, 10, 25, 50, 100, 200];
times_1 = zeros(1, size(values , 2));
times_2 = zeros(1, size(values , 2));

delta = 1e-8;

%main

i = 1;
for value = values
    [x_1, e_1, time_1] = jacobiMethod(delta, @generateA_1, @generateB_1, value);
    [x_2, e_2, time_2] = gaussianWithPartialPivoting(@generateA_1, @generateB_1, value);
    times_1(i) = time_1;
    times_2(i) = time_2;
    i = i + 1;
end

%plotting
hold on

plot(values, times_1, '-o')
plot(values, times_2, '-o')

title('Zależność czasu wykonania algorytmu od liczby równań n.');
ylabel('czas - t') 
xlabel('liczba równań - n')
legend('Metoda Jackobiego','Metoda eliminacji Gaussa zcweg.')

hold off


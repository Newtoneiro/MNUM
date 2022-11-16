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
errors_1 = zeros(1, size(values , 2));
errors_2 = zeros(1, size(values , 2));

%main
i = 1;
for value = values
    [x_1, e_1] = gaussianWithPartialPivoting(@generateA_1, @generateB_1, value);
    [x_2, e_2] = gaussianWithPartialPivoting(@generateA_2, @generateB_2, value);
    errors_1(i) = e_1;
    errors_2(i) = e_2;
    i = i + 1;
end

%plotting
hold on, grid on

%%
% axis equal

plot(values, errors_1, '-o')
plot(values, errors_2, '-o')

title('Zależność błędu \epsilon od liczby równań n.');
ylabel('błąd - \epsilon') 
xlabel('liczba równań - n')
legend('A_1','A_2')

hold off

%clear variables
clear all;
%closes all figures whose handles are visible
close all;
%clear console
clc

%include
addpath ./src/
addpath ./src/QR

%global variables
values = [3, 5, 7, 9, 10];
colours = ['k', 'g', 'r', 'c', 'm'];

X = [-10, -8, -6, -4, -2, 0, 2, 4, 6, 8, 10];
Y = [-32.959, -20.701, -12.698, -5.150, -1.689, 0.126, 0.074, -0.870, -1.737, -3.995, -4.898];

linspaceOffset = 1;
mode = 2; % 1 = linear equations, 2 = QR Factorisation

%main
hold on; grid on;
plot(X, Y, 'ob')

i = 1;
for degree = values
    [x1, y1, err2, errInf] = leastSquaresMethod(X', Y', degree, linspaceOffset, mode);
    plot(x1, y1, colours(i), 'DisplayName', sprintf('Aprox. wiel. %d stopnia', degree));
    i = i + 1;
end

title('Aproksymacja metodą najmniejszych kwadratów');
ylabel('Y') 
xlabel('X')
legend()

hold off

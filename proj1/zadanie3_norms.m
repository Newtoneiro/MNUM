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

%main
hold on; grid on;

err2_n_all = [];
errInf_n_all = [];

err2_qr_all = [];
errInf_qr_all = [];

i = 1;
for degree = values
    [x1, y1, err2_n, errInf_n] = leastSquaresMethod(X', Y', degree, linspaceOffset, 1);
    [x1, y1, err2_qr, errInf_qr] = leastSquaresMethod(X', Y', degree, linspaceOffset, 2);
    err2_n_all(i) = err2_n;
    err2_qr_all(i) = err2_qr;

    errInf_n_all(i) =  errInf_n;
    errInf_qr_all(i) =  errInf_qr;
    i = i+1;
end
%%

plot(values, err2_n_all, '-o')
plot(values, err2_qr_all, '-o')
title('Aproksymacja metodą najmniejszych kwadratów - norma euklidesowa');
ylabel('błąd - \epsilon') 
xlabel('stopień wielomianu - n')
legend('Układ równań normalnych', 'Rozkład QR')

hold off
%%

plot(values, errInf_n_all, '-o')
plot(values, errInf_qr_all, '-o')
title('Aproksymacja metodą najmniejszych kwadratów - norma maksimum');
ylabel('błąd - \epsilon') 
xlabel('stopień wielomianu - n')
legend('Układ równań normalnych', 'Rozkład QR')

hold off

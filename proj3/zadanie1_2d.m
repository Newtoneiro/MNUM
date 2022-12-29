%clear variables
clear all;
%closes all figures whose handles are visible
close all;
%clear console
clc

%include
addpath ./src/

%global variables
zero = [-8 -7];
h0 = 0.01;
hmin = 1e-8;
rtol = 1e-4;

%main
hold on; grid on;
[data, e, h] = RKF23(@f, zero, 20, h0, hmin, rtol);
plot(data(:,3), h,'-o');
l = size(data,1);
xl = get(gca,'xlim');
yl = get(gca,'ylim');
zl = get(gca,'zlim');
xlabel('Time');
ylabel('Step size');
name =  'metoda RKF23';
title(name);
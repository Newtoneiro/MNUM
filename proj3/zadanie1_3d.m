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
hmin = 1e-4;
rtol = 1e-4;

%main
[data, e, h] = RKF23(@f, zero, 20, h0, hmin, rtol);
data = transpose(data);
plot3(data(1,:),data(2,:),data(3,:),'-o');
axis([-8 1 -8 1 0 20])
hold on;grid on;
l = size(data,1);
xl = get(gca,'xlim');
yl = get(gca,'ylim');
zl = get(gca,'zlim');
xlabel('x1 Position');
ylabel('x2 Position');
zlabel('time');
name =  'Metoda RKF23';
title(name);




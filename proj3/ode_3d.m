%clear variables
clear all;
%closes all figures whose handles are visible
close all;
%clear console
clc

%include
addpath ./src/
zero=[-8 -7]; %wektor stanow poczatkowych

%main
[t, data] = ode45(@f2,[0 20], transpose(zero));
h = figure;
plot3(data(:, 1),data(:, 2), t,'-o');
hold on;grid on; 
xlabel('x1 Position');
ylabel('x2 Position');
zlabel('time');
name =  'metoda ode45';
title(name);
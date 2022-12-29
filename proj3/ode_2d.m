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
hold on; grid on;
[t, data] = ode45(@f2,[0 20], transpose(zero));
plot(data(:,2), t,'-o');
l = size(data,1);
xl = get(gca,'xlim');
yl = get(gca,'ylim');
zl = get(gca,'zlim');
xlabel('x2 Position');
ylabel('Time');
name =  'metoda ODE45';
title(name);
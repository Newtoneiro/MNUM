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
delta = 1e-8;

%main
[x, e] = bisect(@f1, a, b, delta);
[xn, en] = newton(@f1, a, delta, 1000);

x
e
xn
en
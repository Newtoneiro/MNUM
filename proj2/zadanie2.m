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
x = [-20, -15, -10];
[x, error] = MM2(@f2, a', x', delta, maxIter)
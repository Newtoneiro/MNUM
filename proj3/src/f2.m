function [Y] = f2(y, x)
% Funkcja zwracająca pochodne trajektorii (z dodatkowym parametrem do ode45)
%     x - wektor argumentów 
%     Y - wektor rozwiązań

Y(1) = x(2) + x(1)*(0.4 -x(1)^2 -x(2)^2); 
Y(2) = -x(1) + x(2)*(0.4 -x(1)^2 -x(2)^2);
Y = transpose(Y);
end
function [Y] = f(x)
% Funkcja zwracająca pochodne trajektorii
%     x - wektor argumentów 
%     Y - wektor rozwiązań

Y(1) = x(2) + x(1)*(0.4 -x(1)^2 -x(2)^2); 
Y(2) = -x(1) + x(2)*(0.4 -x(1)^2 -x(2)^2);

end
function [Y, E, H] = RKF23(f_x, x, timelimit, h, hmin, rtol)
% RK4 Rozwiazanie ukladu metoda Rungego-Kutty drugiego rzędu ze zmiennym
% krokiem
%     f_x        - badana funkcja
%     x          - stan poczatkowy
%     timelimit  - zakres czasu
%     h          - rozmiar kroku początkowego
%     hmin       - minimalny rozmiar kroku
%     rtol       - relative tolerance - błąd względny
    Y  = zeros(10,3);
    E  = [];
    H  = [];

    Y(1,1:2) = x;               % inicjalizacja wektora wyjściowego początkową wartością x
    
    time = 0;                   % zmienna reprezentująca aktualną chwilę czasu
    i = 2;                      % iterator do indeksowania wektorow
    s = 0.9;                    % wsp. do uaktualniania kroku
    Beta = 5;

    while(time < timelimit)

        % metoda RKF23
        k1 = f_x(x);
        k2 = f_x(x + h * (1/4)   * (       k1                      ));
        k3 = f_x(x + h * (1/800) * (-189 * k1 + 729 * k2           ));
        k4 = f_x(x + h * (1/891) * (214  * k1 + 27  * k2 + 650 * k3));
        
        xlow  = x + (1/891)  * h * (214 * k1 + 27 * k2 + 650  * k3          );
        xhigh = x + (1/2106) * h * (533 * k1 + 0  * k2 + 1600 * k3 - 27 * k4);
        
        % Szacowanie błędu techniką pary metod włożonych
        err = norm(xhigh - xlow, inf);

        % Proponowana korekta długości kroku
        alpha = (rtol/err)^(1/3); % alpha = (eps/err)^(1 / (p+1)), p - rząd metody, którą przybliżamy (2)
        hopt = s * h * alpha;
        
        % Sprawdzenie, czy błąd jest akceptowalny
        if s * alpha >= 1
            if time + h == timelimit
                break
            else
                Y(i,1:2) = xhigh;
                E(i) = err;
                H(i) = h;
                x = xhigh;
                time = time+h;
                % zapisanie czasu
                Y(i,3) = time;
                i = i+1;
                % Uaktualnienie obecnego kroku używając optymalnego kroku
                h = min([hopt, Beta * h, timelimit - time]);
            end
        else
            if hopt < hmin
                error("Niemożliwe jest znalezienie rozwiązania z zadaną dokładnością.");
            else
                h = hopt;
            end
        end
    end
end
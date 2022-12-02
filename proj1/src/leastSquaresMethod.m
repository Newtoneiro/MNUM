function [x1, y1, err2, errInf] = leastSquaresMethod(X, Y, n, linspaceOffset, mode)
    addpath ./src/QR

    A = zeros(n, size(X, 1))';
    
    %fill A matrix
    for i = 1:n
        for j = 1:size(X, 1)
            A(j, i) = X(j)^(n-i);
        end
    end
    
    if mode == 1
        % normal equation
        An = A'*A;
        bn = A'*Y;
        xn = An\bn; % x = (A'*A)^(-1) * (A'*b)
    else
        % QR Factorization
        [Q, R] = myQr(A);
        xn = linsolve(R, Q'*Y);
    end
       
    x1 = linspace(min(X) - linspaceOffset, max(X) + linspaceOffset);
    y1 = 0;
    for i = 1:n
        y1 = y1 + xn(i).*x1.^(n-i);
    end
    %calculating error
    err = A*xn-Y;
    err2 = norm(err, 2);
    errInf = norm(err, "inf");
end


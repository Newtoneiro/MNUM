function [x, e,time] = gaussianWithPartialPivoting(generateA, generateB, n)
    A = generateA(n);
    b = generateB(n);
    CMB = [A, b];
    tic % For meassuring time
    for col = 1:n-1
        %Partial Pivoting
        [maxVal , index] = max(abs(CMB(col:n, col)));
        tmp = CMB(index+col-1, :);
        CMB(index+col-1, :) = CMB(col, :);
        CMB(col, :) = tmp;
        %Elimination
        for row=col+1:n
            m = CMB(row, col)/CMB(col, col);
            CMB(row, :) = CMB(row, :) - m*CMB(col, :);
        end
    end
    time = toc; % Get elapsed time
    x = linsolve(CMB(:, 1:n), CMB(:, n+1));
    e = norm(A*x-b);
end

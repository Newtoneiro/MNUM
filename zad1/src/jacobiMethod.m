function [X, e, time] = jacobiMethod(delta, generateA, generateB, n)
    A = generateA(n);
    b = generateB(n);
    X = zeros(n, 1);
    cur_delta = inf;
    tic % For meassuring time
    while cur_delta > delta
        iterational_X = zeros(n, 1);
        for i = 1:n
            temp_x = 0;
            for j = 1:n
                if j ~= i
                    temp_x = temp_x + A(i, j)*X(j);
                end
            end
            iterational_X(i) = (-1/A(i, i)) * (temp_x - b(i));
        end
        X = iterational_X;
        cur_delta = norm(A*X-b);
    end
    time = toc; % Get elapsed time
    e = norm(A*X-b);
end

%wartosci wlasne, widmo maciwerzy i uklady dynamiczne



function [x, e, i, t] = bisect(f, a, b, delta)
    c = f(a); d=f(b);
    %if c*d > 0.0
     %   error('Function has same sign at both endpoints')
    %end
    e = inf;
    i = 1; % Iteration
    tic
    while e > delta
        middle = (a + b)/2;
        y = f(middle);
        if y == 0.0    %solved the equation exactly
            a = middle;
            b = middle;
            break;
        end
        %decide which half to keep
        if c*y < 0.0
            b = middle;
        else
            a = middle;
        end
        x = middle;
        e = abs(f(x));
        i = i + 1;
    end
    t = toc;
end


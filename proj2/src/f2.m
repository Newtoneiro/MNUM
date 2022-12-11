function y = f2(x, a)
    y = 0.0;
    n = size(a, 1);
    % y = a1 * x^n-1 + ... + a(n-1) * x + an
    for i = 1:n
        y = y + a(i) * x.^(n - i);
    end
end


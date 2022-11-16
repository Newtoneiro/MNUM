function [Q, R] = myQr(A)
    Q = zeros(size(A));
    % Gram-Schmidt
    for i = 1:size(A, 2)
        u = A(:, i);
        for j = 1:i-1
            p = projection(A(:, i), Q(:, j));
            u = u - p;
        end
        Q(:, i) = u;
    end
    % Orthonormalize
    for i = 1:size(Q, 2)
        Q(:, i) = Q(:, i) / norm(Q(:, i));
    end

    R = Q'*A;
end


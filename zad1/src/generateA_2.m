function a = generateA_2(n)
    a = zeros(n);
    for i = 1:n
        for j = 1:n
            if i ~= j
                a(i, j) = 2*(i-j) + 2;
            else
                a(i, j) = 1/6;
            end
        end
    end
end

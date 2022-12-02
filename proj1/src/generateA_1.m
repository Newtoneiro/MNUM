function a = generateA_1(n)
    a = zeros(n);
    for i = 1:n
        for j = 1:n
            if (j == i-2) || (j == i+2)
                a(i, j) = 2 - j/n;
            elseif j == i
                a(i, j) = -7;
            else
                a(i, j) = 0;
            end
        end
    end
end

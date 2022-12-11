function [q] = myhorner(a, root)
% last element of q is the rest
    tmp = 0;
    q = zeros(size(a));
    i = 1;
    for coefficient = a
        q(i) = a(i) + tmp;
        tmp = q(i) * root;
        i = i + 1;
    end
end


function [x] = projection(b, A)
    x = ((A'*b)/(A'*A))*A;
end
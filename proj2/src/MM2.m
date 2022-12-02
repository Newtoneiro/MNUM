function [pred_x, e] = MM2(f, a, initial_x, delta, maxIter)
    %initial delta = infinity
    e = inf;
    
    %import java queue
    import java.util.LinkedList
    x = LinkedList();
    x.add(initial_x(1));
    x.add(initial_x(2));
    x.add(initial_x(3));
    
    i = 0;
    while abs(e) > delta && i < maxIter
        %Sort x to build quadratic polynomial
        x_s = sort([x.get(0), x.get(1), x.get(2)]);
       
        %Create quadratic equation using previous q values
        quadF=@(z) f(x_s(1), a) * ((z - x_s(2)) / (x_s(1) - x_s(2))) * ((z - x_s(3)) / (x_s(1) - x_s(3))) ...
        + f(x_s(2), a) * ((z - x_s(1)) / (x_s(2) - x_s(1))) * ((z - x_s(3)) / (x_s(2) - x_s(3))) ...
         + f(x_s(3), a) * ((z - x_s(1)) / (x_s(3) - x_s(1))) * ((z - x_s(2)) / (x_s(3) - x_s(2)));
        try
            %Simplify quadF and get its coefficients
            syms y
            p = sym2poly(quadF(y));
        catch Exception
            warning('Achieved maximum delta.');
            %If Not a polynomial error thrown, then all elements of x array
            %are the same (in regards to delta)
            break
        end
        %Calculate roots
        r = roots(p);
        
        %Find root that's closest to 0
        y1 = f(r(1), a);
        y2 = f(r(2), a);
        if abs(y1) < abs(y2)
            pred_x = r(1);
        else
            pred_x = r(2);
        end

        %Update the Queue, remove the 'oldest' x
        x.remove();
        x.add(pred_x);

        %Calculate current error
        e = f(pred_x, a);

        i = i+1;
    end
end


function [delta] = calculate_delta(x,y,n)
    max = 0;
    for i = 1:n
        if max < abs(x(i)-y(i))
            max = abs(x(i)-y(i));
        end    
    end
    delta = max;
end
function [x] = solve_x(L,b,n)
    y = zeros(n,1);
    for i = 1:n
        y(i) = b(i);
        for j = 1:i-1
            y(i) = (y(i) - L(i,j)*y(j));
        end
        y(i)=y(i)/L(i,i);
    end
    U = L';
    x = zeros(n,1);
    for i = n:-1:1
        x(i) = y(i);
        for j = (i+1):n
            x(i) = (x(i) - U(i,j)*x(j));
        end
        x(i) = x(i)/U(i,i);
    end
end
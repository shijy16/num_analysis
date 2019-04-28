function x = jacobi(A,b,n)
    x = zeros(n,1);
    y = ones(n,1);
    jacobi_cnt = 1;
    while calculate_delta(x,y,n) > 1e-4
        y = x;
        for i=1:n
            x(i) = b(i);
            for j =1:i-1
                x(i) = x(i) - A(i,j)*y(j);
            end
            for j = i+1:n
                x(i) = x(i) - A(i,j)*y(j);
            end
            x(i) = x(i)/A(i,i);
        end
        jacobi_cnt = jacobi_cnt + 1;
    end
    jacobi_cnt
end
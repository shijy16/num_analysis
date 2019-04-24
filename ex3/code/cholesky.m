function [L] = cholesky(A,n)
    for j = 1:n
        for k = 1:j-1
            A(j,j) = A(j,j)-A(j,k)*A(j,k);
        end
        A(j,j) = sqrt(A(j,j));
        for i = j+1:n
            for k = 1:j-1
                A(i,j) = A(i,j) - A(i,k)*A(j,k);
            end
            A (i,j) = A(i,j)/A(j,j);
        end
        L = zeros(n,n);
        for p = 1:n
            for k = 1:p
               L(p,k) = A(p,k);
            end
        end
    end
end
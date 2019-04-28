function [x]=GS(A,b,n)
x = ones(n,1);
x_2 = zeros(n,1);
GS_cnt = 1;
while calculate_delta(x,x_2,n) > 1e-4
    x_2 = x;
    for i=1:n
        x(i) = b(i);
        for j =1:i-1
            x(i) = x(i) - A(i,j)*x(j);
        end
        for j = i+1:n
            x(i) = x(i) - A(i,j)*x(j);
        end
        x(i) = x(i)/A(i,i);
    end
    GS_cnt = GS_cnt + 1;
end
GS_cnt
end
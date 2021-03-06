function [x]=SOR(A,b,n)
w = 0.5;
x = ones(n,1);
x_2 = zeros(n,1);
sor_cnt = 0;
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
        x(i) = (1-w)*x_2(i) + w*x(i);
    end
    sor_cnt = sor_cnt + 1;
end
sor_cnt
end
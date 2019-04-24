n=8;
delta = zeros(n,1);
delta(1:n) = 1e-7;
H = Hilbert(n);
x = ones(n,1);
b = H*x + delta;
L = cholesky(H,n);
x_hat = solve_x(L,b,n);
r = b - H*x_hat;
delta_x = x_hat - x;
r_max = 0;
delta_x_max = 0;
for i = 1:n
    if r_max < abs(r(i))
        r_max = abs(r(i));
    end
    if delta_x_max < abs(delta_x(i))
        delta_x_max = abs(delta_x(i));
    end
end
r_max
delta_x_max
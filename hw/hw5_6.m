
A = [6,2,1;2,3,1;1,1,1];
I = eye(3,3);
p = 7;
u0 = [1;1;1];
v = inv(A - p * I) * u0;
u = v / norm(v, inf);
i = 0;
while norm(u - u0, inf) > 1e-4
    u0 = u;
    v = inv(A - p * I) * u0;
    u = v / norm(v, inf);
    i = i+1;
end;
i
u
x = norm(v, inf)

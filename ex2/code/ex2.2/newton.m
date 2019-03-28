function [ x ] = newton(f,f1,x,no_lambda)
delta = 0.000001;
xprev = 0;
i = 0;
while abs(f(x)) > delta || abs(x-xprev) > delta
    xprev = x;
    s = f(x)./f1(x);
    x = x - s;
    i = i + 1;
    if(no_lambda == 0)
        lambda = 1;
        while abs(f(x)) >= abs(f(xprev))
            x = xprev - lambda*s;
            lambda = lambda/2;
        end
        fprintf('i=%d:lambda=%f,x=%f\t',i,lambda,x)
    else
        fprintf('i=%d,x=%f\t',i,x)
    end
end
fprintf('\nfinished with i = %d\n',i)
end
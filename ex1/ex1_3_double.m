a = 0;
answer = 1;
i = 2
while answer - a > 0
    i = i+1;
    a = answer;
    answer = answer + 1./i;
    if mod(i,1000000) == 0
        disp(i)
    end
end
disp(i)
a = 0;
answer = 1;
i = 1
while answer - a > 0
    i = i+1;
    a = answer;
    answer = answer + 1./i;
    if i == 2097152
        disp(answer)
    end
end
disp(i)
a = single(0);
answer = single(1);
i = 2
while answer - a > 0
    i = i+1;
    a = answer;
    answer = answer + 1./i;
end
disp(i)
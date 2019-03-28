a = single(0);
answer = single(1);
i = 1
while answer - a > 0
    i = i+1;
    a = answer;
    answer = answer + single(1./i);
end
disp(i)
disp(answer)
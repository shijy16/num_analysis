fprintf('*************����ţ�ٷ�����f1���********\n');
x1=newton(@f1,@f1_diff,0.6,0);
x1_t=fzero('f1',0.6);
fprintf('x1=%f,x1_t=%f \n',x1,x1_t)

fprintf('*************����ţ�ٷ�����f2���********\n');
x2=newton(@f2,@f2_diff,1.35,0);
x2_t=fzero('f2',1.35);
fprintf('x2=%f,x2_t=%f \n',x2,x2_t)

fprintf('*************ţ�ٷ�����f1���********\n');
x1=newton(@f1,@f1_diff,0.6,1);
x1_t=fzero('f1',0.6);
fprintf('x1=%f,x1_t=%f \n',x1,x1_t)
fprintf('*************ţ�ٷ�����f2���********\n');
x2=newton(@f2,@f2_diff,1.35,1);
x2_t=fzero('f2',1.35);
fprintf('x2=%f,x2_t=%f \n',x2,x2_t)
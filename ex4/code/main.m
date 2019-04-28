epsilon = 0.0001;
a = 0.5;
n = 100;
h = 1/n;
A = zeros(n-1,n-1);
%build A
for i=1:n-1
    for j=1:n-1
        if i == j
            A(i,j) = -2*epsilon - h;
        end
        if j == i + 1
            A(i,j) = epsilon + h;
        end
        if j == i - 1
            A(i,j) = epsilon;
        end
    end    
end

%build b
b = zeros(n-1,1);
b(1:n-1) = a*h*h;
b(n-1) = a*h*h-epsilon-h;

x = 0:1/n:1;
%true ans
true_y = (1-a)*(1-exp(-x/epsilon))/(1-exp(-1/epsilon))+a*x;

%GS
GS_ans = GS(A,b,n-1);
%jacobi
jacobi_ans = jacobi(A,b,n-1);
%SOR
sor_ans = SOR(A,b,n-1);

figure;
plot(x(2:n),sor_ans,'r',x(2:n),jacobi_ans,'g',x(2:n),GS_ans,'b',x(2:n),true_y(2:n),'k','LineWidth',1.5);
GS_delta = calculate_delta(GS_ans,true_y(2:n),n-1)
jacobi_delta = calculate_delta(jacobi_ans,true_y(2:n),n-1)
sor_delta = calculate_delta(sor_ans,true_y(2:n),n-1)

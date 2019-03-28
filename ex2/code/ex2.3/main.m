zero_point = [];
for i=0:3.14:3.14*9
   zero_point = [zero_point,fzerotx(@(x)besselj(0,x),[i,i+3.14])]; 
end
zero_point
x = 1:0.001:35;
plot(x,besselj(0,x),zero_point,zeros(1,10),'*r')
grid on
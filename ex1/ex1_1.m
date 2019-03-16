h = 10.^(-16:0.2:0);
epsilon_limit = h./2 + 10^(-16)*2./h;
epsilon_real = abs((sin(1+h)+-sin(1))./h-cos(1));
epsilon_trunc = h./2;
epsilon_round = 10^(-16)*2./h;
loglog(h,epsilon_limit,h,epsilon_real,h,epsilon_trunc,h,epsilon_round);
axis([10.^-16,10.^0,0,2])
clear; clc;

g = 9.81

m = 1.5; #0.142 + (28/1000)*8 + (0.011*4) + (0.0025*4);
d = 10;
t = 2;
u_s = 0.7;

a = (2*(d/2))/((t/2)^2);
v_max = a*t;

a_max = ((m/4)*g*u_s)/m
f_n = m*a - (m/4)*g*u_s;

r = 0.01 : 0.001 : 0.1;

tau = [];
w_max = [];

for i = 1 : length(r)
  tau(i) = m*a*r(i);
  w_max(i) = v_max/(2*pi*r(i))
endfor

plot(r, [w_max; tau]);


clear; clc;

# constants
g = 9.81;

function mass = radius_to_mass(r)
  mass = 3.11*r - 0.0487 + 0.00255;
endfunction

# user defined constants
t_run = 2; # Run time
d_run = 10; # Run distance
m = 1; # Total car weight
u_s = 0.7; # Coefficient of static friction between floor and wheel
r_range = [0.0381/2, 0.1]; # Range of wheel radii to test

a_min = (4*d_run)/(t_run^2);
v_max = a_min*t_run/2;
f_normal_ext = (m*a_min/u_s) - 0.25*m*g;

i_w = [ ]; # moments of inertia for wheels
torque_m = [ ]; # torque requirements
power_m = [ ]; # power requirements
rpm_w = [ ];
r_w = r_range(1) : 0.001 : r_range(2);

for i = 1:length(r_w)
  i_w(i) = 0.5*radius_to_mass(r_w(i))*r_w(i)^2;
  torque_m(i) = a_min*(4*i_w(i)/r_w(i) + r_w(i)*m);
  power_m(i) = torque_m(i)*(a_min*t_run)/(2*r_w(i));
  rpm_w(i) = ((a_min*t_run)/(4*r_w(i)*pi))*60;
endfor

hf = figure();
subplot(3, 1, 1);
plot(rpm_w, torque_m, "m");
title("RPM v. torque (Nm)");
xlabel("RPM"); ylabel("torque (Nm)");
xticks(0 : 500 : max(rpm_w) + 500); yticks(0 : 0.1 : max(torque_m) + 0.5);
grid on;
subplot(3, 1, 2);
plot(r_w, power_m);
title("radius (m) v. power (W)");
xlabel("radius (m)"); ylabel("power (W)");
xticks(0 : 0.01 : r_range(2)); yticks(0 : 5 : max(power_m) + 10);
grid on;
subplot(3, 1, 3);
plot(r_w, rpm_w, "g");
title("radius (m) v. RPM");
xlabel("radius (m)"); ylabel("RPM");
xticks(0 : 0.01 : r_range(2)); yticks(0 : 500 : max(rpm_w) + 500);
grid on;


clear; clc;

# constants
g = 9.81;

function mass = radius_to_mass(r)
  mass = 3.11*r - 0.0487 + 0.00255;
endfunction

function plotgraphauto(x, y, x_l, y_l, c)
  plot(x, y, c);
  title(strjoin({x_l, "v.",y_l}, " "));
  xlabel(x_l); ylabel(y_l);
  #stepx = (max(x)-min(x))/10;
  #stepy = (max(y)-min(y))/10
  #xticks(min(x) - 2*stepx: stepx : max(x) + 2*stepx);
  #yticks(min(y) - 2*stepy: stepy : max(y) + 2*stepy);
  grid on;
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
subplot(3, 2, 1);
plotgraphauto(r_w, torque_m, "Radius (m)", "Torque (Nm)", "r");
subplot(3, 2, 2);
plotgraphauto(r_w, rpm_w, "Radius (m)", "RPM", "b");
subplot(3, 2, 3);
plotgraphauto(r_w, power_m, "Radius (m)", "Power (Watts)", "g");
subplot(3, 2, 4);
plotgraphauto(rpm_w, torque_m, "RPM", "Torque (Nm)", "m");
subplot(3, 2, 5);
plotgraphauto(rpm_w, power_m, "RPM", "Power (Watts)", "c");
subplot(3, 2, 6);
plotgraphauto(torque_m, power_m, "Torque (Nm)", "Power (Watts)", "k");
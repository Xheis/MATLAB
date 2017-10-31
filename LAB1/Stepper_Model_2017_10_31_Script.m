%%Stepper_Pend
% Cart/pendulum parameters
M = 1;              % Mass of cart (kg)
m = 0.25;          	% Mass of pendulum (kg)
L = 0.8;            % Length of pendulum (m)
wheel_Radius = 0.088;
b = 0.01;           % Damping of cart (N.s/m) //misc, tuned
c = 0.05;           % Damping of pendulum (N.m.s/rad) //calc'd from sys id

% Other parameters
g = 9.82;           % Acceleration due to gravity (m/s/s)
alpha = 1*pi/180;   % Ground slope (rad = deg*pi/180)
theta0 = 5*pi/180;  % Initial angle (rad = deg*pi/180)

%sym theta v x omega


% -----------------------------------
% Inner (angle) controller parameters
zeroes = 1;%5.4277;
poles =  2.2;%26.4277;
Controller_Gain = -3.5;%-119.0071;
% -----------------------------------

% Outer (velocity) controller parameters
K2 = 1.402;

% Outer (velocity) controller parameters
TF_Theta_To_V_Gain = 1;
TF_Theta_To_X_Gain = 1;


% Run simulation
tsim = 20;
sim('Stepper_Model_2017_10_31');

% Plot results
figure(1);clf
subplot(2,2,1)
plot(t,theta*180/pi,t,ri*180/pi,'r')
grid on
xlim([0 tsim])
xlabel('Time (sec)')
ylabel('\theta (\circ)')
legend('Actual','Demanded','Location','Best')

subplot(2,2,2)
plot(t,omega*180/pi)
grid on
xlim([0 tsim])
xlabel('Time (sec)')
ylabel('\omega (\circ/s)')

subplot(2,2,3)
plot(t,x)
grid on
xlim([0 tsim])
xlabel('Time (sec)')
ylabel('x (m)')

subplot(2,2,4)
plot(t,V,t,r,'r')
grid on
xlim([0 tsim])
xlabel('Time (sec)')
ylabel('v REF (m/s)')
legend('Actual','Demanded','Location','Best')

figure(2);clf
plot(t,u)
grid on
title('Control force')
xlabel('Time (sec)')
ylabel('Force (N)')
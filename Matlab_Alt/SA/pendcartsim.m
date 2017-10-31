% Cart/pendulum parameters
global K N eta R taum r
M = 3;              % Mass of cart (kg)
m = 0.5;          	% Mass of pendulum (kg)
l = 0.5;            % Length of pendulum (m)
r = 0.035;
J = M*r^2/2;
I = m*l^2/2;
K = 0.1;
Eta = 0.5882;
N = 50;
taum = 0.0056;
R = 0.6575;
L = 0.001;
Torquesat = 1.2;
Usat = 12;
% Other parameters
g = 9.82;           % Acceleration due to gravity (m/s/s)
alpha = 0*pi/180;   % Ground slope (rad = deg*pi/180)
theta0 = 10*pi/180;  % Initial angle (rad = deg*pi/180)

% Inner (angle) controller parameters
p = 5.4277;
p1 = 25.4277;
K1 = -119.0071;

% Outer (velocity) controller parameters
K2 = 0.0402;

% Feedback
a = J + (M+m)*r^2;
b = M*l*r;
c = I + M*l^2;
Mmatrix = [ a,      a+b;
            a+b,    a+2*b+c];
inM = inv(Mmatrix);
B = inM*[   1;
            0];
A = inM*[   0;
            M*g*l];
Ad = [  zeros(2),   A;
        0,  1,    0];
Bd = [  B;
        0];
Cd = [   r,  r,    0];
Dd = 0;

Kgain = place(Ad,Bd,[-15 -16 -17]);
% Kgaina = [Kgain(1);Kgain(2);Kgain(3);Kgain(4)];
% Kz = Kgain(5);
Ngain = 1/(Cd*inv(eye(3)-Ad+Bd*Kgain)*Bd);
% Run simulation
tsim = 30;
sim('pendcart');

% Plot results
figure(3);clf
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
plot(t,v,t,r,'r')
grid on
xlim([0 tsim])
xlabel('Time (sec)')
ylabel('v (m/s)')
legend('Actual','Demanded','Location','Best')

figure(2);clf
plot(t,u)
grid on
title('Control force')
xlabel('Time (sec)')
ylabel('Force (N)')





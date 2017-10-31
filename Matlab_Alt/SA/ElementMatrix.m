function y = ElementMatrix(u)
%#codegen
T = u(1);
M = u(2);
l = u(3);
r = u(4);
theta = u(5);
alpha = u(6);
theta1d = u(7);
m = u(8);
g = 9.82;



E1 = T + M*l*r*sin(theta+alpha)*theta1d^2 - (M+m)*g*r*sin(alpha);
E2 = M*l*r*sin(theta+alpha)*theta1d^2 - (M+m)*g*r*sin(alpha) + M*g*l*sin(theta);
y = [E1;E2];
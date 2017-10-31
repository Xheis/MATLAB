function y = massMat(u)
%#codegen
J = u(1);
M = u(2);
m = u(3);
r = u(4);
theta = u(5);
alpha = u(6);
l = u(7);
I = u(8);



M11 = J + (M+m)*r^2;
M12 = J + (M+m)*r^2 + M*l*r*cos(theta+alpha);
M22 = J + (M+m)*r^2 + 2*M*l*r*cos(theta+alpha) + I + M*l^2;
y = [M11;M12;M22];
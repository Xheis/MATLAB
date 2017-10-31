r = 1; 
s = tf('s');
syms x;
A4 = [-1 x; -1-x^3   -1];
sys = tf(A4);
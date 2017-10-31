%assignment 2.1a)

%g = zpk([],1,1);
%h = tf([2 1],[1 0]);
syms Kp s Ti L R E
Cs = tf([Kp Ti],[1 0]);
Ps = tf([1 0],[L R]);
cloop = (Cs - E) * Ps;


cloopmin = minreal(cloop)
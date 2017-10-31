T = 100;
wo = 5;
K = 0.1;
r = 0.035;
eta = 0.5882;
N = 50;
taum = 0.0056;
R = 0.6575;

if T == 0
    i = 0;
else
    if T>0
         i = T/(eta*N*K) + taum/K;
    else
         i = T/(eta*N*K) - taum/K;
    end
end
U = R*i + N*K*wo;

function y = findU(u)
global K N eta R taum r
    T = u(1);
    wo = u(2);

    
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
    y = U;




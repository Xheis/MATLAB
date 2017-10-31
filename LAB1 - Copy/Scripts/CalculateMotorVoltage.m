function [U] = CalculateMotorVoltage(TORQUE,OMEGA,K,N,Eta,R,Taum,r)
%CALCULATEMOTORVOLTAGE Summary of this function goes here
%   Detailed explanation goes here
   
    if T == 0
        i = 0;
    else
        if T>0
			 i = TORQUE/(Eta*N*K)+Taum/K;
        else
			 i = TORQUE/(Eta*N*K)-Taum/K;
        end
    end
    U = R*i + N*K*OMEGA;
end
 
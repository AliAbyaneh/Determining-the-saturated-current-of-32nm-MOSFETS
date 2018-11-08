vgs = 0.8:0.01:1.1;
%%%%%%% HSPICE Simulation Result for Drain Source current
Ids = [
             281.0910e-6  
             294.6428e-6  
             308.2740e-6  
             321.9757e-6  
             335.7401e-6  
             349.5604e-6  
             363.4305e-6  
             377.3453e-6  
             391.3001e-6  
             405.2908e-6  
             419.3138e-6  
             433.3659e-6  
             447.4443e-6  
             461.5466e-6  
             475.6704e-6  
             489.8137e-6  
             503.9747e-6  
             518.1519e-6  
             532.3436e-6  
             546.5485e-6  
             560.7654e-6  
             574.9931e-6  
             589.2306e-6  
             603.4768e-6  
             617.7309e-6  
             631.9919e-6  
             646.2591e-6  
             660.5316e-6  
             674.8087e-6  
             689.0898e-6  
             703.3741e-6 
        ];

Ids = Ids';
vth = 0.65113;
mobility_eff = zeros(1,length(vgs));
%%%%%%% Caclulate Effective Mobility with respect to Vgs
for i = 1:length(vgs)
    mobility_eff(i) = 540/(1 + (((vgs(i) + vth)/(0.54*1.65))^1.85));
end

cox = 0.0209;
WperL = 1e-6/32e-9;

fun = @(x,vgs)(540./(1 + (((vgs + vth)./(0.54*1.65)).^1.85)))*cox*WperL.*(vgs - vth).*(vgs-vth).*x./(vgs - vth + x);
x0 = 0;
EcL = lsqcurvefit(fun,x0,vgs,Ids)
Vds_Estimated = ((vgs - vth).*EcL)./((vgs - vth) + EcL);
Ids_Estimated = cox * WperL .* mobility_eff .* Vds_Estimated .* (vgs - vth);
plot(vgs,Ids_Estimated, '.r');
hold on;
plot(vgs,Ids, '.b');
title({'NMOS I-V Charchteristic',' Red curve is result of model after least square curve fitting','Blue curve is result of simulation'});
grid on; grid minor; xlabel({'V_G_S', ' when V_D_S = V_D_D'}); ylabel('I_d_s');

%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Part C &&&&&&&&

% VDsat = zeros(1,length(vgs));
Vds_Estimated = ((vgs - vth)*100000.*EcL)./((vgs - vth) + 100000*EcL);
VDsat = 2.*Ids./(mobility_eff.*WperL*cox.*(vgs - vth)*2);
% VDsat_Estimated = 2.*Ids_Estimated./(mobility_eff.*WperL*cox.*(vgs - vth)*1e-4)
figure;
plot(vgs,VDsat,'.b');
hold on;
plot(vgs,Vds_Estimated,'.r');

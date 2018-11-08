vgs = -1:0.1:2;
Ids = [   
-1.7128e-3  
-1.5607e-3  
-1.4163e-3  
-1.2783e-3  
-1.1458e-3  
-1.0178e-3  
-893.7069e-6  
-773.2064e-6  
-656.1394e-6  
-542.6715e-6  
-433.3094e-6  
-328.9691e-6  
-231.0913e-6  
-142.0485e-6  
-67.0249e-6  
-18.1003e-6  
-2.1416e-6  
-157.9674e-9  
-9.2902e-9  
-484.6096e-12  
-23.8466e-12  
-3.837e-27  
3.3816e-12  
9.0062e-12  
21.7321e-12  
48.8452e-12  
103.3674e-12  
207.4450e-12  
391.8434e-12  
694.9536e-12  
1.2034e-9  ];


Ids = Ids';
subplot(2,1,1);
plot(vgs,Ids)
title('PMOS I-V Charchteristic');
grid on; grid minor; xlabel('Vgs = Vds'); ylabel('Ids');

IDS2 = -fliplr(Ids);

subplot(2,1,2);
plot(vgs,IDS2)
title('PMOS I-V Charchteristic - Flip and invert');
grid on; grid minor; xlabel('Vgs = Vds'); ylabel('Ids');

ip = interp1(vgs(20:end),IDS2(20:end),0:0.00001:1,'linear','extrap');
hold on;plot(0:0.00001:1,ip);

vgs = -1:0.1:2;
Ids = [-3.6012e-9
-2.2063e-9
-1.3098e-9
-749.1478e-12
-398.0729e-12
-198.2364e-12
-93.5992e-12
-41.6407e-12
-17.2811e-12
-6.5195e-12
0
43.2687e-12
824.9222e-12
15.0039e-9
246.6513e-9
3.1668e-6
26.5424e-6
108.0164e-6
238.7772e-6
388.3280e-6
544.3635e-6
703.3741e-6
864.0267e-6
1.0256e-3
1.1876e-3
1.3497e-3
1.5117e-3
1.6735e-3
1.8349e-3
1.9959e-3
2.1564e-3];

Ids = Ids';
plot(vgs,Ids)
title('NMOS I-V Charchteristic');
grid on; grid minor; xlabel('Vgs = Vds'); ylabel('Ids');

ip = interp1(vgs(20:end),Ids(20:end),0.6:0.00001:2,'linear','extrap');
hold on;plot(0.6:0.00001:2,ip);
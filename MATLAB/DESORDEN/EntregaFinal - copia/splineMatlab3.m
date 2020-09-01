AUX22=0;
AUX23=0;
AUX22=spline(linspace(0,10,length(theta1ns)),[0,theta1ns,0],linspace(0,10,600*length(theta1ns)))
AUX23=spline(linspace(0,10,length(theta2ns)),[0,theta2ns,0],linspace(0,10,600*length(theta2ns)))

ttheta1=timeseries(AUX22,linspace(1,30,length(AUX22)))
ttheta2=timeseries(AUX23,linspace(1,30,length(AUX23)))

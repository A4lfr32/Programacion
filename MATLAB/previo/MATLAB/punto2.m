t = linspace(-10,15,5001);
 
%Gráfica original tiempo continuo (3,1,1)
x = (((t+4)/3)).*heaviside(t+4)-(((t+1)/3)).*heaviside(t+1)-(((t-1)/3)).*heaviside(t-1)+(((t-4)/3)).*heaviside(t-4);

subplot(3,1,1)
plot(t,x, 'k', 'LineWidth',2)
title('x(t)=(((t+4)/3))*u(t+4)-(((t+1)/3))*u(t+1)-(((t-1)/3))*u(t-1)+(((t-4)/3))*u(t-4)');
xlabel('t');
axis([-5 5 -1 2])
 

%Gráfica original tiempo continuo (3,1,2)
x = 2*heaviside(t+6)+(2+(2/3)*(t+3)).*heaviside(t+3)-2*((2/3)*(t)).*heaviside(t)+(-2+(2/3)*(t-3)).*heaviside(t-3)-2*heaviside(t-6);

subplot(3,1,2)
plot(t,x, 'k', 'LineWidth',2)
title('x(t)=2*u(t+6)+(2+(2/3)*(t+3))*u(t+3)-2*((2/3)*(t))*u(t)+(-2+(2/3)*(t-3))*u(t-3)-2*u(t-6)');
xlabel('t');
axis([-7 7 -1 7])
 
%Gráfica original tiempo continuo (3,1,3)
x = (4-(t+2)).*heaviside(t+2)+(2*t).*heaviside(t)-(t-2+4).*heaviside(t-2);

subplot(3,1,3)
plot(t,x, 'k', 'LineWidth',2)
title('x(t)=(4-(t+2))*u(t+2)+(2*t)*u(t)-(t-2+4)*u(t-2)');
xlabel('t');
axis([-3 3 -1 5])
grid
 

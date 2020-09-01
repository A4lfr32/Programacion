t = linspace(-10,15,5001);
 
%Gráfica original tiempo continuo
x = 4*exp(-2*t).*heaviside(t);
subplot(3,2,1)
plot(t,x, 'k', 'LineWidth',3)
hold on;
title('x(t)');
xlabel('t');
axis([-3 3 -2 3])
grid
 
%Gráfica desplazada tiempo continuo
t1 = -(1/2)*t+4;
y = [sin(2*pi*t)+sin(pi*t)];
subplot(3,2,2)
plot(t,y, 'b', 'LineWidth',3)
hold on;
title('x(4-(1/2)t)');
xlabel('t');
axis([0 16 -2 3])
grid
 
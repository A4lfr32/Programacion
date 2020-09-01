t = linspace(-10,15,5001);
 
%Gráfica original tiempo continuo
x = 4*exp(-2*t).*heaviside(t);
subplot(2,2,1)
plot(t,x, 'k', 'LineWidth',3)
hold on;
title('x(t)');
xlabel('t');
axis([-3 3 -2 3])
grid
 
%Gráfica desplazada tiempo continuo
t1 = -(1/2)*t+4;
y = [sin(2*pi*t)+sin(pi*t)];
subplot(2,2,2)
plot(t,y, 'b', 'LineWidth',3)
hold on;
title('x(4-(1/2)t)');
xlabel('t');
axis([0 16 -2 3])
grid
 

%Gráfica tiempo discreto
n = -5:1:5;
z= ((-0.3).^n).*heaviside(-n);
z(6) = 2*z(6);
%z = [1 0 -1 2 0 1 -3 2 0 3 0];
subplot(2,2,3)
stem(n,z,'g', 'LineWidth', 3)
title('x[n]');
xlabel('n');
axis([-6 6 -4 4])
grid

%Gráfica tiempo discret
limsupe = 15;
zz = zeros(1,limsupe);
%z((((limsupe+1)/2)-4):(((limsuper+1)/2)+4)) = 4;
zz(4:12) = 2;
nn = -7:1:7;
subplot(2,2,4)
stem(nn,zz,'g', 'LineWidth', 3)
title('x[n]');
xlabel('n');
axis([-6 6 -4 4])
grid
t = linspace(-10,15,5001);

%Gráfica original tiempo continuo (2,2,1)
x = 4*exp(-2*t).*heaviside(t);

subplot(2,2,1)
plot(t,x, 'k', 'LineWidth',3)
title('x(t)=4*exp(-2*t).*heaviside(t)');
xlabel('t');
axis([-1 5 -1 4])
 

%Gráfica desplazada tiempo continuo (2,2,2)
y = sin(2*pi*t)+sin(pi*t);

subplot(2,2,2)
plot(t,y, 'b', 'LineWidth',3)
title('x(t)=sin(2*pi*t)+sin(pi*t)');
xlabel('t');
axis([0 2*pi -2 2])
 

%Gráfica tiempo discreto (2,2,3)
n = -15:1:15;

z= ((-0.3).^n).*heaviside(-n);
z(6) = 2*z(6);      %correcion heaviside * 2 (en heaviside(0)=0.5
subplot(2,2,3)
stem(n,z,'b', 'LineWidth', 3)
title('x[n]=((-0.3).^n).*heaviside(-n)');
xlabel('n');
axis([-6 2 -24 24])


%Gráfica tiempo discreto (2,2,4)
limsupe = 15;

zz = zeros(1,limsupe);      %vector de 0
zz(4:12) = 2;               %sobreescribo 2 desde -4 hasta 4
subplot(2,2,4)
stem(-7:7,zz,'g', 'LineWidth', 3)
title('x[n]=2 , |n|<5');
xlabel('n');
axis([-7 7 -1 3])
grid
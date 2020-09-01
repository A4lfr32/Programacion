function [y] = punto4(h, x,t)
clc
clear
close all

%t = linspace(-8,8,1001);

%x = 4*exp(-2*t).*heaviside(t); 
subplot(4,1,1)
plot(t,x, 'k', 'LineWidth',2)
hold on;
title('x(t)');
xlabel('t');
axis([-3 3 -2 3])
grid

%h = heaviside(t);
subplot(4,1,2)
plot(t,h, 'g', 'LineWidth',3)
hold on;
title('h(t)');
xlabel('t');
axis([-3 3 -2 3])
grid
   


matrizConv=zeros(length(t),2*length(t)-1);

subplot(2,1,2)
title('y(t)');
xlabel('t');
axis([-3 3 -2 3])

subplot(2,1,2)

y=zeros(1,2*length(t)-1); %inicio tamaño de vector
for i=1:length(t)           %relleno matriz de convolucion
    for j =1:length(t)
        matrizConv(i,j+i-1)=h(j); %almaceno el vector en fila i desplazado i a la derecha
    end
    
end
tt = linspace(min(t),max(t),length(y));  %tamaño del intervalo de la convolucion (mas grande)

for i=1:2*length(t)-1
    y(i)= dot(x,(matrizConv(:,i)')*(2*(max(t)-min(t))/(length(t))));    %obtener solucion punto a punto (para graficar punto apunto)
plot(tt,y, 'g', 'LineWidth',3)
hold on
plot(-t+i*(max(t)-min(t))/(2*length(t)-1)+min(t),h, 'k', 'LineWidth',3)     %comenzar desde el menor valor y moverse en porcentajes del intervalo
pause(0.000001)
hold off

end

grid
end

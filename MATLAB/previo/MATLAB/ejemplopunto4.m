t = linspace(-8,8,101);

x = 4*exp(-2*t).*heaviside(t);
x(51)=x(51)*2;

h = heaviside(t);
 


matrizConv=zeros(length(t),2*length(t)-1);

subplot(2,1,2)
title('y(t)');
xlabel('t');
axis([-3 3 -2 3])

subplot(1,1,1)

y=zeros(1,2*length(t)-1); %inicio tamaño de vector
for i=1:length(h)           %relleno matriz de convolucion
    for j =1:i
        matrizConv(j,i)=h(i); %almaceno el vector en fila i desplazado i a la derecha
    end
    
end
tt = linspace(min(t),max(t),length(y));  %tamaño del intervalo de la convolucion (mas grande)
%a = matrizConv

for i=1:2*length(t)-1
    y(i)= dot(x,(matrizConv(:,i)')*((max(tt)-min(tt))/(length(tt))));    %obtener solucion punto a punto (para graficar punto apunto)
plot(t,(matrizConv(:,i)')*((max(tt)-min(tt))/(length(tt))), 'g', 'LineWidth',3)
hold on
plot(tt,y, 'g', 'LineWidth',3)

plot(-t+i*(max(t)-min(t))/(2*length(t)-1)+min(t),h, 'k', 'LineWidth',3)     %comenzar desde el menor valor y moverse en porcentajes del intervalo
pause(0.000001)
hold off

end
%b=y
grid

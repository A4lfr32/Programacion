t = linspace(-10,15,5001);
 
%Gráfica original tiempo continuo (4,1,1)

x = funcion(t);  %utilizo FUNCTION para representar la funcion, para invertir en el tiempo evaluando en -t
subplot(4,1,1)
plot(t,x, 'k', 'LineWidth',3)
title('funcion(t)=x(t)=(t*u(t)-(t-1+1)*u(t-1)+(2-t)*u(t-1))*u(-t+2)');
xlabel('t');
axis([-1 3 -1 1])

xx = (funcion(t)+funcion(-t))/2; %formula funcion par()
subplot(4,2,3)
plot(t,xx, 'k', 'LineWidth',3)
title('x(t)=xx = (funcion(t)+funcion(-t))/2');
xlabel('t');
axis([-3 3 -1 1])
grid

xxx = (funcion(t)-funcion(-t))/2;  %formula impar()
subplot(4,2,4)
plot(t,xxx, 'k', 'LineWidth',3)
title('x(t)=(funcion(t)-funcion(-t))/2');
xlabel('t');
axis([-3 3 -1 1])
grid

n = -15:1:15;
z = funcion2(n); %utilizo FUNCTION para representar la funcion2, para invertir en el tiempo evaluando en -n
subplot(4,1,3)
stem(n,z,'g', 'LineWidth', 3)
title('funcion[n]=x[n]=exp(-n)*u(n)');
xlabel('n');
axis([-1 5 -1 1])
grid

z = (funcion2(n)+funcion2(-n))/2;  %formula par()
subplot(4,2,7)
stem(n,z,'g', 'LineWidth', 3)
title('x[n]=(funcion(n)+funcion(-n))/2');
xlabel('n');
axis([-5 5 -1 1])
grid


z = (funcion2(n)-funcion2(-n))/2; %formula impar()
subplot(4,2,8)
stem(n,z,'g', 'LineWidth', 3)
title('x[n]=(funcion2(n)-funcion2(-n))/2');
xlabel('n');
axis([-5 5 -1 1])
grid

function [xe] = funcion(dato)
 xe = (dato.*heaviside(dato)-(dato-1+1).*heaviside(dato-1)+(2-dato).*heaviside(dato-1)).*heaviside(-dato+2);
end

%%%%
function [xe] = funcion2(dato)

xe= exp(-dato).*heaviside(dato);

xe(16) = 2*xe(16); %correcion heaviside(0)=0.5//si n es de 15, el cero esta en 16
end

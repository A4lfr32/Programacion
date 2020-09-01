function [y] = punto444(h, x,t)
clc
clear
close all

t = linspace(-4,4,1001);

x = 4*exp(-2*t).*heaviside(t); 
subplot(4,1,1)
plot(t,x, 'k', 'LineWidth',2)
hold on;
title('x(t)=4*exp(-2*t).*heaviside(t)');
xlabel('t');
axis([-3 3 -2 3])
grid

h = heaviside(t)-heaviside(t-1);
subplot(4,1,2)
plot(t,h, 'g', 'LineWidth',3)
hold on;
title('x(t)=heaviside(t)-heaviside(t-1)');
xlabel('t');
axis([-3 3 -2 3])
grid
   


matrizConv=zeros(length(t),2*length(t)-1);
for i=1:length(t)
    for j =1:length(t)
        matrizConv(i,j+i-1)=h(j);
    end
    
end
 
subplot(2,1,2)
title('x(t)');
xlabel('t');
axis([-3 3 -2 3])

subplot(2,1,2)
y= x*matrizConv;
%y=conv(x,h);
t = linspace(-4,4,length(y));
plot(t,y, 'g', 'LineWidth',3)
grid

end

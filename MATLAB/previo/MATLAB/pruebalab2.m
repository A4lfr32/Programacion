t = linspace(-30,30,5001);

RangoFrecuencia=t;
count = 0;
xx= zeros(1,length(t));
x = heaviside(t+1)-heaviside(t-1);
for w=RangoFrecuencia
    count = count + 1;
    aux =x.*exp(-w*t*1i);
    xx(count) = trapz(t,aux);
end

subplot(2,1,1)
plot(RangoFrecuencia,x, 'k', 'LineWidth',2)
axis([-2 2 -2 2])

subplot(2,1,2)
plot(RangoFrecuencia,xx, 'k', 'LineWidth',2)
axis([-10 10 -2 2])

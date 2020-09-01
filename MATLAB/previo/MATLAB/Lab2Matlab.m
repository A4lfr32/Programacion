function [y] = lab2(x, t,filtro,wc)
clc
clear
close all


t = linspace(-20,20,5001);

wch = 1;
wcl = 5;

filtro = 0;

x = exp(-t).*heaviside(t);

switch filtro   %% el .*heaviside(t) es para evitar valores negativos en el filtro, pero si pongo negativo en vez de error sale heaviside(t)
    case 0
        %LPF
        h = heaviside(t+wcl)- heaviside(t-wcl);
    case 1
        %HPF
        h = heaviside(-t-wch)+heaviside(t-wch);
        
    case 2
        %BPF
        h = (heaviside(t+wcl)- heaviside(t-wcl))-(1-(heaviside(-t-wch)+heaviside(t-wch)));
end
%%
RangoFrecuencia=t;
count = 0;
xx= zeros(1,length(t));
%filtroh = heaviside(t+1)-heaviside(t-1);
for w=RangoFrecuencia
    count = count + 1;
    aux =x.*exp(-w*t*1i);
    xx(count) = trapz(t,aux);
end
%%

yy=h.*xx;


count = 0;
y= zeros(1,length(t));
%filtroh = heaviside(t+1)-heaviside(t-1);
for w=RangoFrecuencia
    count = count + 1;
    aux =yy.*exp(w*t*1i);
    y(count) = trapz(t,aux);
end

%% Gráficas
%x = 4*exp(-2*t).*heaviside(t);
subplot(4,1,1)
plot(t,x, 'k', 'LineWidth',2)

title('x(t)=4*exp(-2*t).*heaviside(t)');
xlabel('t');
axis([-3 3 -2 3])


subplot(4,1,2)
plot(RangoFrecuencia,xx, 'k', 'LineWidth',2)


subplot(4,1,3)
plot(RangoFrecuencia,yy, 'k', 'LineWidth',2)



subplot(4,1,4)
plot(t,y, 'k', 'LineWidth',2)


grid

end



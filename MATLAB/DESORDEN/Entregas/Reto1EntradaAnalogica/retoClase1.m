clc
clear all
close all
%%
%definicion de la planta de nivel EIA ante un proceso de identificación
num=0.5067;   %ganancia de la planta nivel EIA LA
den=[61.9554 1];%polo y coef.tiempo
ft=tf(num,den);%funcion de transferencia de la planta luego de identificar
ftlc=feedback(ft,1); %planta en lazo cerrado para evitar problemas de muestreo por inestabilidad

%%
%respuesta de la planta en tiempo y frecuencia
figure
bode(ftlc)%respuesta en frecuencia de la planta en LC
figure
step(ftlc)%respuesta ante una entrada de tipo posición
figure 
pzmap(ftlc)
%%
%criterios de muestreo

%criterio rápido
tsub=90.3%segundos, tiempo de subida extraido de la respuesta al escalón
Ts1=tsub/10 % 10 fotos antes del tiempo de subida


%ancho de banda
wc=0.0243;%frecuencia de corte en rad/s, extraida del diagrama bode
fc=wc/(2*pi);
%landau
finf1=6*fc %6 veces la frec. del ancho de banda en LC
Tinf1=1/finf1
fsup1=25*fc %25 veces la frec. del ancho de banda en LC
Tsup1=1/fsup1
%frec.corte
finf2=8*fc %8 veces la frecuencia de corte del sistema
Tinf2=1/finf2
fsup2=12*fc %12 veces la frecuencia de corte del sistema
Tsup2=1/fsup2
%tiempo establecimiento
tslc=189;

% criterio, entre 8 y 12 fotos antes de estabilizar
Tinf21 = tslc/12
Tsup21 = tslc/8


Tinf3=0.05*tslc %   5% del tiempo de establecimiento LC
Tsup3=0.15*tslc %   15% del tslc

%tau equivalente
polo=-0.0243; %encontrado interpretando la ft de primer orden y pzmap
teq=-1/polo; %hallar el tau equivalente de orden 1
Tinf4=0.2*teq %   20%de la constante de tao equivalente
Tsup4=0.6*teq%    60% de la constante de tao equivalente

%%
%filtro antialiasing
Ts=9; %segundos, dado que es un valor de intersección entre la mayoría de los intervalos arrojados por los criterios de selección
%además es un valor bajo que permite recopilar mayor información de la
%señal
Fs=1/Ts; %frecuencia de muestreo en Hz
faa=Fs/2 % frec.corte en Hz filtro antialiasing teniendo en cuenta el criterio de corte en la mitad de la frec.muestreo
faars=faa*2*pi  %frec. corte filtro en rad/seg
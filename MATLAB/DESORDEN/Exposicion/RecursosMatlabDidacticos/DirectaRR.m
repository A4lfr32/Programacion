function [x,y]=DirectaRR(Puntostheta1,Puntostheta2)

for i=1:length(Puntostheta1)
    subplot(1,2,1);
    [x(i),y(i)]=Robot3R(20,20,0,Puntostheta1(i),Puntostheta2(i),1);   
    title({'Trayectoria';'Espacio Cartesiano'})
    xlabel('Distancia x [adimensional]');
    ylabel('Distancia y [adimencional]');
    subplot(1,2,2);

    hold on
    plot(Puntostheta1(i),Puntostheta2(i),'.k')
    title({'Trayectoria';'Espacio Configuración'})
    xlabel('theta1 [rad]');
    ylabel('theta2 [rad]');
    axis([-pi,pi,0,2*pi])
end
end


% Programado por: Alfredo José Maussa Caballero.
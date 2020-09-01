function [x,y,r] = Robot3R(L12,L23,L34,alfa,beta,gama)
% Robot3R(L12,L23,L34,alfa,beta,gama) produce una animación 
% de un robot RRR con longitudes L12,L23, y L34 en sus brazos 
% respectivamente desde coordenada tierra al actuador
% alfa,beta, y gama angulos relativos ente brazos respectivamente.
% 
% [x,y,r] entrega valores cartesianos (x,y) y su ángulo r
clc


% alfa=alfa*pi/180;
% beta=beta*pi/180;
% gama=gama*pi/180;

t=1;
A=rotz(alfa*t)*[L12;0;0;0];
B=rotz((alfa+beta)*t)*([L23;0;0;0])+A;
C=rotz((alfa+beta+gama)*t)*([L34;0;0;0])+B;


h1=plot(0,0,'xb');
hold on
h2=plot([0,A(1)],[0,A(2)],'k');
h3=plot([A(1),B(1)],[A(2),B(2)],'k');
h4=plot([B(1),C(1)],[B(2),C(2)],'k');

h5=plot(A(1),A(2),'oR');
h6=plot(B(1),B(2),'oR');
h7=plot(C(1),C(2),'.R');

axis('equal')
axis(1.1*(L12+L23+L34)*[-1 1 -1 1])


h8=plot([0,C(1)],[0,C(2)],'--R');
% hold off
pause(0.000000001)
delete(h1);
delete(h2);
delete(h3);
delete(h4);
delete(h5);
delete(h6);
delete(h8);

x=C(1);
y=C(2);
r=(atan(y/x))*180/pi;
end


% Programado por: Alfredo José Maussa Caballero.
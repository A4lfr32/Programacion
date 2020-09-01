function [theta1,theta2,respuesta] = invRR(x,y,a,b,codo)
%la funcion invRR ingresa (x ,y, a, b, codo) 
% para asignar punto final: (x, y)
% para asignar la longitud de los brazos: (a,b)
% por ultimo se ingresa 1 si es codo antihorario respecto al radio
% o 0 si el codo es horario respecto al radio
% los angulos de salida son absolutos, son respecto a el eje x
% y se expresan en radianes

R2=x^2+y^2;
R=sqrt(R2);
C=a+b;

% if x>0
%     rho=atan(y/x);
% else
%     rho=atan(y/x)+pi;
% end

rho = atan2(y,x);

if R>C || R<(a-b)
   respuesta='no hay solución' 
elseif codo==1
%     teorema de coseno respectivo para theta1
    R_Ang_a=acos((R2+a^2-b^2)/(2*R*a));
    theta1=rho-R_Ang_a;
%     teorema de coseno respectivo para theta2
    a_Ang_b =  acos((a^2+b^2-R2)/(2*a*b));
    suple_a_Ang_b = pi-a_Ang_b;
    theta2= suple_a_Ang_b+theta1;
elseif codo ==0
%     teorema de coseno respectivo para theta1
    R_Ang_a=acos((R2+a^2-b^2)/(2*R*a));
    theta1=rho+R_Ang_a;
%     teorema de coseno respectivo para theta2 
    a_Ang_b =  acos((a^2+b^2-R2)/(2*a*b));
    suple_a_Ang_b = pi-a_Ang_b;
    theta2= -(suple_a_Ang_b-theta1);
end

if R<C &&  R>(a-b)

% matrices de transformacion

% translado y roto el eslabon P1
P1 = rotz(theta1)*transxyz(a,0,0)*[0,0,0,1]';
% translado y roto el eslabon P2
P2 = rotz(theta2)*transxyz(b,0,0)*[0,0,0,1]';

% monto el eslabon P2 en la punta del eslabon P1
P0=P1+P2;
plot([0,x],[0,y],'b--')
hold on
% dibujo desde (0,0) a las coordenadas (x,y) del eslabon P1
plot([0,P1(1)],[0,P1(2)],'k','LineWidth',2)

% dibujo desde eslabon P1(x,y) a las coordenadas (x,y) del eslabon P1
plot([P1(1),P0(1)],[P1(2),P0(2)],'r','LineWidth',2)
plot(P0(1),P0(2),'x','LineWidth',2)
hold off    
axis([-C,C,-C,C])

theta2=theta2-theta1;
respuesta=1;
end
end

% Programado por: Alfredo José Maussa Caballero.

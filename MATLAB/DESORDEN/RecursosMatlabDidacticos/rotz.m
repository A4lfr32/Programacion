function rotz = rotz(alfa)
% devuelve Matriz de rotación 4x4, para una rotación en el eje z con ángulo
% (alfa) de entrada expresado en radianes.
    rotz=[cos(alfa),-sin(alfa),0,0;sin(alfa),cos(alfa),0,0;0,0,1,0;0,0,0,1];
end

% Programado por: Alfredo José Maussa Caballero.
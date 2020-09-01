function transxyz = transxyz(x,y,z)
% devuelve Matriz de translación 4x4, para un movimiento (x,y,z) como
% entradas.
    transxyz=[1,0,0,x;0,1,0,y;0,0,1,z;0,0,0,1];
end

% Programado por: Alfredo José Maussa Caballero.
% clear all

% opcion para graficar
% 1, graficar segun spline de funcion de matlab
% 2, graficar segun spline cúbico propuesto, metodo matricial
% 3, graficar segun spline propuesto de orden 5, metodo matricial
opcion=3;

% run 'TrayectoriaCartesianaAarticulacion.mlx'


hold on



if opcion==1
run 'TrayectoriaSplineMatlab.mlx'
% Spline 3 funcion matlab
angulo1=stheta1;
angulo2=stheta2;
elseif opcion==2
    run 'spline3_theta1.mlx'
    run 'spline3_theta2.mlx'
% Spline 3 matricial
angulo1=Y1;
angulo2=Y2;
elseif opcion==3
    run 'spline5_theta1.mlx'
    run 'spline5_theta2.mlx'
% Spline 5 matricial
angulo1=s5_Y1;
angulo2=s5_Y2;

end
close all
figure('units','normalized','outerposition',[0 0 1 1])
subplot(1,2,1)
plot(PuntosC(1:2:end),PuntosC(2:2:end),'x')
hold on
DirectaRR(angulo1,angulo2)

% Programado por: Alfredo José Maussa Caballero.

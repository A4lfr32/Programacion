% Antes de ver este documento, es necesario leer el mupad "Furuta meotodo3"
% para saber de donde salieron las matrices

%PARA LA BARRA DE LA BASE
Lb=0.085         %LONGITUD(m)
Lbcm=0.085/2      %LONGITUD CENTRO DE MASA(m)
Mb=0.095          %MASA(Kg)
Bb=0.0015          %COEFICIENTE DE FRICCIÓN VISCOZA (N*m*s/rad)
Jb=5.7198e-05     %MOMENTO DE INERCIA (Kg*m^2)

%PARA EL PÉNDULO 
Lpcm=0.129/2      %LONGITUD(m) 
Mp=0.024          %MASA (Kg)
Bp=0.0005          %COEFICIENTE DE FRICCIÓN VISCOZA (N*m*s/rad)
Izz=3.3282e-05    %MOMENTO DE INERCIA (Kg*m^2)


% matrices encontradas al linealizar la dinamica del pendulo de furuta
% alrededor del punto de equilibrio x3 = 0
s=tf('s');
A=[0, 1, 0, 0;0, 4.110818532, -72.93609504, -2.401444468;0, 0, 0, 1;0, -4.159181103, -41.61759796, -1.370272844];
B=[0;-2740.545688;0;2772.787402];
C=[0 0 1 0];
D=0;

fur= ss(A,B,C,D);
step(fur)

% eig(A)   % Descomentar esta linea para ver los polos del sistema y
% verificar que es inestable
zita=0.707;
Tslc=5;

wn=4.6/(Tslc*zita);

polos=(wn^2/(s^2+2*zita*wn*s+wn^2));
pzmap(polos)

p=[-0.92 -10 -20 -21];
k=place(A,B,p)
 


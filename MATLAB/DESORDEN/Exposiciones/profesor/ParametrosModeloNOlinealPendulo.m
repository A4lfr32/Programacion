clear all
close all
clc
%% constantes del modelo de pendulo
Mp=0.024; %%Masa del pendulo rotativo en kg
Lcm=0.129/2; %logitud del pendulo en m
%Lp=0.156; %Distancia del pivote al centro de masa
Jp=Mp*(Lcm*2)^2/12; %Momento de inercia del pendulo respecto al centro de masa
Mb=0.095; % Masa brazo
Lb=0.085; %longitud desde el actuador hasa pendulo en m
%larm=0.0619; %Distancia del brazo rotativo al centro de masa
%Jr_cm=9.98*10^-4; %Momento de inercia del brazo alrededor de CM
Jb=Mb*Lb^2/12; %momento de inercia alrededor del pivote
betaP=0.0005; %coeficiente de amorti pendulo en Nms/rad
% betaP=0.000;
% betaR=0.000;
betaR=0.0015; %coficiente de amorti motor en Nms/rad
%Jm=3.90*10^-7; %inercia del motor en kg/m^2
g=9.8;

%Las constantes del motor 
% ng=0.9; %eficiencia de la reductora
Rm=8.4;
km=0.042;
%% Espacio de estado linealizado alrededor de 0 grados
% X=[x1 x2 x3 x4]'=[theta alfa thetap alfap]'
A=[0 0 1 0;
   0 0 0 1;
   0, -(Lb*Lcm^2*Mp^2*g)/(Jp*Mp*Lb^2 + Jb*Mp*Lcm^2 + Jb*Jp),-((Mp*Lcm^2 + Jp)*(km^2 + Rm*betaR))/(Rm*(Jp*Mp*Lb^2 + Jb*Mp*Lcm^2 + Jb*Jp)),(Lb*Lcm*Mp*betaP)/(Jp*Mp*Lb^2 + Jb*Mp*Lcm^2 + Jb*Jp);
   0,(Lcm*Mp*g*(Mp*Lb^2 + Jb))/(Jp*Mp*Lb^2 + Jb*Mp*Lcm^2 + Jb*Jp),(Lb*Lcm*Mp*(km^2 + Rm*betaR))/(Rm*(Jp*Mp*Lb^2 + Jb*Mp*Lcm^2 + Jb*Jp)),-(betaP*(Mp*Lb^2 + Jb))/(Jp*Mp*Lb^2 + Jb*Mp*Lcm^2 + Jb*Jp)]
B=[0;
    0;
    (km*(Mp*Lcm^2 + Jp))/(Rm*(Jp*Mp*Lb^2 + Jb*Mp*Lcm^2 + Jb*Jp));
    -(Lb*Lcm*Mp*km)/(Rm*(Jp*Mp*Lb^2 + Jb*Mp*Lcm^2 + Jb*Jp))]
C=[1 0 0 0;
   0 1 0 0];
D=[0;0];

% Se puede ver que el sistema es inestable, ya que se evaluo el sistema en
% el punto de equilibrio inestable
eig(A)% Debe tener polo inestables y un polo en el origen. Integración motor
%% Diseño de control por espacio de estados

%Evaluación de controlabilidad y observabilidad
Mc=[B A*B A^2*B A^3*B];
rank(Mc)

% Calculo con matrices equivalentes pero en FCC
Aeq=[0 1 0 0;0 0 1 0;0 0 0 1;0 238.2411487 261.6091074 -2.088556451];% Evaluando polos LA
Beq=[0;0;0;1];
Mceq=[Beq Aeq*Beq Aeq^2*Beq Aeq^3*Beq];
rank(Mceq)
P=Mc*inv(Mceq)% Matriz de transformación
% No me esta dando exactamente la misma matriz que en mupad
% Sistema controlable
%% Se va a diseñar control para la FCC
%Especificaciones de diseño
zita=0.7;wn=4;
Bd=[1 2*zita*wn wn^2]
Bdd=conv([1 wn*zita*10],conv([1 wn*11],Bd));
% Obtención de polinomio característico
pd=roots(Bdd)';
Keq=place(Aeq,Beq,pd);
Aast=Aeq-Beq*Keq;

K=Keq*inv(P);% FUncional con el signo contrario del alfa (Pendulo)
% O modificando signos de K=(k1 -k2 k3 -k4)
step(A-B*K,B,C,D)

%% Evaluación de ganancia DC
[num,den]=ss2tf(A-B*K,B,C,D);
salBra=tf(num(1,:),den);
salPen=tf(num(2,:),den);
kc=dcgain(salBra);

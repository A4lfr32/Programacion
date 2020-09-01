%Parámetros del pendulo
m = 0.024;
g = 9.81;
L = 0.129;
beta=0.0005;
alpha=0;
Lpcm=L/2;
I = 1*m*L^2/12;
%Matriz A con punto de equilibro en X1 = 0
Ao=[0 1;
    -m*g*Lpcm*cos(alpha)/I -beta/I];
alpha=pi();
eig(Ao)
%Matriz A con punto de equilibro en X1 = pi, que es inestable
Api = [0 1;
     -m*g*Lpcm*cos(alpha)/I -beta/I]
eig(Api)
B = [0;1/I]
C = [1 0];
%Se evalua controlabilidad
Mc = [B, Api*B];
rank(Mc);
%Defino los polos deseados
p=[-10 -55]
%Asignación de polos
K=place(Api,B,p)
Aast=Api-B*K;
D=0;
[num,den]=ss2tf(Aast,B,C,D);
Pendu = tf(num,den);
%pre=1/dcgain(Pendu)

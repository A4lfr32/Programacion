X = [1 2 3 4 5 6 7 8];
Y = [0 1 0 1 0 1 0 1];
[P,R,S] = lagrangepoly(X,Y);

xx = 0.5 : 0.01 : 8.5;
plot(xx,polyval(P,xx),X,Y,'or',R,S,'.b',xx,spline(X,Y,xx),'--g')
grid
axis([0.5 8.5 -5 5])
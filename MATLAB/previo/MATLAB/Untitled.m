figure
ax1 = subplot(2,1,1);
x = linspace(0,10,50);
y1 = sin(2*x);
plot(ax1,x,y1)
title(ax1,'Subplot 1')
ylabel(ax1,'Values from -1 to 1')
ax2 = subplot(2,1,2);
y2 = rand(50,1);
scatter(ax2,x,y2)
title(ax2,'Subplot 2')
ylabel(ax2,'Values from 0 to 1')
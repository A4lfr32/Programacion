hold off
plot(0,0);
hold on
axis([min(Ec) max(Ec) min(Ep) max(Ep)])
for i=1:length(Ec)
    plot(Ec(i),Ep(i),'.')
    pause(0.1);
    
end

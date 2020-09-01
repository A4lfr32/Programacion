t = linspace(-10,15,20);
x = 1:20;
h = heaviside(t);

matrizConv=zeros(length(t),2*length(t)-1);
for i=1:length(x)
    for j =1:i
        matrizConv(i-j+1,i)=h(j);
    end
end


for i=(length(x)+1):(2*length(x)-1)
    for j =1:(length(x)+1)-i
        matrizConv(j,i)=h(i-j+1);
    end
end

t = zeros(1,10);
x = 1:10;
h = 2:11;
hh=zeros(length(t),length(t));

for i=1:length(t)
    for j=1:i
        hh(i,j)=h(i-j+1);
    end
end

function [P,Y] = Track_function(n,i)

x=rand(n,1)*5;
y=rand(n,1)*5;


k = convhull(x,y);
P = [x(k),y(k)];
%Y = interppolygon(P,i,'pchip');
Y = 1;

end


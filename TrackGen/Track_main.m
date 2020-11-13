clc, clear

n = 10; %number of points
i = 100; %interpolation
[P,Y] = Track_function(n,i);

Y
P
%scatter(Xi,Yi)

%Path plotting---------
%hold on


plot(P(:,1),P(:,2), "-o", "color", "#ff9d12")
%hold off
%plot(Y(:,1),Y(:,2), "-o", "color", "#3b0aff")
%hold off
%plot(Xi(k),Yi(k), "o")

%hold off
%Path plotting--------

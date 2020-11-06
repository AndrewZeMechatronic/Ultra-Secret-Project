clc, clear

n = 15; %number of points

[P,x,y] = Track_function(n);


scatter(x,y,"magenta")

%Path plotting---------
hold on

plot(P(:,1),P(:,2), "-o", "color", "#ff9d12")
%plot(x(k),y(k), "-")

hold off
%Path plotting--------
;

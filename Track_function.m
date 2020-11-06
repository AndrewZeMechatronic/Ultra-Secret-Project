function [P,x,y] = Track_function(n)
    %Random scatter---------
x=rand(n,1)*5;
y=rand(n,1)*5;

%Random scatter---------

%Data matrix------------
k = convhull(x,y);
[m,n] = size(k);
%P = [x(k),y(k)]
P = zeros(m,3);
P = [x(k),y(k), P(:,3)];
%Data matrix-----------


%interpolation---------
dubinsSpace = stateSpaceDubins([0 25; 0 25; -pi pi]);
I = navPath(dubinsSpace);
append(I,P);
interpolate(I,500);
%interpolation---------

end


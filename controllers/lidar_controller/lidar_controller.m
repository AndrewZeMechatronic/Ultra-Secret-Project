function [direction, beta] = lidar_controller(vector_l, vector_r)
%inputs:  vector_l ... left vector
%         vector_r ... right_vector
%
% outputs: vectors_size ... size of vectors
%         beta ... angle of vectors resultant and zero direction
%                  + angles are for left
%                  - angles are for right
%    
% 
% for i = 1:(size(vector_l,1))
%     size_vector_l = sqrt(vector_l(i,1)^2 + vector_l(i,2)^2 + vector_l(i,3)^2);
%     size_vector_r = sqrt(vector_r(i,1)^2 + vector_r(i,2)^2 + vector_r(i,3)^2);
%     vectors_size(i,1) = sqrt(size_vector_l^2 + size_vector_r^2);
%     beta(i,1) = (acosd(size_vector_r/vectors_size(i,1))) - 45;
% end

direction = sqrt(vector_l^2 + vector_r^2);
beta = (acosd(vector_r/direction)) - 45;



end


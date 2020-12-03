function [direction, beta] = lidar_controller(vector_l, vector_r)


direction = sqrt(vector_l^2 + vector_r^2);
beta = (acosd(vector_r/direction)) - 45;



end


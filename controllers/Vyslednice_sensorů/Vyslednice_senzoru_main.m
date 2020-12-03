clc, clear


Sensor_Angle = 45;
n = 10;
%n = 1;
%S1 = zeros(n,2);
%S2 = zeros(n,2);
%V = zeros(n,2);
%An = zeros(n,1);


for i = 1:1:n
    
    Sensor_1 = rand;
    Sensor_2 = rand;
    
    [Value, Angle, Vector] = Sensor_Data_To_Control(Sensor_1,Sensor_2,Sensor_Angle);
    
    plotv([0;0])
    
    hold on
    plotv(Vector)
    axis([-10 10 0 10])

end

hold off
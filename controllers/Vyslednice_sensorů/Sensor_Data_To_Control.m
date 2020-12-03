function [Value, Angle, Vector] = Sensor_Data_To_Control(Sensor_1,Sensor_2,Sensor_Angle)
    
    Sensor_1 = Sensor_1*10;
    Sensor_2 = Sensor_2*10;
    
    S1(1,1) = cos(Sensor_Angle)*Sensor_1;
    S1(1,2) = cos(Sensor_Angle)*Sensor_1;
    
    S2(1,1) = cos(Sensor_Angle)*(-(Sensor_2));
    S2(1,2) = cos(Sensor_Angle)*Sensor_2;
    
    V = S1 + S2
    
    Vector = [V(1,1);V(1,2)];
    Value = sqrt(((V(1,1))^2)+((V(1,2))^2));
    Angle = asind(V(1,1)/Value);
end


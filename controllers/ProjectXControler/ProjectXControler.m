% MATLAB controller for Webots
% File:          ProjectXControler.m
% Date:
% Description:
% Author: Ondrej Richter, Jan Komorous
% Modifications:


desktop;

TIME_STEP = 8;


% Definovani leveho, praveho a stredniho sensoru
DstSensorL = wb_robot_get_device('DstSensorL');
DstSensorR = wb_robot_get_device('DstSensorR');
DstSensorSpeed = wb_robot_get_device('DstSensorSpeed');

% Zapnuti komunikace mezi sensory a kontrolerem
wb_distance_sensor_enable(DstSensorL, TIME_STEP);
wb_distance_sensor_enable(DstSensorR, TIME_STEP); 
wb_distance_sensor_enable(DstSensorSpeed, TIME_STEP);

% Definovani zatacecich motoru
RightSteer = wb_robot_get_device('RightSteer');
LeftSteer = wb_robot_get_device('LeftSteer');

% Centrovani prednich kol
wb_motor_set_position(RightSteer, 0);
wb_motor_set_position(LeftSteer, 0);

% Definovani motoru zadniho nahonu
LeftGas = wb_robot_get_device('LeftGasMotor');
RightGas = wb_robot_get_device('RightGasMotor');

% Nulovani a nastaveni nekonecneho rozsahu motoru zadniho nahonu
wb_motor_set_velocity(LeftGas, 0);
wb_motor_set_position(LeftGas, inf);
wb_motor_set_velocity(RightGas, 0);
wb_motor_set_position(RightGas, inf);

%camera = wb_robot_get_device('camera');
%wb_camera_enable(camera, TIME_STEP);

%gps = wb_robot_get_device('gps');
%wb_gps_enable(gps, TIME_STEP);

% Definovani promennych
Steer = 0;
Gas = 0;

% Hlavni Loop
while wb_robot_step(TIME_STEP) ~= -1
 
% Cteni dat z praveho a leveho sensoru
DstSensorL_Value = wb_distance_sensor_get_value(DstSensorL);
DstSensorR_Value = wb_distance_sensor_get_value(DstSensorR);

% Cteni dat z rychlostniho sensoru
DstSensorSpeed_Value = wb_distance_sensor_get_value(DstSensorSpeed);

% Vypocet vyslednice praveho a leveho sensoru
direction = sqrt(DstSensorL_Value^2 + DstSensorR_Value^2);
beta = (acos(DstSensorR_Value/direction)) - pi/4;
Steer = -beta;

% Prevod hodnot ze stredniho sensoru na rychlost formule
Gas = (20/2048)*DstSensorSpeed_Value
  
% Prirazeni namerenych a vypoctenych hodnot motorum pro ztaceni
wb_motor_set_position(RightSteer, Steer);
wb_motor_set_position(LeftSteer, Steer);

% Prirazeni namerenych a vypoctenych hodnot motorum pro zadni nahon
wb_motor_set_velocity(LeftGas, Gas);
wb_motor_set_velocity(RightGas, Gas);

end
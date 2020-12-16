% MATLAB controller for Webots
% File:          ProjectXControler.m
% Date:
% Description:
% Author:
% Modifications:

%left_motor = wb_robot_get_device('left wheel motor');
%right_motor = wb_robot_get_device('right wheel motor');
%wb_motor_set_position(left_motor, inf);
%wb_motor_set_position(right_motor, inf);
%wb_motor_set_velocity(left_motor, 0);
%wb_motor_set_velocity(right_motor, 0);

% uncomment the next two lines if you want to use
% MATLAB's desktop to interact with the controller:
desktop;
%keyboard;

TIME_STEP = 128;

wb_keyboard_enable(1);

DstSensorL = wb_robot_get_device('DstSensorL');
DstSensorR = wb_robot_get_device('DstSensorR');
wb_distance_sensor_enable(DstSensorL, TIME_STEP);
wb_distance_sensor_enable(DstSensorR, TIME_STEP); 

RightSteer = wb_robot_get_device('RightSteer');
wb_motor_set_position(RightSteer, 0);

LeftSteer = wb_robot_get_device('LeftSteer');
wb_motor_set_position(LeftSteer, 0);

LeftGas = wb_robot_get_device('LeftGasMotor');
wb_motor_set_velocity(LeftGas, 0);
wb_motor_set_position(LeftGas, inf);

RightGas = wb_robot_get_device('RightGasMotor');
wb_motor_set_velocity(RightGas, 0);
wb_motor_set_position(RightGas, inf);

%camera = wb_robot_get_device('camera');
%wb_camera_enable(camera, TIME_STEP);

%gps = wb_robot_get_device('gps');
%wb_gps_enable(gps, TIME_STEP);


%display = wb_robot_get_device('display');
%width = wb_display_get_width(display);
%height = wb_display_get_height(display);



%motors = wb_robot_get_device('rotational motor');
%wb_motor_set_position(motors, inf);
%wb_motor_set_velocity(motors, 0);

% main loop:
% perform simulation steps of TIME_STEP milliseconds
% and leave the loop when Webots signals the termination
%


Steer = 0;
Gas = 0;

while wb_robot_step(TIME_STEP) ~= -1
 
Key = wb_keyboard_get_key(); 



DstSensorL_Value = wb_distance_sensor_get_value(DstSensorL);
DstSensorR_Value = wb_distance_sensor_get_value(DstSensorR);
direction = sqrt(DstSensorL_Value^2 + DstSensorR_Value^2);
beta = (acos(DstSensorR_Value/direction)) - pi/4;
  Steer = -beta

  switch (Key)
    case WB_KEYBOARD_UP 
      Gas = Gas + 2;
    case WB_KEYBOARD_DOWN 
      Gas = Gas - 2;
  
  
  end
  
  % read the sensors, e.g.:
  %  rgb = wb_camera_get_image(camera);

  % Process here sensor data, images, etc.

  % send actuator commands, e.g.:
  %wb_motor_set_velocity(motor, 0);
  %wb_motor_set_velocity(motor2, 0);
  wb_motor_set_position(RightSteer, Steer);
  wb_motor_set_position(LeftSteer, Steer);
  
  wb_motor_set_velocity(LeftGas, Gas);
  wb_motor_set_velocity(RightGas, Gas);
  %DstSensorL
  % if your code plots some graphics, it needs to flushed like this:
  %drawnow;

end

% cleanup code goes here: write data to files, etc.

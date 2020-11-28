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

TIME_STEP = 64;

% get and enable devices, e.g.:
%  camera = wb_robot_get_device('camera');
%  wb_camera_enable(camera, TIME_STEP);
RightSteer = wb_robot_get_device('RightSteer');
wb_motor_set_position(RightSteer, 0);

LeftSteer = wb_robot_get_device('LeftSteer');
wb_motor_set_position(LeftSteer, 0);

LeftGas = wb_robot_get_device('LeftGasMotor');
wb_motor_set_velocity(LeftGas, 0);
wb_motor_set_position(LefttGas, inf);

RightGas = wb_robot_get_device('RightGasMotor');
wb_motor_set_velocity(RightGas, 0);
wb_motor_set_position(RightGas, inf);

Steer = 0;
Gas = 0;


wb_keyboard_enable(1)


%motors = wb_robot_get_device('rotational motor');
%wb_motor_set_position(motors, inf);
%wb_motor_set_velocity(motors, 0);

% main loop:
% perform simulation steps of TIME_STEP milliseconds
% and leave the loop when Webots signals the termination
%

while wb_robot_step(TIME_STEP) ~= -1
  
  Key = wb_keyboard_get_key();
  
  switch (Key)
    case WB_KEYBOARD_RIGHT
      Steer = Steer + 0.02;
    case WB_KEYBOARD_LEFT
      Steer = Steer - 0.02;
    case WB_KEYBOARD_UP
      Gas = Gas + 0.5;
    case WB_KEYBOARD_DOWN
      Gas = Gas - 0.5;
  end
  
  % read the sensors, e.g.:
  %  rgb = wb_camera_get_image(camera);

  % Process here sensor data, images, etc.

  % send actuator commands, e.g.:
  %wb_motor_set_velocity(motor, 0);
  %wb_motor_set_velocity(motor2, 0);
  wb_motor_set_position(RightSteer, Steer);
  wb_motor_set_position(LeftSteer, Steer);
  
  wb_motor_set_velocity(LeftGas, 5);
  wb_motor_set_velocity(RightGas, 5);
  % if your code plots some graphics, it needs to flushed like this:
  %drawnow;

end

% cleanup code goes here: write data to files, etc.

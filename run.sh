#!/bin/bash
xhost +local:root

docker run --rm -it --device=/dev/video0:/dev/video0 ros2-realsense:humble

ros2 launch realsense2_camera rs_launch.py enable_infra1:=true enable_infra2:=true enable_gyro:=true enable_accel:=true unite_imu_method:=1

ros2 launch realsense2_camera rs_launch_get_params_from_yaml.py config_file:="/ros2_ws/ROS2_realsensed435i/config.yaml" camera_namespace:=camera2 camera_name:=camera2

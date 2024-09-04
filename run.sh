#!/bin/bash
xhost +local:root

docker run --rm -it --device=/dev/video0:/dev/video0 ros2-realsense:humble

ros2 launch realsense2_camera rs_launch.py enable_infra1:=true enable_infra2:=true enable_gyro:=true enable_accel:=true unite_imu_method:=1

#!/bin/bash

docker run --name real2 -it --rm \
    --net=host \
    --device=/dev/bus/usb \
    --privileged \
    -v `pwd`:/ros2_ws/ROS2_realsensed435i:rw \
    ros2-realsense:humble

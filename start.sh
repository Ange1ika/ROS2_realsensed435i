#!/bin/bash

docker run --name real2 -it \
    --device=/dev/bus/usb \
    --privileged \
    ros2-realsense:humble

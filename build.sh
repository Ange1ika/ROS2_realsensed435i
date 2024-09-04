#!/bin/bash

xhost +local:root

docker build --no-cache -t ros2-realsense:humble .

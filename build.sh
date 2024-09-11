#!/bin/bash

xhost +local:root

sudo docker build --no-cache -t ros2-realsense:humble .

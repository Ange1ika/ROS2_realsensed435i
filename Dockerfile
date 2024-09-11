FROM ros:humble-perception

ENV WS_DIR="/ros2_ws"
WORKDIR ${WS_DIR}

SHELL ["/bin/bash", "-c"]

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install -y \
    build-essential \
    cmake \
    git-all \
    software-properties-common \
 && rm -rf /var/lib/apt/lists/*
 

# Установка lsusb для доступа к информации о USB-устройствах
RUN apt-get update && apt-get install -y usbutils && rm -rf /var/lib/apt/lists/*

RUN apt-get update \
 && apt-get install -y \
    ros-${ROS_DISTRO}-librealsense2* \
    ros-${ROS_DISTRO}-realsense2-* \
 && rm -rf /var/lib/apt/lists/*

RUN apt-get update \
 && apt-get install -y \
    ros-${ROS_DISTRO}-rviz2 \
    ros-${ROS_DISTRO}-rmw-cyclonedds-cpp \
    vim \
 && rm -rf /var/lib/apt/lists/*

ARG DEBIAN_FRONTEND=dialog

RUN mkdir -p /root/.dds/log
COPY entrypoint.sh /root
COPY cyclonedds_config.xml /root/cyclonedds_config.xml
ENTRYPOINT ["bash", "/root/entrypoint.sh"]


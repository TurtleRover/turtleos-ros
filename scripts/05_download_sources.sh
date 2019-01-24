#!/bin/bash
# Download ROS package sources

if [[ $EUID -ne 0 ]]; then
    echo "This script should be run as root"
    exit 1
fi

MNT='raspbian-sysroot'

PACKAGES=`cat packages`


cat << EOF | chroot $MNT

mkdir -p root/ros_ws
cd root/ros_ws

rosinstall_generator $PACKAGES --rosdistro kinetic --deps --wet-only --tar > turtle-kinetic.rosinstall
wstool init src
wstool merge turtle-kinetic.rosinstall -t src
wstool update -t src

EOF
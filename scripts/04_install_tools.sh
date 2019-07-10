#!/bin/bash
# Install ROS installation tools

if [[ $EUID -ne 0 ]]; then
    echo "This script should be run as root"
    exit 1
fi

MNT='raspbian-sysroot'

cat << EOF | chroot $MNT

apt-get install dirmngr

echo "deb http://packages.ros.org/ros/ubuntu stretch main" > /etc/apt/sources.list.d/ros-latest.list
apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

apt update
apt -y upgrade 

apt install -y python-rosdep python-rosinstall-generator python-wstool python-pip
EOF

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
apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

apt update
apt -y upgrade 

apt install -y python-rosdep python-rosinstall-generator python-wstool
EOF
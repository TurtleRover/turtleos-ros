#!/bin/bash

MNT='ros_ws/raspbian-sysroot'

echo "Installing ROS system dependencies"

# Copy QEMU ARM emulator binary
cp /usr/bin/qemu-arm-static ${MNT}/usr/bin/qemu-arm-static
if [[ $? != 0 ]]; then
    echo "Could not copy QEMU emulator binary"
    exit 1
else
    echo "Copied QEMU emulator binary"
fi

# Mount ROS package sources inside raspbian sysroot
mkdir -p ${MNT}/root/src
mount --bind ros_ws/src/ ${MNT}/root/src/
if [[ $? != 0 ]]; then
    echo "Failed to mount ROS package sources inside rasbian sysroot"
    exit 1
else
    echo "Mounted ROS package sources inside raspbian sysroot"
fi

# Install ROS packages dependencies
cat << EOF | chroot $MNT

apt-get install dirmngr

echo "deb http://packages.ros.org/ros/ubuntu stretch main" > /etc/apt/sources.list.d/ros-latest.list
apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

apt-get update
apt-get -y upgrade 

apt-get install -y python-rosdep

rosdep init
rosdep update

cd root
rosdep install -y --from-paths src --ignore-src --rosdistro kinetic -r --os=debian:stretch
EOF

# Unmount ROS package sources
umount ${MNT}/root/src
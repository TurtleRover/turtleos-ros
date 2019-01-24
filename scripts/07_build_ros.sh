#!/bin/bash
# Build ROS packages

MNT='raspbian-sysroot'

cat << EOF | chroot $MNT

cd root/ros_ws
./src/catkin/bin/catkin_make_isolated --install -DCMAKE_BUILD_TYPE=Release --install-space /opt/ros/kinetic -j 8

EOF

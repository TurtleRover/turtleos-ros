#!/bin/bash
# Installs ROS system dependencies

MNT='raspbian-sysroot'

cat << EOF | chroot $MNT

rosdep init
rosdep update

cd root/ros_ws
rosdep install -y --from-paths src --ignore-src --rosdistro kinetic -r --os=debian:stretch
apt install libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev # gscam dependencies

EOF

#!/bin/bash
# Download ROS package sources

echo "Downloading ROS packages"

mkdir -p ros_ws
cd ros_ws

rosinstall_generator ros_comm --rosdistro kinetic --deps --wet-only --tar > kinetic-ros_comm-wet.rosinstall
wstool init src kinetic-ros_comm-wet.rosinstall
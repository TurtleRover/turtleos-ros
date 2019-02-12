#!/bin/bash
# Deploy ROS workspace

MNT='raspbian-sysroot'
DATE=`date +%Y-%m-%d`

mkdir -p output
tar -cvpf output/${DATE}-ROS.tar -C ${MNT}/opt/ros/kinetic .

umount ${MNT}
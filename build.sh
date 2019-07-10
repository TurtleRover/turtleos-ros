#!/bin/bash -e

if [[ $EUID -ne 0 ]]; then
    echo "This script should be run as root"
    exit 1
fi

./scripts/00_download_raspbian.sh
./scripts/01_extend_raspbian.sh 5000
./scripts/02_mount_raspbian.sh
./scripts/03_copy_qemu.sh
./scripts/04_install_tools.sh
./scripts/05_download_sources.sh
./scripts/06_install_dependencies.sh
./scripts/07_build_ros.sh
./scripts/08_deploy_ros.sh

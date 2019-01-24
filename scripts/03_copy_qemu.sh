#!/bin/bash 

MNT='raspbian-sysroot'

# Copy QEMU ARM emulator binary
cp /usr/bin/qemu-arm-static ${MNT}/usr/bin/qemu-arm-static
if [[ $? != 0 ]]; then
    echo "Could not copy QEMU emulator binary"
    exit 1
else
    echo "Copied QEMU emulator binary"
fi

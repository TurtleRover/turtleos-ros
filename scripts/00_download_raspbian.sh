#!/bin/bash -e
# Downloads latest raspbian lite image

ZIP=raspbian_lite.zip
IMG=raspbian_lite.img
URL=http://downloads.raspberrypi.org/raspbian_lite/images/raspbian_lite-2019-04-09/2019-04-08-raspbian-stretch-lite.zip

echo "Downloading latest raspbian lite release"
mkdir -p image
wget $URL -O image/${ZIP}

echo "Extracting image"
unzip image/${ZIP} -d image/

FILE=`zipinfo -1 image/${ZIP}`
mv image/${FILE} image/${IMG}
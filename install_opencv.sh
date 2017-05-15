#!/bin/bash
#Usage: sudo ./install_opencv.sh 2.4.13

mkdir -p /tmp/ocv-tmp
curl -L https://github.com/Itseez/opencv/archive/$1.zip -o /tmp/ocv-tmp/ocv.zip
unzip /tmp/ocv-tmp/ocv.zip -d /tmp/ocv-tmp
mkdir /tmp/ocv-tmp/opencv-$1/release
cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=/usr/local \
      -D BUILD_PYTHON_SUPPORT=ON \
      -H/tmp/ocv-tmp/opencv-$1 -B/tmp/ocv-tmp/opencv-$1/release
make -C /tmp/ocv-tmp/opencv-$1/release -j8
cd /tmp/ocv-tmp/opencv-$1/release
make install
rm -rf /tmp/ocv-tmp

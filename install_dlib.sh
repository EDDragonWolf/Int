#!/bin/bash
#Usage: sudo ./install_dlib.sh 19.4

apt-get update
apt-get install -y \
    curl \
    cmake \
    libboost-all-dev \
    python-dev
    

mkdir -p /tmp/dlib-tmp
curl -L https://github.com/davisking/dlib/archive/v$1.tar.gz \
        -o /tmp/dlib-tmp/dlib.tar.bz2
tar xf /tmp/dlib-tmp/dlib.tar.bz2 -C /tmp/dlib-tmp/
mkdir /tmp/dlib-tmp/dlib-$1/python_examples/build
cmake -H/tmp/dlib-tmp/dlib-$1/python_examples/build/../../tools/python -B/tmp/dlib-tmp/dlib-$1/python_examples/build
cmake --build /tmp/dlib-tmp/dlib-$1/python_examples/build --config Release
cp /tmp/dlib-tmp/dlib-$1/python_examples/build/dlib.so /usr/local/lib/python2.7/dist-packages
rm -rf /tmp/dlib-tmp

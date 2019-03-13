#!/bin/bash
#Official site: https://ccache.samba.org/
#Based on post https://askubuntu.com/questions/470545/how-do-i-set-up-ccache
#Usage: sudo ./install_ccache

apt-get update
apt-get install -y ccache

# Update symlinks
/usr/sbin/update-ccache-symlinks

# Prepend ccache into the PATH
echo 'export PATH="/usr/lib/ccache:$PATH"' | tee -a ~/.bashrc

# Source bashrc to test the new PATH
source ~/.bashrc && echo $PATH

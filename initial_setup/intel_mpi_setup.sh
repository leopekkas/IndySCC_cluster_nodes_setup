#!/bin/bash

mkdir -p /apps

yum install dnf -y

tee > /tmp/oneAPI.repo << EOF
[oneAPI]
name=Intel® oneAPI repository
baseurl=https://yum.repos.intel.com/oneapi
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://yum.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB
EOF

sudo mv /tmp/oneAPI.repo /etc/yum.repos.d

# Install MPI into /apps
dnf install --installroot=/apps --releasever=/ intel-basekit -y
yum install intel-hpckit -y

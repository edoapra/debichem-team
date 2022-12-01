#!/usr/bin/env bash
sudo apt-get -q=2 install -y devscripts  debhelper dh-python coreutils pkg-config
arch5=$(uname -m|cut -c 1-5)
mpipkg=" mpi-default-bin mpi-default-dev "
if [[ "$arch5" == "armv7" ]]; then mpipkgs=" mpich libmpich-dev "; fi
sudo apt-get -q=2 install -y  gfortran git make  patch python3-dev cmake "$mpipkgs"

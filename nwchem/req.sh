#!/usr/bin/env bash
sudo apt-get -q=2 install -y devscripts  debhelper dh-python coreutils pkg-config
arch5=$(uname -m|cut -c 1-5)
mpipkgs=" mpi-default-bin mpi-default-dev mpich libmpich-dev "
#if [[ "$arch5" == "armv7" ]]; then mpipkgs+=" mpich libmpich-dev "; fi
sudo apt-get -q=2 install -y  gfortran git make  patch python3-dev cmake $mpipkgs
sudo update-alternatives --set mpi /usr/bin/mpicc.mpich
sudo update-alternatives --set mpirun  /usr/bin/mpirun.mpich
mpif90 -show
sed 's/openmpi/mpich/'  /usr/share/mpi-default-dev/debian_defaults > /tmp/new
cat /tmp/new
sudo mv /tmp/new /usr/share/mpi-default-dev/debian_defaults

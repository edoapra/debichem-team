#!/usr/bin/env bash
sudo apt-get -q=2 install -y devscripts  debhelper dh-python coreutils pkg-config
sudo apt-get -q=2 install -y mpi-default-bin mpi-default-dev gfortran git make  patch python3-dev
dpkg-query -L coreutils
which timeout
dpkg-query -S /usr/bin/timeout

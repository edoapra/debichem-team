#!/usr/bin/env bash
sudo apt-get -q=2 install -y devscripts  debhelper dh-python coreutils
sudo apt-get -q=2 install -y mpi-default-bin mpi-default-dev gfortran git make  patch python3-dev

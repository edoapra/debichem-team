#!/usr/bin/env bash
sudo apt -q=2 install -y devscripts  debhelper dh-python moreutils
sudo apt -q=2 install -y mpi-default-bin mpi-default-dev gfortran git make  patch python3-dev

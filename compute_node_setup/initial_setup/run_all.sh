#!/bin/bash

cd /tmp/initial_setup
./intel_mpi_setup.sh
./setup.sh
./users.sh

# The home directories are now mounted, and are on top of the local home directory. Let's re-cd into the directory to update...
cd ~cc/slurm_setup/

./01_users.sh
./02_munge.sh
./03_mariadb.sh
#./04_rpms.sh no need to install mariadb here(?)
./05_slurm_node.sh

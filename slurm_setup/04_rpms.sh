# Take the RPMs you built earlier and drop here, or change the cd below.
mkdir -p /home/cc/slurm_setup/rpms
cd /home/cc/slurm_setup/rpms

yum install perl openssl openssl-devel pam-devel rpm-build numactl numactl-devel hwloc hwloc-devel lua lua-devel readline-devel rrdtool-devel ncurses-devel man2html libibmad libibumad -y
wget https://download.schedmd.com/slurm/slurm-21.08-latest.tar.bz2

rpmbuild -ta slurm-21.08-latest.tar.bz2

yum --nogpgcheck localinstall slurm-* -y

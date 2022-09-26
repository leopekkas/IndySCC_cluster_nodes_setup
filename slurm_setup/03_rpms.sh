# Take the RPMs you built earlier and drop here, or change the cd below.
mkdir -p /home/cc/slurm_setup/rpms
cd /home/cc/slurm_setup/rpms

yum install openssl openssl-devel pam-devel rpm-build numactl numactl-devel hwloc hwloc-devel lua lua-devel readline-devel rrdtool-devel ncurses-devel man2html libibmad libibumad -y
wget https://download.schedmd.com/slurm/slurm-19.05.0.tar.bz2

rpmbuild -ta slurm-22.05.3.tar.bz2

yum --nogpgcheck localinstall slurm-* -y

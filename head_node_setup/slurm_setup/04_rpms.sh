# Take the RPMs you built earlier and drop here, or change the cd below.
mkdir -p /home/cc/slurm_setup/rpms
cd /home/cc/slurm_setup/rpms

yum install perl openssl openssl-devel pam-devel rpm-build numactl numactl-devel hwloc hwloc-devel lua lua-devel readline-devel rrdtool-devel ncurses-devel man2html libibmad libibumad mysql-devel -y
wget https://download.schedmd.com/slurm/slurm-22.05.3.tar.bz2

rpmbuild -ta slurm-22.05.3.tar.bz2

cd /root/rpmbuild/RPMS/x86_64/

yum --nogpgcheck localinstall slurm-* -y

echo "Please create the mysql database"

echo "Please change the host address for the master node in the 05 scripts, and in /etc/slurm/slurm.conf"

# Every node should have the same copy of slurm.conf. If you change it, be sure to copy it around
echo "AuthType=auth/munge
  DbdAddr=127.0.0.1
  DbdHost=login-node
  SlurmUser=slurm
  DebugLevel=4
  LogFile=/var/log/slurm/slurmdbd.log
  PidFile=/var/run/slurmdbd.pid
  StorageType=accounting_storage/mysql
  StorageHost=login-node
  StoragePass=some_pass
  StorageUser=slurm
  StorageLoc=slurm_acct_db" >> /etc/slurm/slurmdbd.conf

cp /home/cc/slurm_setup/slurm.conf /etc/slurm/

cp /home/cc/slurm_setup/cgroup.conf /etc/slurm/

mkdir /var/spool/slurmctld
chown slurm:slurm /var/spool/slurmctld
chmod 755 /var/spool/slurmctld
mkdir  /var/log/slurm
touch /var/log/slurm/slurmctld.log
touch /var/log/slurm/slurm_jobacct.log /var/log/slurm/slurm_jobcomp.log
chown -R slurm:slurm /var/log/slurm/

systemctl enable slurmd.service
systemctl start slurmd.service
systemctl status slurmd.service

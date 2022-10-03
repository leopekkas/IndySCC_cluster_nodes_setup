# Every node should have the same copy of slurm.conf. If you change it, be sure to copy it around
echo "AuthType=auth/munge
  DbdAddr=10.20.29.137
  DbdHost=revontuli-hpl-instance
  SlurmUser=slurm
  DebugLevel=4
  LogFile=/var/log/slurm/slurmdbd.log
  PidFile=/var/run/slurmdbd.pid
  StorageType=accounting_storage/mysql
  StorageHost=revontuli-hpl-instance
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

systemctl enable slurmctld.service
systemctl start slurmctld.service
systemctl status slurmctld.service

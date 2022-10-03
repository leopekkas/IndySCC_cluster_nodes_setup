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

cp /tmp/slurm_setup/slurm.conf /etc/slurm/

cp /tmp/slurm_setup/cgroup.conf /etc/slurm/

mkdir /var/spool/slurmd
chown slurm: /var/spool/slurmd
chmod 755 /var/spool/slurmd
mkdir /var/log/slurm/
touch /var/log/slurm/slurmd.log
chown -R slurm:slurm /var/log/slurm/slurmd.log


systemctl enable slurmd.service
systemctl start slurmd.service

# Every node should have the same copy of slurm.conf. If you change it, be sure to copy it around
echo "AuthType=auth/munge
  DbdAddr=192.168.1.250
  DbdHost=master0
  SlurmUser=slurm
  DebugLevel=4
  LogFile=/var/log/slurm/slurmdbd.log
  PidFile=/var/run/slurmdbd.pid
  StorageType=accounting_storage/mysql
  StorageHost=master0
  StoragePass=some_pass
  StorageUser=slurm
  StorageLoc=slurm_acct_db" >> /etc/slurm/slurmdbd.conf

cp /home/cc/slurm_setup/slurm.conf /etc/slurm/

cp /home/cc/slurm_setup/cgroup.conf /etc/slurm/

mkdir /var/spool/slurmd
chown slurm: /var/spool/slurmd
chmod 755 /var/spool/slurmd
mkdir /var/log/slurm/
touch /var/log/slurm/slurmd.log
chown -R slurm:slurm /var/log/slurm/slurmd.log


systemctl enable slurmd.service
systemctl start slurmd.service
systemctl status slurmd.service

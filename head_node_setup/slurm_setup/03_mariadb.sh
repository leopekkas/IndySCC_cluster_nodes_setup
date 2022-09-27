# Install mariadb

yum install mariadb-server -y
systemctl start mariadb
systemctl enable mariadb

mysql_secure_installation

echo "[mysqld]" >> /etc/my.cnf.d/innodb.cnf
echo " innodb_buffer_pool_size=1024M" >> /etc/my.cnf.d/innodb.cnf
echo " innodb_log_file_size=64M" >> /etc/my.cnf.d/innodb.cnf
echo " innodb_lock_wait_timeout=900" >> /etc/my.cnf.d/innodb.cnf

systemctl stop mariadb
mv /var/lib/mysql/ib_logfile? /tmp/
systemctl start mariadb

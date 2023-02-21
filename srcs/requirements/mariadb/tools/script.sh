#!/bin/bash
mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
service mysql start
sleep 1
mysql << EOF
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
CREATE USER IF NOT EXISTS '$MYSQL_ADMIN'@'%' IDENTIFIED BY '$MYSQL_ADMIN_PASS';
GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_ADMIN'@'%' WITH GRANT OPTION;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
FLUSH PRIVILEGES;
EOF
n=$(ps aux | grep mysql | awk '{print $2}' | wc -l)
while [ "$n" -gt "0" ] 
do 
      kill -9 $(ps aux | grep mysql | awk '{print $2}' | sed -n $n'p')
      n=$(( $n - 1 ))
done
sleep 1
mysqld_safe
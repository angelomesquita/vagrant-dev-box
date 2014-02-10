#!/bin/bash

echo '[Setup MySQL]'
#Enable MySQL remote access
sed -i -e 's/bind-address/#bind-address/g' /etc/mysql/my.cnf 
sed -i -e 's/skip-external-locking/#skip-external-locking/g' /etc/mysql/my.cnf

mysql --user=root --password=root --host=localhost --port=3306 < /vagrant/shell/mysql_bootstrap.sql

service mysql restart

#!/bin/bash

echo '[Prepare Mysql User/Password]'
debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password root'

echo '[Update Ubuntu Server]'
apt-get update

echo '[Prepare environment]'
apt-get install -y php5 php5-cli php5-xdebug php5-mysql phpunit php-apc php5-imagick 
apt-get install -y mysql-server curl imagemagick php5-dev php5-curl 
apt-get install -y libapache2-mod-php5 apache2 git-core build-essential

echo '[Setup vagrant folder]'
rm -rf /var/www
ln -fs /vagrant /var/www

path="/vagrant/shell"
sh $path"/apache.sh"
sh $path"/mysql.sh"
sh $path"/phpmyadmin.sh"
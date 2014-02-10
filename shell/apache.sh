#!/bin/bash

echo '[Setup Apache - VHOSTS]'

HOSTNAME=$(cat <<EOF
localhost
EOF
)
echo "${HOSTNAME}" > /etc/hostname

#hosts file
HOSTS=$(cat <<EOF
127.0.0.1	localhost
EOF
)
echo "${HOSTS}" > /etc/hosts

#vhosts
FILES="/vagrant/shell/vhosts/*"
for f in $FILES
do
	sh $f
done

a2enmod rewrite
service apache2 restart

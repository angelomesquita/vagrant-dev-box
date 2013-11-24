#!/bin/bash

echo '[Setup Apache - VHOSTS]'

HOSTNAME=$(cat <<EOF
localhost
EOF
)
echo "${HOSTNAME}" > /etc/hostname

# Setup hosts file
VHOST=$(cat <<EOF
<VirtualHost *:80>
	ServerAdmin angeloamesquita@gmail.com

	DocumentRoot /var/www
	<Directory />
		Options FollowSymLinks
		AllowOverride All
	</Directory>
	<Directory /var/www/>
		Options Indexes FollowSymLinks MultiViews
		AllowOverride All
		Order allow,deny
		allow from all
	</Directory>

	ScriptAlias /cgi-bin/ /usr/lib/cgi-bin/
	<Directory "/usr/lib/cgi-bin">
		AllowOverride All
		Options +ExecCGI -MultiViews +SymLinksIfOwnerMatch
		Order allow,deny
		Allow from all
	</Directory>

	ErrorLog ${APACHE_LOG_DIR}/error.log
	LogLevel warn

	CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOF
)
echo "${VHOST}" > /etc/apache2/sites-enabled/000-default

#example for zend framework project vhost
CHEQUES=$(cat <<EOF
<VirtualHost *:80>
   DocumentRoot "/vagrant/cheques/public"
   ServerName local.cheques
   ServerAlias local.cheques

   # This should be omitted in the production environment
   SetEnv APPLICATION_ENV development

   <Directory "/vagrant/cheques/public">
       Options Indexes MultiViews FollowSymLinks
       AllowOverride All
       Order allow,deny
       Allow from all
   </Directory>

</VirtualHost>
EOF
)
echo "${CHEQUES}" > /etc/apache2/sites-enabled/001-cheques

#file hosts
HOSTS=$(cat <<EOF
127.0.0.1	localhost
127.0.0.2	local.cheques


# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
EOF
)
echo "${HOSTS}" > /etc/hosts

a2enmod rewrite
service apache2 restart
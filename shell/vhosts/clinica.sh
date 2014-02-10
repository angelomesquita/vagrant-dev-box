#!/bin/bash

VHOST=$(cat <<EOF
<VirtualHost *:80>
    DocumentRoot "/vagrant/clinica/public"
    ServerName clinica-dev
    ServerAlias clinica-dev

    # This should be omitted in the production environment
    SetEnv APPLICATION_ENV development

    ErrorLog /var/log/apache2/error-clinica.log
    LogLevel warn

    <Directory "/vagrant/clinica/public">
        Options Indexes MultiViews FollowSymLinks
        AllowOverride All
        Order allow,deny
        Allow from all
    </Directory>

</VirtualHost>
EOF
)
echo "${VHOST}" > /etc/apache2/sites-enabled/001-clinica

HOSTS=$(cat <<EOF
127.0.0.1   clinica-dev
EOF
)
echo "${HOSTS}" >> /etc/hosts
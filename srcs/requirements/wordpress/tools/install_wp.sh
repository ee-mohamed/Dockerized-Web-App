#!/bin/bash

sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 0.0.0.0:9000/" /etc/php/7.3/fpm/pool.d/www.conf;

if [ ! -f "/var/www/html/.installed" ]; then
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
	chmod +x wp-cli.phar;
	mv wp-cli.phar /usr/local/bin/wp;
	wp core download --allow-root;
	wp config create --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASS} --dbhost=${DB_HOST} --allow-root
	wp core install --url=localhost --title=mel-hach --admin_user=${ADMIN} --admin_password=${ADMIN_PASS} --admin_email=${EMAIL} --allow-root
fi

exec php7.3-fpm --nodaemonize;
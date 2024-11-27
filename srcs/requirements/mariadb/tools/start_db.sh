#!/bin/bash

sed -i '/port/s/^#//' /etc/mysql/mariadb.conf.d/50-server.cnf;
mysqld_safe
if [ ! -f "/var/lib/mysql/.init" ]; then
	mysql < init_db.sql;
	touch .init;
fi
exec mysqld_safe --console;
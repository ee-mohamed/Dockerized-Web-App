#!/bin/bash

sed -i '/port/s/^#//' /etc/mysql/mariadb.conf.d/50-server.cnf;
sed -i 's/^\(bind-address\s*=\s*\).*$/\10.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf;
mysqld;
if [ ! -f "/var/lib/mysql/.init" ]; then
	mariadb < init_db.sql;
	touch .init;
fi
exec mysqld_safe --console;
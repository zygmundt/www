#!/bin/sh
# Uruchomienie MySQL
/usr/bin/mysql_install_db --user=mysql --basedir=/usr  --datadir=/var/lib/mysql
/usr/bin/mysqld_safe &
#Opóźnienie
sleep 10
 
# Uruchomienie Nginx
nginx -g "daemon off;"

#!/bin/bash
sed -i 's/127.0.0.1/0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf
chown -R mysql:mysql /var/lib/mysql /var/run/mysqld
usermod -d /var/lib/mysql/ mysql
service mysql start
mysql -uroot -e "CREATE DATABASE onepage ;"
mysql -uroot --database=onepage < /root/install.sql

rm -Rf /root/install.sql
mysql -uroot -e "use mysql;update user set host='%' where user='root' and host='localhost';flush privileges; " 
mysql -uroot -e "ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY '123456';" 
service mysql restart
/bin/bash
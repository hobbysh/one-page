#!/bin/bash
sleep 1
/etc/init.d/mysql start
/etc/init.d/php8.1-fpm start
/etc/init.d/nginx start

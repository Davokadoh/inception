#!/bin/sh

sleep 4

wp config create \
	--path="/var/www/html" \
	--dbname="sql_db" \
	--dbuser="sql_user" \
	--dbhost="mariadb.srcs_incNet:3306" \
	--dbpass="osddept" \
	--allow-root

wp core install \
	--path="/var/www/html" \
	--url="localhost" \
	--title="Nounours" \
	--admin_user="moreThanAModerator" \
	--admin_password="moreThanAWordToPass" \
	--admin_email="lerouxjoachim@gmail.com" \
	--allow-root

php-fpm81 -F

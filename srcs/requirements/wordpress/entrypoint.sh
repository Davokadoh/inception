#!/bin/sh

wp config create \
	--path="/var/www/html" \
	--dbname="${SQL_DB}" \
	--dbuser="${SQL_USER}" \
	--dbhost="mariadb.srcs_incNet" \
	--dbpass="${SQL_PASS}" \
	--allow-root

wp core install \
	--path="/var/www/html" \
	--url="localhost" \
	--title="Nounours" \
	--admin_user="moreThanAModerator" \
	--admin_password="moreThanAWordToPass" \
	--admin_email="lerouxjoachim@gmail.com" \
	--allow-root

exec php-fpm81 -F

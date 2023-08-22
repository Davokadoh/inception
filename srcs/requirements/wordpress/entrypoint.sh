#!/bin/sh

wp config create \
	--path="/var/www/html" \
	--dbname="${SQL_DB}" \
	--dbuser="${SQL_USER}" \
	--dbhost="mariadb.inception_default" \
	--dbpass="${SQL_PASS}" \
	--allow-root

wp core install \
	--path="/var/www/html" \
	--url="${WP_URL}" \
	--title="${WP_TITLE}" \
	--admin_user="${WP_ADMIN}" \
	--admin_password="${WP_ADMIN_PWD}" \
	--admin_email="${WP_EMAIL}" \
	--allow-root

wp user create \
	"${WP_DB_USER}" \
    "${WP_EMAIL_USER}" \
    --role="author" \
    --user_pass="${WP_DB_PWD}" \
	--allow-root

exec php-fpm81 -F

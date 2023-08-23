#!/bin/sh

wp config create \
  --path="/var/www/html" \
  --dbname="${SQL_DB}" \
  --dbuser="${SQL_USER}" \
  --dbpass="${SQL_PWD}" \
  --dbhost="${SQL_HOST}" \
  --allow-root

wp core install \
  --path="/var/www/html" \
  --url="https://${DOMAIN}" \
  --title="${DOMAIN}" \
  --admin_user="${WP_ADMIN_USER}" \
  --admin_password="${WP_ADMIN_PWD}" \
  --admin_email="${WP_ADMIN_EMAIL}" \
  --skip-email \
  --allow-root

wp user create \
  "$WP_USER" \
  "$WP_USER_EMAIL" \
  --role=editor \
  --user_pass="$WP_USER_PWD"

exec php-fpm81 -F

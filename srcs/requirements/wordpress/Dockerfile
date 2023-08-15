FROM alpine:3.17

RUN apk add --no-cache curl php php-cgi php-fpm php-cli php-phar php-curl php-mysqli mariadb-client httpie

COPY conf/www.conf /etc/php81/php-fpm.d/www.conf

RUN mkdir -p /var/www/html/wordpress
RUN chmod 755 /var/www/html/wordpress
WORKDIR /var/www/html/wordpress
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN wp core download --allow-root

RUN wp config create --allow-root \
      --dbname=sql_db \
      --dbuser=sql_user\
      --dbpass=osddept \
      --dbhost=mariadb:3306 \
      --path="/var/www/html/wordpress" \
      --skip-check

ENTRYPOINT ["php-fpm81", "-F"]

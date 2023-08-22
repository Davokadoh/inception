FROM alpine:3.17

RUN apk add --no-cache curl fcgi php php-cgi php-cli php-common php-curl php-fpm php-gd php-iconv php-mbstring php-mysqli php-openssl php-pdo php-pdo_mysql php-phar php-tokenizer php-zlib mariadb-client

COPY conf/www.conf /etc/php81/php-fpm.d/www.conf

RUN mkdir -p /var/www/html
RUN chmod 755 /var/www/html
WORKDIR /var/www/html
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN wp core download --allow-root

RUN adduser -D -H -u 1000 -s /bin/bash www-data -G www-data
RUN chown -R www-data:www-data /var/www/html
RUN chmod 755 /var/www/html

RUN mkdir /script
COPY entrypoint.sh /script
RUN chmod +x /script/entrypoint.sh

ENTRYPOINT ["/script/entrypoint.sh"]

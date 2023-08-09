FROM alpine:3.17

RUN apk add --no-cache curl php php-cgi php-fpm php-cli php-phar php-curl php-mysqli mariadb-client 

COPY conf/www.conf /etc/php81/php-fpm.d/www.conf

RUN mkdir -p /var/www/html/wordpress
WORKDIR /var/www/html/wordpress
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN wp core download --allow-root

#RUN mkdir -p /var/www/html && wget -q -O - "http://wordpress.org/latest.tar.gz" | tar -xzf - -C /var/www/html

RUN wp config create --allow-root \
      --dbname=$SQL_DB \
      --dbuser=$SQL_USER \
      --dbpass=$SQL_PASSWORD \
      --dbhost=mariadb:3306 \
      --path="/var/www/html/wordpress"

ENTRYPOINT ["php-fpm81", "-F"]

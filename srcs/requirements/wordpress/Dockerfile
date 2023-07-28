FROM debian:bookworm

RUN add-apt-repository ppa:tiagohillebrandt/wp-cli

RUN apt update && apt upgrade && apt install -y php-fpm wp-cli

RUN wget -O /tmp && dpkg

RUN wp core download \
	&& wp core config --dbname=<database_name> --dbuser=<database_user> --dbpass=<database_password> \
	&& wp core install --url=<site_url> --title=<site_title> --admin_user=<admin_username> --admin_password=<admin_password> --admin_email=<admin_email>

RUN mkdir /var/www && wget -q -O - "http://wordpress.org/latest.tar.gz" | tar -xzf - -C /var/www

ENTRYPOINT ["php-fpm", "-F"]

FROM debian:bookworm

RUN apt update && apt upgrade && apt install -y openssl nginx

COPY ./conf/nginx.conf /etc/nginx/

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes \
	-out /etc/nginx/ssl/inception.crt \
	-keyout /etc/nginx/ssl/inception.key \
	-subj "/C=CH/ST=Vaud/L=Lausanne/O=42/OU=42 Lausanne/CN=jleroux.42.ch/UID=jleroux" 

#RUN mkdir -p /var/www/html

#RUN chmod 755 /var/www/html

#RUN chown -R www-data:www-data /var/www/html

ENTRYPOINT ["nginx", "-g", "daemon off;"]

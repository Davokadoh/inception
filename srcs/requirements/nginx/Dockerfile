FROM alpine:3.17

RUN apk add --no-cache openssl nginx

COPY ./conf/default.conf /etc/nginx/http.d/default.conf
RUN sed -i "s/login/${LOGIN}/g" /etc/nginx/nginx.conf

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes \
	-out /etc/nginx/ssl/inception.crt \
	-keyout /etc/nginx/ssl/inception.key \
	-subj "/C=CH/ST=Vaud/L=Lausanne/O=42/OU=42 Lausanne/CN=${LOGIN}.42.ch/UID=${LOGIN}" 

RUN mkdir -p /var/www/html
RUN adduser -D -H -u 1000 -s /bin/bash www-data -G www-data
RUN chown -R www-data:www-data /var/www/html
RUN chmod 755 /var/www/html

ENTRYPOINT ["nginx", "-g", "daemon off;"]

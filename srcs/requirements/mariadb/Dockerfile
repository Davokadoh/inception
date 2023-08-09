FROM alpine:3.17

RUN apk add --no-cache mariadb

RUN mkdir data && mkdir -p /run/mysqld/ && chmod 777 /var/run/mysqld
COPY conf/server.cnf /etc/my.cnf.d/server.cnf
#COPY conf/init.sql /data/init.sql
RUN echo CREATE DATABASE ${SQL_DB}; \
GRANT ALL PRIVILEGES ON ${SQL_DB}.* TO '${SQL_USER}'@'wordpress' IDENTIFIED BY '${SQL_PASSWORD}'; \
FLUSH PRIVILEGES; > /data/init.sql

RUN mariadb-install-db \
      --user=mysql \
      --basedir=/usr \
      --datadir=/var/lib/mysql

ENTRYPOINT ["mariadbd", "-u", "mysql", "--init-file", "/data/init.sql"]

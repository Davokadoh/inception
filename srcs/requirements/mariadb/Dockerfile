FROM alpine:3.17

RUN apk add --no-cache mariadb

RUN mkdir data && mkdir -p /run/mysqld/ \
&& chown -R mysql:mysql /var/run/mysqld \
&& chmod 777 /var/run/mysqld

COPY conf/my.cnf /etc/mysql/my.cnf
COPY conf/init.sql /data/init.sql

RUN mariadb-install-db \
      --user=mysql \
      --basedir=/usr \
      --datadir=/var/lib/mysql

ENTRYPOINT ["mariadbd", "-u", "mysql", "--init-file", "/data/init.sql"]

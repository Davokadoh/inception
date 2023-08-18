FROM alpine:3.17

RUN apk add --no-cache mariadb

RUN mkdir data && mkdir -p /run/mysqld/ \
&& chown -R mysql:mysql /var/run/mysqld \
&& chmod 777 /var/run/mysqld

COPY conf/my.cnf /etc/mysql/my.cnf

COPY conf/init.sql /data/init.sql

ARG SQL_DB
ARG SQL_USER
ARG SQL_PASS

RUN sed -i "s/sql_db/${SQL_DB}/g" /data/init.sql
RUN sed -i "s/sql_user/${SQL_USER}/g" /data/init.sql
RUN sed -i "s/sql_pass/${SQL_PASS}/g" /data/init.sql

RUN mariadb-install-db \
      --user=mysql \
      --basedir=/usr \
      --datadir=/var/lib/mysql

ENTRYPOINT ["mariadbd", "-u", "mysql", "--init-file", "/data/init.sql"]

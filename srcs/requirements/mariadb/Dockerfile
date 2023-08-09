FROM alpine:3.17

RUN apk add --no-cache mariadb

RUN mariadb-install-db \
      --user=mysql \
      --basedir=/usr \
      --datadir=/var/lib/mysql

ENTRYPOINT ["mariadbd", "-u", "mysql"]

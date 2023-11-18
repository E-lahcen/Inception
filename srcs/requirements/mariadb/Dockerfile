FROM alpine:3.16

RUN	apk update && apk upgrade && apk add --no-cache \
        mariadb \
        mariadb-client
        
COPY requirements/mariadb/conf/create_db.sh /tmp/configure.sh

EXPOSE 3306

CMD ["sh", "/tmp/configure.sh"]
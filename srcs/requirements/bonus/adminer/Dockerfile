FROM alpine:3.16

ARG V_PHP=8

RUN apk update && apk upgrade && apk add --no-cache \
    php${V_PHP} \
    php${V_PHP}-common \
    php${V_PHP}-session \
    php${V_PHP}-iconv \
    php${V_PHP}-gd \
    php${V_PHP}-curl \
    php${V_PHP}-xml \
    php${V_PHP}-mysqli \
    php${V_PHP}-imap \
    php${V_PHP}-cgi \
    php${V_PHP}-pdo \
    php${V_PHP}-pdo_mysql \
    php${V_PHP}-soap \
    php${V_PHP}-posix \
    php${V_PHP}-gettext \
    php${V_PHP}-ldap \
    php${V_PHP}-ctype \
    php${V_PHP}-dom \
    php${V_PHP}-simplexml \
    wget

WORKDIR /var/www

RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php && \
    mv adminer-4.8.1.php index.php && chown -R root:root /var/www/

EXPOSE 8080

CMD	[ "php", "-S", "[::]:8080", "-t", "/var/www" ] #Start built-in web Server on the local address and port 8080 and specify root document to be used

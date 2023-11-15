FROM alpine:3.16
ARG V_PHP=8 \
    DB_NAME \
    USER_DB \
    PASS_DB
RUN apk update && apk upgrade && apk add --no-cache \
    php${V_PHP} \
    php${V_PHP}-fpm \
    php${V_PHP}-mysqli \
    php${V_PHP}-json \
    php${V_PHP}-curl \
    php${V_PHP}-dom \
    php${V_PHP}-exif \
    php${V_PHP}-fileinfo \
    php${V_PHP}-mbstring \
    php${V_PHP}-openssl \
    php${V_PHP}-xml \
    php${V_PHP}-zip \
    php${V_PHP}-redis \
    wget \
    unzip && \
    sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" \
      /etc/php8/php-fpm.d/www.conf && \
    sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" \
      /etc/php8/php-fpm.d/www.conf && \
    sed -i "s|;listen.group = nobody|listen.group = nobody|g" \
      /etc/php8/php-fpm.d/www.conf && \
    rm -f /var/cache/apk/*
WORKDIR /var/www
RUN wget https://wordpress.org/latest.zip && \
    unzip latest.zip && \
    cp -rf wordpress/* . && \
    rm -rf wordpress latest.zip
COPY ./requirements/wordpress/conf/wp-config-create.sh .
RUN sh wp-config-create.sh && rm wp-config-create.sh && \
    chmod -R 0777 wp-content/
CMD ["/usr/sbin/php-fpm8", "-F"]

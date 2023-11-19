FROM alpine:3.16

ARG V_PHP=8

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
    php${V_PHP}-phar \
    wget \
    curl \
    unzip && \
    sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" \
      /etc/php${V_PHP}/php-fpm.d/www.conf && \
    sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" \
      /etc/php${V_PHP}/php-fpm.d/www.conf && \
    sed -i "s|;listen.group = nobody|listen.group = nobody|g" \
      /etc/php${V_PHP}/php-fpm.d/www.conf && \
    rm -f /var/cache/apk/*
WORKDIR /var/www
RUN wget https://wordpress.org/latest.zip && \
    unzip latest.zip && \
    cp -rf wordpress/* . && \
    rm -rf wordpress latest.zip

# RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
#     chmod +x wp-cli.phar && \
#     mv wp-cli.phar /usr/local/bin/wp
    
COPY ./requirements/wordpress/conf/wp-config-create.sh .
RUN chmod -R 0777 wp-content/
    
CMD ["sh", "wp-config-create.sh"]

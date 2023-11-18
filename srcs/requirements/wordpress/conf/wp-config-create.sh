#!bin/sh
if [ ! -f "/var/www/wp-config.php" ]; then
cat << EOF > /var/www/wp-config.php
<?php
define( 'DB_NAME', '${DB_NAME}' );
define( 'DB_USER', '${USER_DB}' );
define( 'DB_PASSWORD', '${PASS_DB}' );
define( 'DB_HOST', 'mariadb' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );
define('FS_METHOD','direct');
\$table_prefix = 'wp_';
define( 'WP_DEBUG', false );
if ( ! defined( 'ABSPATH' ) ) {
define( 'ABSPATH', __DIR__ . '/' );}
define( 'WP_REDIS_HOST', 'redis' );
define( 'WP_REDIS_PORT', 6379 );
define( 'WP_REDIS_TIMEOUT', 1 );
define( 'WP_REDIS_READ_TIMEOUT', 1 );
define( 'WP_REDIS_DATABASE', 0 );
require_once ABSPATH . 'wp-settings.php';
EOF
fi

wget -O /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x /usr/local/bin/wp
mkdir test-test
# mkdir -p /run/php

# chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

# echo "Wordpress Download"

# wp core download --allow-root

# echo "Wordpress Create Config"

# wp config create --dbhost=${HOST} --dbname=${DB_NAME} --dbuser=${USER_DB} --dbpass=${PASS_DB} --allow-root

echo "Wordpress Install"

wp core install --url=localhost --title=Inception --admin_user=lelhlami --admin_password=lelhlami --admin_email=lelhlami@student.1337.ma --allow-root

echo "Wordpress Create User"

wp user create  lelhlami2 lelhlami2@student.1337.ma --user_pass=lelhlami2 --role=subscriber --allow-root

exec "$@"

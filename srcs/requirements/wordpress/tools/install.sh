#!/bin/sh
sleep 20
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/bin/wp-cli
cd /wordpress
runuser -u www-data -- wp-cli core install --url=$WORDPRESS_DOMAIN --title=$WORDPRESS_TITLE --admin_user=$WORDPRESS_DB_USER --admin_password=$WORDPRESS_DB_PASSWORD --admin_email=$WORDPRESS_EMAIL --path='/wordpress'
runuser -u www-data -- wp-cli plugin install redis-cache --activate --path='/wordpress'
runuser -u www-data -- wp-cli plugin update --all --path='/wordpress'
runuser -u www-data -- wp-cli redis enable --path='/wordpress'
runuser -u www-data -- wp-cli user create $WORDPRESS_DB_USER $WORDPRESS_EMAIL --role=author --user_pass=$WORDPRESS_DB_PASSWORD --path='/wordpress'
runuser -u www-data -- wp-cli theme install twentyseventeen --activate --path='/wordpress'
/usr/sbin/php-fpm7.3 -F -R
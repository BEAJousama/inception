FROM debian:buster
RUN apt-get update && apt-get install wget php-fpm php-mysql curl -y;\
    userdel www-data && groupadd -g 33 www-data && useradd -u 33 -g www-data www-data ;\
    wget http://wordpress.org/latest.tar.gz ;\
    tar xfz latest.tar.gz ;\
    rm -rf latest.tar.gz wordpress/wp-config.php ;\
    chown -R www-data:www-data /wordpress ;\
    mkdir -p /run/php/ ;\
    chown -R www-data:www-data /wordpress
COPY config/www.conf /etc/php/7.3/fpm/pool.d/
COPY config/wp-config.php /wordpress/wp-config.php
COPY tools/install.sh /tmp/install.sh
EXPOSE 9000
RUN chmod +x /tmp/install.sh
ENTRYPOINT ["/tmp/install.sh"]
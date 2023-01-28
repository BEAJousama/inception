FROM debian:buster
RUN apt-get update && apt-get install adminer apache2 apache2-utils php php-curl libapache2-mod-php php-cli php-mysql php-gd  -y
COPY config/000-default.conf /etc/apache2/sites-enabled/000-default.conf
COPY config/ports.conf /etc/apache2/ports.conf
COPY config/apache2.conf /etc/apache2/apache2.conf
RUN rm -rf /var/www/html/index.html
RUN cp /usr/share/adminer/adminer.php /var/www/html/index.php
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
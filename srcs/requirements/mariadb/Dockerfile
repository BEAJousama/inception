FROM debian:buster

RUN apt-get update && apt-get install procps -y
RUN apt-get install -y mariadb-server mariadb-client
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools /var/www/
RUN chmod +x /var/www/script.sh
EXPOSE 3306
ENTRYPOINT sh /var/www/script.sh

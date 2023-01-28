FROM debian:buster
RUN apt-get update
RUN apt-get install nginx openssl -y
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=127.0.0.1"
RUN openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048
COPY conf/self-signed.conf /etc/nginx/snippets/self-signed.conf
COPY conf/ssl-params.conf /etc/nginx/snippets/ssl-params.conf
COPY conf/nginx.conf /etc/nginx/nginx.conf
CMD ["nginx", "-g", "daemon off;"]
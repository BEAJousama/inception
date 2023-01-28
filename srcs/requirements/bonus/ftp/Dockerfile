FROM debian:buster
RUN apt-get update && apt-get install vsftpd -y
RUN mkdir -p /var/ftp/pub
RUN mkdir -p /var/run/vsftpd/empty
COPY config/vsftpd.conf /etc/vsftpd.conf
CMD /usr/sbin/vsftpd /etc/vsftpd.conf

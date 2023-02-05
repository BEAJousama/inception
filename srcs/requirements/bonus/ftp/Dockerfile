FROM debian:buster
RUN apt-get update && apt-get install -y vsftpd
COPY ./tools/startup.sh /tmp/startup.sh
RUN chmod +x /tmp/startup.sh
EXPOSE 21
ENTRYPOINT ["sh","/tmp/startup.sh" ]
FROM debian:buster
RUN apt-get update && apt-get install redis-server -y
COPY config/redis.conf /etc/redis/redis.conf
EXPOSE 6379
CMD ["redis-server", "--protected-mode", "no"]
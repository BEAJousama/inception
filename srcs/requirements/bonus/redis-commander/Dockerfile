FROM debian:buster
RUN apt-get update && apt-get install curl sudo -y 
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash - && apt-get install nodejs
RUN npm install -g redis-commander
COPY config/local-development.json /usr/lib/node_modules/redis-commander/config/local-development.json
CMD redis-commander
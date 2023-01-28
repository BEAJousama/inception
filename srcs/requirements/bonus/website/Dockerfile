FROM debian:buster
RUN apt-get update && apt-get install curl sudo -y 
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash - && apt-get install nodejs
COPY . /app
WORKDIR /app
RUN npm install
CMD node app.js


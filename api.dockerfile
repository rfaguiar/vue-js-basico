FROM node:9.7.1
MAINTAINER Rogerio Aguiar
COPY ./api/ /var/www/api
WORKDIR /var/www/api
RUN npm install
ENTRYPOINT npm start
EXPOSE 8180
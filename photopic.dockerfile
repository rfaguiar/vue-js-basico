FROM node:9.7.1
MAINTAINER Rogerio Aguiar
COPY ./server/ /var/www/photopic
WORKDIR /var/www/photopic
RUN npm install
ENTRYPOINT npm start
ENV NODE_ENV=production
EXPOSE 8080
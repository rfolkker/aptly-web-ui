FROM debian:stretch

RUN apt-get update && \
apt-get install npm -y && \
apt-get clean

ARG  aptly_host=http://localhost:8080
ENV APTLY_WEB_UI_PROXY_API_URL=$aptly_host
ENV APTLY_WEB_UI_PORT=8081
EXPOSE 8081

ADD aptly-web-ui.tar.gz ./
tar –xvzf ./aptly-web-ui.tar.gz
npm start

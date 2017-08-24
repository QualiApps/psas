# psas

FROM alpine

MAINTAINER Yury Kavaliou <yury_kavaliou@epam.com>

ENV NGINX_WWW /usr/share/nginx/html

RUN apk add --update \
    python \
    python-dev \
    build-base \
    linux-headers \
    pcre-dev \
    py-pip \
    supervisor \
    nginx

RUN pip install --upgrade pip
RUN pip install uwsgi flask

RUN mkdir ${NGINX_WWW}/logs
RUN mkdir ${NGINX_WWW}/app
RUN mkdir /var/log/uwsgi

COPY ./files/nginx.conf /etc/nginx/nginx.conf
COPY ./files/nginx-psas.conf /etc/nginx/conf.d/
COPY ./files/supervisord.conf /etc/supervisord.conf

COPY ./files/app ${NGINX_WWW}/app

WORKDIR ${NGINX_WWW}/app

EXPOSE 80

CMD ["/usr/bin/supervisord"]
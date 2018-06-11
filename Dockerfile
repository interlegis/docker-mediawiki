FROM alpine:3.6

MAINTAINER Matheus Garcia <garcia.figueiredo@gmail.com>

ENV WIKI_GITHUB=https://github.com/interlegis/mediawiki.git \
    WIKI_DATA=/var/www/localhost/htdocs/images \
    WIKI_REVERSEPROXY=false \
    WIKI_SSLPROXY=false \
    WIKI_VERSION=1.31.0-0

EXPOSE 80

VOLUME ["/var/www/localhost/htdocs/images"]

RUN apk update \
 && apk add --no-cache \
                       icu-libs \
                       dcron \
                       git \
                       apache2 \
                       php7 \
                       php7-apache2 \
                       php7-iconv \
                       php7-mysqli \
                       php7-session \
                       php7-json \
                       php7-xml \
                       php7-curl \
                       php7-zip \
                       php7-zlib \
                       php7-gd \
                       php7-dom \
                       php7-xmlreader \
                       php7-mbstring \
                       php7-openssl \
                       php7-xmlrpc \
                       php7-soap \
                       php7-intl \
                       php7-opcache \
                       php7-tokenizer \
                       php7-simplexml \
                       php7-ctype

ENV LC_ALL pt_BR.UTF-8
ENV LANG pt_BR.UTF-8

RUN cd /tmp \
 && git clone ${WIKI_GITHUB} --depth=1 --branch ${WIKI_VERSION} \
 && cd /tmp/mediawiki \
 && git submodule update --init \
 && cd /tmp \
 && mv /tmp/mediawiki/* /var/www/localhost/htdocs \
 && chown apache:apache -R /var/www/localhost/htdocs \
 && mkdir /run/apache2

RUN ln -sf /proc/self/fd/1 /var/log/apache2/access.log \
 && ln -sf /proc/self/fd/1 /var/log/apache2/error.log

COPY LocalSettings.php /var/www/localhost/htdocs/LocalSettings.php
COPY wiki.png /var/www/localhost/htdocs/resources/assets/wiki.png
COPY run.sh /opt/apache2/run.sh

CMD ["/opt/apache2/run.sh"]


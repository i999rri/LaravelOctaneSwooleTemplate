FROM php:8.2.7-cli-alpine3.18

COPY --from=composer:2.6.5 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www

RUN rm -rf ./html && \
    apk add build-base autoconf postgresql-dev curl-dev && \
    pecl install --configureoptions 'enable-sockets="no" enable-openssl="yes" enable-http2="yes" enable-mysqlnd="yes" enable-hook-curl="yes" enable-cares="yes" with-postgres="yes"' openswoole && \
    docker-php-ext-install pcntl && \
    docker-php-ext-enable openswoole.so && \
    docker-php-ext-enable pcntl


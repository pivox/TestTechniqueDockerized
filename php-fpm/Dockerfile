FROM php:fpm-alpine
RUN set -ex \
  && apk --no-cache add \
    postgresql-dev 
RUN docker-php-ext-install pdo_pgsql 
COPY --from=composer /usr/bin/composer /usr/bin/composer
USER www-data:www-data
WORKDIR /var/www
CMD composer install ; vendor/bin/simple-phpunit ; php-fpm
EXPOSE 9000
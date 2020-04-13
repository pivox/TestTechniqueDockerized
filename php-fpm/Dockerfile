FROM php:fpm-alpine
RUN set -ex \
  && apk --no-cache add \
    postgresql-dev 
RUN docker-php-ext-install pdo pdo_pgsql 
COPY --from=composer /usr/bin/composer /usr/bin/composer
WORKDIR /var/www
CMD composer install ;  php-fpm 
EXPOSE 9000
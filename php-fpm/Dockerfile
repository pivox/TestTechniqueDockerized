FROM php:7.4-fpm-alpine
RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted gnu-libiconv \
      && apk add --no-cache --update --virtual .build-deps \
        autoconf \
        g++ \
        make \
      && pecl install xdebug-2.9.5 \
      && apk --no-cache add \
      postgresql-dev \
      && docker-php-ext-install pdo_pgsql \
      && docker-php-ext-enable \
        xdebug \
      # composer
      && wget -O composer-setup.php https://getcomposer.org/installer \
      && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
      && rm composer-setup.php \
      # xdebug command
      && wget -O /usr/local/bin/xdebug https://raw.githubusercontent.com/julienfalque/xdebug/v1.1.0/xdebug \
      && chmod +x /usr/local/bin/xdebug \
      && apk del .build-deps

COPY php.ini /usr/local/etc/php/php.ini
COPY php-cli.ini /usr/local/etc/php/php-cli.ini
COPY xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

COPY boot.sh /tools/boot.sh

CMD ["/tools/boot.sh"]

RUN chown -R www-data:www-data /var/www
USER www-data:www-data
WORKDIR /var/www

COPY boot.sh /tools/boot.sh

CMD ["/tools/boot.sh"]
#!/bin/sh

if [ "$PHP_FPM_XDEBUG" = "1" ]
then
  php-fpm -d zend_extension=xdebug.so
else
  php-fpm
fi

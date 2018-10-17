FROM drupaldocker/php-dev:7.2-fpm-2.x

# Create volume placeholders in order to ensure correct user/group for the volumes.
RUN mkdir -p /var/www/html/drupal-files && chown www-data:www-data /var/www/html/drupal-files && chmod g+ws /var/www/html/drupal-files \
 && mkdir -p /var/www/html/web/sites/default/files && chown www-data:www-data /var/www/html/web/sites/default/files && chmod g+ws /var/www/html/web/sites/default/files \
 && mkdir -p /var/www/html/web/sites/simpletest && chown www-data:www-data /var/www/html/web/sites/simpletest && chmod g+ws /var/www/html/web/sites/simpletest


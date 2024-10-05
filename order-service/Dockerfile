FROM php:8.3-fpm

RUN docker-php-ext-install pdo_mysql

RUN apt-get update && apt-get install -y nginx

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY . /var/www/html

WORKDIR /var/www/html

RUN chown -R www-data:www-data /var/www/html

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Laravel dependencies
RUN composer install

# Generate application key
RUN php artisan key:generate

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 80

ENTRYPOINT ["/start.sh"]
#!/bin/bash

# Start PHP-FPM
php-fpm &

# Wait for PHP-FPM to start
sleep 5

# Start Nginx
nginx -g "daemon off;"
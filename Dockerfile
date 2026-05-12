FROM php:8.2-cli

# Install PDO MySQL extension
RUN docker-php-ext-install pdo_mysql

WORKDIR /var/www/html

# Copy the PHP application into the container
COPY php/ /var/www/html/

# Ensure proper permissions
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80

CMD ["php", "-S", "0.0.0.0:80", "-t", "/var/www/html"]

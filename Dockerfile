FROM php:8.2-apache

# Install MySQL extension
RUN docker-php-ext-install pdo_mysql

# Enable mod_rewrite (important pour les URLs propres)
RUN a2enmod rewrite

WORKDIR /var/www/html

# Copy application
COPY php/ /var/www/html/

# Set permissions
RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html

# Health check
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD curl -f http://localhost/ || exit 1

EXPOSE 80

CMD ["apache2-foreground"]
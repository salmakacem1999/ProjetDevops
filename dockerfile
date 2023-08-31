
# Utiliser une image PHP comme base
FROM php:7.4-fpm

# Répertoire de travail dans le conteneur
WORKDIR /var/www/html


# Copier les fichiers de l'application dans le conteneur
COPY . /var/www/html/

# Installer les dépendances système et extensions PHP nécessaires
RUN apt-get update && apt-get install -y \
    libpq-dev \
    && docker-php-ext-install pdo pdo_pgsql

# Installer Composer (gestionnaire de dépendances PHP)
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Installer les dépendances du projet avec Composer
#RUN composer clear-cache
#RUN composer install --no-interaction --optimize-autoloader

# Exposer le port 9000 pour PHP-FPM
EXPOSE 9000

# Commande de démarrage pour PHP-FPM
CMD ["php-fpm"]

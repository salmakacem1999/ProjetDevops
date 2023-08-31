# Utilisez une image PHP avec Apache comme base
FROM php:7.4-apache

# Installer les dépendances système nécessaires
RUN apt-get update && apt-get install -y \
    libicu-dev \
    libzip-dev \
    unzip \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl pdo pdo_mysql zip

# Configuration d'Apache
RUN a2enmod rewrite
RUN chown -R www-data:www-data /var/www/html

# Copier les fichiers de l'application Symfony dans le conteneur
COPY . /var/www/html/

# Configuration de l'environnement Symfony
ENV APP_ENV=prod

# Exposer le port 80
EXPOSE 80

# Commande par défaut pour démarrer Apache
CMD ["apache2-foreground"]

# Use uma imagem base do PHP com Apache e PDO pré-instalado
FROM php:8.1-apache

# Instale extensões PHP necessárias, como PDO e MySQL
RUN docker-php-ext-install pdo pdo_mysql

# Configure o diretório de trabalho
WORKDIR /var/www/html

# Copie os arquivos para o contêiner
COPY . /var/www/html

# Defina permissões e habilite o Apache mod_rewrite
RUN chown -R www-data:www-data /var/www/html \
    && a2enmod rewrite

# Exponha a porta 80
EXPOSE 80

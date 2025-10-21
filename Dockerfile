FROM ubuntu:22.04

RUN apt update && \
    apt install -y apache2 && \
    sed -i 's/Listen 80/Listen 82/' /etc/apache2/ports.conf && \
    sed -i 's/<VirtualHost \*:80>/<VirtualHost \*:82>/' /etc/apache2/sites-available/000-default.conf

COPY . /var/www/html

EXPOSE 82

CMD ["apachectl", "-D", "FOREGROUND"]

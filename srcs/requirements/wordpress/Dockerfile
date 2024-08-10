FROM debian:buster

#Instalem els paquets per a PHP, php amb mysql, acces a bdd (pdo)...
RUN apt-get update && apt-get -y install \
	wget \
	php-fpm \
	php-mysql \   
	php-pdo \
	php-gd \
	php-cli \
	php-mbstring \
	&& rm -rf /var/lib/apt/lists/*

#Creem el directori per a PHP-FPM
RUN mkdir -p /run/php

#Copiem el fitxer de configuracio de php
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

#Copiem l'script que configura i crea WordPress
COPY ./tools/create_wordpress.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/create_wordpress.sh

#Defineix el directori de treball
WORKDIR /var/www/html/

#Diem el port
Expose 9000

#Script de  creacio de WordPress
ENTRYPOINT ["/usr/local/bin/create_wordpress.sh"]

#Iniciem PHP. El -F es para iniciar en primer pla
CMD ["php-fpm7.3", "-F"]

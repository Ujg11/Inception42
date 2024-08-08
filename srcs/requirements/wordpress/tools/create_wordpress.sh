#!/bin/sh

#mirem si wp-config.php ja existeix i sino el creem
if [ -f ./wp-config.php ]
then
	echo "wordpress already downloaded"
else
	echo "Downloading WordPress..."

	#Instalem wordpress i arxius de configuracio
	#Amb wget  descarreguem el comprimit
	wget http://wordpress.org/latest.tar.gz
	#Descomprimim el comprimit amb tar
	tar xfz latest.tar.gz
	#Movem tots els directoris de wordpress al actual
	mv wordpress/* .
	#Eliminem el comprimit
	rm -rf latest.tar.gz
	#Elimina el directori Wordpress ja que ara esta buit
	rm -rf wordpress

	#Importem variables
	#Ammb sed reemplacem username_here per la variable MYSQL_USER
	sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
	sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
	sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php

	#Copia l'arxiu a wp-config.php, que WordPress utilitzara
	cp wp-config-sample.php wp-config.php


	echo "WordPress correctly downloaded"
#Final del if/else
fi

#Executem el comando per iniciar el servidor
exec "$@"

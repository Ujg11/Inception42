#!/bin/sh

#Inicialitzem la base de dades
mysql_install_db

#Iniciem Mariadb
/etc/init.d/mysql start

#Mirem si ja existeix la base de dades
if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then
	echo "We don't need to create database, it already exists"
else
	#Configurem la base de dades
	#Fem un heredoc per simular i automatitzar les respostes d'instalació
	#Contrasenya per al usuari?
	#Contrasenya i repeticio
	#Eliminar usuaris anonims?
	#Deshabilitar l'inici de sessió remot? N
	#Eliminar base de dades prova
	#Recarregar les taules de privilegis?
	mysql_secure_installation << FINISH
Y
$MYSQL_ROOT_PASSWORD
$MYSQL_ROOT_PASSWORD
Y
n
Y
Y
FINISH

	#Donem accés al usuari root desde qualsevol host
	echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot
	
	#Creem la BDD i l'usuari de Wordpress
	echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE; \
	GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' \
	IDENTIFIED BY '$MYSQL_PASSWORD'; \
	FLUSH PRIVILEGES;" | mysql -uroot

	#Importem la base de dades de WordPress
	mysql -uroot -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < /usr/local/bin/wordpress.sql

fi

#Aturem Mariadb que estava en segon pla
/etc/init.d/mysql stop

#Executem i iniciem MariaDB en primer pla
exec "$@"


FROM debian:bullseye

#Instalació de Mariadb i d'algunes utilitats
RUN apt-get update && \
	apt-get install -y \
	mariadb-server \
	mariadb-client \
	&& rm -rf /var/lib/apt/lists/*

#Configuració de permisos per MariaDB
RUN mkdir -p /var/run/mysqld \
	&& chown -R mysql:mysql /var/run/mysqld \
	&& chmod 777 /var/run/mysqld

EXPOSE 3306

#Copiem l'script d'inicialització, el sql i el fitxer de configuració
COPY ./tools/mariadb.sh /usr/local/bin/
COPY ./conf/wordpress.sql /usr/local/bin/
COPY ./conf/my.cnf /etc/mysql/my.cnf

#Assignem permisos d'execució al sh
RUN chmod +x /usr/local/bin/mariadb.sh
RUN chmod +x /usr/local/bin/wordpress.sql

#Script d'inicialització al iniciar el contenidor
ENTRYPOINT ["/usr/local/bin/mariadb.sh"]

CMD ["mysqld"]

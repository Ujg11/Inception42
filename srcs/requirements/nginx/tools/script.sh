#!/bin/bash

if [ ! -f /etc/ssl/ojimenez.42.fr.crt ]; then
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/ojimenez.42.fr.pem -keyout /etc/ssl/ojimenez.42.fr.key -subj "/C=ES/ST=Barcelona/L=Barcelona/O=42 School/OU=Barcelona/CN=ojimenez.42.fr";
fi
exec "$@"

# Iniciem nginx en primer pla (mode daemon es en segon pla)
#nginx -g "daemon off;"

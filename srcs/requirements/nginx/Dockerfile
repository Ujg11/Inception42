# Usa la imagen oficial de Nginx desde Docker Hub
FROM nginx:alpine

# Copia el archivo index.html a la ubicación predeterminada de Nginx
COPY tools/index.html /usr/share/nginx/html/index.html

# Copia los certificados SSL
COPY conf/nginx.crt /etc/ssl/certs/nginx.crt
COPY conf/nginx.key /etc/ssl/private/nginx.key

# Copia la configuración de Nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf

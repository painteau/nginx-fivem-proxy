FROM nginx:mainline-alpine-slim

ENV FIVEM_SERVER_IP=1.1.1.1
ENV FIVEM_SERVER_PORT=30120
ENV FIVEM_PROXY_DOMAIN=my.domain.com 
ENV FIVEM_PROXY_PORT=30120

# backup original nginx.conf file
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak 

# copy files
COPY nginx.conf.template /etc/nginx/nginx.conf
COPY index.html /var/www/html/
COPY certificate.pem /
COPY private_key.pem /

COPY docker-entrypoint.sh /docker-entrypoint.d/
RUN chmod +x /docker-entrypoint.d/docker-entrypoint.sh

EXPOSE 80
EXPOSE 443
EXPOSE 30120
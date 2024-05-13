#!/usr/bin/env sh
sed -i "s/FIVEM_SERVER_IP/${FIVEM_SERVER_IP}/g" /etc/nginx/nginx.conf
sed -i "s/FIVEM_SERVER_PORT/${FIVEM_SERVER_PORT}/g" /etc/nginx/nginx.conf
sed -i "s/FIVEM_PROXY_DOMAIN/${FIVEM_PROXY_DOMAIN}/g" /etc/nginx/nginx.conf
sed -i "s/FIVEM_PROXY_PORT/${FIVEM_PROXY_PORT}/g" /etc/nginx/nginx.conf
nginx -g daemon off;